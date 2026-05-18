# Changelog

> **Audience:** Humans (project changelog)

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

**Versioning policy for this toolkit:**
- **Major** — Breaking changes to the mental model, skill interfaces, or reading order
- **Minor** — New skills, new features, new output adapters
- **Patch** — Bug fixes, documentation improvements, token optimizations

---

## [Unreleased]

## [3.0.0] - 2026-05-12

### Bootstrap Core Skill (new)

**`bootstrap`** — New core skill providing a standardised session entry point and upgrade lifecycle. Replaces the ad-hoc "run these commands at the start" pattern.

- **`/start`** — Detects Mode A (session start on an established project) vs Mode B (first-time setup). In Mode A it prints a live snapshot of enabled skills and available commands. In Mode B it runs the guided 8-step first-time setup.
- **`/help`** — Prints the full command reference.
- **`/skills`** — Lists all skills registered in `manifest.yaml` with their enabled/disabled status for the current project.
- **`/update`** — KB refresh: detects source repos that have moved ahead since the last analysis run, re-runs all enabled skills on those repos, regenerates affected architecture-docs views, and writes updated SHAs and view lists back to the manifest and context files. Also flags if the toolkit version has changed (signalling that `/upgrade` should follow). Both source and documentation are refreshed in a single pass.
- **`/upgrade`** — Toolkit-version upgrade: pulls the latest toolkit, diffs old→new version for new skills, views, reports, config requirements, and template changes, checks source staleness, then generates new views/reports and re-runs analysis where new views need fresh source data. By the end the project is fully current with the new toolkit version — new views generated, missing config inserted, source re-analysed where needed, `toolboxVersion` updated in the manifest.

`first-time-setup.md` extracted from the main bootstrap workflows file — Mode A sessions no longer load the 8-step setup content (~1,000 tokens saved per established-project session).

### Auto-Sync Hook (Post-Work Hook)

Every analysis skill now ends with a non-skippable **Final Step: Sync context files**, backed by a **Post-Work Hook** block in `AGENTS.md`.

After every completed analysis the agent automatically:
- Updates `CONTEXT.md` stale fields (last run date, view status, toolkit version)
- Updates the per-trigger `last_run` and `outputs[]` fields in `AGENTS.md`
- Updates `README.md` if the analysis changes a badge or status section
- Commits the updated context files

The hook is defined once in `templates/AGENTS.md` and injected into new projects via `first-time-setup.md` Step 3. Existing projects without the hook receive it automatically when `/upgrade` is run (U4 Action 1 Part B).

Skills updated: `arch-analysis`, `security-analysis`, `coding-profile`.

### Code-Graph Improvements

- **Phase 0.0 scope & setup dialogue** — Before extraction begins the agent confirms scope (single repo vs multi-repo), validates all listed repos are accessible, and offers clone/continue/abort for any missing repo. Phase 0.0 display heading added: `Code Graph Analysis — Scope & Setup`.
- **Artefact commit requirement** — Phase 4A and Phase 4D now explicitly require committing all YAML and SQLite output files. A bold warning block prevents accidental omission.
- **Missing-repo validation** — Pre-flight check added; extraction cannot proceed until all repos in scope are verified present.
- **Analysis-tracking integration** — Regenerable artefact pattern documented: `generatedDate`, `regenerate`, and `sourceRepos` fields added to the code-graph manifest block. `check-analysis-status.sh` gains a `check_regenerable_artefacts()` function that compares `generatedDate` against HEAD commit dates per source repo and reports stale artefacts with counts and the regenerate command.

### SQLite Cookbook

New per-project query reference document (`reports/sqlite-cookbook.md`) generated automatically in Phase 4B.5 when the SQLite backend is active.

The cookbook is populated from live extraction stats (9 substitution variables) and covers: opening the database, full schema reference (nodes, edges, unresolved_calls tables + materialized views with column tables), essential queries, call graph traversal (blast radius forward/reverse, shortest path), hotspot analysis, entry point analysis, dead code, async call patterns, repo stats, unresolved calls, and regeneration commands.

`/upgrade` Action 2 Part B retroactively generates the cookbook for projects that ran code-graph before this version — reads stats from the manifest, no re-extraction required.

### Excalidraw Bidirectional Support

The existing Excalidraw output skill was one-way only. v3.0 completes the round-trip:

- **Output skill** (updated) — Fixed `source` field in the system context template (`"architecture-analysis"` → `"https://excalidraw.com"`). Added Step 8: drag-and-drop import instructions to excalidraw.com.
- **Import skill** (new) — 5-phase pipeline for parsing `.excalidraw` JSON files and feeding them into the architecture model:
  - Phase 1: Parse `elements[]`, resolve labels via `containerId`, identify frame boundaries
  - Phase 2: Map `backgroundColor` → component role using the toolkit's standard color palette (`#a5d8ff` service, `#ffc9c9` external, `#b2f2bb` datastore, `#ffd8a8` actor, `#e9ecef` boundary, `#ffec99` process); shape-type fallback for unlabelled elements
  - Phase 3: Disambiguation dialogue — presents mapping table, flags unknowns, user confirms or corrects
  - Phase 4: Auto-selects diagram type (`flowchart LR`, `C4Context`, or `C4Container`), writes `diagrams/{source}-mermaid.md` with full component inventory
  - Phase 5 (optional): Pre-populates `architecture_model` and feeds directly into `arch-analysis` Phase 2

