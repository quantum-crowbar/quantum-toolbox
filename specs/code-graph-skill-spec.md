# Code-Graph Skill Spec

Function-level call graph analysis with adaptive storage backend.

---

## Overview

| Aspect | Description |
|--------|-------------|
| **Location** | `skills/optional/code-graph/` |
| **Purpose** | Build a function-level call graph of a codebase, enabling deep traversal, hot path identification, dead code detection, and entry point tracing |
| **Depends on** | `codebase-analysis` (consumes `architecture.components`, `interfaces`) |
| **Output** | `code_graph` model section (YAML) or `code_graph.sqlite` (SQLite), consumed by `architecture-docs` View 09 and `reports/` |

---

## Output Structure

```
{docs-directory}/architecture-docs/
├── analysis/
│   └── 09-code-graph.md              # View 09: Code graph overview, top findings
└── reports/
    ├── findings-summary.md           # Cross-cutting findings (all views)
    ├── sre-hot-paths.md              # Critical call chains for SRE view
    ├── dead-code.md                  # Functions with no callers
    └── entry-point-map.md            # All entry points traced to leaves

Companion artifact (generated alongside docs):
    code_graph.yaml                   # YAML backend (default, small–medium repos)
    code_graph.sqlite                 # SQLite backend (large repos, opt-in)
```

---

## Backend Selection

### Pre-flight Size Check

Before serializing, count nodes and edges from static analysis tool output:

```
node_count  = total function/method nodes extracted
edge_count  = total call edges extracted
```

Apply thresholds:

| Condition | Action |
|-----------|--------|
| `node_count < 2,000` AND `edge_count < 10,000` | YAML — proceed silently |
| `node_count 2,000–5,000` OR `edge_count 10,000–25,000` | Warn — let user choose |
| `node_count > 5,000` OR `edge_count > 25,000` | Strong recommend SQLite |

### Warning Prompt (Warn tier)

```
This codebase has ~{node_count} functions and ~{edge_count} call edges.
YAML will work but may hit context limits during deep traversal.

Continue with:
  1. YAML (default) — works now, may degrade on large deep-dives
  2. SQLite — full fidelity, AI uses SQL for all traversal

Default: YAML
```

### Strong Recommend Prompt (Recommend tier)

```
This codebase has ~{node_count} functions and ~{edge_count} call edges.
YAML at this scale will exceed context limits during analysis.
SQLite is strongly recommended for reliable results.

Continue with:
  1. SQLite (recommended)
  2. YAML — proceed anyway (not recommended for this codebase)

Default: SQLite
```

Persist selection in `meta.preferences.code_graph_backend: yaml | sqlite`.

---

## Analysis Phases

### Phase 0: Setup

**0.1** Confirm static analysis tooling is available (or fall back to AI-driven extraction).

**0.2** Run pre-flight size check (see Backend Selection above).

**0.3** Confirm backend with user if threshold exceeded.

---

### Phase 1: Node Extraction

**Goal**: Enumerate all functions, methods, and significant callables.

For each node, capture:

```yaml
- id: string                  # Canonical: "file/path.ext:FunctionName"
  type: string                # function | method | constructor | lambda | handler
  name: string                # Short name
  qualified_name: string      # Class.method or module.function
  signature: string           # Full signature with types if available
  location: string            # file/path.ext:line
  fan_in: number              # Count of inbound call edges
  fan_out: number             # Count of outbound call edges
  cyclomatic_complexity: number
  is_entry_point: boolean     # True if reachable from HTTP, CLI, event, scheduler
  is_dead_code: boolean       # fan_in = 0 AND is_entry_point = false
  tags: string[]              # e.g. ["auth", "db", "external", "async"]
```

**Tooling by language:**

| Language | Primary Tool | Fallback (AI-driven) |
|----------|-------------|----------------------|
| TypeScript / JS | `ts-morph`, TypeScript compiler API | AI reads imports + call expressions |
| Python | `pyan3`, `pyright` | AI reads function defs + call sites |
| Java / Kotlin | `jdtls`, Spoon AST | AI reads class methods + invocations |
| Go | `go/callgraph` (`pointer` analysis) | AI reads func declarations + calls |
| C# | Roslyn API | AI reads method defs + invocations |
| Ruby | `ruby-parser` + custom walker | AI reads def blocks + send nodes |
| Multi-lang fallback | `tree-sitter` (AST, no type resolution) | AI-only extraction |

