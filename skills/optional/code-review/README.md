# Code Review

Guidelines for effective, high-signal code reviews — covering security, correctness, maintainability, and team dynamics.

## What Code Review Is For

- **Correctness** — does it do what it's supposed to do?
- **Security** — does it introduce vulnerabilities?
- **Maintainability** — will the next person understand it?
- **Consistency** — does it follow project conventions?
- **Knowledge sharing** — review is a learning channel, not a gate

Code review is NOT for catching every possible improvement. Focus on what matters.

## Review Priority Order

1. **Security issues** — always block; never ship
2. **Correctness bugs** — logic errors, off-by-one, missing error handling
3. **API / contract breaks** — changed behaviour of public interfaces
4. **Resource leaks** — unclosed connections, uncaught async errors
5. **Test coverage** — missing tests for critical paths
6. **Code clarity** — confusing naming, missing comments on non-obvious logic
7. **Style** — defer to linter; don't waste review time on whitespace

## Security Review Focus Areas

```
[ ] User input validated before use (never trust request data)
[ ] No SQL/command/template injection (parameterised queries, no string interpolation)
[ ] Authentication checked before authorisation
[ ] Authorisation checked on every sensitive endpoint (not just at login)
[ ] Secrets not logged, not in responses, not in URLs
[ ] Sensitive data encrypted at rest and in transit
[ ] File operations restricted to expected directories (path traversal)
[ ] Dependencies checked for known CVEs (dependabot / npm audit / pip-audit)
[ ] Error messages don't leak stack traces or internal paths to clients
```

## Correctness Review Focus Areas

```
[ ] Off-by-one errors in loops and index operations
[ ] Integer overflow in numeric calculations
[ ] Null/undefined handling — are all code paths safe?
[ ] Async code awaited correctly (no fire-and-forget on writes)
[ ] Race conditions in concurrent code
[ ] Transaction boundaries correct for multi-step writes
[ ] Idempotency where required (retry-safe operations)
[ ] Edge cases: empty list, zero, negative values, max values
```

## API / Interface Review

```ts
// Check: does this change break existing callers?

// Breaking:
// - Removing a field from a response
// - Changing a field type (string → number)
// - Changing required validation (optional → required)
// - Changing HTTP method or path

// Non-breaking:
// - Adding optional fields to response
// - Adding optional query parameters
// - Tightening validation with a good error message
```

When in doubt, add a deprecation path rather than breaking the API.

## Writing Review Comments

**High signal (always include):**
- Bug or security issue with explanation
- Concrete alternative: "consider X because Y"
- Question about intent: "is this intentional when list is empty?"

**Low signal (skip or mark nitpick):**
- Style preferences covered by the linter
- Rewrites that are equivalent in quality
- Personal taste without a maintainability argument

**Tone:**
- Comment on code, not the author: "this function" not "you wrote"
- Use "nit:" prefix for non-blocking style comments
- Ask questions instead of making demands when genuinely unsure

## Reviewing Tests

```
[ ] Tests cover the happy path
[ ] Tests cover the main error/edge cases
[ ] Test names describe the scenario, not the function name
[ ] No test logic duplication that obscures intent
[ ] Mocks are used at the right boundary (external services, not internals)
[ ] Tests are deterministic (no time-dependent, no random, no order-dependent)
[ ] Test data is minimal — only what the test needs
```

## Performance Considerations

Only flag performance issues when:
- The code runs in a hot path (request handler, tight loop, large data set)
- There is a concrete, measurable problem or a well-known anti-pattern
- The fix doesn't significantly hurt readability

Don't pre-optimise code that processes 10 records once per hour.

## Checklist by Language / Stack

### TypeScript / JavaScript
```
[ ] No `any` types without justification
[ ] Async functions awaited; no floating promises
[ ] Error handling: catch blocks don't swallow errors silently
[ ] ESM imports with correct extensions
[ ] No `eval()`, `Function()`, or `innerHTML =` with user data
```

### Python
```
[ ] Type hints on all function signatures
[ ] No bare `except:` — catch specific exception types
[ ] Blocking IO not called in async functions
[ ] No mutable default arguments (def f(x=[]): ...)
[ ] f-strings used over .format() for clarity
```

### SQL / Database
```
[ ] Parameterised queries — no string interpolation
[ ] Migration exists for schema changes
[ ] Indexes present for WHERE / JOIN columns in hot paths
[ ] Transactions wrap multi-step writes
```

## Self-Review Before Submitting a PR

```
[ ] Read the diff as if you've never seen the code before
[ ] Run the tests locally
[ ] Remove debug logging, TODOs, commented-out code
[ ] PR description explains WHY, not just WHAT
[ ] Scope is focused — one concern per PR
[ ] Breaking changes are documented in the PR body
```
