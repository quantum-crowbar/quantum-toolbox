# Skills Index

This document lists all available skills and how to activate them.

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

### Optional Skills (Opt-In)

Enable these by checking them in your project's `AGENTS.md`:

| Skill | Description | Path |
|-------|-------------|------|
| **software-design** | Design principles, patterns, architectural decisions | [optional/software-design/](optional/software-design/) |
| **tech-stack-decisions** | Technology evaluation, decision frameworks, ADRs | [optional/tech-stack-decisions/](optional/tech-stack-decisions/) |
| **code-conventions** | Style guides, naming conventions, structure standards | [optional/code-conventions/](optional/code-conventions/) |

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

## Skill File Structure

Each skill contains these files:

| File | Purpose | When to Read |
|------|---------|--------------|
| `README.md` | Guidelines and principles | Always read first |
| `workflows.md` | Step-by-step procedures | When performing related tasks |
| `examples.md` | Concrete examples | For reference and learning |
| `templates.md` | Reusable templates | When creating documents |
| `checklist.md` | Quick reference | During reviews |

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
| `software-design` | None |
| `tech-stack-decisions` | `software-design` (optional) |
| `code-conventions` | None |

---

## Future Skills (Roadmap)

Skills planned for future development:

- `testing-strategy` - Test pyramid, coverage, TDD/BDD
- `api-design` - REST, GraphQL, versioning
- `documentation` - Code docs, user docs, architecture docs
- `security-practices` - OWASP, auth patterns, secrets management
- `performance` - Profiling, optimization, caching
- `devops` - CI/CD, deployment, monitoring