Both skills registered in `analysis-outputs/_index.md` with trigger phrases. Triggers: `"Analyse this excalidraw file"`, `"Convert excalidraw to Mermaid"`, `"Use this excalidraw as architecture input"`.

### Token Optimisation (45% session-start reduction)

Six optimisations reducing session-start overhead from ~9,600 tokens (v2.4) to ~2,500 tokens (v3.0):

| Optimisation | Saving |
|---|---|
| OPT-1: Split `_index.md` → `_index.md` + `_detail.md` | ~2,000 t/session |
| OPT-2: Domain-split glossary (TOGAF + Security terms deferred to skill invocation) | ~650 t/session |
| OPT-3: Remove bootstrap command duplication from `core/workflows.md` | ~2,500 t when bootstrap active |
| OPT-4: Phased loading annotations in large skill READMEs | 7–14 K t/large skill |
| OPT-5: `scripts/measure-tokens.sh` token baseline script | tooling |
| OPT-6: Extract first-time-setup from bootstrap (Mode A overhead) | ~1,000 t/Mode A session |

### Analysis Tracking

- Toolkit version tracking: `CONTEXT.md` now records the toolkit submodule SHA; `/update` checks it against the current toolkit version and flags when `/upgrade` should be run.
- Incremental view update commands added — re-run only the views whose source data changed, rather than regenerating the full analysis.

### Bug Fixes

- `excalidraw-output.md`: corrected `source` field in system context JSON template
- Bootstrap `/start`: fixed mode detection (session start vs first-time setup)
- Stale skill descriptions in `AGENTS.md` template and `arch-analysis/README.md` updated to match current phase count

## [2.6.0] - 2026-03-04

### New Skills (3)

**`roadmap-building`** — Generates full phased implementation roadmaps from architecture analysis, TOGAF Phase E/F output, or standalone requirements. Produces initiatives, ADRs, risk register, epic/ticket breakdown with complexity sizing (XS–XL) and team assignments, and a machine-readable roadmap tracker. Integrates with TOGAF Phases E, F, and G.

**`roadmap-analysis`** — Seven-mode deep-dive analysis for an existing roadmap: (1) Expand an initiative into a week-by-week implementation plan with rollback triggers; (2) Identify research questions that need structured investigation; (3) Score complexity across technical, organisational, and risk axes with critical path; (4) Identify spike candidates with Go/No-Go criteria; (5) Generate itemised effort estimates with risk buffers; (6) Export roadmap packages to PDF; (7) Plan team composition and financial model by phase.

**`coding-profile`** — Reads real repository code and generates per-stack coding skill files agents can load before writing code. Captures naming conventions, async style, testing framework and patterns, error handling strategy, API design, observability setup, and review standards — all from actual code, not generic best practices. Groups multiple repos by stack and merges them into one profile, flagging divergences explicitly.

### Quick Start & Onboarding

Updated the one-prompt Quick Start to use `.quantum-toolbox` as the canonical submodule directory name (replacing the legacy `.ai-toolkit`). The setup script, AGENTS.md template, and CONTEXT.md template all align on this name now.

Added a **skill-first rule** to both templates: before starting any task, agents check `skills/_index.md` for a matching skill and follow it if one exists. This is surfaced as a callout in AGENTS.md and as a prominent rule in CONTEXT.md, making it harder to miss.

Quick Start step 5 added: *Read skill catalog* — ensures the skill index is always loaded at session start.

### Core Tooling & Conventions

Added `> **Audience:**` tags to all files that were missing them (`AI_TOOLKIT_CONTEXT.md`, `CONTRIBUTING.md`, `SECURITY.md`, `CHANGELOG.md`, `CODE_OF_CONDUCT.md`, `specs/README.md`, `specs/ROADMAP-TRACKER.md`). Every file in the toolkit now declares its intended reader.

`docs/skills/README.md` simplified: removed duplicated skill tables that were drifting out of sync with `skills/_index.md`. The file now points to the index as the single source of truth.

`core/workflows.md` updated: `presentation`, `release-notes`, `sprint-plan`, and `review-output` moved to a new **Output Generation** category in Skill Discovery — they were previously buried under Development Workflows or missing entirely.

`.gitignore` updated to exclude `.claude/settings.local.json` (user-specific path, not shareable).

### Open-Source Readiness

- `CODE_OF_CONDUCT.md` — Contributor Covenant
- `CONTRIBUTING.md` — guide for building skills, adjusting the mental model, PR workflow
- `SECURITY.md` — vulnerability reporting policy
- `LICENSE` — MIT license
- Mental model override mechanism (`architecture-thinking.local.md`) with template
- README.md: "How It Works" section explaining the mental model as engine
- AGENTS.md: updated reading order to include mental model override step

