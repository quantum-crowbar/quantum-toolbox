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
