# TypeScript Backend

Guidelines for building backend services with Node.js or Bun in TypeScript.

## Runtime Choice

| Runtime | Use when |
|---------|----------|
| **Bun** | New services; faster startup, built-in TS, faster installs |
| **Node.js** | Existing ecosystem constraints; maximum compatibility |

Bun is the default for new services in 2025+.

## Framework

**Hono** is the default for new services — fast, lightweight, edge-compatible:

```ts
import { Hono } from 'hono'
import { zValidator } from '@hono/zod-validator'
import { z } from 'zod'

const app = new Hono()

const createUserSchema = z.object({
  email: z.string().email(),
  name: z.string().min(1),
})

app.post('/users', zValidator('json', createUserSchema), async (c) => {
  const body = c.req.valid('json')
  const user = await userService.create(body)
  return c.json(user, 201)
})

export default app
```

Use **Fastify** when: you need a large plugin ecosystem, OpenAPI generation, or schema-based serialisation.

## Validation — Zod

```ts
import { z } from 'zod'

const UserSchema = z.object({
  id: z.string().uuid(),
  email: z.string().email(),
  createdAt: z.coerce.date(),
})

type User = z.infer<typeof UserSchema>

// Parse and throw on invalid
const user = UserSchema.parse(rawData)

// Safe parse — returns { success, data } | { success: false, error }
const result = UserSchema.safeParse(rawData)
```

## Database — Drizzle ORM

```ts
import { drizzle } from 'drizzle-orm/bun-sqlite'
import { users } from './schema'
import { eq } from 'drizzle-orm'

const db = drizzle(new Database('app.db'))

// Type-safe queries
const user = await db.select().from(users).where(eq(users.id, id)).get()
```

- Drizzle for new projects (type-safe, lightweight, Bun-compatible)
- Prisma for projects needing complex relations or an existing Prisma setup
- Never write raw SQL without parameterisation

## Module System

- ESM only for Bun and modern Node (Node 18+)
- `package.json`: `"type": "module"`
- Import with `.js` extension in source (even for `.ts` files) — required for ESM

## Error Handling

```ts
// Typed error class
class AppError extends Error {
  constructor(
    public readonly code: string,
    message: string,
    public readonly statusCode = 500
  ) {
    super(message)
    this.name = 'AppError'
  }
}

// Hono error handler
app.onError((err, c) => {
  if (err instanceof AppError) {
    return c.json({ error: err.code, message: err.message }, err.statusCode)
  }
  console.error(err)
  return c.json({ error: 'INTERNAL_ERROR' }, 500)
})
```

## Environment Configuration

```ts
import { z } from 'zod'

const envSchema = z.object({
  DATABASE_URL: z.string().url(),
  SECRET_KEY: z.string().min(32),
  PORT: z.coerce.number().default(3000),
})

export const env = envSchema.parse(process.env)
```

Validate at startup — fail fast if required env vars are missing.

## Testing

- **Bun test** for unit tests (built-in, no jest config needed)
- **Vitest** for Node.js projects
- Test the HTTP layer with `app.request()` (Hono) — no running server needed
- Mock external services with `msw` (mock service worker)
