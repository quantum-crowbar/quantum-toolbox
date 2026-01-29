# Project AGENTS.md Template

> **Instructions**: Copy this file to your project root as `AGENTS.md` and customize the sections below.
> Remove all `<!-- instruction -->` comments after customizing.

---

# AI Agent Instructions

> **Last Updated:** <!-- YYYY-MM-DD -->
> **Version:** <!-- e.g., 1.0.0 -->

This document provides instructions for AI coding agents working on this project.

## Quick Start

1. Read this file first
2. Read project context: [CONTEXT.md](./CONTEXT.md)
3. Read core instructions: [.aiagent/core/instructions.md](.aiagent/core/instructions.md)
4. Read workflows: [.aiagent/core/workflows.md](.aiagent/core/workflows.md)

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

- [ ] `software-design` - [.aiagent/skills/optional/software-design/](.aiagent/skills/optional/software-design/)
- [ ] `tech-stack-decisions` - [.aiagent/skills/optional/tech-stack-decisions/](.aiagent/skills/optional/tech-stack-decisions/)
- [ ] `code-conventions` - [.aiagent/skills/optional/code-conventions/](.aiagent/skills/optional/code-conventions/)

<!-- Check the skills you want to enable and remove the unchecked ones -->

## Core Documentation

These files are always loaded from the `.aiagent` submodule:

| Document | Purpose | Path |
|----------|---------|------|
| Instructions | Coding rules, bash safety | [core/instructions.md](.aiagent/core/instructions.md) |
| Workflows | Development processes | [core/workflows.md](.aiagent/core/workflows.md) |
| Glossary | Standard terminology | [core/glossary.md](.aiagent/core/glossary.md) |
| Skills Index | Available skills | [skills/_index.md](.aiagent/skills/_index.md) |

## Templates

- [Commit Message Format](.aiagent/templates/COMMIT.md)
- [Pull Request Template](.aiagent/templates/PULL_REQUEST.md)

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
3. Read core instructions: [.aiagent/core/instructions.md](.aiagent/core/instructions.md)
4. Read workflows: [.aiagent/core/workflows.md](.aiagent/core/workflows.md)

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

- [x] `software-design` - [.aiagent/skills/optional/software-design/](.aiagent/skills/optional/software-design/)
- [x] `code-conventions` - [.aiagent/skills/optional/code-conventions/](.aiagent/skills/optional/code-conventions/)
```
