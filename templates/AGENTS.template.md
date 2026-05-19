# Project AGENTS.md Template

> **Instructions**: Copy this file to your project root as `AGENTS.md` and customize the sections below.
> Remove all `<!-- instruction -->` comments after customizing.
> Replace `.quantum-toolbox` with your actual submodule directory name.

---

# AI Agent Instructions

> **Last Updated:** <!-- YYYY-MM-DD -->
> **Version:** <!-- e.g., 1.0.0 -->

This document provides instructions for AI coding agents working on this project.

## Quick Start

1. Read this file first
2. Read project context: [CONTEXT.md](./CONTEXT.md)
3. Read core instructions: [.quantum-toolbox/core/instructions.md](.quantum-toolbox/core/instructions.md)
4. Read workflows: [.quantum-toolbox/core/workflows.md](.quantum-toolbox/core/workflows.md)
5. Read skill catalog: [.quantum-toolbox/skills/_index.md](.quantum-toolbox/skills/_index.md)

> **Before starting any task**, check `.quantum-toolbox/skills/_index.md` for a matching skill. If one exists, load and follow it — skills encode the preferred approach, templates, and quality bar for that type of work.

## Project-Specific Guidelines

<!-- Add any project-specific rules that override or extend the core instructions -->

### Code Style

<!-- Describe project-specific code style requirements -->
<!-- Example: "Use 2-space indentation", "Prefer functional components", etc. -->

### Architecture

<!-- Describe high-level architecture and where to find things -->
<!-- Example: "API routes in /src/api, Components in /src/components" -->

### Testing

<!-- Describe project-specific testing requirements -->
<!-- Example: "All API endpoints must have integration tests" -->

## Enabled Skills

<!-- List which optional skills are enabled for this project -->
<!-- Remove this section if using only core skills -->

The following optional skills are enabled for this project:

- [ ] `arch-analysis` - [.quantum-toolbox/skills/optional/arch-analysis/](.quantum-toolbox/skills/optional/arch-analysis/)
- [ ] `code-graph` - [.quantum-toolbox/skills/optional/code-graph/](.quantum-toolbox/skills/optional/code-graph/)
  <!-- SQLite-first: when enabled, arch-analysis Phase 0.5 offers code-graph extraction  -->
  <!-- before analysis begins. Deterministic AST queries replace in-context traversal.    -->
  <!-- 90–98% fewer tokens on medium+ codebases; 60–70% on small (<200 nodes).           -->
  <!-- SQLite file written to code/{repo}/code_graph.sqlite (gitignored).                -->
- [ ] `software-design` - [.quantum-toolbox/skills/optional/software-design/](.quantum-toolbox/skills/optional/software-design/)
- [ ] `tech-stack-decisions` - [.quantum-toolbox/skills/optional/tech-stack-decisions/](.quantum-toolbox/skills/optional/tech-stack-decisions/)
- [ ] `code-conventions` - [.quantum-toolbox/skills/optional/code-conventions/](.quantum-toolbox/skills/optional/code-conventions/)

<!-- Check the skills you want to enable and remove the unchecked ones -->

## Core Documentation

These files are always loaded from the `.quantum-toolbox` submodule:

| Document | Purpose | Path |
|----------|---------|------|
| Instructions | Coding rules, bash safety | [core/instructions.md](.quantum-toolbox/core/instructions.md) |
| Workflows | Development processes | [core/workflows.md](.quantum-toolbox/core/workflows.md) |
| Glossary | Standard terminology | [core/glossary.md](.quantum-toolbox/core/glossary.md) |
| Skills Index | Available skills | [skills/_index.md](.quantum-toolbox/skills/_index.md) |

## Templates

- [Commit Message Format](.quantum-toolbox/templates/COMMIT.md)
- [Pull Request Template](.quantum-toolbox/templates/PULL_REQUEST.md)

## Post-Work Hook (mandatory after any skill that commits artefacts)

