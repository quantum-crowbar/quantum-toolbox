#!/usr/bin/env bash
# =============================================================================
# update-analysis-manifest.sh
# Update analysis manifest after regenerating architecture docs or coding profiles.
#
# Usage:
#   bash scripts/update-analysis-manifest.sh
#
# What it does:
#   1. Detects current commit SHAs in cloned code repos
#   2. Detects current quantum-toolbox version from .quantum-toolbox/skills/manifest.yaml
#   3. Asks which artifacts you regenerated
#   4. Updates specs/analysis-manifest.json with new versions
#   5. Adds entry to update history (including toolboxVersion)
#
# Requirements:
#   - jq (for JSON manipulation)
#   - yq OR grep (for reading YAML version field)
#   - Code repos cloned in code/ directory
# =============================================================================
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
MANIFEST="$REPO_ROOT/specs/analysis-manifest.json"
CODE_DIR="$REPO_ROOT/code"
TOOLBOX_MANIFEST="$REPO_ROOT/.quantum-toolbox/skills/manifest.yaml"
TEMP_MANIFEST=$(mktemp /tmp/analysis-manifest-XXXXXX.json)
trap 'rm -f "$TEMP_MANIFEST" "${TEMP_MANIFEST}.tmp"' EXIT

print_header() {
  echo ""
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  echo "  Update Analysis Manifest"
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  echo ""
}

print_step() { echo ""; echo "▶  $1"; echo ""; }
print_ok()   { echo "   ✔  $1"; }
print_warn() { echo "   ⚠  $1"; }

check_jq() {
  if ! command -v jq &>/dev/null; then
    echo "✗ Error: jq is not installed"
    echo "  Install with: brew install jq (macOS) or apt-get install jq (Linux)"
    exit 1
  fi
}

check_manifest() {
  if [ ! -f "$MANIFEST" ]; then
    echo "✗ Error: Analysis manifest not found at $MANIFEST"
    exit 1
  fi
}

get_current_commit() {
  local repo_path=$1
  if [ -d "$repo_path/.git" ]; then
    (cd "$repo_path" && git rev-parse --short HEAD)
  else
    echo "NOT_CLONED"
  fi
}

get_toolbox_version() {
  if [ ! -f "$TOOLBOX_MANIFEST" ]; then
    echo "unknown"
    return
  fi
  # Try yq first, fall back to grep
  if command -v yq &>/dev/null; then
    yq '.version' "$TOOLBOX_MANIFEST" 2>/dev/null || grep '^version:' "$TOOLBOX_MANIFEST" | awk '{print $2}' | tr -d '"'
  else
    grep '^version:' "$TOOLBOX_MANIFEST" | awk '{print $2}' | tr -d '"'
  fi
}

detect_repo_commits() {
  print_step "Detecting current repository commits"

  declare -gA REPO_COMMITS

  # Discover repos dynamically from manifest rather than hardcoding names
  for repo in $(jq -r '.lastAnalysis.repositories | keys[]' "$MANIFEST"); do
    local repo_path="$CODE_DIR/$repo"
    local commit
    commit=$(get_current_commit "$repo_path")

    REPO_COMMITS[$repo]=$commit

    if [ "$commit" = "NOT_CLONED" ]; then
      printf "  %-24s ... ⚠ Not cloned\n" "$repo"
    else
      printf "  %-24s ... %s\n" "$repo" "$commit"
    fi
  done
}

select_updated_artifacts() {
  print_step "Select which artifacts you regenerated"

  echo "  Which analysis artifacts did you update?"
  echo ""
  echo "  [1] Architecture docs (docs/architecture-docs/)"
  echo "  [2] Coding profiles (.ai-coding-skills/)"
  echo "  [3] Both"
  echo "  [4] Cancel"
  echo ""
  read -rp "  Selection [1-4]: " ARTIFACT_CHOICE

  case "$ARTIFACT_CHOICE" in
    1)
      UPDATE_ARCH_DOCS=true
      UPDATE_CODING_PROFILES=false
      ;;
    2)
      UPDATE_ARCH_DOCS=false
      UPDATE_CODING_PROFILES=true
      ;;
    3)
      UPDATE_ARCH_DOCS=true
      UPDATE_CODING_PROFILES=true
      ;;
    4)
      echo ""
      echo "  Cancelled."
      exit 0
      ;;
    *)
      echo "  Invalid selection. Exiting."
      exit 1
      ;;
  esac

  echo ""
  if [ "$UPDATE_ARCH_DOCS" = true ]; then
    print_ok "Will update: Architecture docs"
  fi
  if [ "$UPDATE_CODING_PROFILES" = true ]; then
    print_ok "Will update: Coding profiles"
  fi
}

get_update_note() {
  print_step "Add update note (optional)"

  echo "  Briefly describe what changed (or press Enter to skip):"
  read -rp "  Note: " UPDATE_NOTE

  if [ -z "$UPDATE_NOTE" ]; then
    UPDATE_NOTE="Manual update"
  fi
}

