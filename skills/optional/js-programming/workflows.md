# JavaScript Programming — Workflows

## Code Review Checklist

```
[ ] No var declarations
[ ] Async functions always use await in try/catch
[ ] No Promise.then() mixed with await in same function
[ ] Parallel operations use Promise.all where safe
[ ] === used throughout (no ==)
[ ] No silent catch blocks
[ ] Error messages are specific and actionable
[ ] ESM imports/exports (not require/module.exports in new code)
[ ] Optional chaining used instead of nested && guards
[ ] Nullish coalescing used instead of || for defaults
```

## Async Bug Patterns to Catch

```js
// Bug: forEach doesn't await
items.forEach(async item => await process(item))  // ✗
for (const item of items) await process(item)      // ✓

// Bug: unhandled rejection
fetchData().then(process)  // ✗ missing .catch()
await fetchData().then(process)  // ✓ caught by outer try/catch

// Bug: Promise.all failure loses context
const results = await Promise.all(items.map(process))  // partial failure unclear
// ✓ Use Promise.allSettled() if partial failure is expected
```

## Module Pattern

```js
// user-service.js
export async function getUser(id) { ... }
export async function updateUser(id, data) { ... }
// No default export — named exports only
```

## Performance Patterns

- Avoid O(n²) in loops — use Map/Set for lookups
- Debounce event handlers that fire frequently
- `structuredClone()` for deep copies (Node 17+, modern browsers)
