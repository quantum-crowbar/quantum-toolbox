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

## [3.2.0] - 2026-08-19

Bundled release covering the two remaining gaps in the code-graph tooling-by-language
table (Java, Objective-C) — both validated the same day against the same prototype
methodology used for Swift/Kotlin in 3.1.0, so they ship together in one version.

### Code-Graph Skill — Java tree-sitter tooling

- Fixed a stale table row: the previous "Java / Kotlin" row named `tree-sitter-kotlin`
  as the fallback for *both* languages — Java had no working syntax-only fallback
  documented at all. Split into separate Java and Kotlin rows.
- Documented why `jdtls`/Spoon AST are not safe Java defaults: `jdtls` needs a
  successful full Gradle build (same requirement already flagged for Kotlin); Spoon's
  automatic project-model launcher (`MavenLauncher`) only understands Maven's
  `pom.xml` — there is no equivalent auto-detecting Gradle launcher, so Gradle
  projects need the dependency graph resolved and supplied by hand, which is
  fragile and tends to fail silently rather than erroring clearly.
- `tree-sitter-java` (`tree-sitter-grammars/tree-sitter-java`) is now the recommended
  default before AI-only fallback — npm-installable, syntax-only, no build step,
  sidesteps the Maven/Gradle gap entirely instead of fixing it. Tagged
  `extraction_method: static`.
