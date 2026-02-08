# Token Usage Baseline

> **Measured**: 2026-02-08
> **Purpose**: Track context window efficiency before/after optimization
> **Method**: Characters / 4 (standard English token approximation)

---

## KPI: Agent Session Token Cost

How many tokens an AI agent consumes to start a session and use the toolkit.

### Scenario A: Minimal Session (core only)

Agent reads entry points + core docs + core skills.

| File | Tokens |
|------|--------|
| `AGENTS.md` | 1,278 |
| `AI_TOOLKIT_CONTEXT.md` | 3,578 |
| `core/instructions.md` | 1,381 |
| `core/workflows.md` | 2,293 |
| `core/glossary.md` | 1,577 |
| `core/architecture-thinking.md` | 3,162 |
| `skills/_index.md` | 1,804 |
| `skills/core/git-workflow/` (4 files) | 3,762 |
| `skills/core/todo-workflow/` (5 files) | 12,892 |
| **Total** | **31,727** |

### Scenario B: Architecture Analysis Session

Scenario A + arch-analysis + codebase-analysis.

| Added | Tokens |
|-------|--------|
| Scenario A baseline | 31,727 |
| `skills/optional/codebase-analysis/` (4 files) | 8,431 |
| `skills/optional/arch-analysis/` (5 files) | 20,132 |
| **Total** | **60,290** |

### Scenario C: Full TOGAF Session

Scenario B + all TOGAF phases.

| Added | Tokens |
|-------|--------|
| Scenario B baseline | 60,290 |
| `skills/optional/togaf/` (46 files) | 156,787 |
| **Total** | **217,077** |

### Scenario D: Everything

All skills loaded (unrealistic but represents total footprint).

| Added | Tokens |
|-------|--------|
| All skills + core + entry points | ~390,000 |
| Specs & docs (not normally loaded) | ~72,000 |
| **Total repository** | **~461,000** |

---

## Redundancy Analysis

Content duplicated across multiple files, wasting tokens.

### Duplicated Content Inventory

| Content | Files Where It Appears | Est. Duplicate Tokens |
|---------|----------------------|----------------------|
| Skills table (full listing) | AGENTS.md, AI_TOOLKIT_CONTEXT.md, README.md, skills/_index.md, docs/skills/README.md | ~2,000 |
| Directory structure tree | AGENTS.md, AI_TOOLKIT_CONTEXT.md, README.md | ~600 |
| Invokable commands table | AI_TOOLKIT_CONTEXT.md, README.md, skills/_index.md | ~500 |
| Skill package structure | AGENTS.md, AI_TOOLKIT_CONTEXT.md, README.md, skills/_index.md | ~300 |
| Recommended models table | README.md, AI_TOOLKIT_CONTEXT.md | ~150 |
| Setup instructions | AGENTS.md, AI_TOOLKIT_CONTEXT.md | ~200 |
| Bash safety list (unnecessary) | core/instructions.md | ~1,044 |
| todo-workflow (summary + full) | core/workflows.md, skills/core/todo-workflow/ | ~800 |
| **Total estimated waste** | | **~5,594** |

### Redundancy as % of Session Cost

| Scenario | Session Tokens | Redundant Tokens | Waste % |
|----------|---------------|-----------------|---------|
| A: Minimal | 31,727 | ~5,594 | **17.6%** |
| B: Arch Analysis | 60,290 | ~5,594 | 9.3% |
| C: Full TOGAF | 217,077 | ~5,594 | 2.6% |

**Key insight**: Redundancy hits hardest in the minimal session — the most common use case. 17.6% of tokens are wasted on duplicated or unnecessary content.

---

## Entry Point Token Costs

Files that agents read at session start (before any skill activation).

| File | Tokens | Role | Audience |
|------|--------|------|----------|
| `AGENTS.md` | 1,278 | Submodule entry point | Agents |
| `AI_TOOLKIT_CONTEXT.md` | 3,578 | Comprehensive reference | Both |
| `README.md` | 2,102 | GitHub landing page | Humans |
| `skills/_index.md` | 1,804 | Skill manifest | Both |
| `docs/skills/README.md` | 5,289 | Skills deep reference | Both |
| **Total (all 5)** | **14,051** | | |
| **Agent-relevant only** | **~6,660** | AGENTS + AI_TOOLKIT_CONTEXT + _index | |

**Target after optimization**: Agents should read 1-2 files totaling ~3,000-4,000 tokens to get oriented, not 14,000.

---

## Core Files Token Costs

Always-loaded foundation documents.

| File | Tokens | Notes |
|------|--------|-------|
| `core/instructions.md` | 1,381 | Contains ~1,044 tokens of bash safety list (target for removal) |
| `core/workflows.md` | 2,293 | Contains ~800 tokens duplicating todo-workflow skill |
| `core/glossary.md` | 1,577 | Clean, no issues |
| `core/architecture-thinking.md` | 3,162 | Clean, no issues |
| **Total** | **8,413** | |
| **After cleanup** | **~6,569** | Remove bash list + dedupe todo-workflow |

---

## Skill Package Token Costs

Per-skill token budgets (sorted by size).

