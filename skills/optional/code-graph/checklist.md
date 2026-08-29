# Code-Graph Checklist

Quick reference for code graph analysis completion.

---

## Phase 0: Setup

- [ ] Primary language(s) detected
- [ ] Static analysis tool identified (or AI fallback confirmed)
- [ ] Pre-flight size estimate completed
  - [ ] Source file count captured
  - [ ] Node estimate calculated
  - [ ] Edge estimate calculated
- [ ] Backend threshold applied
  - [ ] YAML (< 2k nodes / < 10k edges) → proceeded silently
  - [ ] Warn tier → user prompted and choice recorded
  - [ ] Recommend tier → user prompted and SQLite recommended
- [ ] `meta.preferences.code_graph_backend` persisted

---

## Phase 1: Node Extraction

- [ ] Static analysis tool run (or AI fallback used)
- [ ] Exclusions applied (tests, generated, vendor)
- [ ] All nodes captured with required fields:
  - [ ] `id` (canonical file:FunctionName format)
  - [ ] `type` (function / method / constructor / lambda / handler)
  - [ ] `name` + `qualified_name`
  - [ ] `signature`
  - [ ] `location` (file:line)
  - [ ] `cyclomatic_complexity`
  - [ ] `extraction_method` (static | ai)
- [ ] Entry points marked (`is_entry_point: true`)
  - [ ] HTTP route handlers
  - [ ] CLI command handlers
  - [ ] Event / message queue consumers
  - [ ] Scheduled / cron handlers
  - [ ] Exported library functions
- [ ] Tags applied (db, cache, external, auth, async, handler)

---

## Phase 2: Edge Extraction

- [ ] All call edges extracted with required fields:
  - [ ] `from` + `to` (canonical node ids)
  - [ ] `type` (call / import / implements / extends / instantiates)
  - [ ] `call_site` (file:line)
  - [ ] `is_dynamic` flag
  - [ ] `is_conditional` flag
  - [ ] `is_async` flag
- [ ] `fan_in` back-filled on all nodes
- [ ] `fan_out` back-filled on all nodes
- [ ] `is_dead_code` set (fan_in = 0 AND is_entry_point = false)

### Phase 2.1.1: Unresolved Call Classification

- [ ] Every `unresolved_calls.reason` uses only the 4 canonical values: `external-package` \|
      `missing-repo` \| `dynamic` \| `type-alias` — no ad hoc/catch-all values
- [ ] All 4 cheap resolution heuristics applied before falling back to `type-alias`: same-class
      `this`/`self` lookup, framework-call allowlist, typed-variable tracking, DI/constructor
      injection
- [ ] `unresolved_calls.repo` populated (needed for per-language coverage breakdown)

### Phase 2.6: Cross-Repo Correlation Mechanisms

- [ ] Every cross-repo mechanism actually present in the codebase has a matching correlation pass
      (imports, HTTP, gRPC, message queues, GraphQL federation, shared DB tables, OpenAPI clients,
      shared config) — any mechanism present in code but absent from the correlation script is a
      named gap, not a silent omission
- [ ] `mechanism_edges` table populated for each implemented mechanism
- [ ] **Near-miss diagnostics** (2.6.3): any correlation pass that finds zero matches despite both
      inbound and outbound candidates existing logs the top 5 closest non-matching pairs by
      path/topic-name similarity — a bare `0` with no near-miss evidence is not acceptable

---

## Phase 3: Pre-computed Views

- [ ] `hot_nodes` — sorted by fan_in desc
- [ ] `dead_code` — filtered (fan_in = 0, not entry point), git dates attempted
- [ ] `entry_point_traces` — all entry points traced depth-first
  - [ ] `external_calls` collected per trace
  - [ ] `data_stores` collected per trace
- [ ] `cycles` — circular dependencies detected
- [ ] `complexity_hotspots` — cyclomatic_complexity > 10, sorted desc

---

## Phase 3.6: Coverage Scorecard

- [ ] `repoCoverage`, `languageCoverage`, `crossRepoMechanismCoverage`, `edgeResolutionCoverage`
      all computed
- [ ] `edgeResolutionCoverage` reported both blended AND per-language — never blended-only
- [ ] Every metric below 100% has a named reason recorded in `stats.gaps` (missing grammar,
      unresolvable mechanism, inaccessible repo, dominant `type-alias` bucket, etc.)
- [ ] Scorecard + gaps written to `specs/analysis-manifest.json` → `artifacts.code-graph.stats`

---

## Phase 4: Serialization

### YAML Backend
- [ ] `code_graph` section written to analysis model
  - [ ] `meta` block complete (node_count, edge_count, tool, backend)
  - [ ] `nodes[]` complete
  - [ ] `edges[]` complete
  - [ ] `views{}` complete

### SQLite Backend
- [ ] `code_graph.sqlite` file created
  - [ ] `nodes` table populated
  - [ ] `edges` table populated with foreign keys
  - [ ] All indexes created
  - [ ] `view_hot_nodes` materialized table created
  - [ ] `view_dead_code` materialized table created
  - [ ] `view_complexity_hotspots` materialized table created
  - [ ] `view_entry_traces` populated
  - [ ] `view_cycles` populated

---

## Output: View 09

- [ ] `analysis/09-code-graph.md` created
  - [ ] Extraction summary table complete
  - [ ] Coverage Scorecard table complete (all 4 metrics + gap reasons)
  - [ ] Edge Resolution Coverage per-language table complete (not blended-only)
  - [ ] Unresolved Calls by reason table complete (4 canonical reasons)
  - [ ] Complexity hotspots table (top 10)
  - [ ] High fan-in table (top 10)
  - [ ] High fan-out table (top 10)
  - [ ] Circular dependencies section
  - [ ] Dead code summary
  - [ ] Mermaid diagrams (top 3 entry point traces)

---

## Output: Reports

- [ ] `reports/entry-point-map.md` — all entry points traced
- [ ] `reports/dead-code.md` — full inventory with removal risk
- [ ] `reports/sre-hot-paths.md` — if SRE view (08) also active
- [ ] `reports/findings-summary.md` — generated last, after all views complete

---

## Quality Gates

- [ ] Node count in model matches tool-reported count
- [ ] All entry points from `interfaces.apis[]` have corresponding entry point nodes
- [ ] No nodes with `fan_in = null` or `fan_out = null`
- [ ] Cycles cross-checked: each cycle node exists in `nodes[]`
- [ ] AI-extracted nodes flagged with `extraction_method: ai`
- [ ] Backend selection documented in `meta.preferences.code_graph_backend`
- [ ] No `unresolved_calls.reason` value outside the 4 canonical enum values
- [ ] Every correlation pass with 0 matches has near-miss diagnostics logged, not a silent `0`
