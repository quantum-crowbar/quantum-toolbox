# Database — Workflows

## Code Review Checklist

```
[ ] No string interpolation in queries — parameterised only
[ ] Schema changes have a migration file
[ ] Migration is reversible (down migration exists or documented)
[ ] Indexes exist for all WHERE / JOIN / ORDER BY columns in hot paths
[ ] Transactions used for multi-step writes
[ ] Connection pool configured (not new connections per request)
[ ] DB credentials come from environment (not hardcoded)
[ ] App DB user has DML-only privileges (no DDL)
[ ] SELECT * avoided — explicit column lists only
[ ] N+1 queries eliminated (use JOINs or batch load)
```

## Schema Change Workflow (Safe Deploy)

### Adding a column (non-breaking)

```
1. Generate migration: add nullable column OR column with default
2. Review generated SQL before applying
3. Apply to staging → run integration tests
4. Deploy new code (reads new column with fallback if absent)
5. Apply to production
```

### Removing a column (two-phase)

```
Phase 1 (this release):
  - Stop writing to column in code
  - Stop reading from column in code
  - Deploy code

Phase 2 (next release):
  - Generate DROP COLUMN migration
  - Apply to staging → verify
  - Apply to production
```

Never drop a column in the same release as removing the code that uses it.

### Renaming a column (two-phase)

```
Phase 1:
  - Add new column
  - Write to both columns
  - Backfill old → new
  - Deploy

Phase 2:
  - Read from new column only
  - Stop writing to old column
  - Drop old column
```

## N+1 Query Detection

```python
# Bad — N+1
users = await session.execute(select(User))
for user in users:
    orders = await session.execute(select(Order).where(Order.user_id == user.id))

# Good — JOIN or eager load
result = await session.execute(
    select(User).options(selectinload(User.orders))
)
```

Signs of N+1 in logs:
- Repeated identical queries with different IDs
- Query count scales linearly with result set size

## EXPLAIN ANALYZE Workflow

```sql
-- 1. Run with EXPLAIN ANALYZE to see actual costs
EXPLAIN (ANALYZE, BUFFERS, FORMAT TEXT)
SELECT * FROM orders WHERE user_id = 'abc' ORDER BY created_at DESC LIMIT 20;

-- 2. Look for:
--    Seq Scan on large tables → needs index
--    Hash Join on high-cardinality → may need index on join key
--    Sort on large sets → consider covering index with ORDER BY column
--    High rows removed by filter → partial index candidate

-- 3. Add index, run EXPLAIN ANALYZE again, compare costs
```

## Backup and Recovery Checklist

```
[ ] Automated daily backups enabled (pg_dump or managed service snapshots)
[ ] Backup restore tested in staging (not just assumed to work)
[ ] Point-in-time recovery (WAL archiving) enabled for production
[ ] Backup retention policy documented
[ ] Recovery time objective (RTO) and recovery point objective (RPO) defined
```

## Connection Pool Sizing Reference

| Service type | Connections per instance | Notes |
|-------------|--------------------------|-------|
| Web API (async) | 5–10 | Async I/O multiplexes well |
| Web API (sync/WSGI) | 10–20 | One connection per thread |
| Background worker | 2–5 | Lower concurrency |
| pgbouncer (transaction mode) | Matches server max_connections | Proxy handles fan-out |

Formula: `max_connections = (2 × vCPUs) + 1` as a starting point for PostgreSQL.

## SQLite-Specific Notes

```ts
// Bun built-in SQLite (no driver install needed)
import { Database } from 'bun:sqlite'

const db = new Database('app.db', { create: true })

// Enable WAL mode for concurrent reads
db.exec('PRAGMA journal_mode = WAL')
db.exec('PRAGMA foreign_keys = ON')
db.exec('PRAGMA synchronous = NORMAL')  // safe with WAL

// Prepared statements are essential for SQLite performance
const getUser = db.prepare('SELECT * FROM users WHERE id = ?')
const user = getUser.get(id)
```

WAL mode required when multiple processes/threads read while writes occur.
