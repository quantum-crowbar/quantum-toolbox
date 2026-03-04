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

### Added
- `CODE_OF_CONDUCT.md` — Contributor Covenant
- `CONTRIBUTING.md` — guide for building skills, adjusting the mental model, PR process
- `SECURITY.md` — vulnerability reporting policy
- `LICENSE` — MIT license
- `CHANGELOG.md` — this file
- Mental model override mechanism (`architecture-thinking.local.md`)
- Override template (`templates/architecture-thinking.override.template.md`)
- OSS readiness checklist (`specs/OSS-READINESS-CHECKLIST.md`)

### Changed
- README.md — added "How It Works" section explaining the mental model as engine
- AGENTS.md — updated reading order to include mental model override step
- `core/workflows.md` — added Mental Model Loading section

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
