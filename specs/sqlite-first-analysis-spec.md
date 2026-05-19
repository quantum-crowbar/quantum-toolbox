# Spec: SQLite-First Code Analysis

> **Status:** ⚪ Planned · **Target:** v3.1
> **Audience:** AI Agents + Developers

When the SQLite backend is active the agent should use SQL for every analysis query it is capable of answering from the database — instead of reading source files or traversing the YAML model in-context. This spec defines which operations move to SQL, what schema extensions are needed, and how the workflow phases change.

---

## Principle

> **If the data is in SQLite, the agent must query it. Reading source files is only permitted for operations that are genuinely not representable as SQL.**

The YAML model stays as a human-readable snapshot committed to the repo. It is no longer used as a data source during analysis. All traversal, aggregation, and filtering runs against `code_graph.sqlite`.

---

## Integration Point: arch-analysis Phase 0.5

Code-graph extraction must happen **before** any view generation begins. View 09 and the reports/ directory (`entry-point-map`, `dead-code`, `sre-hot-paths`, `sqlite-cookbook`) all depend on the SQLite file. Backfilling them after the fact produces lower-fidelity AI-only output.

### Where the prompt lives

arch-analysis **Phase 0.5** (after setup, before Phase 1 reconnaissance) presents the user with three options:

| Choice | What happens |
|---|---|
| **Y — Run now** | Pauses arch-analysis, invokes code-graph Phase 0.0 scope dialogue, extraction runs to completion (SQLite written + committed), then arch-analysis resumes at Phase 1 with SQLite available for all views |
| **S — AI-only** | Extraction skipped; View 09 generated from AI source reading only; reports/ omitted; note added to index.md |
| **D — Defer** | View 09 omitted from this run entirely; user runs code-graph separately later and adds View 09 via `/update` |

If a current `code_graph.sqlite` already exists (per manifest), the prompt is skipped and the existing file is used automatically.

### Why Phase 0.5 not later

Placing the prompt in Phase 0.5 means:
- Extraction tooling detection happens before the agent spends tokens on analysis
- The SQLite file is ready when Phase 4B.6 SQL dispatch is invoked during view generation 
- No backtracking — views are generated once, from the right source

---

## Current State vs Target

| Analysis Operation | Current (SQLite active) | Target |
|---|---|---|
| Hot nodes (fan-in top 20) | Phase 3 in-context sort of YAML nodes | `SELECT … FROM view_hot_nodes LIMIT 20` |
| Dead code list | Phase 3 in-context filter of YAML nodes | `SELECT … FROM view_dead_code` |
| Complexity hotspots | Phase 3 in-context filter of YAML nodes | `SELECT … FROM view_complexity_hotspots` |
| Entry point traces | Phase 3 DFS traversal in-context | Pre-stored in `view_entry_traces`; read as JSON rows |
| Cycle detection | Phase 3 DFS with back-edge detection in-context | Pre-stored in `view_cycles`; read as JSON rows |
| Blast radius (forward) | AI reads YAML edges, traverses manually | Recursive CTE (see cookbook) |
| Blast radius (reverse) | AI reads YAML edges, traverses manually | Recursive CTE (reverse direction) |
| Cross-repo call count | AI counts YAML edges where from_repo ≠ to_repo | `SELECT … FROM edges WHERE from_repo != to_repo` |
| Dead code by repo | AI counts YAML nodes per repo | `SELECT repo, SUM(is_dead_code) … GROUP BY repo` |
| Async call patterns | nonfunctional-analysis reads source files | `SELECT … FROM edges WHERE is_async = 1` |
| Unresolved calls per repo | AI counts YAML unresolved_calls | `SELECT from_node, COUNT(*) … FROM unresolved_calls GROUP BY …` |
| Highest fan-in × complexity (refactor priority) | Not available | `JOIN nodes … ORDER BY fan_in * cyclomatic_complexity DESC` |
| Entry points with DB writes | Not available | `JOIN nodes + edges WHERE tag LIKE '%db%' AND is_entry_point = 1` |

---

## Phase 3 Rewrite (SQLite path)

Phase 3 currently runs all view computation in-context: DFS traversal, sorting, filtering. When SQLite is active this entire phase collapses to:

### 3.1–3.5 (SQLite path)

