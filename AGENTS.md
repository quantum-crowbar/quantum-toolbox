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

8. **[skills/_detail.md](skills/_detail.md)** - Skill Dependencies + Invokable Skills tables — read before loading any skill
9. **Skill `README.md` + `workflows.md`** - Read when about to use a specific skill
10. **Skill `templates.md`, `examples.md`, `checklist.md`** - Read as needed during execution (see File Loading Guide in each skill README)
Large skills have 4-phase loading — only Phase 1 (README + workflows) is required on invocation.

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
| [skills/_index.md](skills/_index.md) | Full skill catalog, token budget, activation |
| [skills/_detail.md](skills/_detail.md) | Skill dependencies + invokable commands (load on skill invocation) |
| [scripts/measure-tokens.sh](scripts/measure-tokens.sh) | Measure current token counts per skill |
| [specs/ROADMAP-TRACKER.md](specs/ROADMAP-TRACKER.md) | Roadmap and planned work |
| [templates/](templates/) | AGENTS.md, CONTEXT.md, commit, PR templates |

---

## Quick Start (project setup)

```bash
git submodule add <this-repo-url> .quantum-toolbox
cp .quantum-toolbox/templates/AGENTS.template.md ./AGENTS.md
cp .quantum-toolbox/templates/CONTEXT.template.md ./CONTEXT.md
# Optional: customize the architectural mental model for your project
cp .quantum-toolbox/templates/architecture-thinking.override.template.md ./architecture-thinking.local.md
```

Enable optional skills by checking them in your project's `AGENTS.md`.