update_manifest() {
  print_step "Updating manifest"

  local today
  today=$(date -u +"%Y-%m-%d")

  local toolbox_version
  toolbox_version=$(get_toolbox_version)
  print_ok "quantum-toolbox version: $toolbox_version"

  # Start with current manifest
  cp "$MANIFEST" "$TEMP_MANIFEST"

  # Update last analysis date and top-level toolboxVersion
  jq --arg date "$today" --arg tv "$toolbox_version" \
    '.lastAnalysis.date = $date | .toolboxVersion = $tv' "$TEMP_MANIFEST" > "$TEMP_MANIFEST.tmp"
  mv "$TEMP_MANIFEST.tmp" "$TEMP_MANIFEST"

  # Update repository commits
  for repo in "${!REPO_COMMITS[@]}"; do
    local commit="${REPO_COMMITS[$repo]}"
    if [ "$commit" != "NOT_CLONED" ]; then
      jq --arg repo "$repo" --arg commit "$commit" \
        '.lastAnalysis.repositories[$repo].commit = $commit' "$TEMP_MANIFEST" > "$TEMP_MANIFEST.tmp"
      mv "$TEMP_MANIFEST.tmp" "$TEMP_MANIFEST"
      print_ok "Updated $repo → $commit"
    fi
  done

  # Update architecture docs artifact if selected
  if [ "$UPDATE_ARCH_DOCS" = true ]; then
    local all_commits
    all_commits=$(printf '%s\n' "${REPO_COMMITS[@]}" | grep -v "NOT_CLONED" | jq -R . | jq -s .)
    jq --argjson commits "$all_commits" --arg tv "$toolbox_version" \
      '.lastAnalysis.artifacts."architecture-docs".sourceCommits = $commits | .lastAnalysis.artifacts."architecture-docs".toolboxVersion = $tv' "$TEMP_MANIFEST" > "$TEMP_MANIFEST.tmp"
    mv "$TEMP_MANIFEST.tmp" "$TEMP_MANIFEST"
    print_ok "Updated architecture-docs sourceCommits + toolboxVersion"
  fi

  # Update coding profiles if selected — discover dynamically from manifest
  if [ "$UPDATE_CODING_PROFILES" = true ]; then
    for profile in $(jq -r '.lastAnalysis.artifacts."coding-profiles" | keys[]' "$MANIFEST" 2>/dev/null); do
      local repo
      repo=$(jq -r --arg profile "$profile" '.lastAnalysis.artifacts."coding-profiles"[$profile].sourceRepo' "$MANIFEST")
      local commit="${REPO_COMMITS[$repo]:-NOT_CLONED}"
      if [ "$commit" != "NOT_CLONED" ]; then
        jq --arg profile "$profile" --arg commit "$commit" --arg tv "$toolbox_version" \
          '.lastAnalysis.artifacts."coding-profiles"[$profile].sourceCommit = $commit | .lastAnalysis.artifacts."coding-profiles"[$profile].toolboxVersion = $tv' "$TEMP_MANIFEST" > "$TEMP_MANIFEST.tmp"
        mv "$TEMP_MANIFEST.tmp" "$TEMP_MANIFEST"
      fi
    done
    print_ok "Updated coding profile sourceCommits + toolboxVersion"
  fi

  # Add history entry
  local artifacts_array="[]"
  if [ "$UPDATE_ARCH_DOCS" = true ]; then
    artifacts_array=$(echo "$artifacts_array" | jq '. + ["architecture-docs"]')
  fi
  if [ "$UPDATE_CODING_PROFILES" = true ]; then
    artifacts_array=$(echo "$artifacts_array" | jq '. + ["coding-profiles"]')
  fi

  local history_entry
  history_entry=$(jq -n \
    --arg date "$today" \
    --arg action "Analysis update" \
    --arg toolboxVersion "$toolbox_version" \
    --argjson artifacts "$artifacts_array" \
    --arg note "$UPDATE_NOTE" \
    '{date: $date, action: $action, toolboxVersion: $toolboxVersion, artifacts: $artifacts, note: $note}')

  jq --argjson entry "$history_entry" '.updateHistory += [$entry]' "$TEMP_MANIFEST" > "$TEMP_MANIFEST.tmp"
  mv "$TEMP_MANIFEST.tmp" "$TEMP_MANIFEST"

  # Write back to original file
  mv "$TEMP_MANIFEST" "$MANIFEST"

  print_ok "Manifest updated: $MANIFEST"
}

print_summary() {
  echo ""
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  echo "  Manifest Updated Successfully"
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  echo ""
  echo "  Next steps:"
  echo "  1. Verify changes: cat $MANIFEST"
  echo "  2. Commit to git:"
  echo "     git add specs/analysis-manifest.json"
  echo "     git commit -m \"docs: update analysis manifest\""
  echo "  3. Commit updated analysis artifacts if you haven't already"
  echo ""
}

main() {
  print_header

  check_jq
  check_manifest

  detect_repo_commits
  select_updated_artifacts
  get_update_note
  update_manifest
  print_summary
}

main "$@"