| Skill | Files | Tokens | Tier |
|-------|-------|--------|------|
| togaf (all phases) | 46 | 156,787 | Optional |
| analysis-outputs (all adapters) | 24 | 63,238 | Optional |
| arch-analysis | 5 | 20,132 | Optional |
| architecture-synthesis | 6 | 19,591 | Optional |
| security-analysis | 5 | 20,085 | Optional |
| fitness-functions | 5 | 18,119 | Optional |
| structurizr | 5 | 15,569 | Optional |
| todo-workflow | 5 | 12,892 | Core |
| nonfunctional-analysis | 5 | 12,678 | Optional |
| codebase-analysis | 4 | 8,431 | Optional |
| code-conventions | 5 | 8,525 | Optional |
| software-design | 5 | 7,266 | Optional |
| tech-stack-decisions | 5 | 6,920 | Optional |
| git-workflow | 4 | 3,762 | Core |
| **Total (all skills)** | **134** | **~373,995** | |

---

## Optimization Targets

| Target | Current | Goal | Savings |
|--------|---------|------|---------|
| Entry point tokens (agent reads) | ~6,660 | ~3,500 | ~3,160 (47%) |
| Bash safety list removal | 1,044 | 0 | 1,044 (100%) |
| todo-workflow dedup in core/ | ~800 | ~100 | ~700 (88%) |
| Total redundancy eliminated | 5,594 | ~500 | ~5,094 (91%) |
| **Minimal session (Scenario A)** | **31,727** | **~26,600** | **~5,100 (16%)** |

---

## Post-Optimization Results (2026-02-08)

### What Changed

| Optimization | Tokens Saved |
|-------------|-------------|
| O1: AGENTS.md rewrite (1,278 → 504) | 774 |
| O1: AI_TOOLKIT_CONTEXT.md → redirect (3,578 → 158, removed from reading path) | 3,578 |
| O1: skills/_index.md absorbed unique content (1,804 → 2,484) | -680 |
| O2: Bash safety list removed from core/instructions.md (1,381 → 435) | 946 |
| O7: todo-workflow dedup in core/workflows.md (2,293 → 1,939) | 354 |
| **Net entry point + core savings** | **~4,972** |

### Session Start Cost (toolkit files only)

| File | Before | After |
|------|--------|-------|
| `AGENTS.md` | 1,278 | 504 |
| `AI_TOOLKIT_CONTEXT.md` | 3,578 | _(not read)_ |
| `core/instructions.md` | 1,381 | 435 |
| `core/glossary.md` | 1,577 | 1,583 |
| `skills/_index.md` | 1,804 | 2,484 |
| **Total** | **9,618** | **5,006** |
| **Reduction** | | **48%** |

### Scenario A: Minimal Session (revised)

| File | Before | After |
|------|--------|-------|
| Entry points + core docs | 14,873 | 10,113 |
| Core skills (git-workflow + todo-workflow) | 16,654 | 16,651 |
| **Total** | **31,727** | **26,764** |
| **Reduction** | | **15.6%** |

### Entry Points (agent-read)

| File | Before | After |
|------|--------|-------|
| `AGENTS.md` | 1,278 | 504 |
| `AI_TOOLKIT_CONTEXT.md` | 3,578 | 0 (redirect, not in reading path) |
| `skills/_index.md` | 1,804 | 2,484 |
| **Total** | **6,660** | **2,988** |
| **Reduction** | | **55%** |

### Redundancy Eliminated

| Content | Before (duplicated) | After |
|---------|-------------------|-------|
| Skills table | 5 files | 1 canonical (skills/_index.md) + 1 human (docs/skills/README.md) |
| Directory structure tree | 3 files | 1 (README.md, human-only) |
| Invokable commands table | 3 files | 1 canonical (skills/_index.md) |
| Skill package structure | 4 files | 1 canonical (skills/_index.md) |
| Recommended models table | 2 files | 1 (README.md, human-only) |
| Setup instructions | 2 files | 1 per audience (AGENTS.md, README.md) |
| Bash safety list | 1 file | Removed |
| todo-workflow duplication | 2 files | Pointer only in core/workflows.md |
| **Estimated duplicate tokens** | **~5,594** | **~0** |

### Summary

| Metric | Before | After | Improvement |
|--------|--------|-------|-------------|
| Session start tokens | 9,618 | 5,006 | **48% reduction** |
| Agent entry point tokens | 6,660 | 2,988 | **55% reduction** |
| Minimal session (Scenario A) | 31,727 | 26,764 | **15.6% reduction** |
| Redundant tokens | ~5,594 | ~0 | **~100% eliminated** |
| Total repo tokens | ~461,273 | ~456,943 | ~1% (content redistributed) |

---

## How to Remeasure

```bash
# Total tokens for a file
wc -c < FILE | awk '{print int(($1+3)/4)}'

# Total tokens for a directory
find DIR -name "*.md" -exec wc -c {} + | tail -1 | awk '{print int(($1+3)/4)}'

# Total repository tokens
find . -name "*.md" -not -path "./.git/*" -exec wc -c {} + | tail -1 | awk '{print int(($1+3)/4)}'
```

Current total repository: **~461,273 tokens** across 134 markdown files.
