# Skills Index

> **Audience:** AI Agents + Humans (canonical skill listing)

This document lists all available skills and how to activate them.

**Machine-readable source**: [manifest.yaml](manifest.yaml) — canonical skill metadata (YAML).

## What Are Skills?

Skills are specialized knowledge packages that provide:
- **Guidelines** - Principles and best practices
- **Workflows** - Step-by-step procedures
- **Examples** - Concrete case studies and samples
- **Templates** - Reusable document formats
- **Checklists** - Quick reference for reviews

## Skill Tiers

### Core Skills (Always Active)

These skills are automatically loaded for every project:

| Skill | Description | Path |
|-------|-------------|------|
| **git-workflow** | Git best practices, branching strategies, commit hygiene | [core/git-workflow/](core/git-workflow/) |
| **todo-workflow** | Invokable autonomous/semi-autonomous development workflow | [core/todo-workflow/](core/todo-workflow/) |

### Optional Skills (Opt-In)

Enable these by checking them in your project's `AGENTS.md`:

| Skill | Description | Path |
|-------|-------------|------|
| **codebase-analysis** | Base analysis engine producing structured analysis model | [optional/codebase-analysis/](optional/codebase-analysis/) |
| **analysis-outputs** | Output adapters (architecture-docs, coding-context, etc.) | [optional/analysis-outputs/](optional/analysis-outputs/) |
| **arch-analysis** | Architecture documentation (codebase-analysis + architecture-docs) | [optional/arch-analysis/](optional/arch-analysis/) |
| **security-analysis** | Security posture assessment with dual output (human-readable + compliance) | [optional/security-analysis/](optional/security-analysis/) |
| **nonfunctional-analysis** | Testing coverage, configuration audit, performance, code health | [optional/nonfunctional-analysis/](optional/nonfunctional-analysis/) |
| **architecture-synthesis** | Middle-out architecture from diagrams and specs | [optional/architecture-synthesis/](optional/architecture-synthesis/) |
| **fitness-functions** | Evolutionary architecture fitness measurement and validation | [optional/fitness-functions/](optional/fitness-functions/) |
| **structurizr** | C4 architecture modeling with Structurizr DSL | [optional/structurizr/](optional/structurizr/) |
| **togaf** | Enterprise architecture framework (ADM phases A-H) | [optional/togaf/](optional/togaf/) |
| **software-design** | Design principles, patterns, architectural decisions | [optional/software-design/](optional/software-design/) |
| **tech-stack-decisions** | Technology evaluation, decision frameworks, ADRs | [optional/tech-stack-decisions/](optional/tech-stack-decisions/) |
| **code-conventions** | Style guides, naming conventions, structure standards | [optional/code-conventions/](optional/code-conventions/) |
| **presentation** | Generate slide decks (PPTX, PDF) from Markdown using Marp CLI | [optional/presentation/](optional/presentation/) |
| **js-programming** | JavaScript idioms, async patterns, ESM, common pitfalls | [optional/js-programming/](optional/js-programming/) |
| **ts-programming** | TypeScript type system, strict mode, generics, utility types | [optional/ts-programming/](optional/ts-programming/) |
| **react-native** | Cross-platform mobile patterns, performance, platform-specific code | [optional/react-native/](optional/react-native/) |
| **python-backend** | FastAPI, Pydantic v2, SQLAlchemy async, uv, Alembic | [optional/python-backend/](optional/python-backend/) |
| **ts-backend** | Hono, Zod, Drizzle ORM, Bun runtime, error handling | [optional/ts-backend/](optional/ts-backend/) |
| **database** | SQL schema design, indexing, migrations, connection pooling, security | [optional/database/](optional/database/) |
| **code-review** | Security, correctness, maintainability review patterns and checklists | [optional/code-review/](optional/code-review/) |
| **qa-testing** | Test pyramid, unit/integration/API testing, mocking, coverage | [optional/qa-testing/](optional/qa-testing/) |
| **qa-mobile** | Mobile QA, device matrix, Detox E2E, accessibility, release checklist | [optional/qa-mobile/](optional/qa-mobile/) |
| **devops** | CI/CD, deployment strategies, IaC (Terraform/Pulumi), containers, Kubernetes, observability | [optional/devops/](optional/devops/) |
| **ux-design** | Design thinking, user research, wireframing, design systems, WCAG accessibility | [optional/ux-design/](optional/ux-design/) |
| **frontend** | React/Vue patterns, CSS architecture, Core Web Vitals, accessibility in code | [optional/frontend/](optional/frontend/) |
| **sprint-planning** | Story mapping, estimation, capacity planning, dependency management, retrospectives | [optional/sprint-planning/](optional/sprint-planning/) |
| **user-stories** | Acceptance criteria, BDD/Gherkin, INVEST, story splitting, DoR/DoD | [optional/user-stories/](optional/user-stories/) |
| **tdd-workflow** | Red-green-refactor, test-first discipline, outside-in TDD, test doubles | [optional/tdd-workflow/](optional/tdd-workflow/) |

