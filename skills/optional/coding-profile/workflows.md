# Coding Profile Workflows

> **Audience:** AI Agents

---

## Entry Point

When user says `"Create coding profile"`, `"Profile this directory"`, `"Profile repos: ..."`, or similar:

```
1. Present scope options (see Phase 1)
2. Discover repos in scope
3. Detect stacks
4. Read code per repo
5. Merge per stack
6. Generate skill files
7. Summarise and offer next steps
```

Do NOT run all phases speculatively. Confirm scope with the user before reading any code.

---

## Phase 1: Scope Selection

### Step 1.1 — Ask for Scope

If scope is not clear from the invocation, present options:

```
To generate coding profiles I need to know which repos to read.

Options:
  A) A directory containing multiple repos
     Enter a path, or type "this" for the current directory
  B) Specific repo names or paths
     e.g. "api-service, worker-service" or "/projects/api"

What's your scope?
```

### Step 1.2 — Resolve Scope

| Input | Resolution |
|-------|-----------|
| `this` | Current working directory |
| Relative path (e.g. `../projects`) | Resolve relative to current dir |
| Absolute path | Use as-is |
| Repo names without paths | Search current dir for matching subdirectories |

### Step 1.3 — Discover Repos

For a directory scope:
- List all immediate subdirectories
- Keep only those containing a `.git` folder
- Exclude: `.quantum-toolbox`, `.git`, `node_modules`, `.venv`, `vendor`, `dist`, `build`

For named repos:
- Locate each by name or path
- Verify `.git` exists in each

Report to user:
```
Found N repos in [scope]:
  - api-service        (typescript-node)
  - frontend-app       (typescript-react)
  - data-pipeline      (python-fastapi)

Proceed with all 3? (yes / exclude: <name>)
```

Wait for confirmation before proceeding.

---

## Phase 2: Stack Detection

For each confirmed repo, identify the primary tech stack.

### Step 2.1 — Inspect Manifest Files

Check for these files in repo root:

```
package.json          → Node.js (detect framework from dependencies)
pyproject.toml        → Python (detect framework from tool.poetry.dependencies)
setup.py / setup.cfg  → Python
requirements.txt      → Python
Cargo.toml            → Rust
go.mod                → Go
pom.xml               → Java (Maven)
build.gradle          → Java/Kotlin (Gradle)
*.csproj              → C# / .NET
Gemfile               → Ruby
mix.exs               → Elixir
```

### Step 2.2 — Refine with Framework Detection

For Node.js repos, inspect `package.json` dependencies:

| Dependency | Stack Label |
|-----------|------------|
| `next` | `typescript-react` (Next.js) |
| `react` (no next) | `typescript-react` |
| `express`, `fastify`, `hapi`, `koa` | `typescript-node` |
| `@nestjs/core` | `typescript-nestjs` |
| No framework | `typescript-node` or `javascript-node` |

For Python repos:

| Dependency | Stack Label |
|-----------|------------|
| `fastapi` | `python-fastapi` |
| `django` | `python-django` |
| `flask` | `python-flask` |
| No framework | `python` |

### Step 2.3 — Handle Polyglot Repos

If a repo has multiple languages:
- Identify primary language by file count or LOC in `src/` or equivalent
- Label as primary stack; note secondary in profile header
- If genuinely 50/50 (e.g. a full-stack monorepo), split into two profiles with a shared-repo note

### Step 2.4 — Group by Stack

```
typescript-node:  [api-service, worker-service]
typescript-react: [frontend-app]
python-fastapi:   [data-pipeline]
```

Report grouping to user. Confirm if any assignments look wrong.

---

## Phase 3: Code Reading

For each repo, read source files to extract conventions. Focus on **real code, not config or docs**.

### Step 3.1 — Identify Source Directories

| Stack | Primary source dirs |
|-------|-------------------|
| Node.js / TypeScript | `src/`, `lib/`, `app/` |
| Python | `src/`, `app/`, `<package_name>/` |
| Go | `cmd/`, `internal/`, `pkg/` |
| Java | `src/main/java/` |
| Ruby | `app/`, `lib/` |
| Rust | `src/` |

### Step 3.2 — Sample Files Strategically

Do NOT read every file. Sample:
- 3–5 files that represent the core domain (not tests, not generated)
- 2–3 test files
- 1–2 entry point files (`main.*`, `index.*`, `app.*`, `server.*`)
- 1 example of each major type (controller, service, model, repository, handler, etc.)

If the repo has a clear module structure, read one file per module type.

### Step 3.3 — Extract Per-Section Evidence

For each file read, extract evidence for each profile section:

**Naming Conventions** — look for:
- Variable and function names (camelCase vs snake_case vs PascalCase)
- File naming pattern (`userService.ts` vs `user-service.ts` vs `user_service.py`)
- Class/type naming
- Constant naming (`ALL_CAPS`, `SCREAMING_SNAKE`, etc.)
- Export patterns (named vs default)