```
IF backend = sqlite:

  3.1 Hot nodes
      Already in view_hot_nodes materialized table.
      Run: SELECT id, fan_in, fan_out, location FROM view_hot_nodes LIMIT 20;
      → No in-context work.

  3.2 Dead code
      Already in view_dead_code.
      Run: SELECT id, location FROM view_dead_code;
      For last_modified: git log --follow -1 --format="%ai" -- {location_file}
      → Only filesystem access for git dates, not source content.

  3.3 Entry point traces
      Already in view_entry_traces as JSON rows (written in Phase 2).
      Run: SELECT entry_node, entry_type, path, external_calls, data_stores
           FROM view_entry_traces;
      Parse JSON columns to reconstruct trace objects.
      → No DFS traversal in-context.

  3.4 Cycles
      Already in view_cycles as JSON rows.
      Run: SELECT nodes FROM view_cycles;
      → No DFS traversal in-context.

  3.5 Complexity hotspots
      Already in view_complexity_hotspots.
      Run: SELECT id, cyclomatic_complexity, location
           FROM view_complexity_hotspots LIMIT 10;
      → No in-context work.

SKIP Phase 3 in-context work entirely.
Proceed directly to Phase 4B serialization.
```

Token saving: Phase 3 YAML traversal eliminated entirely for SQLite path. All views are read as compact result sets rather than full YAML blocks.

---

## Phase 4B Schema Extensions

The following columns and tables are needed to support the target operations above. All are additive — existing schema is unchanged.

### `nodes` — add columns

```sql
-- already present in current schema via tags JSON, but expose as indexed columns
-- for query performance on the most common filters:
ALTER TABLE nodes ADD COLUMN has_db_call INTEGER DEFAULT 0;
    -- 1 if tags contains 'db'
ALTER TABLE nodes ADD COLUMN has_external_call INTEGER DEFAULT 0;
    -- 1 if tags contains 'external'
ALTER TABLE nodes ADD COLUMN repo_path TEXT;
    -- relative file path within repo (split from location for GROUP BY)
```

### `edges` — add `repo` columns (already have from_repo / to_repo)

Already present in current schema. No changes needed.

### New materialized view: `view_refactor_priority`

```sql
-- Top candidates for refactoring: high fan-in × high complexity
CREATE TABLE view_refactor_priority AS
  SELECT
    id,
    repo,
    fan_in,
    cyclomatic_complexity,
    fan_in * cyclomatic_complexity AS refactor_score,
    location
  FROM nodes
  WHERE is_dead_code = 0
  ORDER BY refactor_score DESC;
```

### New materialized view: `view_cross_repo_edges`

```sql
-- All edges that cross a repo boundary
CREATE TABLE view_cross_repo_edges AS
  SELECT
    e.from_node, e.to_node,
    e.from_repo, e.to_repo,
    e.call_site, e.is_async, e.is_conditional
  FROM edges e
  WHERE e.from_repo != e.to_repo;
```

### New materialized view: `view_db_entry_paths`

```sql
-- Entry points that transitively reach a DB call
-- (via view_entry_traces path JSON, joined with nodes.has_db_call)
-- Populated during Phase 3 when SQLite backend is active
CREATE TABLE view_db_entry_paths (
  entry_node TEXT NOT NULL,
  entry_type TEXT,
  db_nodes TEXT NOT NULL    -- JSON array of node ids with has_db_call = 1 in path
);
```

---

## Analysis Phase: Ad-Hoc SQL Dispatch

After Phase 4B, add a new dispatch rule to the analysis driver:

### Phase 4B.6: SQL Dispatch Table (SQLite backend only)

When the user asks a question during analysis that can be answered from the DB, the agent must route to SQL first before reading any file.

```
SQLite dispatch rules:

User asks about...              → SQL query to run
─────────────────────────────────────────────────────────
"most called functions"         → SELECT … FROM view_hot_nodes LIMIT N
"dead code"                     → SELECT … FROM view_dead_code
"complex functions"             → SELECT … FROM view_complexity_hotspots
"blast radius of X"             → Recursive CTE forward from X (see cookbook)
"what calls X"                  → SELECT … FROM edges WHERE to_node LIKE '%X%'
"what does X call"              → SELECT … FROM edges WHERE from_node LIKE '%X%'
"cross-repo calls"              → SELECT … FROM view_cross_repo_edges
"async calls"                   → SELECT … FROM edges WHERE is_async = 1
"unresolved calls"              → SELECT … FROM unresolved_calls
"refactor candidates"           → SELECT … FROM view_refactor_priority LIMIT 10
"entry points that hit DB"      → SELECT … FROM view_db_entry_paths
"dead code by repo"             → SELECT repo, COUNT(*) FROM view_dead_code GROUP BY repo
"cycles"                        → SELECT nodes FROM view_cycles
```

