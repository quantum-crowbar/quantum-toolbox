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
#   2. Asks which artifacts you regenerated
#   3. Updates specs/analysis-manifest.json with new versions
#   4. Adds entry to update history
#
# Requirements:
#   - jq (for JSON manipulation)
#   - Code repos cloned in code/ directory
# =============================================================================
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
MANIFEST="$REPO_ROOT/specs/analysis-manifest.json"
CODE_DIR="$REPO_ROOT/code"
TEMP_MANIFEST="/tmp/analysis-manifest-$$.json"

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

detect_repo_commits() {
  print_step "Detecting current repository commits"

  declare -gA REPO_COMMITS

  for repo in checkout-service checkout-bridge checkout; do
    local repo_path="$CODE_DIR/$repo"
    local commit
    commit=$(get_current_commit "$repo_path")

    REPO_COMMITS[$repo]=$commit

    if [ "$commit" = "NOT_CLONED" ]; then
      printf "  %-20s ... ⚠ Not cloned\n" "$repo"
    else
      printf "  %-20s ... %s\n" "$repo" "$commit"
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

  # Start with current manifest
  cp "$MANIFEST" "$TEMP_MANIFEST"

  # Update last analysis date
  jq ".lastAnalysis.date = \"$today\"" "$TEMP_MANIFEST" > "$TEMP_MANIFEST.tmp"
  mv "$TEMP_MANIFEST.tmp" "$TEMP_MANIFEST"

  # Update repository commits
  for repo in "${!REPO_COMMITS[@]}"; do
    local commit="${REPO_COMMITS[$repo]}"
    if [ "$commit" != "NOT_CLONED" ]; then
      jq ".lastAnalysis.repositories[\"$repo\"].commit = \"$commit\"" "$TEMP_MANIFEST" > "$TEMP_MANIFEST.tmp"
      mv "$TEMP_MANIFEST.tmp" "$TEMP_MANIFEST"
      print_ok "Updated $repo → $commit"
    fi
  done

  # Update architecture docs artifact if selected
  if [ "$UPDATE_ARCH_DOCS" = true ]; then
    local all_commits
    all_commits=$(printf '%s\n' "${REPO_COMMITS[@]}" | grep -v "NOT_CLONED" | jq -R . | jq -s .)
    jq ".lastAnalysis.artifacts.\"architecture-docs\".sourceCommits = $all_commits" "$TEMP_MANIFEST" > "$TEMP_MANIFEST.tmp"
    mv "$TEMP_MANIFEST.tmp" "$TEMP_MANIFEST"
    print_ok "Updated architecture-docs sourceCommits"
  fi

  # Update coding profiles if selected
  if [ "$UPDATE_CODING_PROFILES" = true ]; then
    # Update each profile with its corresponding repo commit
    for profile in "typescript-node-checkout-service.md" "typescript-node-checkout-bridge.md" "typescript-react-checkout.md" "qa-engineer.md"; do
      local repo=""
      case "$profile" in
        typescript-node-checkout-service.md)
          repo="checkout-service"
          ;;
        typescript-node-checkout-bridge.md)
          repo="checkout-bridge"
          ;;
        typescript-react-checkout.md|qa-engineer.md)
          repo="checkout"
          ;;
      esac

      local commit="${REPO_COMMITS[$repo]}"
      if [ "$commit" != "NOT_CLONED" ]; then
        jq ".lastAnalysis.artifacts.\"coding-profiles\".\"$profile\".sourceCommit = \"$commit\"" "$TEMP_MANIFEST" > "$TEMP_MANIFEST.tmp"
        mv "$TEMP_MANIFEST.tmp" "$TEMP_MANIFEST"
      fi
    done
    print_ok "Updated coding profile sourceCommits"
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
    --argjson artifacts "$artifacts_array" \
    --arg note "$UPDATE_NOTE" \
    '{date: $date, action: $action, artifacts: $artifacts, note: $note}')

  jq ".updateHistory += [$history_entry]" "$TEMP_MANIFEST" > "$TEMP_MANIFEST.tmp"
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
