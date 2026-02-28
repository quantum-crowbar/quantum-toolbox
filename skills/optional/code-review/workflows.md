# Code Review — Workflows

## AI-Assisted Review Workflow

When asked to review code, follow this sequence:

### 1. Understand intent first
- Read the PR description or commit message
- Read any linked spec, ticket, or issue
- Understand what problem is being solved before looking at the code

### 2. High-level pass
- Read changed files top-to-bottom for structure
- Flag any files that look unexpectedly touched
- Check if the change scope is appropriate

### 3. Security pass (always)
```
- User input validation at API boundary
- SQL / command / template injection
- Auth checks (authentication + authorisation)
- Secrets handling
- Path traversal / file ops
- Output encoding (XSS prevention in web contexts)
```

### 4. Correctness pass
```
- Logic errors, off-by-one
- Null/undefined paths
- Async errors / floating promises
- Transaction boundaries
- Race conditions
```

### 5. Tests pass
```
- Coverage of added behaviour
- Edge cases tested
- Test quality (readable, focused, deterministic)
```

### 6. Maintainability pass
```
- Naming clarity
- Non-obvious logic commented
- No dead code, debug logs, or TODOs left in
```

### 7. Write comments grouped by priority
```
BLOCKING (must fix before merge):
  - Security issues
  - Correctness bugs

SHOULD FIX (strong recommendation):
  - Missing tests
  - Resource leaks
  - Breaking API changes

OPTIONAL (nit / suggestion):
  - Style improvements
  - Alternative approaches
```

## Vulnerability Pattern Library

### Injection

```python
# SQL injection — BAD
cursor.execute(f"SELECT * FROM users WHERE email = '{user_input}'")

# Good
cursor.execute("SELECT * FROM users WHERE email = %s", (user_input,))
```

```ts
// Command injection — BAD
exec(`ffmpeg -i ${filename} output.mp4`)

// Good
execFile('ffmpeg', ['-i', filename, 'output.mp4'])
```

```ts
// Path traversal — BAD
const file = path.join('/uploads', req.params.filename)

// Good
const safe = path.resolve('/uploads', req.params.filename)
if (!safe.startsWith('/uploads/')) throw new AppError('FORBIDDEN', 'Invalid path', 403)
```

### Authentication / Authorisation

```ts
// Missing authorisation check — BAD
app.get('/users/:id/orders', async (c) => {
  return c.json(await db.getOrders(c.req.param('id')))  // any user can read any orders
})

// Good
app.get('/users/:id/orders', requireAuth, async (c) => {
  const { userId } = c.get('user')
  if (userId !== c.req.param('id')) throw new AppError('FORBIDDEN', 'Not your orders', 403)
  return c.json(await db.getOrders(userId))
})
```

### Secret Leakage

```ts
// BAD — secret in response
return c.json({ user: { id, email, passwordHash } })

// BAD — secret in log
logger.info('auth attempt', { email, password })

// Good — explicit allowlist for response fields
return c.json({ user: { id, email } })
logger.info('auth attempt', { email })
```

### Async Errors

```ts
// BAD — floating promise; errors silently lost
app.post('/webhooks', (c) => {
  processWebhook(c.req.json())  // not awaited, not caught
  return c.json({ ok: true })
})

// Good
app.post('/webhooks', async (c) => {
  await processWebhook(await c.req.json())
  return c.json({ ok: true })
})
```

## PR Comment Templates

**Security block:**
```
🔴 BLOCKING — Security: SQL injection risk
This query interpolates `req.params.id` directly into the SQL string.
If `id` is user-controlled, this is exploitable.
Fix: use parameterised query: `db.query('SELECT * FROM x WHERE id = $1', [id])`
```

**Bug block:**
```
🔴 BLOCKING — Bug: floating promise
`sendEmail()` is not awaited. If it throws, the error is silently lost
and the caller gets a success response when the email never sent.
Fix: `await sendEmail(...)`
```

**Missing test:**
```
🟡 SHOULD FIX — Missing test coverage
The error path when `userId` is not found is not tested.
Please add a test that verifies a 404 is returned in this case.
```

**Nit:**
```
nit: consider extracting this into a named constant for readability:
const MAX_RETRIES = 3
```
