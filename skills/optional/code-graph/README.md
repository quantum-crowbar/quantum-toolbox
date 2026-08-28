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

## Maximization Principle

This skill's default posture is to extract as much real signal as possible within whatever scope
is chosen — not the minimum needed to answer today's question:

- **Prefer real static analysis over AI inference**, for every language detected in scope. Tree-sitter
  grammars exist for nearly every mainstream language — reach for one before falling back to AI-only
  extraction. A codebase with 6 languages and 1 AI-fallback tag is a better outcome than one with 6
  languages and 4 AI-fallback tags.
- **Prefer full cross-repo mechanism coverage over call-edges alone.** Direct function calls are only
  one of several ways codebases connect (imports, HTTP, gRPC, queues, GraphQL federation, shared DB
  tables, OpenAPI, shared config — see below). A graph that resolves TypeScript function calls but
  misses that two repos also talk over Kafka is missing exactly the edges most useful for blast-radius
  analysis.
- **Never silently under-report.** When a language lacks a usable extractor, or a detected cross-repo
  mechanism can't be resolved into edges, surface it as a named gap in the coverage scorecard —
  never leave it unmentioned.

This principle governs tool selection (workflow 0.1), cross-repo mechanism detection (2.6), and the
coverage scorecard (3.6) — see [workflows.md](workflows.md).

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
| **2.6: Cross-Repo Mechanisms** | Detect and extract imports, HTTP, gRPC, queues, GraphQL, shared DB, OpenAPI, config links | Typed mechanism edges alongside call edges |
| **3: Pre-computed Views** | Calculate hot nodes, dead code, entry traces, cycles, coverage scorecard | `views{}` in model |
| **4: Serialization** | Write to YAML model or SQLite | `code_graph.yaml` / `code_graph.sqlite` |

---

## Tooling by Language

| Language | 1st choice (type-aware) | 2nd choice (tree-sitter) | Last resort |
|----------|--------------------------|---------------------------|-------------|
| TypeScript / JS | `ts-morph`, TypeScript compiler API | `tree-sitter-typescript` | AI-driven AST reading |
| Python | `pyan3`, `pyright` | `tree-sitter-python` | AI-driven extraction |
| Java | `jdtls`/Spoon AST only if the project builds cleanly | `tree-sitter-java` (npm, syntax-only, no build needed) | AI-driven extraction |
| Kotlin | `jdtls` only if the project builds cleanly | `tree-sitter-kotlin` (npm, syntax-only, no build needed) | AI-driven extraction |
| Swift | — | `tree-sitter-swift` (npm, syntax-only, no build needed) | AI-driven extraction |
| Objective-C | — | `tree-sitter-objc` (npm, syntax-only, no build needed) | AI-driven extraction |
| Go | `go/callgraph` (pointer analysis) | `tree-sitter-go` | AI-driven extraction |
| C# | Roslyn API | `tree-sitter-c-sharp` | AI-driven extraction |
| Ruby | `ruby-parser` + custom walker | `tree-sitter-ruby` | AI-driven extraction |
| Any other language with a maintained grammar | — | `tree-sitter-<lang>` | AI-only extraction |

**Selection order**: try the 1st-choice type-aware tool → if unavailable, try the matching
tree-sitter grammar (install it if missing rather than skipping straight to AI) → only fall back to
AI-driven extraction if no grammar exists or extraction fails at both prior steps. Tree-sitter has no
type resolution (no generics/dynamic-dispatch resolution) but is still real syntax-aware parsing, not
inference — always preferred over AI-only.

**Why type-aware stays 1st, not tree-sitter**: type-aware tools do *semantic* resolution (which
overload/interface implementation a call actually targets, generics, cross-package type-checked
references) that tree-sitter's syntax-only parsing can't provide. Promoting tree-sitter to a
mandatory 2nd choice doesn't override a working type-aware tool — it just closes the gap where a
language previously had no type-aware tool configured and extraction would otherwise skip straight
to AI.

**AI-driven fallback (last resort)**: Produces nodes and edges from source reading. Cannot resolve
dynamic dispatch, generics, or cross-package overloads. All nodes marked `extraction_method: ai` for
transparency, and every AI-fallback language is counted against `languageCoverage` in the coverage
scorecard.

---

## Cross-Repo Correlation Mechanisms

Function-call edges only capture same-language, same-repo relationships. What makes
`code_graph.sqlite` genuinely useful for whole-system questions ("what breaks if I change this Kafka
topic's schema?", "what's the blast radius of this shared DB table?") is resolving the *other* ways
repos connect. Phase 2.6 actively looks for all of the following, not just whichever one the current
question happens to need:

| Mechanism | Evidence to scan for | Edge type |
|-----------|----------------------|-----------|
| Imports / shared packages | Cross-repo `package.json`/`pom.xml`/`go.mod` deps on internal shared libs | `import` |
| HTTP / REST calls | HTTP client calls whose base URL/host matches another tracked repo's service name | `http` |
| gRPC | `.proto` file imports, generated stub calls | `grpc` |
| Message queues | Kafka/SQS/SNS/RabbitMQ producer + consumer topic/queue names | `queue` |
| GraphQL federation | Subgraph schema references, `@key`/`@extends` directives | `graphql` |
| Shared database tables | Same table name/connection string referenced from multiple repos | `db-shared` |
| OpenAPI-generated clients | Generated SDK/client code pointing at another repo's OpenAPI spec | `openapi` |
| Shared config / env vars | Env vars or config keys whose value is another tracked repo's URL/name | `config` |

Each mechanism that is *present in the codebase* (detected via config files, manifests, lockfiles,
`.proto`/OpenAPI specs) must be extracted into edges when a parser/heuristic is available. If a
mechanism is detected but can't yet be resolved into edges, it's recorded as a gap — never silently
omitted. This is what `crossRepoMechanismCoverage` in the coverage scorecard tracks.

**Java/Kotlin/Swift/Objective-C via tree-sitter**: all four are syntax-only, npm-installable, no-build-required parsers — the recommended default over `jdtls`/Spoon/IndexStoreDB, which all require a successful full project build (Gradle or Xcode.app) and, for Spoon specifically, only auto-configure classpaths for Maven projects (no equivalent for Gradle). See `specs/code-graph-skill-spec.md` Phase 1 for full grammar-facts notes and per-language gotchas (incompatible `tree-sitter` core version ranges between the Swift/Objective-C pair (`^0.22.x`) and the Java/Kotlin pair (`^0.21.x`); Objective-C's message-passing selector resolution needs its own routine, distinct from the receiver-plus-name pattern shared by Java/Kotlin/Swift).

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

### Coverage Scorecard

Every extraction run computes and surfaces three coverage metrics in View 09 (also written to
`specs/analysis-manifest.json` → `artifacts.code-graph.stats`):

| Metric | Meaning |
|--------|---------|
| `repoCoverage` | Repos actually analyzed / repos tracked in `specs/repos.json` |
| `languageCoverage` | Languages extracted with a real type-aware tool or tree-sitter grammar / languages present across cloned repos |
| `crossRepoMechanismCoverage` | Cross-repo correlation mechanisms actually resolved into edges / mechanisms detected as present in the codebase |

Any metric below 100% must come with a named reason (missing grammar, unresolvable mechanism,
inaccessible repo) in `stats.gaps` and in View 09 — never a silent gap. See workflow [3.6 Coverage
Scorecard](workflows.md).

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
