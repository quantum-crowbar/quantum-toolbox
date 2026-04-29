# Code Graph SQLite Cookbook

> **Generated:** {extraction_date}  
> **Database:** `{sqlite_path}`  
> **Extraction stats:** {node_count} nodes · {edge_count} edges · {repo_count} repos · {entry_count} entry points · {dead_count} dead code nodes ({dead_pct})

This file is the query reference for direct SQLite access to the code graph.
Use it alongside `sqlite3`, [DB Browser for SQLite](https://sqlitebrowser.org/), or DBeaver.

---

## Opening the Database

```bash
# CLI
sqlite3 {sqlite_path}

# Enable readable output
.headers on
.mode column
.width 60 10 10 10
```

GUI tools:
- **DB Browser for SQLite** — free, cross-platform, visual schema and query runner
- **DBeaver** — full-featured, supports SQLite alongside other databases

---

## Schema Overview

```sql
-- Run in sqlite3 to see full DDL
.schema nodes
.schema edges
.schema unresolved_calls
.schema vw_hot_nodes
.schema vw_dead_code
.schema vw_complexity
.schema vw_entry_points
.schema vw_cross_repo
```

### `nodes` — all functions and methods

| Column | Type | Description |
|--------|------|-------------|
| `id` | TEXT PK | Canonical identifier: `file.ts:ClassName.methodName` |
| `type` | TEXT | `function` \| `method` \| `constructor` \| `lambda` \| `handler` |
| `name` | TEXT | Short function name |
| `qualified_name` | TEXT | Class-qualified name (e.g. `AuthService.validateToken`) |
| `signature` | TEXT | Full signature including parameters and return type |
| `location` | TEXT | `file.ts:line` |
| `repo` | TEXT | Source repository name |
| `fan_in` | INTEGER | Number of callers |
| `fan_out` | INTEGER | Number of callees |
| `cyclomatic_complexity` | INTEGER | McCabe complexity score |
| `is_entry_point` | INTEGER | 1 = HTTP/CLI/event/cron handler |
| `is_dead_code` | INTEGER | 1 = no callers and not an entry point |
| `extraction_method` | TEXT | `static` \| `ai` |
| `tags` | TEXT | JSON array: `["db","cache","external","auth","async","handler"]` |

### `edges` — call relationships

| Column | Type | Description |
|--------|------|-------------|
| `id` | INTEGER PK | Auto-increment |
| `from_node` | TEXT FK | Caller node id |
| `to_node` | TEXT FK | Callee node id |
| `from_repo` | TEXT | Calling repository |
| `to_repo` | TEXT | Called repository |
| `type` | TEXT | `call` \| `import` \| `implements` \| `extends` \| `instantiates` |
| `call_site` | TEXT | `file.ts:line` where the call appears |
| `is_dynamic` | INTEGER | 1 = via interface dispatch or reflection |
| `is_conditional` | INTEGER | 1 = inside if/try/catch — not guaranteed to execute |
| `is_async` | INTEGER | 1 = awaited or Promise-chained |

### `unresolved_calls` — calls that could not be resolved to a node

| Column | Type | Description |
|--------|------|-------------|
| `from_node` | TEXT | Calling node id |
| `call_site` | TEXT | `file.ts:line` |
| `target` | TEXT | What was called (string form) |
| `reason` | TEXT | `external-package` \| `missing-repo` \| `dynamic` \| `type-alias` |

---

## Essential Queries

### Repo overview

```sql
-- Node count by repo
SELECT repo, COUNT(*) AS nodes
FROM nodes
GROUP BY repo
ORDER BY nodes DESC;
```

### Entry point count by repo

```sql
SELECT repo, COUNT(*) AS entry_points
FROM nodes
WHERE is_entry_point = 1
GROUP BY repo
ORDER BY entry_points DESC;
```

### Dead code percentage by repo

```sql
SELECT
  repo,
  COUNT(*) AS total,
  SUM(is_dead_code) AS dead,
  ROUND(100.0 * SUM(is_dead_code) / COUNT(*), 1) || '%' AS dead_pct
FROM nodes
GROUP BY repo
ORDER BY dead DESC;
```

---

## Call Graph Traversal

### Direct callers of a function

```sql
-- Replace 'src/auth/service.ts:validateToken' with your target
SELECT n.id, n.repo, n.location
FROM edges e
JOIN nodes n ON n.id = e.from_node
WHERE e.to_node LIKE '%validateToken%';
```

### Direct callees of a function

```sql
SELECT n.id, n.repo, n.location
FROM edges e
JOIN nodes n ON n.id = e.to_node
WHERE e.from_node LIKE '%validateToken%';
```

### Blast radius — 3 levels deep (forward)

```sql
-- What does this function call, transitively?
WITH RECURSIVE blast AS (
  SELECT to_node AS node_id, 1 AS depth
  FROM edges WHERE from_node LIKE '%validateToken%'
  UNION ALL
  SELECT e.to_node, b.depth + 1
  FROM edges e
  JOIN blast b ON e.from_node = b.node_id
  WHERE b.depth < 3
)
SELECT DISTINCT n.id, n.repo, n.location, b.depth
FROM blast b
JOIN nodes n ON n.id = b.node_id
ORDER BY b.depth, n.repo;
```

### Reverse blast radius — 4 levels up (callers)

```sql
-- Who calls this function, transitively?
WITH RECURSIVE reverse_blast AS (
  SELECT from_node AS node_id, 1 AS depth
  FROM edges WHERE to_node LIKE '%validateToken%'
  UNION ALL
  SELECT e.from_node, rb.depth + 1
  FROM edges e
  JOIN reverse_blast rb ON e.to_node = rb.node_id
  WHERE rb.depth < 4
)
SELECT DISTINCT n.id, n.repo, n.location, rb.depth
FROM reverse_blast rb
JOIN nodes n ON n.id = rb.node_id
ORDER BY rb.depth, n.repo;
```

### Path between two functions

```sql
-- Find any path from functionA to functionB
WITH RECURSIVE path_search AS (
  SELECT from_node AS start, to_node AS end_node,
         from_node || ' → ' || to_node AS path,
         1 AS hops
  FROM edges WHERE from_node LIKE '%functionA%'
  UNION ALL
  SELECT ps.start, e.to_node,
         ps.path || ' → ' || e.to_node,
         ps.hops + 1
  FROM edges e
  JOIN path_search ps ON e.from_node = ps.end_node
  WHERE ps.hops < 8 AND ps.path NOT LIKE '%' || e.to_node || '%'
)
SELECT path, hops
FROM path_search
WHERE end_node LIKE '%functionB%'
ORDER BY hops
LIMIT 5;
```

---

## Hotspot Analysis

### Most-called functions

```sql
SELECT id, repo, fan_in, fan_out, location
FROM vw_hot_nodes
LIMIT 20;
```

### High fan-in AND fan-out (coordination hubs)

```sql
SELECT id, repo, fan_in, fan_out,
       (fan_in + fan_out) AS total_degree
FROM nodes
WHERE fan_in > 5 AND fan_out > 5
ORDER BY total_degree DESC
LIMIT 20;
```

### High cyclomatic complexity

```sql
SELECT id, repo, cyclomatic_complexity, location
FROM vw_complexity
ORDER BY cyclomatic_complexity DESC
LIMIT 20;
```

### High-complexity dead code (safe to delete but tangled)

```sql
SELECT id, repo, cyclomatic_complexity, location
FROM nodes
WHERE is_dead_code = 1 AND cyclomatic_complexity > 5
ORDER BY cyclomatic_complexity DESC;
```

### Most-called × complexity (refactor priority)

```sql
SELECT id, repo,
       fan_in,
       cyclomatic_complexity,
       (fan_in * cyclomatic_complexity) AS refactor_score
FROM nodes
WHERE cyclomatic_complexity > 5 AND fan_in > 3
ORDER BY refactor_score DESC
LIMIT 20;
```

---

## Entry Point Analysis

### All entry points sorted by blast radius

```sql
SELECT id, repo, fan_out, location
FROM vw_entry_points
ORDER BY fan_out DESC;
```

### HTTP entry points only

```sql
SELECT id, repo, fan_out, location
FROM nodes
WHERE is_entry_point = 1 AND tags LIKE '%http%'
ORDER BY fan_out DESC;
```

### Kafka / message consumers

```sql
SELECT id, repo, fan_out, location
FROM nodes
WHERE is_entry_point = 1 AND tags LIKE '%kafka%'
ORDER BY fan_out DESC;
```

### Trivial handlers (entry points that call nothing)

```sql
SELECT id, repo, location
FROM nodes
WHERE is_entry_point = 1 AND fan_out = 0;
```

---

## Dead Code Analysis

### Dead code by repo

```sql
SELECT id, repo, cyclomatic_complexity, location
FROM vw_dead_code
ORDER BY repo, cyclomatic_complexity DESC;
```

### Non-trivial dead code (complexity > 1)

```sql
SELECT id, repo, cyclomatic_complexity, location
FROM nodes
WHERE is_dead_code = 1 AND cyclomatic_complexity > 1
ORDER BY cyclomatic_complexity DESC;
```

### Dead functions with telling name patterns

```sql
SELECT id, repo, location
FROM nodes
WHERE is_dead_code = 1
  AND (name LIKE '%legacy%' OR name LIKE '%old%'
       OR name LIKE '%deprecated%' OR name LIKE '%unused%')
ORDER BY repo;
```

---

## Async and Conditional Calls

### All async edges

```sql
SELECT e.from_node, e.to_node, e.call_site
FROM edges e
WHERE e.is_async = 1
ORDER BY e.from_node;
```

### Functions that make only async calls

```sql
SELECT n.id, n.repo, n.fan_out
FROM nodes n
WHERE n.fan_out > 0
  AND NOT EXISTS (
    SELECT 1 FROM edges e
    WHERE e.from_node = n.id AND e.is_async = 0
  )
ORDER BY n.fan_out DESC;
```

---

## Repo-Level Stats

### Full summary table

```sql
SELECT
  repo,
  COUNT(*) AS total_nodes,
  SUM(is_entry_point) AS entry_points,
  SUM(is_dead_code) AS dead_code,
  ROUND(100.0 * SUM(is_dead_code) / COUNT(*), 1) || '%' AS dead_pct,
  MAX(cyclomatic_complexity) AS max_cc,
  ROUND(AVG(fan_in), 1) AS avg_fan_in,
  ROUND(AVG(fan_out), 1) AS avg_fan_out
FROM nodes
GROUP BY repo
ORDER BY total_nodes DESC;
```

### Edge distribution by originating repo

```sql
SELECT from_repo,
       COUNT(*) AS total_edges,
       SUM(CASE WHEN from_repo != to_repo THEN 1 ELSE 0 END) AS cross_repo
FROM edges
GROUP BY from_repo
ORDER BY total_edges DESC;
```

### Cross-repo edges summary

```sql
SELECT from_repo, to_repo, COUNT(*) AS calls
FROM vw_cross_repo
GROUP BY from_repo, to_repo
ORDER BY calls DESC;
```

---

## Unresolved Calls

### Breakdown by reason

```sql
SELECT reason, COUNT(*) AS count
FROM unresolved_calls
GROUP BY reason
ORDER BY count DESC;
```

### Unresolved calls in a specific repo

```sql
SELECT uc.from_node, uc.target, uc.call_site, uc.reason
FROM unresolved_calls uc
JOIN nodes n ON n.id = uc.from_node
WHERE n.repo = 'api-service'
ORDER BY uc.call_site;
```

---

## Regeneration

```bash
# Full re-extraction
node scripts/cg-extract.js && node scripts/cg-reports.js

# Incremental update (after a git pull)
# Tell the agent: "update code graph"
# The agent will re-extract only changed files and recompute affected views.
```

---

## Related Files

| File | Description |
|------|-------------|
| [`../analysis/09-code-graph.md`](../analysis/09-code-graph.md) | View 09 — narrative code graph analysis |
| [`entry-point-map.md`](entry-point-map.md) | All entry points traced to leaf nodes |
| [`dead-code.md`](dead-code.md) | Full dead code inventory with removal risk |
| [`sre-hot-paths.md`](sre-hot-paths.md) | Critical call chains with reliability signals |