**Code Patterns** — look for:
- Async style (`async/await` vs callbacks vs `.then()`)
- Functional vs class-based preference
- How functions are composed
- Dependency injection patterns
- Common utility usage (lodash, ramda, etc.)

**Testing Approach** — from test files:
- Framework (`jest`, `vitest`, `pytest`, `go test`, etc.)
- Test file location (`__tests__/`, `*.spec.ts`, `*_test.go`, etc.)
- Mocking style (`jest.mock`, `sinon`, `unittest.mock`, etc.)
- Fixture/factory patterns
- Test structure (`describe/it`, `def test_`, etc.)

**Error Handling** — look for:
- Try/catch frequency and style
- Custom error classes (do they exist? what's the hierarchy?)
- Result type usage (e.g. `{ data, error }`, `Result<T, E>`)
- Error propagation pattern (throw vs return vs callback)
- Logging on errors

**API Design** — look for (if applicable):
- Route naming convention (`/users/:id` vs `/users/{id}`)
- Request/response shape patterns
- Validation library (`zod`, `joi`, `class-validator`, `pydantic`, etc.)
- Auth pattern (JWT header extraction, middleware, decorator)
- Error response format

**State & Data Flow** — look for:
- How data flows from entry point to output
- Transformation patterns (mappers, DTOs, serialisers)
- Database access pattern (ORM, query builder, raw SQL, repository pattern)

**Observability** — look for:
- Logging library (`winston`, `pino`, `structlog`, `slog`, `zap`)
- Log format (JSON, structured, text)
- Log levels used in practice
- Metrics/tracing imports if present

### Step 3.4 — Collect Evidence Counts

For each pattern observed, track how many files confirm it. Only include patterns seen in **≥3 files** as standards. Fewer counts are noted as exceptions or alternatives.

---

## Phase 4: Cross-Repo Merging (Per Stack)

For stacks with multiple repos, merge per-repo extractions into one stack profile.

### Step 4.1 — Find Common Patterns

For each section (naming, testing, etc.):
- Patterns appearing in **≥50% of repos** in the stack → **standard**
- Patterns appearing in some repos → **divergence** (note which repos)
- Patterns appearing in one repo only → **[repo-name] only**

### Step 4.2 — Document Divergences

Format divergences clearly in the profile:

```markdown
### Variable Naming

**Standard:** `camelCase` (all repos)

### Test Framework

**Standard:** `jest`
**Divergence:** `worker-service` uses `vitest`
  → Reason unknown. When working in worker-service, use vitest syntax.
```

### Step 4.3 — Decide on Addendum Files

Create a repo-specific addendum (`<stack>-<repo>.md`) only if a repo has **3 or more** significant divergences from the stack standard. Otherwise, divergences are noted inline in the main stack profile.

---

## Phase 5: Generate Skill Files

### Step 5.1 — Write Stack Profile(s)

For each stack, write `coding-profile/<stack-name>.md` using the template in `templates.md`.

Requirements:
- Use only evidence-based content (no invented conventions)
- Include 1–2 inline code examples per section where helpful
- Keep total file under 800 tokens
- Mark divergences clearly

### Step 5.2 — Write Index

Write `coding-profile/index.md` covering:
- Date generated
- Scope (directory or repos)
- Stacks found and repos in each
- Any divergences flagged across stacks
- How to load: which file to read per stack

### Step 5.3 — Write Addenda (if needed)

For repos with ≥3 divergences from stack standard, write `coding-profile/<stack>-<repo>.md` covering only the sections that differ. The main profile remains the baseline.

---

## Phase 6: Summary and Handoff

Report to user:

```
Coding profiles generated:

  coding-profile/
    index.md
    typescript-node.md        (api-service + worker-service merged)
    typescript-node-worker-service.md  (3 divergences from standard)
    typescript-react.md       (frontend-app)
    python-fastapi.md         (data-pipeline)

Key findings:
  - typescript-node: consistent naming and testing; worker-service uses vitest (vs jest)
  - typescript-react: uses React Query (not Redux) for server state
  - python-fastapi: pydantic v2 with strict mode; structlog for logging

To use: add to AGENTS.md under Enabled Skills, or load directly before writing code.
Refresh anytime with: "Refresh coding profile"
```

Offer next steps:
- Load the relevant profile now for the current task
- Add to `AGENTS.md` for persistent team use
- Re-run for a specific stack only

---

## Re-Run Behaviour

When user says `"Refresh coding profile"`:
- Repeat Phase 1–5 using the same scope (stored in `index.md`)
- Overwrite existing profile files
- Note what changed (new divergences, removed patterns) in `index.md`

When user says `"Refresh profile for [stack]"`:
- Re-read only repos in that stack group
- Overwrite only that stack's profile file