### Improvements & Optimisations

- Session-start token cost reduced from ~5,006 to ~4,620 tokens (~8%) by removing duplicated skill tables from `docs/skills/README.md` that were maintained separately from `skills/_index.md`
- Skill Discovery in `core/workflows.md` now covers all invokable skills — 4 skills (`release-notes`, `sprint-plan`, `review-output`, `presentation`) were previously missing from the section agents use to list capabilities
- `specs/roadmap-skills-spec.md` expanded with roadmap tracker format, epic/ticket breakdown, XS/S/M/L/XL complexity scale, and team assignment rules — used as the build spec for the new roadmap skills
- `skills/manifest.yaml` and `skills/_index.md` kept in sync with full metadata for all new and existing skills
- `ROADMAP-TRACKER.md` reflects all completed items across optimisation and new skills tracks

## [2.5.0] - 2026-02-08

### Added
- Token baseline measurement (`specs/TOKEN-BASELINE.md`)
- Roadmap skills tracking in `skills/_index.md` and `manifest.yaml`
- Expanded glossary with roadmap and financial terms

### Changed
- Consolidated roadmap tracker with optimization track
- 48% reduction in session-start token cost (9,618 to 5,006 tokens)
- Eliminated redundancy across core files

## [2.4.0] - 2026-02-06

### Added
- PDF report skill — structured document generation
- Presentation skill moved to output adapters category
- Skills documentation hub (`docs/skills/README.md`)
- Skill discovery workflow for improved onboarding
- Roadmap-analysis modes: team planning, financial estimation
- Simplified startup prompt

### Changed
- Replaced "resources" terminology with human-centric language throughout
- Directory restructure for clean submodule usage

## [2.3.0] - 2026-02-05

### Added
- Architecture Synthesis skill — middle-out architecture from diagrams and specs
- Core Architecture output adapter — standardized analysis output format
- Change management communication plan
- Fitness Functions skill — quantitative architecture governance
- Migration planning integration
- Presentation skill — end-to-end slide deck delivery
- NIS 2 EU Directive compliance framework for security-analysis
- Excalidraw as 4th diagram output format
- TOGAF Preliminary Phase skill

## [2.2.0] - 2026-02-04

### Added
- TOGAF ADM Phases E, F, G, H — complete ADM coverage
- Roadmap for core architecture output and enhancements
- Excalidraw and presentation generation roadmap
- Tooling research for diagrams and presentations

## [2.1.0] - 2026-02-03

### Added
- Nonfunctional-analysis skill
- Structurizr authoring skill — C4 model generation
- TOGAF Core ADM skills (Phases B, C, D)
- Security-analysis skill
- Analysis refactoring (Phases 1-4) — unified analysis pipeline

### Changed
- Comprehensive README update with quickstart prompts
- Renamed to "AI Agent Toolbox for Architects"
- Added `AI_TOOLKIT_CONTEXT.md` with full repository context

## [2.0.0] - 2026-02-01

### Added
- Architecture thinking foundation (`core/architecture-thinking.md`) — the mental model engine
- TOGAF skill family index
- Arch-analysis structured output directory
- Diagram format options and AI file exclusions
- TOGAF vision checklist

### Changed
- Arch-analysis expanded with Dependency Health Check, Data Flow Mapping, Error Handling workflows

## [1.0.0] - 2026-01-29

### Added
- Git submodule architecture — toolkit designed for embedding
- Tiered skills system (core + optional)
- Arch-analysis skill — codebase architecture analysis
- Todo-workflow skill — structured task management
- Root README and architecture analysis guide
- Skill index (`skills/_index.md`)

## [0.1.0] - 2026-01-18

### Added
- Initial AI agent setup with instruction files
- Pre-work checklist and autonomous development loop
- Core workflows and coding guidelines

---

[Unreleased]: https://github.com/quantum-crowbar/quantum-toolbox/compare/v2.5.0...HEAD
[2.5.0]: https://github.com/quantum-crowbar/quantum-toolbox/compare/v2.4.0...v2.5.0
[2.4.0]: https://github.com/quantum-crowbar/quantum-toolbox/compare/v2.3.0...v2.4.0
[2.3.0]: https://github.com/quantum-crowbar/quantum-toolbox/compare/v2.2.0...v2.3.0
[2.2.0]: https://github.com/quantum-crowbar/quantum-toolbox/compare/v2.1.0...v2.2.0
[2.1.0]: https://github.com/quantum-crowbar/quantum-toolbox/compare/v2.0.0...v2.1.0
[2.0.0]: https://github.com/quantum-crowbar/quantum-toolbox/compare/v1.0.0...v2.0.0
[1.0.0]: https://github.com/quantum-crowbar/quantum-toolbox/compare/v0.1.0...v1.0.0
[0.1.0]: https://github.com/quantum-crowbar/quantum-toolbox/releases/tag/v0.1.0
