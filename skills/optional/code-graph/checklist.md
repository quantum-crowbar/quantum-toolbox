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
