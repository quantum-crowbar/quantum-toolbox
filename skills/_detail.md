# Skills Detail

> **Audience:** AI Agents
> **When to load:** On skill invocation, before loading a skill, or when running `/skills`.

Contains reference tables not needed at session start.

---

## Skill Dependencies

Some skills may recommend reading other skills first:

| Skill | Recommended Prerequisites |
|-------|--------------------------|
| `git-workflow` | None |
| `todo-workflow` | `git-workflow` (uses git operations) |
| `bootstrap` | None (reads environment; no skill dependencies) |
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
| `code-graph` | `codebase-analysis` (required — provides source model); `arch-analysis` (optional, for View 09 output) |
| `analysis-tracking` | None (standalone; works alongside any analysis skill) |
| `update-logs` | None (standalone; recommended alongside any analysis skill that modifies docs) |

---

## Invokable Skills

Some skills can be explicitly invoked during a session:

| Skill | Invocation | Description |
|-------|------------|-------------|
| `bootstrap` | `/start` | Bootstrap the session — read environment, report status, offer paths forward |
| `bootstrap` | `/help` | Context-aware help — enabled skills, commands, analysis status, one screen |
| `bootstrap` | `/skills` | Interactive skill explorer — full list, pick to learn, offer to run |
| `bootstrap` | `/update` | Check all update dimensions (qt version, views, code, docs) — report + act |
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
| `code-graph` | `"Build code graph"` / `"Trace call graph for <entry point>"` / `"Find hot paths"` | Function-level call graph analysis with adaptive YAML/SQLite backend |
| `analysis-tracking` | `"Check analysis staleness"` / `"Update analysis views"` / `"Set up analysis tracking"` | Detect code staleness or toolkit version changes; generate new views incrementally |
| `update-logs` | `"Create update log"` / `"Write update log"` | Structured audit trail for the current session's changes |

See each skill's README for full invocation options.

---

## Creating New Skills

To add a new skill:

1. Create a directory in `skills/optional/` (or `skills/core/` if always-on)
2. Add the required files following the structure in `skills/_index.md`
3. Update `skills/_index.md` skill tables and `skills/manifest.yaml`
4. Update `skills/_detail.md` (this file) — add to Skill Dependencies and Invokable Skills
5. Submit a pull request

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
