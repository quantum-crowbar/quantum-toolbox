# Code-Graph Skill

Function-level call graph analysis with adaptive storage backend.

---

## Purpose

Build a complete call graph of a codebase at the function/method level, enabling:

- **Hot path identification** — which functions are called most (high fan-in, change risk)
- **Dead code detection** — functions with no callers and no entry point reachability
- **Entry point tracing** — full call chains from HTTP/CLI/event handlers to leaves
- **Cycle detection** — circular dependencies that indicate design problems
- **Complexity hotspots** — functions with high cyclomatic complexity
- **SRE enrichment** — call chain data feeding into the SRE & Reliability view

---

## When to Use

Invoke this skill when you need function-level understanding of a codebase:

```
"Analyze code graph"
"Build call graph"
"Find dead code"
"Trace entry points"
"Show me hot paths"
"Which functions are most depended on?"
"What does this endpoint actually call?"
```

Or as part of multi-output codebase analysis:

```
"Analyze this codebase"
  ☑ Code graph
```

---

## Relationship to Other Skills

| Skill | Relationship |
|-------|-------------|
| `codebase-analysis` | Prerequisite — consumes `architecture.components`, `interfaces` from its model |
| `architecture-docs` View 09 | Output — code graph findings rendered as documentation |
| `architecture-docs` reports/ | Output — entry-point-map, dead-code, sre-hot-paths all require this skill |
| SRE view (08) | Enrichment — when both active, `sre-hot-paths.md` gains call chain depth |

---

## Adaptive Backend

This skill selects a storage backend based on codebase size, detected at analysis time:

| Codebase Size | Nodes | Edges | Backend |
|---------------|-------|-------|---------|
| Small–Medium | < 2,000 | < 10,000 | YAML (default, silent) |
| Medium–Large | 2,000–5,000 | 10,000–25,000 | YAML or SQLite (user prompt) |
| Large | > 5,000 | > 25,000 | SQLite (strongly recommended) |

**YAML backend**: Graph stored in `code_graph` section of the analysis model. AI traverses edges directly using named traversal primitives.

**SQLite backend**: Graph stored in `code_graph.sqlite`. AI executes SQL including recursive CTEs for multi-level traversal. Full fidelity at any scale.

See [workflows.md](workflows.md) for the full pre-flight check procedure.

---

## Analysis Phases

| Phase | Goal | Output |
|-------|------|--------|
| **0: Setup** | Detect tooling, run size pre-flight, confirm backend | Backend selection persisted |
| **1: Node Extraction** | Enumerate all functions/methods with metadata | `nodes[]` in model |
| **2: Edge Extraction** | Build directed call graph | `edges[]` in model, fan_in/fan_out back-filled |
| **3: Pre-computed Views** | Calculate hot nodes, dead code, entry traces, cycles | `views{}` in model |
| **4: Serialization** | Write to YAML model or SQLite | `code_graph.yaml` / `code_graph.sqlite` |

---

## Tooling by Language

| Language | Primary Tool | Fallback |
|----------|-------------|----------|
| TypeScript / JS | `ts-morph`, TypeScript compiler API | AI-driven AST reading |
| Python | `pyan3`, `pyright` | AI-driven extraction |
| Java / Kotlin | `jdtls`, Spoon AST | AI-driven extraction |
| Go | `go/callgraph` (pointer analysis) | AI-driven extraction |
| C# | Roslyn API | AI-driven extraction |
| Ruby | `ruby-parser` + custom walker | AI-driven extraction |
| Multi-lang / unknown | `tree-sitter` (AST, no type resolution) | AI-only extraction |

**AI-driven fallback**: Produces nodes and edges from source reading. Cannot resolve dynamic dispatch, generics, or cross-package overloads. All nodes marked `extraction_method: ai` for transparency.

---

## Outputs

### Analysis View

`architecture-docs/analysis/09-code-graph.md`
- Extraction summary (tool, counts, backend, confidence)
- Complexity hotspots (top 10)
- High fan-in functions (most-called, change risk)
- High fan-out functions (coordination risk)
- Circular dependencies
- Dead code summary
- Mermaid call graph diagrams (top 3 entry point traces)

### Reports (all require code-graph)

| Report | File | Description |
|--------|------|-------------|
| Entry Point Map | `reports/entry-point-map.md` | Every entry point traced to leaves with blast radius |
| Dead Code | `reports/dead-code.md` | Full inventory with removal risk assessment |
| SRE Hot Paths | `reports/sre-hot-paths.md` | Critical call chains (requires SRE view 08 active) |
| Findings Summary | `reports/findings-summary.md` | Cross-cutting aggregation of all active views |
| SQLite Cookbook | `reports/sqlite-cookbook.md` | Schema reference + query examples for direct SQLite access (SQLite backend only) |

> **Retroactive generation:** If you already have a code graph but no `sqlite-cookbook.md`
> (e.g. the graph was extracted before this toolkit version), run `/upgrade` — Action 2 will
> generate the cookbook from your existing SQLite stats without re-running extraction.

---

## Traversal Primitives (YAML backend)

Named operations the AI uses to walk the graph:

| Operation | Question Answered |
|-----------|------------------|
| `callers_of(node_id)` | What calls this function? |
| `callees_of(node_id)` | What does this function call? |
| `trace_path(from, to)` | What is the call chain between two functions? |
| `entry_paths(node_id)` | Which entry points can reach this function? |
| `subgraph(node_id, depth)` | N levels of call graph around this function |
| `find_node(name)` | Look up a function by name or partial signature |

See [workflows.md](workflows.md) for SQL equivalents when using the SQLite backend.
