# QA Testing

Guidelines for quality assurance and automated testing across web backends and APIs.

## Test Pyramid

```
         /\
        /  \   E2E / Integration (few, slow, high confidence)
       /----\
      /      \  Integration / API tests (moderate, medium speed)
     /--------\
    /          \ Unit tests (many, fast, focused)
   /____________\
```

- Unit tests: pure logic, single function or class, no I/O
- Integration tests: multiple components together, real or in-memory DB, no network
- E2E tests: full stack, real services, real browser/HTTP client

Aim for a wide base and a narrow top. Most bugs are found cheapest at the unit level.

## Testing Principles

- **Test behaviour, not implementation** — call the public API; don't test private methods
- **One assertion concept per test** — a test that checks three things hides which thing broke
- **Arrange–Act–Assert (AAA)** — clear structure in every test
- **Deterministic** — same inputs always produce same output; no time, random, or order dependencies
- **Independent** — each test runs in isolation; no shared mutable state between tests
- **Fast** — slow tests don't get run; aim for < 1s per unit test

## Unit Testing

```python
# Python — pytest
def test_calculate_discount_returns_zero_for_full_price():
    result = calculate_discount(price=100, code=None)
    assert result == 0

def test_calculate_discount_applies_percentage():
    result = calculate_discount(price=100, code='SAVE20')
    assert result == 20

def test_calculate_discount_raises_for_negative_price():
    with pytest.raises(ValueError, match='price must be positive'):
        calculate_discount(price=-1, code=None)
```

```ts
// TypeScript — bun test
import { describe, it, expect } from 'bun:test'

describe('calculateDiscount', () => {
  it('returns 0 when no code provided', () => {
    expect(calculateDiscount(100, null)).toBe(0)
  })

  it('applies percentage discount', () => {
    expect(calculateDiscount(100, 'SAVE20')).toBe(20)
  })

  it('throws for negative price', () => {
    expect(() => calculateDiscount(-1, null)).toThrow('price must be positive')
  })
})
```

## API / Integration Testing

```python
# FastAPI — httpx async client
from httpx import AsyncClient
import pytest

@pytest.mark.asyncio
async def test_create_user_returns_201():
    async with AsyncClient(app=app, base_url='http://test') as client:
        response = await client.post('/users', json={'email': 'a@b.com', 'name': 'Alice'})
    assert response.status_code == 201
    assert response.json()['email'] == 'a@b.com'

@pytest.mark.asyncio
async def test_create_user_returns_422_for_invalid_email():
    async with AsyncClient(app=app, base_url='http://test') as client:
        response = await client.post('/users', json={'email': 'not-an-email', 'name': 'Alice'})
    assert response.status_code == 422
```

```ts
// Hono — app.request() (no running server needed)
import { describe, it, expect } from 'bun:test'
import app from '../src/app.js'

describe('POST /users', () => {
  it('creates a user and returns 201', async () => {
    const res = await app.request('/users', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ email: 'a@b.com', name: 'Alice' }),
    })
    expect(res.status).toBe(201)
    const body = await res.json()
    expect(body.email).toBe('a@b.com')
  })
})
```

## Mocking Strategy

| Layer | Mock approach |
|-------|--------------|
| External HTTP APIs | `msw` (mock service worker) or `httpx` mock transport |
| Database | In-memory DB (SQLite), or test-scoped transaction rollback |
| Email / SMS | Mock/spy on the transport function |
| Time | `freezegun` (Python), `@sinonjs/fake-timers` (JS), or inject `now` as param |
| Filesystem | Temp directory fixture |

**Don't mock internals** — only mock at service boundaries (external HTTP, DB, email, time).

## Test Fixtures and Data

```python
# pytest fixtures
@pytest.fixture
async def db_session(engine):
    async with AsyncSession(engine) as session:
        async with session.begin():
            yield session
            await session.rollback()  # each test gets a clean slate

@pytest.fixture
def user_factory(db_session):
    async def _create(**kwargs):
        user = User(email='test@example.com', **kwargs)
        db_session.add(user)
        await db_session.flush()
        return user
    return _create
```

- Use transaction rollback for DB isolation between tests (faster than truncate)
- Factories over hardcoded fixtures — create only what the test needs
- Avoid global test state

## Coverage Guidelines

| Layer | Target |
|-------|--------|
| Business logic / services | > 80% |
| HTTP handlers / routes | Happy path + main error cases |
| Utility functions | 100% for public API |
| Configuration parsing | Startup validation tested |
| Migration scripts | Not typically unit tested; run in CI |

Coverage is a proxy, not a goal. 80% coverage with meaningful assertions > 100% with assertions that only check `assert result is not None`.

## Testing Configuration

```toml
# Python pyproject.toml
[tool.pytest.ini_options]
asyncio_mode = "auto"
testpaths = ["tests"]
addopts = "--strict-markers -v"

[tool.coverage.run]
source = ["src"]
omit = ["src/main.py", "tests/*"]
```

```json
// bun — package.json
{
  "scripts": {
    "test": "bun test",
    "test:coverage": "bun test --coverage"
  }
}
```

## Common Anti-Patterns

```
✗ Testing implementation details — tests break on refactor without bug
✗ Shared mutable state between tests — flaky, order-dependent
✗ Sleeping in tests — use event-based waits or mocks
✗ Catching exceptions in tests to check message — use pytest.raises() or expect().toThrow()
✗ One mega-integration-test — untestable, slow feedback
✗ Mocking everything — tests that never hit real code paths
```
