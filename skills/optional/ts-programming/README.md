# TypeScript Programming

Guidelines for writing safe, idiomatic TypeScript.

## Core Principles

- **Strict mode always** — `"strict": true` in tsconfig; never disable strict checks
- **No `any`** — use `unknown` and narrow, or model the type properly
- **Types describe shape, interfaces describe contracts**
- **Let inference work** — annotate function signatures, let inference handle locals

## Type System

### Prefer `unknown` over `any`

```ts
// ✓
function parse(input: unknown): User {
  if (!isUser(input)) throw new Error('Invalid user shape')
  return input
}

// ✗
function parse(input: any): User { return input }
```

### Type vs Interface

```ts
// Interface: public contracts, extendable by others
interface Repository<T> {
  findById(id: string): Promise<T | null>
  save(entity: T): Promise<T>
}

// Type alias: unions, intersections, computed shapes
type UserId = string & { readonly brand: 'UserId' }
type Result<T> = { ok: true; data: T } | { ok: false; error: Error }
```

### Discriminated Unions

```ts
type ApiResponse<T> =
  | { status: 'ok'; data: T }
  | { status: 'error'; code: number; message: string }

function handle(res: ApiResponse<User>) {
  if (res.status === 'ok') {
    console.log(res.data.name)  // TypeScript knows data exists
  }
}
```

## Generics

```ts
// ✓ Constrained generic
async function findOrThrow<T>(
  repo: Repository<T>,
  id: string
): Promise<T> {
  const result = await repo.findById(id)
  if (!result) throw new Error(`Not found: ${id}`)
  return result
}
```

- Name type params descriptively when the meaning isn't obvious (`TEntity` not `T`)
- Constrain generics (`T extends BaseEntity`) when you rely on shape

## Enums vs Union Types

```ts
// ✓ String union (simpler, no runtime overhead)
type Status = 'active' | 'inactive' | 'pending'

// ✓ Const enum when numeric mapping is needed
const enum Direction { Up, Down, Left, Right }

// ✗ Regular enum — avoid (runtime object, confusing semantics)
enum Status { Active, Inactive }
```

## Utility Types

Use built-ins before writing your own:
- `Partial<T>`, `Required<T>`, `Readonly<T>`
- `Pick<T, K>`, `Omit<T, K>`
- `ReturnType<F>`, `Parameters<F>`
- `NonNullable<T>` to strip null/undefined

## tsconfig Essentials

```json
{
  "compilerOptions": {
    "strict": true,
    "noUncheckedIndexedAccess": true,
    "exactOptionalPropertyTypes": true,
    "noImplicitReturns": true
  }
}
```

`noUncheckedIndexedAccess` catches array/object index bugs — enable it.

## Common Mistakes

- Casting with `as` to suppress errors instead of narrowing properly
- `!` non-null assertion without being certain — use proper guards
- Widening types with `as unknown as TargetType` — almost always wrong
- Forgetting that `Object.keys()` returns `string[]` not `(keyof T)[]`
