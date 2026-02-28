# TypeScript Backend — Workflows

## Code Review Checklist

```
[ ] All inputs validated with Zod at the API boundary
[ ] No any types
[ ] Environment validated at startup with Zod schema
[ ] Database queries parameterised (no string interpolation into SQL)
[ ] Error responses don't leak internal details (stack traces, DB errors)
[ ] Custom AppError used (not bare Error) for known error cases
[ ] ESM imports with .js extensions (not .ts)
[ ] Tests cover happy path + main error cases
```

## Hono Request Lifecycle

```ts
// Middleware → Handler → Error handler

// Middleware
app.use('*', async (c, next) => {
  const start = Date.now()
  await next()
  c.header('X-Response-Time', `${Date.now() - start}ms`)
})

// Route with validation
app.put('/users/:id',
  zValidator('param', z.object({ id: z.string().uuid() })),
  zValidator('json', updateUserSchema),
  async (c) => {
    const { id } = c.req.valid('param')
    const body = c.req.valid('json')
    return c.json(await userService.update(id, body))
  }
)
```

## Drizzle Migration Workflow

```bash
# Generate migration from schema changes
bunx drizzle-kit generate

# Apply migrations
bunx drizzle-kit migrate

# Open Drizzle Studio (local DB browser)
bunx drizzle-kit studio
```

## Bun vs Node Compatibility Notes

| Feature | Bun | Node |
|---------|-----|------|
| TS execution | Native | ts-node/tsx |
| Test runner | bun test | vitest/jest |
| SQLite | Built-in | better-sqlite3 |
| HTTP server | Built-in | http module |
| Package manager | bun install | npm/pnpm |
