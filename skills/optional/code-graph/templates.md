# Code-Graph Templates

Output templates for View 09 and all code-graph-dependent reports.

---

## View 09 — Code Graph Template

**File**: `architecture-docs/analysis/09-code-graph.md`

```markdown
# Code Graph Analysis

**Project**: {meta.project_name}
**Generated**: {meta.analysis_date}
**Tool**: {code_graph.meta.tool_used}
**Backend**: {code_graph.meta.backend}

---

## Extraction Summary

| Metric | Value |
|--------|-------|
| Functions / Methods | {code_graph.meta.node_count} |
| Call Edges | {code_graph.meta.edge_count} |
| Entry Points | {count of nodes where is_entry_point = true} |
| Dead Code Candidates | {count of nodes where is_dead_code = true} |
| Cycles Detected | {count of code_graph.views.cycles} |
| Extraction Method | {code_graph.meta.extraction_method} |
| Storage Backend | {code_graph.meta.backend} |

> **Coverage Confidence**: {static = High | ai = Medium | mixed = Medium}
> {If extraction_method = ai}: _Note: AI-driven extraction cannot resolve dynamic dispatch,
> generics, or cross-package overloads. Results are indicative, not exhaustive._

---

## Complexity Hotspots

Functions with cyclomatic complexity > 10. High complexity increases defect probability and maintenance cost.

| Function | Location | Complexity | Action |
|----------|----------|------------|--------|
{for node in code_graph.views.complexity_hotspots (top 10)}
| `{node.qualified_name}` | [{node.location}]({node.location}) | {node.cyclomatic_complexity} | Review / refactor |
{/for}

---

## High Fan-in Functions

Most-called functions. Changes here have the highest blast radius.

| Function | Location | Callers | Risk |
|----------|----------|---------|------|
{for node in code_graph.views.hot_nodes (top 10)}
| `{node.qualified_name}` | [{node.location}]({node.location}) | {node.fan_in} | {fan_in > 20 = High | fan_in > 10 = Medium | else = Low} |
{/for}

---

## High Fan-out Functions

Functions calling the most other functions. Coordination hubs — fragile if dependencies change.

| Function | Location | Callees | Note |
|----------|----------|---------|------|
{for node in nodes sorted by fan_out desc (top 10)}
| `{node.qualified_name}` | [{node.location}]({node.location}) | {node.fan_out} | {fan_out > 15 = High coordination | else = ""} |
{/for}

---

## Circular Dependencies

{If code_graph.views.cycles is empty}
No circular dependencies detected.
{else}

| Cycle | Nodes Involved | Recommended Action |
|-------|---------------|-------------------|
{for cycle in code_graph.views.cycles}
| Cycle {index} | {cycle.nodes joined by " → "} | Break dependency via interface or event |
{/for}
{/if}

---

## Dead Code Summary

{code_graph.views.dead_code count} functions have no callers and are not entry points.

| Category | Count |
|----------|-------|
| Total dead code candidates | {total} |
| Last modified > 1 year ago | {count where last_modified < 1 year} |
| Last modified < 6 months | {count — potentially recently orphaned} |

> See `reports/dead-code.md` for the full inventory with removal risk assessment.

---

## Entry Point Call Graphs

Call graph diagrams for the top 3 entry points by call depth.

{for trace in code_graph.views.entry_point_traces (top 3, sorted by path.length desc)}

### {trace.entry} ({trace.entry_type})

```mermaid
graph TD
{for i, node_id in enumerate(trace.path)}
  {sanitize_id(node_id)}["{short_name(node_id)}"]
  {if i > 0}
  {sanitize_id(trace.path[i-1])} --> {sanitize_id(node_id)}
  {/if}
{/for}
{for node_id in trace.data_stores}
  style {sanitize_id(node_id)} fill:#f0a,color:#fff
{/for}
{for node_id in trace.external_calls}
  style {sanitize_id(node_id)} fill:#fa0,color:#fff
{/for}
```

**Data stores touched**: {trace.data_stores joined by ", " | "None"}
**External calls**: {trace.external_calls joined by ", " | "None"}

{/for}

> See `reports/entry-point-map.md` for all entry points with full blast radius analysis.
```

---

## Report: Entry Point Map Template

**File**: `architecture-docs/reports/entry-point-map.md`

```markdown
# Entry Point Map

**Project**: {meta.project_name}
**Generated**: {meta.analysis_date}
**Entry Points**: {count of nodes where is_entry_point = true}

---

## Summary

| Entry Point | Type | Depth | Data Stores | External Calls |
|-------------|------|-------|-------------|----------------|
{for trace in code_graph.views.entry_point_traces}
| `{short_name(trace.entry)}` | {trace.entry_type} | {trace.path.length} | {trace.data_stores.length} | {trace.external_calls.length} |
{/for}

---

{for trace in code_graph.views.entry_point_traces}

## {trace.entry}

**Type**: {trace.entry_type}
**Handler**: [{trace.entry}]({node_location(trace.entry)})

### Call Chain

```
{for i, node_id in enumerate(trace.path)}
{"  " * i}→ {node_id} [{node_type(node_id)}]
{/for}
```

### Blast Radius

| Aspect | Detail |
|--------|--------|
| Call depth | {trace.path.length} hops |
| Data stores accessed | {trace.data_stores joined by ", " | "None"} |
| External services called | {trace.external_calls joined by ", " | "None"} |
| Async boundaries | {count of edges in path where is_async = true} |
| Conditional paths | {count of edges in path where is_conditional = true} |

---
{/for}
```

