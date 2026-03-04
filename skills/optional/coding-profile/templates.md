# Coding Profile Templates

> **Audience:** AI Agents

Templates for all generated coding profile outputs.

---

## Stack Profile (`<stack-name>.md`)

This is the primary agent-loadable skill file. Keep it under 800 tokens.

```markdown
# Coding Profile: [Stack Label]

> **Audience:** AI Agents
> **Generated:** YYYY-MM-DD
> **Repos:** [repo-a, repo-b, ...]
> **Stack:** [language] + [framework] + [runtime/version if relevant]

---

## Stack Identity

- **Language:** [e.g. TypeScript 5.x]
- **Framework:** [e.g. Express 4.x / Fastify 4.x]
- **Runtime:** [e.g. Node.js 20 LTS]
- **Package Manager:** [npm / yarn / pnpm / pip / cargo / go modules]
- **Secondary languages:** [e.g. SQL (PostgreSQL), Bash]

---

## Project Structure

```
[Typical directory tree — show actual shape, not ideal]
src/
  controllers/    # Route handlers
  services/       # Business logic
  repositories/   # DB access
  models/         # Domain types / entities
  utils/          # Shared helpers
  middleware/     # Express middleware
tests/
  unit/
  integration/
```

Key conventions:
- [e.g. "Feature code co-located with its tests"]
- [e.g. "Shared types in src/types/"]

---

## Naming Conventions

| Thing | Convention | Example |
|-------|-----------|---------|
| Variables | [camelCase / snake_case] | `userCount`, `user_count` |
| Functions | [camelCase / snake_case] | `getUserById()` |
| Classes | [PascalCase] | `UserService` |
| Interfaces / Types | [PascalCase, prefix I? / no prefix] | `User`, `IUserRepository` |
| Files | [kebab-case / camelCase / snake_case] | `user-service.ts` |
| Directories | [kebab-case / snake_case] | `user-profiles/` |
| Constants | [SCREAMING_SNAKE / camelCase] | `MAX_RETRY_COUNT` |
| Env vars | [SCREAMING_SNAKE] | `DATABASE_URL` |
| Exports | [named / default / barrel] | `export { UserService }` |

[Notes on exceptions or special cases]

---

## Code Patterns

**Async style:** [async/await / Promise chains / callbacks]

```[lang]
// Actual pattern from the codebase
[example]
```

**Functional vs class-based:** [e.g. "Services are classes, utilities are standalone functions"]

**Dependency injection:** [e.g. "Constructor injection via tsyringe" / "Manual wiring in index.ts" / "None"]

**Common utilities:** [e.g. lodash (preferred for data transforms), dayjs (dates)]

**Other notable patterns:**
- [e.g. "DTOs used at controller boundary, domain objects internally"]
- [e.g. "No inheritance — composition preferred"]

---

## Testing Approach

- **Framework:** [jest / vitest / pytest / go test / etc.]
- **Test file location:** [co-located: `*.spec.ts` / separate: `tests/`]
- **Coverage target:** [N% if specified in config]

**Mocking style:**

```[lang]
// How mocks are set up in this codebase
[example]
```

**Fixture/factory pattern:**

```[lang]
// How test data is created
[example]
```

**Test structure:**

```[lang]
// Typical test block pattern
[example: describe/it, def test_, t.Run, etc.]
```

**What tests cover:** [unit + integration / unit only / e2e where / etc.]

---

## Error Handling

**Pattern:** [try/catch / Result type / error-first callback / exception hierarchy]

```[lang]
// How errors are thrown and caught in this codebase
[example]
```

**Custom error classes:**

```[lang]
// If they exist — show the hierarchy
[example or "None — uses native Error"]
```

**Error propagation:** [e.g. "Thrown from service, caught in controller, formatted as HTTP response"]

**Logging on errors:** [e.g. "logger.error({ err }, 'context message') — structured, always includes err"]

---

## API Design

> Skip this section if the repo is not an API service.

- **Style:** [REST / GraphQL / gRPC / tRPC]
- **Route naming:** [e.g. `GET /users/:id`, `POST /users`, plural nouns, kebab-case]
- **Validation:** [zod / joi / class-validator / pydantic / marshmallow / none]
- **Auth pattern:** [e.g. "JWT in Authorization header, extracted in auth middleware, user attached to req.user"]
- **Error response format:**

```json
{
  "error": {
    "code": "USER_NOT_FOUND",
    "message": "No user with id 123",
    "statusCode": 404
  }
}
```

---

## State & Data Flow

**Data access:** [ORM / query builder / raw SQL / repository pattern]
**ORM/library:** [e.g. Prisma / TypeORM / SQLAlchemy / GORM / None]

**Transformation pattern:**

```[lang]
// How data is shaped between layers
[example: mapper function, DTO conversion, serialiser, etc.]
```

**Key invariants:**
- [e.g. "DB entities never returned directly from controllers"]
- [e.g. "All times stored as UTC, converted at edge"]

---

## Observability

- **Logging library:** [pino / winston / structlog / slog / zap / console / none]
- **Log format:** [JSON structured / text / mixed]
- **Log level convention:** [e.g. "info for business events, debug for internals, error for failures"]

```[lang]
// Typical log call pattern
logger.info({ userId, action: 'login' }, 'User logged in')
```

- **Metrics:** [Prometheus / Datadog / none / unknown]
- **Tracing:** [OpenTelemetry / Datadog APM / none / unknown]

---

## Review Standards

What reviewers consistently enforce in this codebase (derived from code consistency signals):

- [ ] [e.g. "No `any` in TypeScript — use `unknown` with type guard"]
- [ ] [e.g. "All public functions have JSDoc with @param and @returns"]
- [ ] [e.g. "Every new endpoint has an integration test"]
- [ ] [e.g. "Errors must be logged before re-throwing"]
- [ ] [e.g. "No business logic in controllers"]

---

## Divergences

> Only present if this profile merges multiple repos.

| Repo | Section | Divergence |
|------|---------|-----------|
| [repo-name] | [Section] | [How it differs from the standard above] |
```

