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
| **release-notes** | Changelog format, semantic versioning, breaking change summary, audience-specific formats | [optional/release-notes/](optional/release-notes/) |
| **sprint-plan** | Sprint plan output format, estimation conventions, dependency notation, risk register | [optional/sprint-plan/](optional/sprint-plan/) |
| **review-output** | Severity tiers (blocking/recommended/nit), review report format, per-language checklists | [optional/review-output/](optional/review-output/) |
| **roadmap-building** | Generate phased implementation roadmaps with ADRs, epics, tickets, risk register, and roadmap tracker | [optional/roadmap-building/](optional/roadmap-building/) |
| **roadmap-analysis** | Deep-dive roadmap analysis: expand initiatives, research, complexity, spikes, estimation, PDF export, team/financial planning | [optional/roadmap-analysis/](optional/roadmap-analysis/) |
| **coding-profile** | Generate per-stack coding skill files from real repository code — conventions, testing, error handling, API design | [optional/coding-profile/](optional/coding-profile/) |

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
| `roadmap-building` | `arch-analysis` or `architecture-synthesis` (recommended); `togaf` (optional for Phase E/F integration) |
| `roadmap-analysis` | `roadmap-building` (recommended; can also parse external roadmaps) |
| `coding-profile` | None (reads source directly; `codebase-analysis` output can supplement) |

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
| `roadmap-building` | `"Build implementation roadmap"` / `"Build roadmap with epics and tickets"` | Generate phased roadmap with ADRs, epics, tickets, and tracker |
| `roadmap-analysis` | `"Analyze roadmap complexity"` / `"Expand initiative [N]"` / `"Plan team for roadmap"` | 7-mode deep analysis of an existing roadmap |
| `coding-profile` | `"Create coding profile"` / `"Profile this directory"` / `"Profile repos: ..."` | Generate per-stack coding skill files from real repo code |

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

Note: delivery and implementation skills (programming languages, CI/CD, UX, testing) live in
the quantum-crew repo at `skills/` — they are crew-specific, not architecture-toolbox skills.
