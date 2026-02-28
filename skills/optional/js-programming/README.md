# JavaScript Programming

Guidelines for writing idiomatic, modern JavaScript.

## Core Principles

- **Explicit over implicit** — avoid relying on coercions and falsy/truthy surprises
- **Modern syntax** — ES2020+ features are the baseline; no transpile-target excuses for old patterns
- **Async-first** — async/await everywhere; raw promise chains only when chaining is cleaner
- **No var** — `const` by default, `let` when reassignment is needed

## Variables and Scope

```js
// ✓
const user = getUser()
let count = 0

// ✗
var user = getUser()
```

- Destructure early: `const { id, name } = user`
- Optional chaining: `user?.profile?.avatar`
- Nullish coalescing: `config.timeout ?? 5000`

## Async Patterns

```js
// ✓ async/await
async function fetchUser(id) {
  const response = await fetch(`/users/${id}`)
  if (!response.ok) throw new Error(`HTTP ${response.status}`)
  return response.json()
}

// ✓ Parallel when safe
const [user, posts] = await Promise.all([fetchUser(id), fetchPosts(id)])
```

- Never mix async/await and `.then()` in the same function
- Always `await` in try/catch — silent promise rejections are bugs

## Error Handling

```js
// ✓ Explicit, actionable errors
throw new Error(`User ${id} not found in region ${region}`)

// ✗ Silent swallow
try { doThing() } catch {}
```

- Use `Error` subclasses for distinct error types where callers need to distinguish
- Log with context, not just the error message

## Modules

- ESM (`import`/`export`) for all new code; CommonJS only for legacy Node tooling
- Named exports over default exports — named exports are more refactor-safe
- Index files (`index.js`) are acceptable for re-exporting a module's public surface

## Collections

```js
// ✓ Functional over imperative
const activeUsers = users.filter(u => u.active).map(u => u.name)

// ✓ Object spread
const updated = { ...user, name: 'new' }

// ✗ Mutating the original
user.name = 'new'
```

## Common Pitfalls

- `==` is always wrong — use `===`
- `parseInt` without radix is wrong — use `parseInt(str, 10)` or `Number(str)`
- `forEach` doesn't await async callbacks — use `for...of` for sequential async
- `Array.from({ length: n })` not `new Array(n)` for creating arrays
