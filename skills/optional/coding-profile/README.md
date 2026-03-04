# Coding Profile Skill

> **Audience:** AI Agents

Generate per-stack coding skills from real repository code. A coding profile captures the actual patterns, conventions, and idioms a team uses — not generic best practices — so agents working in those repos follow the same standards as the humans who wrote the code.

---

## Purpose

When an agent joins a project mid-flight, it needs to understand:
- How *this* team names things (not how names should ideally be)
- Which testing patterns are used *here* (not what the framework supports)
- What error handling looks like in practice (not what the docs recommend)

A coding profile is a compact, stack-specific skill file generated from the actual codebase. It is consumed by agents and team members as a coding context skill — loaded before writing code to ensure consistency.

---

## When to Use

- Setting up AI agents on an existing project for the first time
- Onboarding a new team member who will use AI assistance
- Multiple repos on the same stack — merge into one shared profile
- Conventions drift over time — re-run to refresh the profile

---

## Scope Selection

When invoked, the agent asks the user to define scope:

### Option A: Directory of Repos

Specify a directory containing multiple repositories. Enter a path or type `this` to use the current working directory.

```
Scope: this           # current working directory
Scope: /projects      # explicit path containing multiple repos
```

The agent discovers all repos in that directory (one level deep — each subdirectory that contains a `.git` folder is treated as a separate repo).

### Option B: Specific Repo Names

Type one or more repo names or paths explicitly:

```
Repos: api-service, frontend-app
Repos: /projects/api-service, /projects/worker-service
```

### What Counts as a Repo

Any directory containing a `.git` folder. The agent does not recursively search beyond one level from the chosen scope directory.

---

## Stack Detection

For each discovered repo, the agent identifies the primary tech stack by inspecting:

| Signal | Examples |
|--------|---------|
| Package manifests | `package.json`, `pyproject.toml`, `Cargo.toml`, `go.mod`, `pom.xml`, `build.gradle`, `*.csproj` |
| Lock files | `yarn.lock`, `pnpm-lock.yaml`, `poetry.lock`, `Gemfile.lock` |
| Config files | `.eslintrc`, `tsconfig.json`, `pytest.ini`, `Makefile`, `Dockerfile` |
| Directory structure | `src/`, `lib/`, `app/`, `cmd/`, `internal/` |
| Framework markers | `next.config.*`, `vite.config.*`, `angular.json`, `django/`, `rails/` |

**Stack label examples:** `typescript-node`, `typescript-react`, `python-fastapi`, `go`, `java-spring`, `rust`, `ruby-rails`, `csharp-dotnet`

---

## Per-Stack Grouping

Multiple repos on the same stack are merged into one profile:

- Detect common patterns (appear in ≥50% of repos on that stack) → include as **standard**
- Detect divergent patterns → include as **divergence** (noted which repo differs and how)
- Unique patterns in a single repo → noted as **[repo-name] only**

**Example:** Three Node.js repos all use `camelCase` for variables → standard. Two use `jest`, one uses `vitest` → divergence noted.

If a repo is ambiguous (e.g. a polyglot monorepo), it is profiled under the dominant stack based on LOC or primary entry point.

---

## Output Structure

```
coding-profile/
  index.md                  # Overview: stacks found, repos grouped, divergences
  <stack-name>.md           # One skill file per detected stack
  <stack-name>-<repo>.md    # Optional: repo-specific addendum if significant divergences exist
```

**Examples:**
```
coding-profile/
  index.md
  typescript-node.md
  typescript-react.md
  python-fastapi.md
```

---

## What Each Stack Profile Contains

Each `<stack-name>.md` skill file covers:

| Section | What It Captures |
|---------|-----------------|
| **Stack Identity** | Language, framework, runtime version, package manager |
| **Project Structure** | Directory layout, where code lives, config locations |
| **Naming Conventions** | Variables, functions, classes, files, dirs, constants, exports |
| **Code Patterns** | Preferred patterns (functional vs class-based, async style, error flow) |
| **Testing Approach** | Framework, file location, naming, mocking style, fixture patterns |
| **Error Handling** | Try/catch vs Result types, error classes, logging strategy |
| **API Design** | REST conventions, GraphQL patterns, validation approach, auth pattern |
| **State & Data Flow** | How state is managed, data transformation patterns |
| **Observability** | Logging library, log format, metrics, tracing approach |
| **Review Standards** | What reviewers care about in PRs (derived from code consistency signals) |

---

## Principles

- **Descriptive, not prescriptive**: Capture what the team does, not what they should do.
- **Evidence-based**: Every convention must be supported by at least 3 code examples from the actual repos.
- **Compact**: Each stack profile targets ~600–800 tokens so it can be loaded alongside other context.
- **Divergences are first-class**: Disagreements between repos are more useful than pretending they don't exist.
- **Re-runnable**: Re-running the skill overwrites existing profiles. Agents should treat profiles as regenerated artifacts, not hand-edited files.

---

## Invocation Patterns

| User Says | Agent Does |
|-----------|-----------|
| `"Create coding profile"` | Asks for scope (directory or repo list) |
| `"Profile this directory"` | Uses current working directory as scope |
| `"Profile repos: api, worker"` | Profiles those two repos specifically |
| `"Refresh coding profile"` | Re-reads repos and regenerates all profiles |
| `"Profile just the backend"` | Profiles a specific named repo |

---

## Integration

Generated profiles are standalone skill files. To use them:

1. Place the `coding-profile/` directory in the project root or inside `.quantum-toolbox/` for team-wide sharing
2. Reference in `AGENTS.md` under Enabled Skills:

```markdown
- [x] `coding-profile/typescript-node` — Team coding conventions for Node.js services
```

3. Agents load the relevant stack profile before writing any code

---

## Dependencies

None. Reads directly from source code. Does not require `codebase-analysis` to be run first (though its output can supplement the profile if available).