- Documented Java grammar facts in `code-graph-skill-spec.md`: separate node types
  per declaration kind (unlike Kotlin/Swift's unified node types), `method_invocation`
  resolves callees directly via `object:`/`name:` fields (simpler than the
  navigation-expression pattern needed for Kotlin/Swift), modifiers are anonymous
  children of a `modifiers` node (same quirk as Swift's `async`), and anonymous-class/
  lambda bodies are attributed to their nearest enclosing named method — same
  simplification already used for Kotlin/Swift trailing lambdas.
- `tree-sitter-java` requires `tree-sitter@^0.21.x` — the same range as
  `tree-sitter-kotlin`, so the two share one isolated npm install with no new
  version conflict (unlike the Swift/Objective-C pair, below).

### Code-Graph Skill — Objective-C tree-sitter tooling

- Objective-C was previously undocumented in the code-graph skill entirely — no
  tool row, no fallback guidance.
- `tree-sitter-objc` (`tree-sitter-grammars/tree-sitter-objc`) added as the
  recommended default — npm-installable, syntax-only, no build step, same tier as
  the other three mobile/JVM languages.
- Documented a structural difference worth flagging clearly: Objective-C's
  message-passing call syntax (`[receiver selectorPart1:arg1 selectorPart2:arg2]`)
  means its call node does not carry one callee identifier — it carries a
  *sequence* of selector-part fields that must be reconstructed into a full
  selector string and matched against declarations reconstructed the same way.
  This needs its own resolution routine; it is not a variant of the
  receiver-plus-name pattern shared by Java/Kotlin/Swift, and should not be
  force-fit into that shared helper.
- `tree-sitter-objc` requires `tree-sitter@^0.22.x` — the same range as
  `tree-sitter-swift`, so it needs its own isolated npm install, separate from
  the Java/Kotlin pair, for the reason already documented for Swift.

## [3.1.0] - 2026-08-17

### Bootstrap — incremental source-registry reconciliation for `/update`

`/update` previously only diffed already-known repos against git HEAD SHAs — it had
no way to discover new repos or docs, or to track documentation staleness at all.

- New **Phase C1.5: Reconcile Source Registries**, run on every `/update`: normalizes
  and diffs a project's flat URL list (`sources/urls.md`) against its optional
  structured catalog (e.g. `repos.json`) and the analysis manifest.
- New repos/docs found in the URL list are **auto-added** (catalog entry + first
  analysis / first fetch) — additive and reversible, no confirmation needed.
- Entries present in the catalog/manifest but missing from the URL list are
  **flagged and asked about**, never silently removed (may have been added
  directly to the catalog).
- New `lastAnalysis.docs` manifest field tracks each doc URL's source version
  (e.g. Confluence page version) so re-fetches are incremental — only pages
  whose version actually changed are re-fetched, not the whole tree.
- Doc URLs support both a recursive crawl (default — page + all descendants)
  and a `[page-only]` marker for a single page.
- `/update --full` (or "full re-analysis") opts out of all diffing and rebuilds
  the manifest baseline from scratch.
- Schema: `analysis-manifest-schema.json` gains `lastAnalysis.docs` and a
  top-level `registryFiles` field.

### Code-Graph Skill — Swift/Kotlin tree-sitter tooling (Phase 4)

Validated via a prototype run against real iOS/Android app repos in a production polyglot metarepo (2026-08-17):

- `code-graph-skill-spec.md` and `workflows.md`: added a named Swift row and a revised Java/Kotlin row to the tooling-by-language tables — `tree-sitter-swift` and `tree-sitter-kotlin` (both npm packages, syntax-only, no build step) are now the recommended default before AI-only fallback for these two languages, tagged `extraction_method: static`.
- Documented that `jdtls`/IndexStoreDB require a full working build (Gradle / Xcode.app, not just Command Line Tools) and are frequently unavailable in CI/sandboxed environments — tree-sitter needs neither.
- Flagged that Periphery (the well-known Swift dead-code tool) went commercial and archived its OSS repo read-only on 2026-08-12 — removed as a recommendation.
- Documented a real gotcha: `tree-sitter-swift` and `tree-sitter-kotlin` require incompatible `tree-sitter` core versions (`^0.22.x` vs `^0.21.x`) and need isolated npm installs, not a shared root dependency.
- Prototype measured ~7.5ms/file — an 11k-file iOS app or 14k-file Android app extracts in under two minutes.
- Follow-up: promote the prototype into real extractor scripts, add `extraction_method`/`language` columns to the SQLite schema, and land results in a consuming project.

## [3.0.0] - 2026-05-18

This is a major version. Four new skills, a full SQLite-first analysis architecture, evidence-based diagram edges, a structured command lifecycle for AI agent sessions, and a 74% reduction in session-start token overhead compared to v2.6.

### New Skills

**`bootstrap`** (core) — Standardised session entry point and upgrade lifecycle. Replaces the informal "run these files at startup" pattern with slash commands that work consistently across every project.

- **`/start`** — Detects Mode A (established project session) vs Mode B (first-time setup). Mode A prints a live snapshot of enabled skills, code-graph status, dependency warnings, and manifest schema violations. Mode B runs the guided 8-step first-time setup. `first-time-setup.md` is a separate file so Mode A sessions never load setup content (~1,000 tokens saved per session).
- **`/help`** — Full command reference.
- **`/skills`** — Lists all skills in `manifest.yaml` with enabled/disabled status for the current project.
- **`/update`** — KB refresh: detects source repos ahead of the last analysis SHA, re-runs affected skills, regenerates stale architecture-docs views, writes updated SHAs and view lists to the manifest and context files, and auto-regenerates `reports/sqlite-cookbook.md` if the code graph was refreshed.
- **`/upgrade`** — Toolkit-version upgrade: pulls the latest toolkit, diffs the old→new version for new skills, views, reports, config requirements, and template changes, then generates new outputs and re-runs analysis where required. Ends with `toolboxVersion` updated in the manifest and all artifacts flagged with a `generatedWithSkillVersion` bump.

**`code-graph`** (optional) — Extracts a full call-graph from source code into a SQLite database (`code_graph.sqlite`) enabling SQL-speed queries at near-zero token cost. Core phases:

- **Phase 0.0** — Scope & setup dialogue: confirms single vs multi-repo, validates all repos are accessible, offers clone/continue/abort per missing repo.
- **Phase 2.5** — Incremental update: detect changed files via `git diff`, SQL-delete stale nodes/edges (with shared-library cascade), re-extract only changed files, recompute fan-in/fan-out/dead-code, rebuild all 8 materialized view tables. DFS recompute is partial — only paths that include changed nodes are rewalked.
- **Phase 3** — DFS traversal writing `view_entry_traces`, `view_cycles`, and `view_db_entry_paths`.
- **Phase 4A** — YAML output: when SQLite backend is active the YAML `code_graph` section contains stats and `sqlite_path` pointer only (no full node/edge arrays).
- **Phase 4B DDL** — Schema: `nodes` gains `has_db_call`, `has_external_call`, `repo_path`; `edges` gains denormalized `from_repo`/`to_repo`; 4 new indexes; three new materialized view tables: `view_refactor_priority` (fan_in × cyclomatic_complexity ranking), `view_cross_repo_edges`, `view_db_entry_paths`.
- **Phase 4B.5** — Generates `reports/sqlite-cookbook.md` populated from live extraction stats (9 variables). Covers schema reference, essential queries, call-graph traversal, hotspot analysis, entry points, dead code, async patterns, cross-repo edges, refactor priority, and DB entry paths.
- Artefact commit enforced in Phase 4A and 4D — bold warning block prevents omission.

**`excalidraw-import`** (optional) — Parses `.excalidraw` JSON files and feeds them into the architecture model. 5-phase pipeline: parse `elements[]` → map `backgroundColor` to component role using the toolkit's standard colour palette → disambiguation dialogue → write `diagrams/{source}-mermaid.md` → optionally pre-populate `architecture_model` and hand off to `arch-analysis`. Completes the Excalidraw round-trip (output was already supported).

**`update-logs`** (optional) — Structured log generation for project update communications.

### Bootstrap Commands — Hardening

**Phase 1.2 — Skill dependency validation**: each enabled skill's `dependencies[]` is checked against the enabled list. Warnings collected with three fix options (A: enable the dep, B: standalone mode, C: ignore) and surfaced in the Phase 2 status block without blocking the session.

**Phase 1.3 — Manifest schema validation**: on every `/start`, `specs/analysis-manifest.json` is validated against `specs/analysis-manifest-schema.json`. Specific violations shown in Phase 2; session continues.

**Phase 2 status block**: extended with a `Code graph:` line (`✓ current` / `⚠ stale` / `not run` / `not enabled`), a `⚡` prompt when code-graph is enabled but has never run, and the dependency warning block.

**`/upgrade` Phase U2 Step 4 — Skill version tracking**: compares `artifacts.{skill}.generatedWithSkillVersion` against current skill versions in `manifest.yaml`. Flags outdated artifacts for regeneration. New **Action 2b**: prompts user to regenerate, then writes updated `generatedWithSkillVersion` values.

### SQLite-First Analysis Architecture

All code analysis that can be answered from `code_graph.sqlite` **must** use SQL. Traversing YAML or reading source files for questions the graph can answer is prohibited when the SQLite file is current.

Together, the changes in this section replace non-deterministic AI inference with facts read from a call graph extracted directly from source code:

| Change | What it replaces | Effect on output quality |
|---|---|---|
| Phase 4.0 evidence-based edges | Edges inferred from naming conventions, cluster co-location, or domain knowledge | Component & data-flow diagrams only show edges that exist in code; false edges are structurally prevented |
| Phase 4B.6 SQL Dispatch (View 09) | AI summary of code structure from YAML or file scan | Code-graph report is a deterministic read from the extracted graph — same codebase always produces the same output |
| Phase 3 nonfunctional SQLite delegation | AI estimates of dead code, complexity, async usage | Findings are exact counts from the graph, not approximations |
| Phase 2.5 incremental graph update | Full re-extraction or accepting a stale graph | Evidence stays current with the codebase; precision doesn't decay between analyses |
| `nodes.has_db_call` / `has_external_call` columns | Guessing which services touch a DB or external endpoint | DB-boundary and external-call classifications are extraction-time facts, not inferred from naming |

The net result: with `code_graph.sqlite` current, the analysis pipeline is a *projection of the actual codebase* rather than a best-effort narrative. Inferred edges and estimates still appear where the graph lacks coverage, but they are explicitly flagged — solid arrows mean confirmed, dashed arrows mean uncertain.

**`arch-analysis/workflows.md`**
- **Phase 0.5** — Code-graph pre-check: Y/S/D dialogue before Phase 1 with detailed PRECISION / SPEED / TOKEN USAGE table (90–98% token reduction on medium+ codebases; 60–70% on small). Fast-path skips the dialogue when a current `code_graph.sqlite` already exists. AI-only upgrade sub-path: detects `code_graph_mode = "ai-only"` + SQLite now available → offers to regenerate View 09 and reports/ from SQLite without re-running analysis.
- **Phase 4B.6** — SQL Dispatch table: 13-rule routing table + full View 09 section → SQL query mapping (8 view sections sourced from SQL on the SQLite path).

**`nonfunctional-analysis/workflows.md`** — Phase 3 SQLite delegation pre-check: dead-code, complexity, async-in-sync, and unresolved-call checks delegated to SQL when the graph is current. Falls back to full source scan when absent or stale.

**`sqlite-cookbook.template.md`** — Naming bug fixed: all `vw_X` → `view_X` (5 view names). Schema table updated with 3 new `nodes` columns and all 8 view table names. New sections: **Refactor Priority Analysis** (3 query variants) and **DB Entry Paths** (2 query variants). Cross-repo pair query added.

**`arch-analysis/workflows.md` — Phase 4.0: Evidence-Based Diagram Edges** *(contributed by [@jciveira](https://github.com/jciveira) — [PR #5](https://github.com/quantum-crowbar/quantum-toolbox/pull/5))* — New mandatory gate before any diagram edge is drawn. For every service, the agent must build a per-edge evidence table (`From → To → source file → config key`) and classify each edge as Confirmed (`-->`) or Inferred (`-.->`) before writing a single line of Mermaid. Explicit prohibition: edges based solely on naming conventions, co-location, or assumed patterns are forbidden. On the SQLite path, Steps A and B (config file reading + build manifest scan) are skipped entirely — the evidence table is populated from `view_cross_repo_edges` and `nodes.has_db_call`/`has_external_call` instead.

This is the conceptual completion of the SQLite-first shift: the call graph built during extraction is now the authoritative source of truth for diagram edges. Diagrams generated with `code_graph.sqlite` current are projections of the actual codebase, not best-effort narratives. Inferred edges still appear (as dashed arrows) but are explicitly marked uncertain — which is significantly more honest than a solid arrow drawn from a naming heuristic.

### Auto-Sync Hook (Post-Work Hook)

Every analysis skill ends with a non-skippable **Final Step: Sync context files**, backed by a **Post-Work Hook** block in `AGENTS.md`. After analysis the agent automatically updates `CONTEXT.md` stale fields, the per-trigger `last_run` and `outputs[]` in `AGENTS.md`, any badge in `README.md`, and commits the lot. Skills updated: `arch-analysis`, `security-analysis`, `coding-profile`. The hook is injected at first-time setup and retroactively added by `/upgrade`.

### Analysis Views

- **View 08 — SRE & Reliability** added to `arch-analysis` and `architecture-docs`
- **View 09 — Code-Graph Summary** (new): surfaces call-graph metrics from SQLite — entry points, dead code ratio, cyclomatic complexity distribution, cross-repo coupling

### Quality & Correctness

**`specs/analysis-manifest-schema.json`** — New JSON Schema 2020-12 contract for `specs/analysis-manifest.json`. Required top-level fields: `toolboxVersion`, `lastAnalysis`, `artifacts`. `$defs` covers `artifactEntry` (base, includes `generatedWithSkillVersion`), `codeGraphArtifact` (extended with `code_graph_mode`, `stats`, `files`), `historyEntry`.

**`templates/AGENTS.template.md`** — Post-Work Hook extended with an "analysis-manifest.json integrity" rule: every artifact entry must carry `generatedWithSkillVersion`; cites the schema file.

**`skills/manifest.yaml`** — `version: "1.0"` added to all 22 skill entries, enabling `generatedWithSkillVersion` tracking across projects.

**`CONTEXT.template.md`** — New **Analysis Preferences** section tracks SQLite-first status, last extraction date, and extraction scope. `arch-analysis` + `code-graph` added to the Enabled Skills checklist with Phase 0.5 inline comment.

**`first-time-setup.md`** — Step 3: prompt to enable code-graph at setup; Step 8 Option A: notes the Phase 0.5 SQLite offer.

### Session-Start Token Optimisation (74% reduction)

Session-start overhead reduced from ~9,600 tokens (v2.4) to ~2,500 tokens (v3.0):

| Optimisation | Saving |
|---|---|
| OPT-1: Split `_index.md` → `_index.md` + `_detail.md` | ~2,000 t/session |
| OPT-2: Domain-split glossary (TOGAF + Security terms deferred) | ~650 t/session |
| OPT-3: Remove bootstrap command duplication from `core/workflows.md` | ~2,500 t when bootstrap active |
| OPT-4: Phased loading annotations in large skill READMEs | 7–14 K t/large skill |
| OPT-5: `scripts/measure-tokens.sh` token baseline script | tooling |
| OPT-6: Extract first-time-setup from bootstrap (Mode A overhead) | ~1,000 t/Mode A session |

### Deprecations & Consolidation

**`codebase-analysis` deprecated** — `arch-analysis` is now the single recommended entry point for all analysis work. `codebase-analysis` retains its files for migration compatibility and will be removed in v4.

- `manifest.yaml`: `codebase-analysis` status → `deprecated`
- `arch-analysis` description → "Default analysis skill"; invocations expanded to catch `"Analyze this codebase"`, `"Run analysis"`, `"Analyze this repo"` in addition to `"Analyze the architecture"`
- `code-graph` dependency updated from `codebase-analysis` → `arch-analysis`
- `skills/_index.md`: `arch-analysis` listed first as **Default**; `codebase-analysis` struck through with migration note; Agent Notes updated
- Both READMEs updated

### Infrastructure

- **`docs/site/` removed from version control** — 9 symlinked files deleted; site built from source with `mkdocs build` only. `mkdocs.yml`: `docs_dir: docs`.
- **`.gitignore`**: `_site/` deduplicated.
- **OSS compliance pass**: `CODE_OF_CONDUCT.md`, `CONTRIBUTING.md`, `SECURITY.md`, `LICENSE` all verified correct before push.

### Bug Fixes

- `excalidraw-output.md`: corrected `source` field in system context JSON template (`"architecture-analysis"` → `"https://excalidraw.com"`)
- Bootstrap `/start`: fixed mode detection (session start vs first-time setup)
- `sqlite-cookbook.template.md`: fixed `vw_X` → `view_X` naming (queries would have failed at runtime)
- Stale skill descriptions in `AGENTS.md` template and `arch-analysis/README.md` corrected

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

[Unreleased]: https://github.com/quantum-crowbar/quantum-toolbox/compare/v3.0.0...HEAD
[3.0.0]: https://github.com/quantum-crowbar/quantum-toolbox/compare/v2.6.0...v3.0.0
[2.6.0]: https://github.com/quantum-crowbar/quantum-toolbox/compare/v2.5.0...v2.6.0
[2.5.0]: https://github.com/quantum-crowbar/quantum-toolbox/compare/v2.4.0...v2.5.0
[2.4.0]: https://github.com/quantum-crowbar/quantum-toolbox/compare/v2.3.0...v2.4.0
[2.3.0]: https://github.com/quantum-crowbar/quantum-toolbox/compare/v2.2.0...v2.3.0
[2.2.0]: https://github.com/quantum-crowbar/quantum-toolbox/compare/v2.1.0...v2.2.0
[2.1.0]: https://github.com/quantum-crowbar/quantum-toolbox/compare/v2.0.0...v2.1.0
[2.0.0]: https://github.com/quantum-crowbar/quantum-toolbox/compare/v1.0.0...v2.0.0
[1.0.0]: https://github.com/quantum-crowbar/quantum-toolbox/compare/v0.1.0...v1.0.0
[0.1.0]: https://github.com/quantum-crowbar/quantum-toolbox/releases/tag/v0.1.0