---

## How to Activate Optional Skills

In your project's root `AGENTS.md`, find the "Enabled Skills" section and check the skills you want:

```markdown
## Enabled Skills

- [x] `software-design` - Design principles and patterns
- [x] `tech-stack-decisions` - Technology evaluation frameworks
- [ ] `code-conventions` - Style guides and conventions
```

When a skill is enabled, AI agents should read all files in that skill's directory before starting relevant work.

---

## Loading Strategy

**Lazy loading**: Do NOT read all skill files at session start. Only load a skill when invoking it.

- **Session start**: Read this index file (`_index.md`) for skill discovery
- **On invocation**: Read the skill's `README.md` + `workflows.md`
- **As needed**: Read `templates.md`, `examples.md`, `checklist.md` during skill execution

## Token Budget

Approximate context window cost when using this toolkit.

### Session Start (~4,600 tokens)

| File | Tokens |
|------|--------|
| Toolkit AGENTS.md | ~500 |
| core/instructions.md | ~440 |
| core/glossary.md | ~1,580 |
| skills/_index.md (this file) | ~2,100 |
| **Total** | **~4,620** |

Additional core docs (read when needed): core/workflows.md (~1,940), core/architecture-thinking.md (~3,170).

### Per-Skill Cost (on invocation)

| Skill | Tokens | Skill | Tokens |
|-------|--------|-------|--------|
| arch-analysis | ~20,100 | security-analysis | ~20,100 |
| architecture-synthesis | ~19,600 | fitness-functions | ~18,100 |
| structurizr | ~15,600 | nonfunctional-analysis | ~12,700 |
| code-conventions | ~8,500 | codebase-analysis | ~8,400 |
| software-design | ~7,300 | tech-stack-decisions | ~6,900 |
| analysis-outputs | ~3,900 | togaf (index only) | ~2,300 |
| **TOGAF phases** | **~10K-24K each** | **TOGAF all phases** | **~154,500** |

### Context Window Planning

| Window Size | Budget After Session Start | Practical Limit |
|-------------|---------------------------|-----------------|
| 100K tokens | ~95K for skills + code | 1-2 large skills + codebase |
| 200K tokens | ~195K for skills + code | 3-4 large skills + codebase |

**Rule of thumb**: Reserve at least 50% of context for actual codebase content. A single analysis skill (arch, security, nonfunctional) uses ~15-20K tokens.

---

## Skill File Structure

Each skill contains these files:

| File | Purpose | When to Read |
|------|---------|--------------|
| `README.md` | Guidelines and principles | On skill invocation |
| `workflows.md` | Step-by-step procedures | On skill invocation |
| `examples.md` | Concrete examples | During execution (as needed) |
| `templates.md` | Reusable templates | During execution (as needed) |
| `checklist.md` | Quick reference | During execution (as needed) |

---

## Default Output Directories

When skills generate output files, they use these defaults (confirm with user before generating):