AI-driven fallback note: produces nodes and edges but cannot resolve dynamic dispatch, generics, or cross-package overloads. Mark these nodes with `extraction_method: ai` for transparency.

---

### Phase 2: Edge Extraction

**Goal**: Build the call graph as directed edges.

For each edge, capture:

```yaml
- from: string                # Caller node id
  to: string                  # Callee node id
  type: string                # call | import | implements | extends | instantiates
  call_site: string           # file/path.ext:line of the call
  is_dynamic: boolean         # True if resolved via interface/virtual dispatch
  is_conditional: boolean     # True if inside if/try/catch — not always executed
  is_async: boolean           # True if async/await or Promise chain
```

After all edges are extracted, back-fill `fan_in` and `fan_out` on each node.

---

### Phase 3: Pre-computed Views

**Goal**: Calculate common query results upfront so AI does not need to traverse at analysis time.

Compute and store:

```yaml
views:
  hot_nodes:                  # Sorted by fan_in descending
    - id: string
      fan_in: number
      fan_out: number
      location: string

  dead_code:                  # fan_in = 0, is_entry_point = false
    - id: string
      location: string
      last_modified: string   # From git log if available

  entry_point_traces:         # Depth-first path from each entry point to leaves
    - entry: string           # Entry point node id
      entry_type: string      # http | cli | event | scheduler | export
      path: string[]          # Ordered node ids from entry to leaf
      external_calls: string[] # Nodes tagged 'external' in path
      data_stores: string[]   # Nodes tagged 'db' or 'cache' in path

  cycles:                     # Circular call chains
    - nodes: string[]         # All node ids in the cycle

  complexity_hotspots:        # Cyclomatic complexity > 10
    - id: string
      cyclomatic_complexity: number
      location: string
```

---

### Phase 4: Backend Serialization

#### YAML path

Write `code_graph` section into the analysis model:

```yaml
analysis_model:
  code_graph:
    meta:
      node_count: number
      edge_count: number
      extraction_method: string   # static | ai | mixed
      tool_used: string
      backend: yaml
    nodes: [...]
    edges: [...]
    views:
      hot_nodes: [...]
      dead_code: [...]
      entry_point_traces: [...]
      cycles: [...]
      complexity_hotspots: [...]
```

#### SQLite path

Create `code_graph.sqlite` with schema:

```sql
CREATE TABLE nodes (
  id TEXT PRIMARY KEY,
  type TEXT,
  name TEXT,
  qualified_name TEXT,
  signature TEXT,
  location TEXT,
  fan_in INTEGER,
  fan_out INTEGER,
  cyclomatic_complexity INTEGER,
  is_entry_point INTEGER,   -- 0 | 1
  is_dead_code INTEGER,     -- 0 | 1
  extraction_method TEXT,   -- static | ai
  tags TEXT                 -- JSON array
);

CREATE TABLE edges (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  from_node TEXT REFERENCES nodes(id),
  to_node TEXT REFERENCES nodes(id),
  type TEXT,
  call_site TEXT,
  is_dynamic INTEGER,
  is_conditional INTEGER,
  is_async INTEGER
);

CREATE INDEX idx_edges_from ON edges(from_node);
CREATE INDEX idx_edges_to ON edges(to_node);
CREATE INDEX idx_nodes_fan_in ON nodes(fan_in DESC);
CREATE INDEX idx_nodes_dead ON nodes(is_dead_code);
CREATE INDEX idx_nodes_entry ON nodes(is_entry_point);
```

Pre-computed views stored as materialized tables:

```sql
CREATE TABLE view_hot_nodes AS
  SELECT id, fan_in, fan_out, location FROM nodes ORDER BY fan_in DESC;

CREATE TABLE view_dead_code AS
  SELECT id, location FROM nodes WHERE is_dead_code = 1;

CREATE TABLE view_complexity_hotspots AS
  SELECT id, cyclomatic_complexity, location
  FROM nodes WHERE cyclomatic_complexity > 10
  ORDER BY cyclomatic_complexity DESC;
```

