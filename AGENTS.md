# AI Agent Setup

> **Audience:** AI Agents
> **Version:** 2.5.0
> A reusable submodule providing standardized instructions, workflows, and skills for AI coding agents.

---

## Reading Order

### Session Start (always read)

1. **Project root `AGENTS.md`** - Project-specific guidelines and enabled skills
2. **Project root `CONTEXT.md`** - Current project state and setup
3. **[core/instructions.md](core/instructions.md)** - Coding rules and security guidelines
4. **[core/architecture-thinking.md](core/architecture-thinking.md)** - Mental model: domains, stakeholders, gap analysis, risk, prioritization
5. **Project root `architecture-thinking.local.md`** *(if it exists)* - Project-specific overrides to the mental model. Matching headings replace defaults, new headings are added, sections listed under `## Skip` are ignored.
6. **[core/glossary.md](core/glossary.md)** - Standard terminology
7. **[skills/_index.md](skills/_index.md)** - Skill catalog, activation, invocation commands

### On Demand (read only when invoking a skill)

8. **Skill `README.md` + `workflows.md`** - Read when about to use a specific skill
9. **Skill `templates.md`, `examples.md`, `checklist.md`** - Read as needed during execution

**Do NOT read all optional skills upfront.** Only load a skill's files when the user invokes it or when the task requires it.

---

## Core Documentation

| Document | Purpose |
|----------|---------|
| [core/instructions.md](core/instructions.md) | Coding rules, security guidelines |
| [core/workflows.md](core/workflows.md) | Development processes, autonomous dev loop |
| [core/architecture-thinking.md](core/architecture-thinking.md) | Architecture domains, stakeholders, gap analysis |
| [core/glossary.md](core/glossary.md) | Standard terminology |

---

## Key References

| Resource | Purpose |
|----------|---------|
| [skills/_index.md](skills/_index.md) | Full skill catalog, dependencies, invokable commands |
| [specs/ROADMAP-TRACKER.md](specs/ROADMAP-TRACKER.md) | Roadmap and planned work |
| [templates/](templates/) | AGENTS.md, CONTEXT.md, commit, PR templates |

---

## Quick Start (project setup)

```bash
git submodule add <this-repo-url> .ai-toolkit
cp .ai-toolkit/templates/AGENTS.template.md ./AGENTS.md
cp .ai-toolkit/templates/CONTEXT.template.md ./CONTEXT.md
# Optional: customize the architectural mental model for your project
cp .ai-toolkit/templates/architecture-thinking.override.template.md ./architecture-thinking.local.md
```

Enable optional skills by checking them in your project's `AGENTS.md`.
