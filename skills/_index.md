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
| **bootstrap** | Session bootstrap — orient the agent, report project state, guide to first action | [core/bootstrap/](core/bootstrap/) |

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
| **code-graph** | Function-level call graph: hot paths, dead code, entry point tracing, cycle detection. Adaptive YAML/SQLite backend | [optional/code-graph/](optional/code-graph/) |
| **analysis-tracking** | Track analyzed commits and toolkit version; detect code staleness and new views after toolkit upgrades | [optional/analysis-tracking/](optional/analysis-tracking/) |
| **update-logs** | Structured audit trail for agentic multi-file changes — what changed, why, what was read, what is still open | [optional/update-logs/](optional/update-logs/) |

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
- **Before invoking a skill**: Read `skills/_detail.md` for the dependency and invocation tables
- **On invocation**: Read the skill's `README.md` + `workflows.md` (Phase 1)
- **As needed**: Read `templates.md` when generating output; `examples.md` on uncertainty; `checklist.md` for quick reference

Use `scripts/measure-tokens.sh` to get current token counts before each release.

## Token Budget

Approximate context window cost when using this toolkit. To remeasure: `bash scripts/measure-tokens.sh`.

### Session Start (~7,000 tokens)

| File | Tokens |
|------|--------|
| User's AGENTS.md | ~500 |
| core/instructions.md | ~435 |
| core/glossary.md | ~1,213 |
| skills/_index.md (this file) | ~2,228 |
| core/architecture-thinking.md | ~3,168 |
| **Total** | **~7,544** |

On-demand (read when triggered): `core/workflows.md` (~1,333), `skills/_detail.md` (~1,600), domain glossaries (~300 each).

**Pre-OPT savings**: session-start overhead dropped from ~13,745 → ~7,544 tokens (−45%) via OPT-1/2/3.

### Per-Skill Cost (on invocation)

Measured with `scripts/measure-tokens.sh`. Phase 1 = README + workflows only (use the File Loading Guide in each skill README).

| Skill | Phase 1 | Full | Skill | Phase 1 | Full |
|-------|---------|------|-------|---------|------|
| arch-analysis | ~8,500 | ~20,900 | security-analysis | ~8,600 | ~21,200 |
| architecture-synthesis | ~8,000 | ~19,700 | fitness-functions | ~6,700 | ~18,200 |
| structurizr | ~8,000 | ~15,700 | nonfunctional-analysis | — | ~12,700 |
| codebase-analysis | — | ~9,800 | code-graph | — | ~8,200 |
| code-conventions | — | ~8,500 | software-design | — | ~7,300 |
| tech-stack-decisions | — | ~6,900 | update-logs | — | ~5,400 |
| analysis-tracking | — | ~2,900 | bootstrap | — | ~2,800 |
| togaf (index only) | ~2,300 | — | analysis-outputs (index) | ~2,100 | — |
| **TOGAF all phases** | — | **~157,000** | **TOGAF per phase** | — | **~10K-24K** |

### Context Window Planning

| Window Size | Budget After Session Start | Practical Limit |
|-------------|---------------------------|-----------------|
| 100K tokens | ~92K for skills + code | 1-2 large skills (Phase 1) + codebase |
| 200K tokens | ~192K for skills + code | 3-4 large skills (Phase 1) + codebase |

**Rule of thumb**: Reserve at least 50% of context for actual codebase content. Using Phase 1 loading, a large analysis skill costs ~8-9K tokens instead of ~20K.

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

> **Contributing a new skill?** See [skills/_detail.md](_detail.md#creating-new-skills).

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

### On Skill Invocation
Before loading any skill, read [skills/_detail.md](_detail.md) for the Skill Dependencies and Invokable Skills tables.

---

## Future Skills (Ideas)

Aspirational ideas — not yet planned or specified:

- `api-design` - REST, GraphQL, versioning
- `documentation` - Code docs, user docs, architecture docs
- `performance` - Profiling, optimization, caching

Note: delivery and implementation skills (programming languages, CI/CD, UX, testing) live in
the quantum-crew repo at `skills/` — they are crew-specific, not architecture-toolbox skills.
