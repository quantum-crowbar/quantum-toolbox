# TDD Workflow — Workflows

## TDD Session Checklist

```
Before writing any production code:
[ ] Failing test written that describes the desired behaviour
[ ] Test fails for the right reason (not a syntax error or wrong import)
[ ] Test name clearly describes the scenario

During implementation:
[ ] Minimum code written to make the test pass (no more)
[ ] No production code added without a failing test asking for it
[ ] All tests pass before refactoring

During refactor:
[ ] Tests remain green after every change
[ ] Code duplication removed
[ ] Names improved
[ ] No new behaviour added during refactor (separate RED step for that)

After the cycle:
[ ] New test added to cover the next piece of behaviour
[ ] Test suite runs in < 1s for unit tests (fast feedback loop)
```

## Red-Green-Refactor Timer

A disciplined TDD cycle should be short. If you're spending more than:

| Phase | Time budget | If longer… |
|-------|------------|-----------|
| Red | 2–5 min | Test is too large — break it down |
| Green | 5–15 min | Behaviour is too complex — break the story smaller |
| Refactor | 5–10 min | Design needs bigger surgery — create a separate refactor task |

If you find yourself writing code for more than 15 minutes without running tests, stop. Write a test for what you've written so far.

## Common TDD Mistakes

### Writing too much before testing

```ts
// Bad — wrote 50 lines then "added tests"
// This is test-after, not TDD; tests retrofit to the code, not vice versa

// Good — wrote 3 lines after a failing test
function add(a: number, b: number) { return a + b }
```

### Testing implementation instead of behaviour

```ts
// Bad — tests internal structure; breaks on refactor
expect(service._cache.has(userId)).toBe(true)

// Good — tests observable behaviour
const result1 = await service.getUser(userId)
const result2 = await service.getUser(userId)
expect(db.query).toHaveBeenCalledTimes(1)  // cached; DB only hit once
```

### Over-mocking

```ts
// Bad — mocking so much that no real code runs
const repo = { findById: jest.fn(), save: jest.fn(), delete: jest.fn() }
const validator = { validate: jest.fn().mockReturnValue(true) }
const mapper = { toDto: jest.fn().mockReturnValue(dto) }
// Now the test verifies mocks talk to mocks

// Better — use a fake repository; only mock at system boundaries
const repo = new InMemoryUserRepository()
const service = new UserService(repo)
```

### Skipping the refactor step

```
RED → GREEN → (skip refactor) → RED → GREEN → (skip) → RED...
```

Result: tests pass but code degrades. Refactor is when the design happens — don't skip it.

## TDD with HTTP Handlers (Outside-In)

```ts
// 1. Start with the handler test (outermost)
it('returns 201 with the created user when valid data is provided', async () => {
  const res = await app.request('/users', {
    method: 'POST',
    body: JSON.stringify({ email: 'a@b.com', name: 'Alice' }),
    headers: { 'Content-Type': 'application/json' },
  })
  expect(res.status).toBe(201)
  const body = await res.json()
  expect(body).toMatchObject({ email: 'a@b.com', name: 'Alice' })
})
// Test fails — handler doesn't exist

// 2. Implement the handler shell (using a mock service)
const mockUserService = { create: jest.fn().mockResolvedValue({ id: '1', email: 'a@b.com', name: 'Alice' }) }
app.post('/users', async (c) => {
  const body = await c.req.json()
  const user = await mockUserService.create(body)
  return c.json(user, 201)
})
// Handler test passes

// 3. Now drive the service with its own failing test
it('creates and persists a user', async () => {
  const repo = new InMemoryUserRepository()
  const service = new UserService(repo)
  const user = await service.create({ email: 'a@b.com', name: 'Alice' })
  expect(user.id).toBeDefined()
  expect(await repo.findByEmail('a@b.com')).not.toBeNull()
})
// Test fails — UserService doesn't exist yet

// 4. Implement UserService to pass
// ... continue inward
```

## Test Naming Conventions

```
Pattern: [unit/behaviour] [condition] [expected outcome]

ts:   it('returns 0 when no discount code is provided')
      it('throws NotFoundError when user does not exist')
      it('sends a welcome email after successful registration')

python:
      def test_returns_zero_when_no_discount_code():
      def test_raises_not_found_when_user_missing():
      def test_sends_welcome_email_on_registration():
```

Test names are documentation. A failing test name should tell you exactly what broke and what the expected behaviour was.

## When TDD is Hard (and What to Do)

| Situation | Approach |
|-----------|---------|
| Testing UI rendering | Use component testing (RTL); test behaviour not DOM structure |
| Testing async side effects | Use jest.fn() spies; verify calls not implementation |
| Testing third-party API | Mock at the HTTP boundary with msw or equivalent |
| Testing database queries | Use in-memory or test database with rollback per test |
| Testing a function with many dependencies | Design problem — extract a pure core, test that; mock/fake the shell |
| Testing legacy code with no seams | Add a characterisation test first; then extract and test |
