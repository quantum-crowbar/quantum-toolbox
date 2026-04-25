#!/usr/bin/env bash
# =============================================================================
# measure-tokens.sh
# Measure approximate token count for all toolkit files.
#
# Usage:
#   bash scripts/measure-tokens.sh              # per-skill table
#   bash scripts/measure-tokens.sh --session    # session-start files only
#   bash scripts/measure-tokens.sh --all        # all files, sorted by size
#
# Token estimation: ~1 token per 4 characters (conservative approximation).
# Actual counts vary by model tokenizer; treat as a planning guide.
# =============================================================================
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

bytes_to_tokens() {
  local bytes=$1
  echo $((bytes / 4))
}

print_file_tokens() {
  local label=$1
  local file=$2
  if [ -f "$file" ]; then
    local bytes
    bytes=$(wc -c < "$file")
    local tokens
    tokens=$(bytes_to_tokens "$bytes")
    printf "  %-50s %6d tokens  (%d bytes)\n" "$label" "$tokens" "$bytes"
  fi
}

print_dir_tokens() {
  local label=$1
  local dir=$2
  if [ -d "$dir" ]; then
    local bytes
    bytes=$(find "$dir" -name "*.md" -exec cat {} \; | wc -c)
    local tokens
    tokens=$(bytes_to_tokens "$bytes")
    printf "  %-50s %6d tokens\n" "$label" "$tokens"
  fi
}

session_start_report() {
  echo ""
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  echo "  Session-Start Token Budget (always loaded)"
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  echo ""

  local total_bytes=0
  local -a files=(
    "core/instructions.md"
    "core/architecture-thinking.md"
    "core/glossary.md"
    "skills/_index.md"
  )

  for f in "${files[@]}"; do
    local path="$REPO_ROOT/$f"
    if [ -f "$path" ]; then
      local bytes
      bytes=$(wc -c < "$path")
      total_bytes=$((total_bytes + bytes))
      local tokens
      tokens=$(bytes_to_tokens "$bytes")
      printf "  %-50s %6d tokens\n" "$f" "$tokens"
    fi
  done

  echo ""
  local total_tokens
  total_tokens=$(bytes_to_tokens "$total_bytes")
  printf "  %-50s %6d tokens\n" "TOTAL (session start)" "$total_tokens"
  echo ""
  echo "  On-demand (read when needed):"
  print_file_tokens "core/workflows.md" "$REPO_ROOT/core/workflows.md"
  print_file_tokens "core/architecture-thinking.md (already counted)" "/dev/null"
  echo ""
}

per_skill_report() {
  echo ""
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  echo "  Per-Skill Token Cost (on invocation — all skill files)"
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  echo ""

  local skills_dir="$REPO_ROOT/skills"

  # Core skills
  echo "  Core (always active):"
  for skill_dir in "$skills_dir/core"/*/; do
    local name
    name=$(basename "$skill_dir")
    if [ -d "$skill_dir" ]; then
      local bytes
      bytes=$(find "$skill_dir" -name "*.md" -exec cat {} \; | wc -c)
      local tokens
      tokens=$(bytes_to_tokens "$bytes")
      printf "    %-45s %6d tokens\n" "$name" "$tokens"
    fi
  done

  echo ""
  echo "  Optional:"

  # Build array of name+tokens for sorting
  local -a rows=()
  for skill_dir in "$skills_dir/optional"/*/; do
    local name
    name=$(basename "$skill_dir")
    if [ -d "$skill_dir" ]; then
      local bytes
      bytes=$(find "$skill_dir" -name "*.md" -exec cat {} \; 2>/dev/null | wc -c)
      local tokens
      tokens=$(bytes_to_tokens "$bytes")
      rows+=("$tokens $name")
    fi
  done

  # Sort descending by token count and print
  printf '%s\n' "${rows[@]}" | sort -rn | while read -r tokens name; do
    printf "    %-45s %6d tokens\n" "$name" "$tokens"
  done

  echo ""
}

all_files_report() {
  echo ""
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  echo "  All Files (sorted by size)"
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  echo ""

  find "$REPO_ROOT" -name "*.md" \
    -not -path "*/docs/site/*" \
    -not -path "*/.git/*" | while read -r f; do
    local bytes
    bytes=$(wc -c < "$f")
    local tokens
    tokens=$(bytes_to_tokens "$bytes")
    local rel
    rel="${f#$REPO_ROOT/}"
    echo "$tokens $rel"
  done | sort -rn | head -40 | while read -r tokens rel; do
    printf "  %-60s %6d tokens\n" "$rel" "$tokens"
  done

  echo ""
}

main() {
  local mode="${1:---skills}"

  case "$mode" in
    --session)
      session_start_report
      ;;
    --all)
      session_start_report
      all_files_report
      ;;
    --skills|*)
      session_start_report
      per_skill_report
      ;;
  esac

  echo "  Note: ~1 token per 4 chars. Actual varies by model tokenizer."
  echo "  Run before major releases to keep the Per-Skill Cost table in skills/_index.md current."
  echo ""
}

main "$@"
