# TDD Workflow

Guidelines for test-driven development — red-green-refactor, test-first discipline, and applying TDD to real codebases.

## Core Principles

- **Test first, always** — write a failing test before writing any production code
- **One failing test at a time** — never write more than one failing test before making it pass
- **Minimum code to pass** — write the simplest code that makes the test pass; don't anticipate
- **Refactor with confidence** — refactoring is safe only when the test suite is green
- **Tests are design tools** — difficulty in testing a unit usually signals a design problem

## The Red-Green-Refactor Cycle

```
RED    → Write a failing test that describes one piece of desired behaviour
GREEN  → Write the minimum production code to make the test pass
REFACTOR → Clean up both the production code and the test; keep tests green

Repeat.
```

```
❶ RED
   Write test → it fails (because the production code doesn't exist yet)
   Verify the test fails for the right reason

❷ GREEN
   Write just enough code to pass
   Don't worry about clean code yet; just make it green

❸ REFACTOR
   Improve the code — remove duplication, improve names, extract functions
   Run tests after every change to stay green

→ Back to ❶
```

## What to Test (and What Not To)

### Test

- Behaviour observable from the public interface
- All logical branches (happy path, error cases, edge cases)
- Boundary values (zero, negative, max, empty, nil)
- Integration between components at the seam

### Don't test

- Private methods — test them through the public interface
- Language/framework internals — don't test that `Array.push` works
- Implementation details — the test should survive refactoring
- Third-party libraries — mock them at the boundary; assume they work

## Test Structure (AAA)

```ts
describe('calculateDiscount', () => {
  it('returns 0 when no discount code is provided', () => {
    // Arrange
    const price = 100
    const code = null

    // Act
    const discount = calculateDiscount(price, code)

    // Assert
    expect(discount).toBe(0)
  })
})
```

Each test has one clear assertion concept. If a test name contains "and", it probably tests two things.

## TDD by Example

### Step 1: Write the first failing test

```ts
// price-calculator.test.ts — no production code yet
import { calculateTotal } from './price-calculator'

it('returns item price when there are no discounts', () => {
  expect(calculateTotal({ price: 100, discountCode: null })).toBe(100)
})
// Fails: calculateTotal is not defined
```

### Step 2: Write minimum code to pass

```ts
// price-calculator.ts
export function calculateTotal({ price }: { price: number; discountCode: null }) {
  return price
}
// Test passes
```

### Step 3: Add the next failing test

```ts
it('applies 20% discount for code SAVE20', () => {
  expect(calculateTotal({ price: 100, discountCode: 'SAVE20' })).toBe(80)
})
// Fails: discount not implemented
```

### Step 4: Extend the implementation

```ts
export function calculateTotal({ price, discountCode }: { price: number; discountCode: string | null }) {
  if (discountCode === 'SAVE20') return price * 0.8
  return price
}
// Test passes
```

### Step 5: Refactor

```ts
const DISCOUNTS: Record<string, number> = { SAVE20: 0.2 }

export function calculateTotal({ price, discountCode }: Input): number {
  const discount = discountCode ? (DISCOUNTS[discountCode] ?? 0) : 0
  return price * (1 - discount)
}
// All tests still pass
```

## Outside-In TDD (London School)

Starts from the outermost interface (HTTP handler, UI) and works inward, using test doubles at each layer boundary.

```
1. Write failing acceptance test (full stack, end-to-end)
2. Write failing unit test for the outermost layer (handler)
   → Use mocks for collaborators not yet implemented
3. Red-green-refactor the handler
4. Move to the next layer inward (service)
   → Write failing unit test
   → Red-green-refactor
5. Continue inward until the acceptance test passes
```

Outside-in drives the design from the consumer's perspective — no code gets written unless a test asks for it.

## Test Doubles

| Type | What it does | When to use |
|------|-------------|-------------|
| **Stub** | Returns canned responses | Eliminating real dependencies |
| **Mock** | Verifies interactions (was it called? how?) | Testing that a collaborator was called correctly |
| **Fake** | Real implementation, simplified (e.g. in-memory DB) | Integration tests; faster than real DB |
| **Spy** | Records calls; optionally stubs | Verify side effects without full mock setup |

```ts
// Stub — just return a value
const emailService = { send: jest.fn().mockResolvedValue({ sent: true }) }

// Mock — verify it was called correctly
expect(emailService.send).toHaveBeenCalledWith({
  to: 'user@example.com',
  subject: 'Welcome',
})

// Fake — in-memory repository
class InMemoryUserRepository implements UserRepository {
  private users: User[] = []
  async save(user: User) { this.users.push(user) }
  async findById(id: string) { return this.users.find(u => u.id === id) ?? null }
}
```

## TDD with Legacy Code

When adding TDD to a codebase without tests:

```
1. Characterisation tests — write tests that describe current behaviour (even if wrong)
   → These are safety nets for refactoring, not specifications

2. Identify seam — find a point where you can insert a test double (dependency injection, parameter, factory)

3. Extract and test — extract the logic you want to change into a new, testable unit

4. Strangler fig — write new code TDD; route traffic to it; delete old code when old code is unused
```

Don't write tests for everything at once — prioritise:
- Code that is changing right now
- Code that has bugs
- Code that is critical to business operation

## Coverage as a Guide

```
Target: > 80% for business logic / services
        Happy path + main error cases for HTTP handlers
        100% for pure utility functions (trivial to achieve)

Don't:
  - Chase 100% coverage at the expense of test quality
  - Cover code that exercises trivial language features
  - Add tests purely to hit a coverage number

Do:
  - Use coverage as a map to find untested paths
  - Treat a coverage drop as a signal, not an absolute gate
```
