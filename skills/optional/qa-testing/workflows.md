# QA Testing — Workflows

## Test Review Checklist

```
[ ] Tests cover happy path
[ ] Tests cover main error cases (validation failure, not found, auth failure)
[ ] Test names describe the scenario (not the function name)
[ ] Each test has one clear assertion concept
[ ] No shared mutable state between tests
[ ] No sleep/arbitrary delays — event-based or mocked time
[ ] Mocks used only at service boundaries (external services, DB)
[ ] DB tests use transaction rollback for isolation
[ ] Coverage: service layer > 80%, handlers have key paths tested
[ ] CI runs the test suite on every PR
```

## New Feature Test Plan

When a new feature is delivered, verify:

```
1. Happy path end-to-end (unit + integration)
2. Validation errors return correct HTTP status and message
3. Authentication required where expected
4. Authorisation enforced (user can't access another user's resource)
5. Edge cases: empty input, max-length input, duplicate input
6. Concurrent requests (if applicable): idempotency, no race condition
7. Error propagation: what happens when a dependency fails?
```

## CI Test Pipeline

```yaml
# GitHub Actions example
test:
  runs-on: ubuntu-latest
  steps:
    - uses: actions/checkout@v4
    - uses: oven-sh/setup-bun@v1     # or actions/setup-python
    - run: bun install
    - run: bun test --coverage
    - run: bunx tsc --noEmit         # type check
```

Fail-fast rules:
- Type errors → fail
- Test failures → fail
- Coverage below threshold → warn (don't block on coverage alone)

## Test Naming Conventions

```
# Pattern: [subject] [condition] [expected outcome]

# Python (pytest)
def test_create_user_with_duplicate_email_returns_409(): ...
def test_get_order_when_not_owner_returns_403(): ...
def test_process_payment_with_expired_card_raises_payment_error(): ...

# TypeScript (bun test / vitest)
it('returns 409 when email already exists')
it('returns 403 when accessing another user\'s order')
it('throws PaymentError when card is expired')
```

## Debugging Flaky Tests

Common causes:

| Symptom | Likely cause | Fix |
|---------|-------------|-----|
| Fails only in CI | Order dependency | Use independent fixtures |
| Fails intermittently | Shared state / race | Isolate with rollback, remove global state |
| Passes alone, fails in suite | State leak | Check `beforeEach`/`afterEach` cleanup |
| Fails on different timezones | Hardcoded dates | Use UTC, freeze time, or relative dates |
| Fails under load | Timing assumption | Mock time or use event-based waits |

## Load and Contract Testing

### Load testing (k6)

```js
import http from 'k6/http'
import { check } from 'k6'

export const options = {
  vus: 50,
  duration: '30s',
}

export default function () {
  const res = http.get('http://localhost:3000/users')
  check(res, {
    'status is 200': (r) => r.status === 200,
    'response time < 200ms': (r) => r.timings.duration < 200,
  })
}
```

### Contract testing (Pact)

- Use for microservice boundaries where teams own both sides
- Consumer defines the contract, provider verifies it
- Avoids having to run the full stack for integration tests

## Regression Test Workflow

When a bug is fixed:
1. Write a failing test that reproduces the bug
2. Verify the test fails on the current code
3. Apply the fix
4. Verify the test now passes
5. The test becomes the regression guard for this bug

This ensures:
- The bug is genuinely fixed
- It won't silently regress in future
- The intent of the fix is documented