Entry point traces and cycles stored as JSON rows in:

```sql
CREATE TABLE view_entry_traces (
  entry_node TEXT,
  entry_type TEXT,
  path TEXT,           -- JSON array of node ids
  external_calls TEXT, -- JSON array
  data_stores TEXT     -- JSON array
);

CREATE TABLE view_cycles (
  cycle_id INTEGER PRIMARY KEY AUTOINCREMENT,
  nodes TEXT           -- JSON array of node ids
);
```

---

## Traversal Primitives

When using the **YAML backend**, the AI uses these named operations against the model:

| Operation | Description | How AI executes |
|-----------|-------------|-----------------|
| `callers_of(node_id)` | All functions that call this node | Filter `edges` where `to = node_id` |
| `callees_of(node_id)` | All functions this node calls | Filter `edges` where `from = node_id` |
| `trace_path(from, to)` | Call chain between two nodes | Walk edges depth-first from `from`, stop at `to` |
| `entry_paths(node_id)` | All entry points that can reach this node | Walk edges in reverse from node_id until `is_entry_point = true` |
| `subgraph(node_id, depth)` | N-level call graph around a node | BFS/DFS outward up to `depth` hops |
| `find_node(name)` | Look up a node by name or partial signature | Filter `nodes` where `name` or `qualified_name` matches |

When using the **SQLite backend**, the AI executes SQL directly. Recursive CTEs handle multi-level traversal:

```sql
-- subgraph(node_id, depth: 3)
WITH RECURSIVE call_tree AS (
  SELECT from_node, to_node, 1 AS depth
  FROM edges WHERE from_node = ?
  UNION ALL
  SELECT e.from_node, e.to_node, ct.depth + 1
  FROM edges e JOIN call_tree ct ON e.from_node = ct.to_node
  WHERE ct.depth < 3
)
SELECT DISTINCT n.* FROM call_tree ct JOIN nodes n ON n.id = ct.to_node;
```

---

## Output View: 09 — Code Graph

**File:** `analysis/09-code-graph.md`

Sections:
1. **Extraction Summary** — tool used, node/edge counts, backend selected, coverage confidence
2. **Complexity Hotspots** — top 10 functions by cyclomatic complexity
3. **High Fan-in Functions** — most-called functions (stability risk if changed)
4. **High Fan-out Functions** — functions calling the most others (coordination risk)
5. **Circular Dependencies** — detected cycles with remediation notes
6. **Dead Code Summary** — count and sample of unreachable functions
7. **Call Graph Diagrams** — Mermaid diagrams for top 3 entry point traces

---

## Output Reports (requires code-graph)

### `reports/entry-point-map.md`

For every entry point (HTTP, CLI, event, scheduler):
- Full traced call path to leaves
- External calls encountered
- Data stores accessed
- Blast radius summary

### `reports/dead-code.md`

Full inventory of dead code:
- Function id, location, last modified (from git)
- Estimated removal risk (high if depended on by tests, low if zero references)

### `reports/sre-hot-paths.md`

Enriched when both `code-graph` and SRE view (08) are active:
- Entry points on critical SRE paths (health, auth, payment)
- Call chains with async boundaries highlighted
- Functions on hot paths lacking error handling
- Fan-in > 20 functions with no circuit breaker wrapping

### `reports/findings-summary.md`

Cross-cutting aggregation across all active analysis views. Generated last, after all views complete. Sections mirror active views with a top 3–5 findings per view and a unified priority-sorted action list.

---

## Invocation

```
"Analyze code graph"
"Build call graph"
"Find dead code"
"Trace entry points"
"Show me hot paths"
```

Or as part of multi-output analysis:
```
"Analyze this codebase"
  ☑ Code graph (code-graph)
```

---

## Phase Roadmap

| Phase | Scope | Status |
|-------|-------|--------|
| **1A** | `code_graph` model section spec (this doc) | ⚪ Planned |
| **1B** | Analysis workflow: Phase 0–4, per-language tooling guide, AI fallback | ⚪ Planned |
| **1C** | Traversal primitives, View 09, reports/ output | ⚪ Planned |
| **2** | SQLite export path (schema, indexes, materialized views) | ⚪ Planned |
