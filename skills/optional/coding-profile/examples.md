# Coding Profile Examples

> **Audience:** AI Agents

---

## Example 1: Directory with Multiple Repos, Two Stacks

**Invocation:** `"Profile this directory"`

**Directory:** `/projects/` (current working directory)

**Repos discovered:**
```
/projects/
  api-service/       ← has .git
  worker-service/    ← has .git
  frontend-app/      ← has .git
  .quantum-toolbox/  ← excluded
  node_modules/      ← excluded
```

**Agent output (scope confirmation):**
```
Found 3 repos in /projects:
  - api-service      → typescript-node (Express)
  - worker-service   → typescript-node (Fastify) — same stack, different framework
  - frontend-app     → typescript-react (Next.js)

Stack grouping:
  typescript-node:  api-service, worker-service
  typescript-react: frontend-app

Proceed with all 3? (yes / exclude: <name>)
```

**User:** `yes`

**Agent reads code, then generates:**

```
coding-profile/
  index.md
  typescript-node.md              (api-service + worker-service merged)
  typescript-node-worker-service.md  (3 divergences: framework, test runner, DI)
  typescript-react.md             (frontend-app)
```

**Generated `typescript-node.md` (excerpt):**
```markdown
# Coding Profile: typescript-node

> **Generated:** 2026-03-04
> **Repos:** api-service, worker-service
> **Stack:** TypeScript 5.x + Node.js 20 LTS

## Stack Identity

- **Language:** TypeScript 5.x
- **Framework:** Express 4.x (api-service) / Fastify 4.x (worker-service)
- **Package Manager:** pnpm (both repos)

## Naming Conventions

| Thing | Convention | Example |
|-------|-----------|---------|
| Variables | camelCase | `userId`, `requestCount` |
| Functions | camelCase | `getUserById()`, `processPayment()` |
| Classes | PascalCase | `UserService`, `PaymentRepository` |
| Files | kebab-case | `user-service.ts`, `payment-repository.ts` |
| Constants | SCREAMING_SNAKE | `MAX_RETRY_COUNT`, `DEFAULT_TIMEOUT_MS` |
| Exports | Named only — no default exports | `export { UserService }` |

## Testing Approach

- **Framework:** jest (api-service) — see divergence for worker-service
- **Test file location:** co-located, `*.spec.ts` suffix
- **Coverage target:** 80% (configured in jest.config.ts)

**Mocking style:**
```typescript
jest.mock('../repositories/user-repository')
const mockUserRepo = jest.mocked(UserRepository)
mockUserRepo.prototype.findById.mockResolvedValue(mockUser)
```

## Divergences

| Repo | Section | Divergence |
|------|---------|-----------|
| worker-service | Framework | Uses Fastify (not Express) |
| worker-service | Testing | Uses vitest (not jest) |
| worker-service | DI | Uses manual wiring (not tsyringe) |
```

**Generated `typescript-node-worker-service.md` (excerpt):**
```markdown
# Coding Profile Addendum: typescript-node / worker-service

> **Base profile:** typescript-node.md

Load this IN ADDITION TO the base profile when working in worker-service.

## Testing Approach

**Stack standard:** jest with `jest.mock()`
**worker-service:** vitest with `vi.mock()`

```typescript
import { vi } from 'vitest'
vi.mock('../repositories/user-repository')
const mockUserRepo = vi.mocked(UserRepository)
```

## Dependency Injection

**Stack standard:** tsyringe (constructor injection with decorators)
**worker-service:** Manual wiring in `src/container.ts`

```typescript
// container.ts
export const userService = new UserService(
  new UserRepository(db),
  new EmailService(mailer)
)
```
```

**Agent summary to user:**
```
Coding profiles generated:

  coding-profile/
    index.md
    typescript-node.md        (api-service + worker-service merged, 3 divergences)
    typescript-node-worker-service.md
    typescript-react.md       (frontend-app)

Key findings:
  - typescript-node: consistent naming and project structure across both repos
  - worker-service diverges on 3 points: Fastify vs Express, vitest vs jest, manual DI vs tsyringe
  - typescript-react: React Query for server state, Tailwind for styles, no Redux

To use:
  - Working in api-service → load typescript-node.md
  - Working in worker-service → load typescript-node.md + typescript-node-worker-service.md
  - Working in frontend-app → load typescript-react.md
```

---

## Example 2: Single Repo Profiled by Name

**Invocation:** `"Profile the data-pipeline repo"`

**Agent output (scope confirmation):**
```
Locating "data-pipeline"...
Found: /projects/data-pipeline (.git verified)

Stack detected: python-fastapi (FastAPI 0.110, Python 3.12, PDM)

Profile 1 repo? (yes / no)
```

**User:** `yes`

**Generated `python-fastapi.md` (excerpt):**
```markdown
# Coding Profile: python-fastapi

> **Generated:** 2026-03-04
> **Repos:** data-pipeline
> **Stack:** Python 3.12 + FastAPI 0.110

## Naming Conventions

| Thing | Convention | Example |
|-------|-----------|---------|
| Variables | snake_case | `user_id`, `request_count` |
| Functions | snake_case | `get_user_by_id()`, `process_payment()` |
| Classes | PascalCase | `UserService`, `PaymentRepository` |
| Files | snake_case | `user_service.py`, `payment_repository.py` |
| Constants | SCREAMING_SNAKE | `MAX_RETRY_COUNT` |
| Pydantic models | PascalCase with suffix | `UserResponse`, `CreateUserRequest` |

## Testing Approach

- **Framework:** pytest + pytest-asyncio
- **Test file location:** `tests/` directory, mirrors src structure
- **Fixture pattern:** conftest.py per directory, factory fixtures

```python
# conftest.py
@pytest.fixture
def user_factory(db_session):
    def _factory(**kwargs):
        defaults = {"email": "test@example.com", "is_active": True}
        user = User(**{**defaults, **kwargs})
        db_session.add(user)
        db_session.commit()
        return user
    return _factory
```

## Error Handling

**Pattern:** Custom exception hierarchy + FastAPI exception handlers

```python
# exceptions.py
class AppError(Exception):
    def __init__(self, message: str, code: str):
        self.message = message
        self.code = code

class NotFoundError(AppError): ...
class ValidationError(AppError): ...

# main.py — registered handler
@app.exception_handler(AppError)
async def app_error_handler(request: Request, exc: AppError):
    return JSONResponse(
        status_code=exc.status_code,
        content={"error": {"code": exc.code, "message": exc.message}}
    )
```

## Observability

- **Logging:** structlog with JSON output
- **Log call pattern:**
```python
logger.info("user_login", user_id=user_id, ip=request.client.host)
logger.error("payment_failed", user_id=user_id, error=str(exc))
```
```

---

## Example 3: Re-Running a Profile

**Invocation:** `"Refresh coding profile"`

**Agent:**
```
Refreshing coding profiles using previous scope: /projects/

Re-reading 3 repos:
  - api-service (typescript-node)
  - worker-service (typescript-node)
  - frontend-app (typescript-react)

...reading...

Changes detected:
  - typescript-node: api-service now uses Zod for validation (previously joi)
  - typescript-react: no changes

Updated files:
  coding-profile/typescript-node.md (Zod noted in API Design section)
  coding-profile/index.md (updated date)

No changes to typescript-react.md — skipped overwrite.
```
