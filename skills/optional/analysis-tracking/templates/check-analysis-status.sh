#!/usr/bin/env bash
# =============================================================================
# check-analysis-status.sh
# Check if architecture analysis and coding profiles are up-to-date.
#
# Usage:
#   bash scripts/check-analysis-status.sh
#
# What it does:
#   1. Reads specs/analysis-manifest.json to get last analyzed commit SHAs
#   2. Compares with current HEAD commit in each cloned code repo
#   3. Checks if quantum-toolbox version has changed since last analysis
#      (new views may be available that need to be generated)
#   4. Reports staleness status and recommends what to regenerate
#
# Requirements:
#   - jq (for parsing JSON)
#   - yq OR grep (for reading YAML — used for toolkit version)
#   - Code repos cloned in code/ directory (optional, will skip if not present)
# =============================================================================
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
MANIFEST="$REPO_ROOT/specs/analysis-manifest.json"
CODE_DIR="$REPO_ROOT/code"
TOOLBOX_MANIFEST="$REPO_ROOT/.quantum-toolbox/skills/manifest.yaml"

print_header() {
  echo ""
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  echo "  Analysis Staleness Check"
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  echo ""
}

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
    echo ""
    echo "  The manifest file tracks which commits were analyzed."
    echo "  It should have been created when running arch-analysis or coding-profile skills."
    exit 1
  fi
}

get_last_analysis_date() {
  jq -r '.lastAnalysis.date' "$MANIFEST"
}

get_analyzed_commit() {
  local repo=$1
  jq -r ".lastAnalysis.repositories[\"$repo\"].commit" "$MANIFEST"
}

get_manifest_toolbox_version() {
  jq -r '.toolboxVersion // "unknown"' "$MANIFEST"
}

get_current_toolbox_version() {
  if [ ! -f "$TOOLBOX_MANIFEST" ]; then
    echo "unknown"
    return
  fi
  if command -v yq &>/dev/null; then
    yq '.version' "$TOOLBOX_MANIFEST" 2>/dev/null || grep '^version:' "$TOOLBOX_MANIFEST" | awk '{print $2}' | tr -d '"'
  else
    grep '^version:' "$TOOLBOX_MANIFEST" | awk '{print $2}' | tr -d '"'
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

count_commits_behind() {
  local repo_path=$1
  local old_commit=$2
  local new_commit=$3

  if [ ! -d "$repo_path/.git" ]; then
    echo "?"
    return
  fi

  # Check if old commit exists in the repo
  if ! (cd "$repo_path" && git cat-file -e "$old_commit" 2>/dev/null); then
    echo "UNKNOWN"
    return
  fi

  (cd "$repo_path" && git rev-list --count "$old_commit..$new_commit" 2>/dev/null || echo "UNKNOWN")
}

check_repo_status() {
  local repo=$1
  local repo_path="$CODE_DIR/$repo"

  printf "  %-20s ... " "$repo"

  local analyzed_commit
  analyzed_commit=$(get_analyzed_commit "$repo")

  local current_commit
  current_commit=$(get_current_commit "$repo_path")

  if [ "$current_commit" = "NOT_CLONED" ]; then
    echo "⚠ Not cloned (analyzed: $analyzed_commit)"
    return 1
  fi

  if [ "$analyzed_commit" = "$current_commit" ]; then
    echo "✓ Up-to-date ($current_commit)"
    return 0
  else
    local commits_behind
    commits_behind=$(count_commits_behind "$repo_path" "$analyzed_commit" "$current_commit")

    if [ "$commits_behind" = "UNKNOWN" ]; then
      echo "⚠ Cannot determine staleness (analyzed: $analyzed_commit, current: $current_commit)"
      return 1
    elif [ "$commits_behind" = "?" ]; then
      echo "⚠ Repo not cloned (analyzed: $analyzed_commit)"
      return 1
    else
      echo "⚠ Stale ($commits_behind commits behind: $analyzed_commit → $current_commit)"
      return 1
    fi
  fi
}

print_summary() {
  local up_to_date=$1
  local total=$2
  local analysis_date=$3
  local toolkit_stale=$4

  echo ""
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  echo "  Summary: $up_to_date/$total repositories up-to-date"
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  echo ""
  echo "  Last analysis: $analysis_date"
  echo ""

  if [ "$toolkit_stale" = "true" ]; then
    echo "  ⚠ quantum-toolbox version has changed since last analysis."
    echo "    New views may be available. Run 'Update analysis views' to generate"
    echo "    only the new views from your existing analysis model."
    echo "    (No re-analysis of source code needed if model is still current.)"
    echo ""
  fi

  if [ "$up_to_date" -eq "$total" ] && [ "$toolkit_stale" = "false" ]; then
    echo "  ✓ All analysis artifacts are up-to-date."
    echo "  No regeneration needed."
  else
    echo "  ⚠ Some repositories have new commits since last analysis."
    echo ""
    echo "  Recommended actions:"
    echo "  1. Clone missing repos (if any): bash scripts/clone-repos.sh"
    echo "  2. Update repos: bash scripts/update-repos.sh"
    echo "  3. Regenerate stale artifacts:"
    echo ""
    echo "     # Architecture analysis (if repos changed significantly)"
    echo "     # Load arch-analysis skill and run on code/ directory"
    echo ""
    echo "     # Coding profiles (if patterns changed)"
    echo "     # Load coding-profile skill and run on specific repos"
    echo ""
    echo "  4. Update manifest: bash scripts/update-analysis-manifest.sh"
    echo ""
  fi
}

main() {
  print_header

  check_jq
  check_manifest

  local analysis_date
  analysis_date=$(get_last_analysis_date)

  echo "  Last analysis: $analysis_date"
  echo ""

  # --- Toolkit version check ---
  local manifest_toolbox_version
  manifest_toolbox_version=$(get_manifest_toolbox_version)

  local current_toolbox_version
  current_toolbox_version=$(get_current_toolbox_version)

  local toolkit_stale="false"
  echo "  quantum-toolbox version:"
  printf "    %-24s %s\n" "Last analysis:" "$manifest_toolbox_version"
  printf "    %-24s %s\n" "Current:" "$current_toolbox_version"

  if [ "$manifest_toolbox_version" != "unknown" ] && [ "$current_toolbox_version" != "unknown" ] && \
     [ "$manifest_toolbox_version" != "$current_toolbox_version" ]; then
    echo "    ⚠ Version changed — new views may be available"
    toolkit_stale="true"
  else
    echo "    ✓ Version unchanged"
  fi

  echo ""
  echo "  Checking repository status..."
  echo ""

  local up_to_date=0
  local total=0

  # Check each repository listed in manifest
  for repo in $(jq -r '.lastAnalysis.repositories | keys[]' "$MANIFEST"); do
    if check_repo_status "$repo"; then
      ((up_to_date++))
    fi
    ((total++))
  done

  print_summary "$up_to_date" "$total" "$analysis_date" "$toolkit_stale"

  if [ "$up_to_date" -ne "$total" ] || [ "$toolkit_stale" = "true" ]; then
    exit 1
  fi
}

main "$@"