| Output Type | Default Directory |
|-------------|-------------------|
| Analysis | `analysis/` |
| Presentations | `presentations/` |

---

## Creating New Skills

To add a new skill:

1. Create a directory in `skills/optional/` (or `skills/core/` if always-on)
2. Add the required files following the structure above
3. Update this index with the new skill
4. Submit a pull request

### Skill Naming Conventions

- Use `kebab-case` for directory names
- Keep names concise but descriptive
- Avoid generic names like "best-practices"

### Good Examples
- `api-design` - REST/GraphQL API design principles
- `testing-strategy` - Test pyramid, coverage, TDD
- `security-practices` - OWASP, auth, secrets management

### Avoid
- `misc` - Too vague
- `stuff` - Not descriptive
- `my-skill` - Not meaningful

---

## Skill Dependencies

Some skills may recommend reading other skills first:

| Skill | Recommended Prerequisites |
|-------|--------------------------|
| `git-workflow` | None |
| `todo-workflow` | `git-workflow` (uses git operations) |
| `codebase-analysis` | None (base analysis engine) |
| `analysis-outputs` | `codebase-analysis` (consumes analysis model) |
| `arch-analysis` | None (uses codebase-analysis internally) |
| `security-analysis` | `arch-analysis` or `codebase-analysis` (recommended) |
| `nonfunctional-analysis` | `codebase-analysis` (optional, for context) |
| `architecture-synthesis` | None (parses diagrams/specs directly) |
| `fitness-functions` | None (standalone or with migration-planning) |
| `structurizr` | None (standalone C4 modeling) |
| `togaf` | `arch-analysis` (recommended for baseline) |
| `software-design` | None |
| `tech-stack-decisions` | `software-design` (optional) |
| `code-conventions` | None |
| `presentation` | None (standalone, uses exported diagrams) |

---

## Invokable Skills

Some skills can be explicitly invoked during a session:

| Skill | Invocation | Description |
|-------|------------|-------------|
| `skill-discovery` | `"What skills do you have?"` / `"List your capabilities"` | List all skills with offer to elaborate |
| `todo-workflow` | `"Use todo workflow"` | Start autonomous/semi-autonomous development |
| `codebase-analysis` | `"Analyze this codebase"` | Base analysis with multi-output adapter selection |
| `arch-analysis` | `"Analyze the architecture"` | Architecture documentation (shortcut) |
| `security-analysis` | `"Analyze security"` | Security posture assessment with compliance reports |
| `nonfunctional-analysis` | `"Analyze code quality"` | Testing, config, performance, health assessment |
| `architecture-synthesis` | `"Synthesize architecture from diagrams"` | Parse diagrams/specs into architecture model |
| `fitness-functions` | `"Define fitness functions"` / `"Analyze system fitness"` | Evolutionary architecture fitness assessment |
| `structurizr` | `"Create C4 model"` | Architecture modeling with Structurizr DSL |
| `togaf` | `"Apply TOGAF"` / `"Create architecture vision"` | Enterprise architecture using ADM |
| `presentation` | `"Generate presentation"` / `"Create slides"` | Markdown to PPTX/PDF slide generation |

See the skill's README for full invocation options. Skill Discovery is defined in [core/workflows.md](../core/workflows.md#skill-discovery).

---

## Agent Notes

### Analysis Workflow
- Use `codebase-analysis` as the base engine
- Select output adapters based on user needs
- Run analysis once, output multiple formats

### TOGAF Integration
- Core concepts in `core/architecture-thinking.md` apply automatically
- ADM phases in `togaf/` are invokable as needed
- Supports lightweight/partial use (not all-or-nothing)

---

## Future Skills (Ideas)

Aspirational ideas — not yet planned or specified:

- `api-design` - REST, GraphQL, versioning
- `documentation` - Code docs, user docs, architecture docs
- `performance` - Profiling, optimization, caching
- `devops` - CI/CD, deployment, monitoring

See [ROADMAP-TRACKER.md](../specs/ROADMAP-TRACKER.md) for planned work with specs and timelines.