**Rule:** If a question matches a dispatch pattern and the SQLite file exists and is current, run the SQL query. Do not read YAML or source files for these operations. Present the query result to the user as a formatted table.

**Fallback:** If the SQLite file does not exist or the query returns no useful result, fall back to YAML or source reading with a note: `"SQLite not available — falling back to in-context analysis"`.

---

## View 09 Generator (SQLite path)

`09-code-graph.md` is currently generated from the YAML `code_graph` section. When SQLite is active it must be generated from DB queries instead.

### Mapping: View 09 sections → SQL queries

| Section | Current source | SQL replacement |
|---|---|---|
| Extraction summary | `code_graph.meta` YAML | `SELECT COUNT(*) FROM nodes/edges` + manifest stats |
| Hot nodes table | `code_graph.views.hot_nodes[]` YAML | `SELECT … FROM view_hot_nodes LIMIT 20` |
| Dead code table | `code_graph.views.dead_code[]` YAML | `SELECT … FROM view_dead_code` |
| Complexity hotspots | `code_graph.views.complexity_hotspots[]` YAML | `SELECT … FROM view_complexity_hotspots LIMIT 10` |
| Entry point traces | `code_graph.views.entry_point_traces[]` YAML | `SELECT … FROM view_entry_traces` |
| Cycle list | `code_graph.views.cycles[]` YAML | `SELECT nodes FROM view_cycles` |
| Cross-repo calls | Not currently in View 09 | `SELECT … FROM view_cross_repo_edges LIMIT 20` |
| Refactor priority | Not currently in View 09 | `SELECT … FROM view_refactor_priority LIMIT 10` |

The YAML `code_graph` section in the model can be reduced to a lightweight stub when SQLite is active (stats only, no full node/edge arrays) — the SQLite file is the authoritative source.

---

## nonfunctional-analysis Integration

nonfunctional Phase 3 currently reads source files to detect async anti-patterns and unused code. When code-graph SQLite is active these checks move to SQL:

| nonfunctional check | Current | SQL path |
|---|---|---|
| Unused functions | AI scans source for uncalled symbols | `SELECT … FROM view_dead_code` |
| Complex functions | AI reads files, estimates complexity | `SELECT … FROM view_complexity_hotspots` |
| Async in sync context | AI searches for `await` in non-async functions | `SELECT n.id FROM nodes n JOIN edges e ON … WHERE e.is_async=1 AND n.tags NOT LIKE '%async%'` |
| Unhandled promise chains | AI reads source | `SELECT … FROM unresolved_calls WHERE reason = 'dynamic'` (partial proxy) |

Workflow change: nonfunctional Phase 3 checks for presence of `code_graph.sqlite`. If found and current (generatedDate matches manifest), delegates these four checks to SQL and skips the source file scan for them.

---

## Acceptance Criteria

- [ ] arch-analysis Phase 0.5 prompts user to run code-graph extraction before analysis if skill is enabled and no current SQLite exists
- [ ] Phase 0.5 correctly handles Y (run now) / S (AI-only) / D (defer) and the "already extracted" fast-path
- [ ] Phase 3 in-context traversal (3.1–3.5) is skipped entirely when SQLite backend is active
- [ ] All five view types read from materialized tables, not YAML
- [ ] `view_refactor_priority` and `view_cross_repo_edges` materialized tables created in Phase 4B
- [ ] Phase 4B.6 SQL dispatch table documented in `workflows.md`
- [ ] View 09 generator uses SQL queries when SQLite is active
- [ ] nonfunctional Phase 3 delegates to SQLite when available
- [ ] YAML `code_graph` section reduced to stats-only stub when SQLite is active
- [ ] Fallback to YAML/source documented and implemented for missing SQLite
- [ ] `sqlite-cookbook.template.md` updated with `view_refactor_priority` and `view_cross_repo_edges` query sections
- [ ] Checklist updated

---

## Implementation Order

1. **arch-analysis Phase 0.5** — code-graph pre-check dialogue (Y/S/D + already-extracted fast-path)
2. Phase 4B schema additions (`view_refactor_priority`, `view_cross_repo_edges`, `view_db_entry_paths`) + `repo_path` column
3. Phase 3 SQLite path (skip in-context traversal, read from materialized tables)
4. Phase 4B.6 SQL dispatch table in `workflows.md`
5. View 09 generator SQL mapping
6. nonfunctional Phase 3 integration
7. YAML stub reduction
8. Cookbook update (new view sections)