---

## Index File (`index.md`)

```markdown
# Coding Profile Index

> **Audience:** AI Agents
> **Generated:** YYYY-MM-DD
> **Scope:** [directory path or list of repos]

## Stacks Found

| Stack | Profile | Repos |
|-------|---------|-------|
| [typescript-node] | [typescript-node.md](typescript-node.md) | api-service, worker-service |
| [typescript-react] | [typescript-react.md](typescript-react.md) | frontend-app |
| [python-fastapi] | [python-fastapi.md](python-fastapi.md) | data-pipeline |

## Divergences Summary

| Stack | Repo | What Diverges |
|-------|------|--------------|
| typescript-node | worker-service | Uses vitest (stack standard: jest) |

## How to Use

Load the profile for the stack you're working in before writing any code:
- Working on `api-service` → read `typescript-node.md`
- Working on `frontend-app` → read `typescript-react.md`
- Working in `worker-service` → read `typescript-node.md` + `typescript-node-worker-service.md`

## Refresh

Run `"Refresh coding profile"` to regenerate from source. Profiles are regenerated artifacts — do not hand-edit them.
```

---

## Repo Addendum (`<stack>-<repo>.md`)

Only created when a repo has ≥3 divergences from stack standard. Contains only the sections that differ.

```markdown
# Coding Profile Addendum: [stack] / [repo-name]

> **Audience:** AI Agents
> **Generated:** YYYY-MM-DD
> **Base profile:** [stack-name.md](stack-name.md)

This file documents how [repo-name] differs from the [stack] standard profile.
Load this file IN ADDITION TO the base profile when working in [repo-name].

---

## [Section name]

**Stack standard:** [what the standard says]
**[repo-name]:** [what this repo does instead]

```[lang]
// Example from this repo
[example]
```

[Repeat for each divergent section]
```
