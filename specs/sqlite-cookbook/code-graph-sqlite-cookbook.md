# Spec: code-graph skill — SQLite Cookbook output

> **Target:** quantum-toolbox · `skills/optional/code-graph/`
> **Type:** New report output (SQLite backend only)
> **Proposed addition:** Phase 5 serialization step + new report template

---

## Problem

When the code-graph skill runs with the SQLite backend, it produces 4 reports:
- `docs/architecture-docs/reports/entry-point-map.md`
- `docs/architecture-docs/reports/dead-code.md`
- `docs/architecture-docs/reports/sre-hot-paths.md`
- `docs/architecture-docs/reports/findings-summary.md` (updated)

There is no **query reference** generated alongside the SQLite file. Users who open `code_graph.sqlite` directly (via `sqlite3`, DBeaver, DB Browser) have no guide for the schema or useful queries. The skill's `workflows.md` contains SQL examples but they are agent-facing, not user-facing.

---

## Proposed Change

### 1. Add `sqlite-cookbook.md` to the code-graph report outputs (SQLite backend only)

**File path:** `{docs-directory}/architecture-docs/reports/sqlite-cookbook.md`

Generate this file as the final step of Phase 4 (Serialization), after the SQLite file is written.

**Trigger condition:** SQLite backend only. Do not generate when using the YAML backend.

---

### 2. Content specification

The cookbook must include all of the following sections:

#### Header
- Title: `# Code Graph SQLite Cookbook`
- One-line description of what the file is and where the SQLite lives

#### Opening the Database
- `sqlite3 {sqlite_path}` CLI command with the actual path filled in
- Mention of GUI tools: DB Browser for SQLite, DBeaver

#### Schema Overview
- `.schema` commands for all 6 objects: `nodes`, `edges`, `unresolved_calls`, `vw_hot_nodes`, `vw_dead_code`, `vw_complexity`, `vw_entry_points`, `vw_cross_repo`
- Column-level reference tables for `nodes` and `edges` (all columns with types and descriptions)

#### Essential Queries (minimum set)
- Repo overview (node count by repo)
- Entry point count by repo
- Dead code percentage by repo

#### Call Graph Traversal
- Direct callers (`WHERE to_node LIKE`)
- Direct callees (`WHERE from_node LIKE`)
- Blast radius — recursive CTE, 3 levels deep
- Reverse blast radius — recursive CTE up callers, 4 levels
- Path-finding between two functions

#### Hotspot Analysis
- Most-called functions from `vw_hot_nodes`
- High fan-in AND fan-out (coordination hubs)
- High-complexity from `vw_complexity`
- High-complexity dead code (safe to delete but tangled)
- Most-called × complexity (refactor priority ranking)

#### Entry Point Analysis
- All entry points sorted by `fan_out`
- HTTP entry points only (filter by `tags LIKE '%http%'`)
- Kafka consumers (filter by `tags LIKE '%kafka%'`)
- Trivial handlers (`fan_out = 0`)

#### Dead Code Analysis
- Dead code by repo
- Non-trivial dead code (`cyclomatic_complexity > 1`)
- Dead functions matching name patterns (`legacy`, `old`, `deprecated`)

#### Async and Conditional Calls
- All async edges
- Functions with only async calls

#### Repo-Level Stats
- Full summary table (nodes, entry points, dead code, max CC, avg fan-in/out)
- Edge distribution by originating repo
- Cross-repo edges summary

#### Unresolved Calls
- Breakdown by `reason`
- Unresolved calls filtered to a specific repo

#### Regeneration
- Commands to re-run extraction and regenerate reports
- Reference to incremental update approach (agent: `"update code graph"`)

#### Related Links
- Links to View 09, entry-point-map, dead-code, sre-hot-paths (relative paths)

---

### 3. Template variables to substitute at generation time

| Placeholder | Value |
|-------------|-------|
| `{sqlite_path}` | Actual relative path to the `.sqlite` file from repo root |
| `{docs-directory}` | Docs root (e.g. `docs/architecture-docs`) |
| `{node_count}` | Total nodes from extraction stats |
| `{edge_count}` | Total edges |
| `{repo_count}` | Number of repos scanned |
| `{entry_count}` | Number of entry points |
| `{dead_count}` | Number of dead code nodes |
| `{dead_pct}` | Dead code percentage |
| `{extraction_date}` | ISO date of extraction |

---

### 4. Changes to `README.md` / skill output listing

In `skills/optional/code-graph/README.md`, add `sqlite-cookbook.md` to the Reports table:

```markdown
| SQLite Cookbook | `reports/sqlite-cookbook.md` | Schema reference + query examples for direct SQLite access (SQLite backend only) |
```

---

### 5. Changes to `workflows.md`

In the Phase 4 (Serialization) section, after the SQLite write step, add:

```
Phase 4b — SQLite Cookbook (SQLite backend only)
  Generate reports/sqlite-cookbook.md from the template above.
  Substitute all template variables with actual values from extraction stats.
  Write to {docs-directory}/architecture-docs/reports/sqlite-cookbook.md.
```

---

### 6. Changes to `findings-summary.md` injection

When injecting the code-graph stats block into `findings-summary.md`, add a line:

```markdown
**SQLite Cookbook:** [reports/sqlite-cookbook.md](reports/sqlite-cookbook.md)
```

---

## Out of Scope

- YAML backend — no cookbook generated (schema is agent-internal, not user-facing)
- Updating the cookbook on incremental graph updates — only full re-extraction regenerates it
- SQLite cookbook for non-TypeScript repos (Swift, Kotlin, Python) — separate graph files would need separate instances; deferred

---

## Reference Implementation

A hand-authored version of this output is committed at:

```
docs/architecture-docs/reports/sqlite-cookbook.md
```

in `dxpcore-lowerfunnel-metarepo` (branch `update/q-t_3.0v_dev`).

This file should be used as the canonical template when implementing the skill output. The template variables listed above are the only parts that need to be dynamically substituted — all query text is static.