After any skill run that commits output files, update the following before considering the task done.
**Does not apply to AI-only runs that produce no committed files.**

### CONTEXT.md

| Field | What to write |
|-------|--------------|
| Key paths table | Add any new files or directories committed as part of this operation |
| Update log | Append or overwrite today's row: `\| <date> \| <one-line summary with stats> \|` |
| Current state → Implemented | If a new capability was delivered, add it |

**Idempotency rule:** If a row for today's date already exists in the update log — overwrite it in place.
If no row exists for today — append a new row. Never create duplicate rows for the same date.

### AGENTS.md

Update only the fields that changed:

| Trigger | Fields to update |
|---------|-----------------|
| `arch-analysis` completed | Step 2 view list; staleness line |
| `code-graph` completed | Step 2b stats + snapshot date; staleness line |
| `security-analysis` completed | Security section (if present); staleness line |
| `coding-profile` completed | Step 3 profile list; staleness line |
| `/upgrade` completed | Skills list + toolbox version; staleness line |

### README.md

Update only if one of the following is true:
- A "Available Without Cloning" checklist item is missing or has stale stats
- A new `docs/architecture-docs/reports/` file was committed that is absent from the README
- Code graph stats in an existing SQLite bullet are outdated
- A new script was added to `scripts/` that users should know about

Do not rewrite the README for any other reason. Touch only the specific stale field.

### Commit

```bash
git add CONTEXT.md AGENTS.md README.md
git commit -m "docs: sync context files after <skill-name> run"
```

### analysis-manifest.json integrity

After any skill that writes `specs/analysis-manifest.json`:
- The manifest must conform to `.quantum-toolbox/specs/analysis-manifest-schema.json`.
- Each artifact entry must include `generatedWithSkillVersion` (read from the skill's `version` field in `manifest.yaml`).
- Validate by checking required top-level keys: `toolboxVersion`, `lastAnalysis`, `artifacts`.
- If a required field is missing, write it before committing.

---

## When to Update This File

- When project-specific guidelines change
- When enabling/disabling optional skills
- When architecture significantly changes
- When onboarding requirements change

---

## Example: Completed AGENTS.md

Below is an example of a completed AGENTS.md for reference:

```markdown
# AI Agent Instructions

> **Last Updated:** 2024-01-15
> **Version:** 2.1.0

This document provides instructions for AI coding agents working on the Acme E-commerce Platform.

## Quick Start

1. Read this file first
2. Read project context: [CONTEXT.md](./CONTEXT.md)
3. Read core instructions: [.quantum-toolbox/core/instructions.md](.quantum-toolbox/core/instructions.md)
4. Read workflows: [.quantum-toolbox/core/workflows.md](.quantum-toolbox/core/workflows.md)
5. Read skill catalog: [.quantum-toolbox/skills/_index.md](.quantum-toolbox/skills/_index.md)

> **Before starting any task**, check `.quantum-toolbox/skills/_index.md` for a matching skill. If one exists, load and follow it.

## Project-Specific Guidelines

### Code Style

- Use TypeScript strict mode
- Prefer functional React components with hooks
- Use Tailwind CSS for styling (no inline styles)
- All API responses must use the `ApiResponse<T>` wrapper type

### Architecture

- `/src/api` - Next.js API routes
- `/src/components` - React components (atomic design: atoms, molecules, organisms)
- `/src/lib` - Shared utilities and helpers
- `/src/hooks` - Custom React hooks
- `/src/types` - TypeScript type definitions

### Testing

- All API routes require integration tests
- Components with logic require unit tests
- E2E tests for critical user flows (checkout, auth)
- Minimum 80% coverage for new code

## Enabled Skills

- [x] `software-design` - [.quantum-toolbox/skills/optional/software-design/](.quantum-toolbox/skills/optional/software-design/)
- [x] `code-conventions` - [.quantum-toolbox/skills/optional/code-conventions/](.quantum-toolbox/skills/optional/code-conventions/)
```
