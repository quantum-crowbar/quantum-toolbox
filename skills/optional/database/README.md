# Database

Guidelines for database design, querying, and migration across SQL and NoSQL stores.

## Core Principles

- **Parameterise everything** — never interpolate user input into queries
- **Schema changes via migrations** — never alter production schema manually
- **Repository pattern** — keep query logic out of business logic
- **Transactions for consistency** — wrap multi-step writes in transactions
- **Indexes are deliberate** — add for known query patterns, measure before and after

## Choosing a Database

| Use case | Good fit |
|----------|----------|
| Relational data with integrity constraints | PostgreSQL, SQLite |
| High-write time-series or events | PostgreSQL (timescaledb), ClickHouse |
| Document / flexible schema | PostgreSQL JSONB (first choice), MongoDB |
| Key-value cache / session | Redis |
| Full-text search | PostgreSQL FTS, Elasticsearch |
| Embedded / edge / mobile | SQLite |

Default to PostgreSQL for new services — it handles relational, JSON, full-text, and time-series well.

## Schema Design

```sql
-- Always include these on persistent tables
CREATE TABLE users (
  id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  email       TEXT NOT NULL UNIQUE,
  created_at  TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- Soft-delete pattern (prefer over hard delete for audit trails)
ALTER TABLE users ADD COLUMN deleted_at TIMESTAMPTZ;
-- Query: WHERE deleted_at IS NULL
```

Rules:
- UUIDs as primary keys (portable, no ordering leak)
- `TIMESTAMPTZ` not `TIMESTAMP` (timezone-aware)
- `NOT NULL` by default — nullable only when absence is meaningful
- Foreign keys with explicit `ON DELETE` behaviour
- Separate junction tables for many-to-many (no array columns for relations)

## Indexing

```sql
-- Single column — most common
CREATE INDEX idx_users_email ON users (email);

-- Partial index — only index relevant rows (smaller, faster)
CREATE INDEX idx_users_active ON users (email) WHERE deleted_at IS NULL;

-- Covering index — avoids table lookup for common queries
CREATE INDEX idx_orders_user_created ON orders (user_id, created_at DESC);

-- Expression index
CREATE INDEX idx_users_email_lower ON users (lower(email));
```

Index guidelines:
- Index columns in `WHERE`, `JOIN ON`, and `ORDER BY` clauses
- Composite index column order matters — most selective first
- Every index slows writes — add only for measured query patterns
- `EXPLAIN ANALYZE` before and after adding indexes

## Query Patterns

```sql
-- Prefer explicit column lists over SELECT *
SELECT id, email, created_at FROM users WHERE id = $1;

-- Pagination — keyset (better than OFFSET for large tables)
SELECT id, created_at FROM orders
WHERE created_at < $1  -- cursor from previous page
ORDER BY created_at DESC
LIMIT 20;

-- Upsert
INSERT INTO users (id, email) VALUES ($1, $2)
ON CONFLICT (email) DO UPDATE SET updated_at = now();

-- Count estimation (fast) vs exact count (slow on large tables)
SELECT reltuples::BIGINT FROM pg_class WHERE relname = 'users';
```

## Transactions

```python
# Python (SQLAlchemy async)
async with session.begin():
    await session.execute(update_balance_sql, {"user_id": uid, "amount": -100})
    await session.execute(insert_transaction_sql, {...})
    # auto-commit on exit, rollback on exception
```

```ts
// Drizzle
await db.transaction(async (tx) => {
  await tx.update(accounts).set({ balance: sql`balance - 100` }).where(eq(accounts.id, fromId))
  await tx.insert(ledger).values({ from: fromId, to: toId, amount: 100 })
})
```

- Transactions should be short-lived — don't include HTTP calls or slow operations inside
- Use `READ COMMITTED` (default) for most cases; `SERIALIZABLE` only when needed

## Connection Pooling

- Always use a connection pool (pgbouncer, or ORM pool) — never new connections per request
- Pool sizing: `(2 × CPU cores) + effective_spindle_count` is a starting point; profile under load
- Set connection timeout; don't let requests wait indefinitely for a pool slot

## Migrations

```bash
# Drizzle (TypeScript projects)
bunx drizzle-kit generate   # generate SQL from schema diff
bunx drizzle-kit migrate    # apply pending migrations

# Alembic (Python projects)
alembic revision --autogenerate -m "add users table"
alembic upgrade head
```

Rules:
- Every schema change needs a migration file
- Migrations are additive — avoid dropping columns in the same release as removing code
- Deploy in two phases when removing columns: (1) stop writing, (2) drop column
- Never run `CREATE TABLE IF NOT EXISTS` in application startup in production

## Security

```sql
-- Least-privilege DB user for the app
CREATE USER app_user WITH PASSWORD '...';
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO app_user;
-- Do NOT grant CREATE, DROP, ALTER to the app user
```

- Separate migration user (needs DDL) from app user (needs DML only)
- Rotate credentials via environment — never hardcode
- Audit log sensitive tables with `created_by`, `updated_by` columns or triggers
- Use row-level security (RLS) in PostgreSQL for multi-tenant data isolation

## Performance Diagnostics

```sql
-- Slow query log (PostgreSQL)
-- In postgresql.conf:
-- log_min_duration_statement = 1000  (log queries > 1s)

-- Find missing indexes
SELECT schemaname, tablename, attname, n_distinct, correlation
FROM pg_stats WHERE tablename = 'orders';

-- Active queries
SELECT pid, query, state, wait_event, now() - query_start AS duration
FROM pg_stat_activity
WHERE state != 'idle'
ORDER BY duration DESC;

-- Table and index bloat check
SELECT relname, pg_size_pretty(pg_relation_size(oid)) FROM pg_class ORDER BY pg_relation_size(oid) DESC LIMIT 20;
```
