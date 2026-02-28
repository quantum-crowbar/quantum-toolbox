# TypeScript Programming — Workflows

## Type Safety Checklist

```
[ ] tsconfig has "strict": true
[ ] No any — unknown with narrowing instead
[ ] No ts-ignore or @ts-expect-error without explanation
[ ] No non-null assertions (!) without a guard comment explaining certainty
[ ] Function signatures are annotated (params + return type)
[ ] Discriminated unions used for multi-state types
[ ] Utility types used before custom mapped types
```

## Narrowing Patterns

```ts
// Type guard function
function isUser(value: unknown): value is User {
  return typeof value === 'object' && value !== null && 'id' in value
}

// Exhaustive check for discriminated union
function assertNever(x: never): never {
  throw new Error(`Unexpected value: ${JSON.stringify(x)}`)
}

function handle(status: Status) {
  switch (status) {
    case 'active': return doActive()
    case 'inactive': return doInactive()
    default: return assertNever(status)  // compile error if case is missing
  }
}
```

## Declaration Files

For untyped third-party modules:
```ts
// types/untyped-module.d.ts
declare module 'untyped-module' {
  export function doThing(input: string): string
}
```

## Build Tooling

- `tsc --noEmit` for type-checking only (CI gate)
- Use project references for monorepos
- `ts-node` or `tsx` for scripts; `tsup` or `esbuild` for library builds