---

## Report: Dead Code Template

**File**: `architecture-docs/reports/dead-code.md`

```markdown
# Dead Code Report

**Project**: {meta.project_name}
**Generated**: {meta.analysis_date}
**Candidates**: {count of dead code nodes}

> Dead code candidates have `fan_in = 0` and are not registered as entry points.
> Verify before removal: some functions may be invoked via reflection, dynamic dispatch,
> or external consumers not visible to static analysis.

---

## Summary

| Risk | Count | Description |
|------|-------|-------------|
| Safe to remove | {count where last_modified > 1 year AND extraction_method = static} | Old, statically confirmed unreachable |
| Review first | {count where extraction_method = ai} | AI-extracted — dynamic dispatch possible |
| Recently orphaned | {count where last_modified < 6 months} | May be leftover from recent refactor |

---

## Inventory

| Function | Location | Last Modified | Risk | Notes |
|----------|----------|---------------|------|-------|
{for node in code_graph.views.dead_code sorted by last_modified asc}
| `{node.qualified_name}` | [{node.location}]({node.location}) | {node.last_modified | "unknown"} | {removal_risk(node)} | {node.extraction_method = ai ? "⚠ AI-extracted" : ""} |
{/for}

---

## Removal Guidance

1. **Confirm with git blame** — check if function was recently deleted from call sites
2. **Search for string references** — dynamic invocation via strings won't appear in graph
3. **Check test files** — dead code in production that's only called from tests is still used
4. **Remove in batches by module** — reduces risk vs. removing across the codebase at once
```

---

## Report: SRE Hot Paths Template

**File**: `architecture-docs/reports/sre-hot-paths.md`

> Requires both `code-graph` and SRE view (08) to be active.

```markdown
# SRE Hot Paths

**Project**: {meta.project_name}
**Generated**: {meta.analysis_date}

> This report identifies call chains on reliability-critical paths.
> Generated from combined code-graph and SRE analysis.

---

## Critical Entry Points

| Entry Point | Path Depth | Async Boundaries | Missing Error Handling | High Fan-in Nodes |
|-------------|------------|-----------------|----------------------|-------------------|
{for trace in sre_critical_traces}
| `{short_name(trace.entry)}` | {trace.path.length} | {trace.async_boundaries} | {trace.missing_error_handling.length} | {trace.high_fanin_nodes.length} |
{/for}

---

{for trace in sre_critical_traces}

## {trace.entry}

### Call Chain with SRE Annotations

```
{for node_id in trace.path}
→ {node_id}
  {if node_id in missing_error_handling}  ⚠ No error handling
  {/if}
  {if node_fanin(node_id) > 20}  🔴 High fan-in ({fan_in}) — change risk
  {/if}
  {if edge_to_node_is_async(node_id)}  ⏳ async boundary
  {/if}
  {if node_id in nodes_without_circuit_breaker and node_fanin > 10}  ⚡ No circuit breaker
  {/if}
{/for}
```

### Reliability Risks

| Risk | Location | Severity |
|------|----------|----------|
{for risk in trace.risks}
| {risk.type} | [{risk.location}]({risk.location}) | {risk.severity} |
{/for}

---
{/for}
```

---

## Report: Findings Summary Template

**File**: `architecture-docs/reports/findings-summary.md`

> Generated last, after all active analysis views are complete.

```markdown
# Findings Summary

**Project**: {meta.project_name}
**Generated**: {meta.analysis_date}
**Active Views**: {list of completed analysis views}

---

## Priority Action List

All findings across active views, sorted by priority:

| # | Priority | Category | Finding | View | Location |
|---|----------|----------|---------|------|----------|
{for finding in all_findings sorted by priority}
| {index} | {finding.priority} | {finding.category} | {finding.summary} | {finding.source_view} | [{finding.location}]({finding.location}) |
{/for}

---

## Per-View Summary

{for view in active_views}

### {view.name}

| Status | Key Findings |
|--------|-------------|
| {view.status} | {view.top_findings top 3} |

{/for}

---

## Metrics Dashboard

| Metric | Value | Status |
|--------|-------|--------|
{if code_graph active}
| Dead code candidates | {dead_code_count} | {dead_code_count > 50 = 🔴 | > 20 = 🟡 | 🟢} |
| Complexity hotspots | {complexity_hotspot_count} | {count > 10 = 🔴 | > 5 = 🟡 | 🟢} |
| Circular dependencies | {cycles_count} | {cycles_count > 0 = 🔴 | 🟢} |
{/if}
{if sre_view active}
| SRE observable entry points | {observable_pct}% | {< 70 = 🔴 | < 90 = 🟡 | 🟢} |
| Health endpoints present | {health_check_present} | {false = 🔴 | 🟢} |
{/if}
{if dependency_view active}
| Vulnerable dependencies | {vulnerable_count} | {> 0 critical = 🔴 | > 0 = 🟡 | 🟢} |
| Outdated dependencies | {outdated_count} | {> 20 = 🔴 | > 5 = 🟡 | 🟢} |
{/if}
```
