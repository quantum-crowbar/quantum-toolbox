# Roadmap Tracker

Master tracking document for all skill development roadmaps.

---

## Status Overview

| Roadmap | Phase | Status | Priority |
|---------|-------|--------|----------|
| Arch-Analysis Enhancement | Phase 1 | 🟢 Complete | High |
| Arch-Analysis Output Structure | - | 🟢 Complete | High |
| TOGAF Foundation | Phase 1 | 🟢 Complete | High |
| Structurizr Authoring Skill | - | 🟢 Complete | Medium |
| Structurizr Export Adapter | - | 🟢 Complete | Medium |
| Security-Analysis Skill | Phase 2 | 🟢 Complete | Medium |
| Nonfunctional-Analysis Skill | Phase 3 | 🟢 Complete | Medium |
| TOGAF Core ADM | Phase 2 | 🟢 Complete | Medium |
| Analysis Refactoring | Phase 1-4 | 🟢 Complete | Medium |
| TOGAF Phase E | - | 🟢 Complete | Medium |
| TOGAF Phase F | - | 🟢 Complete | Medium |
| TOGAF Phase G | - | 🟢 Complete | Medium |
| TOGAF Phase H | - | 🟢 Complete | Medium |
| Architecture Synthesis Skill | - | 🟢 Complete | High |
| Core Architecture Docs Output | - | 🟢 Complete | High |
| Change Mgmt Communication Plan | - | 🟢 Complete | High |
| Fitness Functions Skill | - | 🟢 Complete | High |
| Migration Planning Fitness Integration | - | 🟢 Complete | High |
| Presentation Generation | - | 🟢 Complete | Medium |
| NIS 2 Compliance Framework | - | 🟢 Complete | Medium |
| Excalidraw Diagram Support | - | 🟢 Complete | Medium |
| TOGAF Preliminary Phase | - | 🟢 Complete | Low |
| | | | |
| **--- NEW SKILLS ---** | | | |
| Roadmap Building Skill | Phase 1 | ⚪ Planned | High |
| Roadmap Analysis Skill (7 modes) | Phase 2 | ⚪ Planned | High |
| Roadmap Skills Documentation | Phase 3 | ⚪ Planned | Low |
| | | | |
| **--- OPEN-SOURCE READINESS ---** | | | |
| Mental Model Override Mechanism | - | 🟢 Complete | High |
| Mental Model Full Swap Mechanism | - | ⚪ Planned | Medium |
| README: Mental Model as Engine | - | 🟢 Complete | High |
| CONTRIBUTING.md + CODE_OF_CONDUCT.md | - | 🟢 Complete | High |
| Bug & Security Reporting (SECURITY.md) | - | 🟢 Complete | High |
| LICENSE file (MIT) | - | 🟢 Complete | High |
| CHANGELOG.md | - | 🟢 Complete | Medium |
| .github Setup (CI, Issue/PR Templates) | - | 🟢 Complete | Medium |
| Example Project (quantum-blockchain) | - | ⚪ Planned | Medium |
| | | | |
| **--- OPTIMIZATION / REFACTOR ---** | | | |
| Entry Point Consolidation | - | ⚪ Planned | High |
| Remove Bash Safety List | - | ⚪ Planned | High |
| Token Budget Guidance | - | ⚪ Planned | High |
| Machine-Readable Skill Manifest | - | ⚪ Planned | Medium |
| Explicit Lazy Loading Guidance | - | ⚪ Planned | Medium |
| Clarify File Audiences | - | ⚪ Planned | Medium |
| Resolve todo-workflow Dual Location | - | ⚪ Planned | Medium |
| Fix .claude/settings.local.json | - | ⚪ Planned | Low |
| Fix Duplicate Invokable Command | - | ⚪ Planned | Low |
| Fix Output Adapter Paths | - | ⚪ Planned | Low |
| Fix Presentation Skill Categorization | - | ⚪ Planned | Low |
| Fix Contradictory Roadmap Status | - | ⚪ Planned | Low |

Legend: 🟢 Complete | 🟡 In Progress | ⚪ Planned | 🔴 Blocked

---

## Completed Work

### Arch-Analysis Phase 1 ✅

- [x] **Dependency Health Check**
  - [x] Add workflow phase (Phase 6)
  - [x] Template for dependency manifest
  - [x] Checklist for outdated/vulnerable packages
  - [x] License compliance inventory

- [x] **Data Flow Mapping**
  - [x] Add workflow phase (Phase 7)
  - [x] Template for data flow diagrams
  - [x] Trace data from input to storage
  - [x] Entity cross-reference matrix

- [x] **Error Handling Analysis**
  - [x] Add workflow phase (Phase 8)
  - [x] Template for error handling inventory
  - [x] Map error propagation patterns
  - [x] Recovery mechanisms documentation

### Arch-Analysis Output Structure ✅

- [x] Phase 0: Setup workflow
- [x] Ask for documentation directory
- [x] Create `architecture-docs/` with `index.md` and `analysis/` subdirectory
- [x] Numbered output files (01-07)
- [x] Index template with executive summary
- [x] Diagram format preference (Mermaid/ASCII/PlantUML)
- [x] AI file exclusions

### TOGAF Foundation ✅

- [x] **Core Concepts** (`core/architecture-thinking.md`)
  - [x] Architecture Domains
  - [x] Stakeholder Thinking
  - [x] Architecture Principles
  - [x] Baseline vs Target Thinking
  - [x] Gap Analysis templates
  - [x] Roadmap Prioritization
  - [x] Risk Analysis with mindmaps
  - [x] Enterprise Continuum

- [x] **Family Index** (`togaf/_index.md`)
  - [x] ADM cycle overview
  - [x] Phase relationships diagram
  - [x] When to use each phase

- [x] **Phase A: Architecture Vision** (`togaf/vision/`)
  - [x] README.md
  - [x] workflows.md (template-first approach)
  - [x] templates.md (Vision doc, Stakeholder map, Statement of Work)
  - [x] examples.md
  - [x] checklist.md (quick reference)

### Security-Analysis Skill ✅

- [x] **Dual Output Format**
  - [x] Human-readable analysis (7 reports with diagrams)
  - [x] Standards-based compliance reports (multi-select)

- [x] **Compliance Frameworks**
  - [x] OWASP ASVS template
  - [x] NIST CSF template
  - [x] CIS Controls template
  - [x] ISO 27001 template

- [x] **Skill Files** (`skills/optional/security-analysis/`)
  - [x] README.md with principles and framework descriptions
  - [x] workflows.md with 7 analysis phases
  - [x] templates.md (analysis + compliance templates)
  - [x] checklist.md
  - [x] examples.md

### Nonfunctional-Analysis Skill ✅

- [x] **Testing Coverage Analysis**
  - [x] Test discovery and inventory
  - [x] Coverage gap identification
  - [x] Test quality assessment
  - [x] Flaky test detection

- [x] **Configuration Audit**
  - [x] Config file inventory
  - [x] Environment variable audit
  - [x] Secrets management check
  - [x] Validation coverage

- [x] **Performance Hotspots**
  - [x] Complexity metrics
  - [x] Async pattern analysis
  - [x] Database query analysis
  - [x] Resource management review

- [x] **Code Health**
  - [x] Duplication detection
  - [x] Dead code analysis
  - [x] Technical debt markers
  - [x] Consistency scoring

- [x] **Skill Files** (`skills/optional/nonfunctional-analysis/`)
  - [x] README.md
  - [x] workflows.md
  - [x] templates.md
  - [x] checklist.md
  - [x] examples.md

### TOGAF Core ADM ✅

- [x] **Phase B: Business Architecture** (`togaf/business-architecture/`)
  - [x] Capability mapping and heatmaps
  - [x] Value stream modeling
  - [x] Business process models (BPMN-style)
  - [x] Organization mapping
  - [x] Gap analysis templates
  - [x] Work package definitions

- [x] **Phase C: Information Systems** (`togaf/information-systems/`)
  - [x] Data entity catalogs
  - [x] Logical data models
  - [x] Data flow diagrams
  - [x] Application catalogs
  - [x] Application-capability matrix
  - [x] Interface and integration catalogs
  - [x] Data governance model

- [x] **Phase D: Technology Architecture** (`togaf/technology-architecture/`)
  - [x] Technology catalog and radar
  - [x] Platform architecture (containers, databases, messaging)
  - [x] Network architecture diagrams
  - [x] Deployment architecture (HA, DR)
  - [x] Security architecture
  - [x] Technology standards

---

## Remaining Tasks

### Medium Priority

#### Structurizr Skills (New)
See: [structurizr-skills-spec.md](structurizr-skills-spec.md)

**Structurizr Authoring** (`skills/optional/structurizr/`) ✅
- [x] README.md with C4 concepts and DSL reference
- [x] workflows.md for create/update/review workspaces
- [x] templates.md with DSL patterns
- [x] checklist.md for C4 completeness
- [x] examples.md with sample workspaces

**Structurizr Export** (`analysis-outputs/structurizr/`) ✅
- [x] Mapping rules from analysis model to DSL
- [x] Workspace generation templates
- [x] Integration with codebase-analysis

#### TOGAF Core ADM (Phase 2) ✅
- [x] Phase B: Business Architecture skill
- [x] Phase C: Information Systems skill
- [x] Phase D: Technology Architecture skill

### Low Priority

#### TOGAF Planning & Governance ✅
- [x] Phase E: Opportunities and Solutions
- [x] Phase F: Migration Planning
- [x] Phase G: Implementation Governance
- [x] Phase H: Architecture Change Management

#### Analysis Refactoring ✅
See: [codebase-analysis-refactor-spec.md](codebase-analysis-refactor-spec.md)

**Complete**
- [x] Extract shared analysis engine (`codebase-analysis/`)
- [x] Define analysis model schema (`analysis-model.md`)
- [x] Create output adapter pattern (`analysis-outputs/`)
- [x] Architecture-docs adapter (existing output)
- [x] Coding-context adapter (AGENTS.md, CONTEXT.md)
- [x] Product spec adapter
- [x] Structurizr adapter (export from analysis)
- [x] ArchiMate adapter

### Architecture Synthesis Skill ✅

- [x] Create skill directory structure
- [x] README.md - concepts and process guide
- [x] workflows.md - 7-phase synthesis workflow
- [x] templates.md - input templates and conventions
- [x] parsers.md - format parsing logic (Excalidraw, Mermaid, Draw.io, ArchiMate)
- [x] examples.md - end-to-end examples
- [x] checklist.md - quick reference

### Core Architecture Docs Output ✅

- [x] Create core-architecture adapter directory
- [x] README.md - adapter purpose, structure, TOGAF integration
- [x] templates.md - output templates for all sections:
  - [x] index.md - executive summary
  - [x] baseline/ - current state (4 domain files)
  - [x] target/ - future state
  - [x] gap-analysis/ - gap register
  - [x] risk-analysis/ - risk register
  - [x] evolution-plan/ - roadmap + fitness functions
  - [x] change-management/ - communication plan
- [x] Update _index.md to register new adapter

### Change Management Communication Plan ✅

- [x] Communication Plan Template with full matrix:
  - [x] Stakeholder/audience
  - [x] Message type
  - [x] Owner
  - [x] Delivery date
  - [x] Team/domain
  - [x] Channel/medium
  - [x] Status
  - [x] **Impact review date/period**
- [x] Stakeholder group templates
- [x] Message templates (announcement, training, status)
- [x] Communication schedule (Gantt)
- [x] Impact review process
- [x] Input workflow for planning
- [x] Integration into workflows.md Step 6.2
- [x] Realistic example (Auth0 migration)
- [x] Checklist updates

### Fitness Functions Skill ✅

- [x] Create skill directory (`skills/optional/fitness-functions/`)
- [x] README.md - Evolutionary architecture concepts, 8 fitness categories
  - [x] Deployment/Operational (DORA metrics)
  - [x] Performance (latency, throughput)
  - [x] Reliability (availability, MTTR, MTBF)
  - [x] Security (vulnerabilities, compliance)
  - [x] Scalability (elasticity, capacity)
  - [x] Maintainability (complexity, debt, coverage)
  - [x] Coupling/Modularity (dependencies, API stability)
  - [x] Data Integrity (consistency, backups, RPO)
- [x] workflows.md - 7-step lifecycle
  - [x] Identify quality attributes
  - [x] Define fitness functions
  - [x] Establish baselines
  - [x] Set targets
  - [x] Implement measurement
  - [x] Monitor & report
  - [x] Review & adapt
- [x] templates.md - Comprehensive templates
  - [x] Fitness function specification
  - [x] Quality attribute prioritization
  - [x] Fitness function catalog
  - [x] Fitness dashboard
  - [x] Baseline report
  - [x] Fitness-guided migration
  - [x] CI/CD fitness gate
  - [x] Composite function definition
- [x] checklist.md - Quick reference for all steps
- [x] examples.md - 6 comprehensive examples
  - [x] E-commerce platform
  - [x] SaaS migration
  - [x] API platform
  - [x] Data pipeline
  - [x] Microservices architecture
  - [x] Security-first system

### Migration Planning Fitness Integration ✅

- [x] Update migration-planning README.md with fitness concepts
- [x] Add Step 1b: Establish Fitness Baseline to workflows.md
- [x] Add Step 2b: Define Fitness Gates to workflows.md
- [x] Fitness-based rollback triggers
- [x] Dashboard configuration
- [x] Update output structure with fitness deliverables
- [x] Link to standalone fitness-functions skill

### Presentation Generation Skill ✅

- [x] Create skill directory (`skills/optional/presentation/`)
- [x] README.md - Marp concepts, syntax, architecture patterns
  - [x] Marp CLI commands and output formats
  - [x] Markdown slide syntax (front matter, directives, images)
  - [x] Architecture presentation patterns (vision, ADR, deep dive, migration)
  - [x] Diagram embedding workflow
  - [x] File organization best practices
- [x] workflows.md - 7-step presentation workflow
  - [x] Define purpose & audience
  - [x] Select template
  - [x] Gather content
  - [x] Prepare diagrams
  - [x] Write slides
  - [x] Review & refine
  - [x] Export & deliver
- [x] templates.md - Reusable slide templates
  - [x] Vision deck (12 slides)
  - [x] ADR deck (10 slides)
  - [x] Deep dive deck (12 slides)
  - [x] Migration deck (11 slides)
  - [x] Status deck (8 slides)
  - [x] Minimal deck (5 slides)
  - [x] Common slide patterns
- [x] checklist.md - Quick reference for all steps
- [x] examples.md - 5 comprehensive examples
  - [x] API Gateway ADR presentation
  - [x] Microservices migration vision
  - [x] Technical deep dive
  - [x] Migration briefing
  - [x] Status update
- [x] themes/architecture.css - Custom architecture theme

---

## Quick Summary: What's Left

**17 items remaining across 3 tracks** (7 OSS items completed this session).

### Open-Source Readiness (9 items)

| # | Task | Effort | Priority |
|---|------|--------|----------|
| OSS-1 | **Mental model override mechanism** — project-level layered overrides for architecture-thinking.md | Medium | High |
| OSS-2 | **Mental model full swap** — named profiles for fundamentally different worldviews | Large | Medium |
| OSS-3 | **README: mental model as engine** — explain the core design principle to adopters | Small | High |
| OSS-4 | **CONTRIBUTING.md** — building skills, adjusting mental model, PR conventions | Medium | High |
| OSS-5 | **Bug & security reporting** — SECURITY.md, issue templates | Small | High |
| OSS-6 | **LICENSE file** — MIT or GPL, actual license text | Small | High |
| OSS-7 | **CHANGELOG.md** — backfill from git history, define versioning policy | Medium | Medium |
| OSS-8 | **.github setup** — CI pipeline, issue/PR templates | Medium | Medium |
| OSS-9 | **Example project** — quantum-blockchain with toolkit wired up, pre-generated outputs | Medium | Medium |

### New Skills (3 items)

| # | Task | Effort | Priority | Spec |
|---|------|--------|----------|------|
| N1 | **Roadmap Building** — generate implementation roadmaps from architecture (ADRs, deps, phases, risks) | Large | High | [roadmap-skills-spec.md](roadmap-skills-spec.md) |
| N2 | **Roadmap Analysis** — 7 modes: expand, research, complexity, spikes, estimation, PDF export, team/financial planning | Large | High | [roadmap-skills-spec.md](roadmap-skills-spec.md) |
| N3 | **Roadmap Skills Documentation** — update indexes, context files, end-to-end examples | Small | Low | - |

### Optimization / Refactor (12 items)

| # | Task | Effort | Priority |
|---|------|--------|----------|
| O1 | **Entry point consolidation** — deduplicate 5 overlapping files (~300-400 lines saved) | Large | High |
| O2 | **Remove bash safety list** — cut ~100 lines from `core/instructions.md` | Small | High |
| O3 | **Token budget guidance** — document token footprint per skill | Small | High |
| O4 | **Machine-readable skill manifest** — single YAML/JSON source of truth | Medium | Medium |
| O5 | **Explicit lazy loading guidance** — read-on-demand pattern | Small | Medium |
| O6 | **Clarify file audiences** — tag files as human / agent / both | Small | Medium |
| O7 | **Resolve todo-workflow dual location** — eliminate content split | Small | Medium |
| O8 | **Fix `.claude/settings.local.json`** — hardcoded absolute path | Small | Low |
| O9 | **Fix duplicate invokable command** — "Generate presentation" x2 | Small | Low |
| O10 | **Fix output adapter paths** — wrong paths in AI_TOOLKIT_CONTEXT.md | Small | Low |
| O11 | **Fix presentation skill categorization** — inconsistent across files | Small | Low |
| O12 | **Fix contradictory roadmap status** — "Future Skills" vs "all complete" | Small | Low |

---

## Open-Source Readiness

### OSS-1: Mental Model Override Mechanism (High Priority)

**Problem:** `core/architecture-thinking.md` is the engine driving all analysis, TOGAF, and output skills. It encodes one architectural worldview (TOGAF-influenced, domain-centric). Adopters need to customize it for their context without forking the toolkit.

**Solution:** A project-level override convention using a layered file approach.

**How it works:**
1. Toolkit ships `core/architecture-thinking.md` as the default mental model
2. Adopters create `architecture-thinking.local.md` in their project root
3. Agents read the default first, then the override
4. Override semantics: matching headings **replace**, new headings **add**, listed headings under `## Skip` are **ignored**

**Tasks:**
- [ ] Document the override convention in AGENTS.md reading order (step between core and skills)
- [ ] Create `templates/architecture-thinking.override.template.md` with section structure and instructions
- [ ] Update `core/workflows.md` to reference override loading
- [ ] Add examples: adding a domain, replacing stakeholder types, changing default prioritization
- [ ] Test: agent correctly layers override on top of default

**Example override file:**
```markdown
# Architecture Thinking — Project Overrides

> Read AFTER core/architecture-thinking.md.
> Matching headings REPLACE. New headings ADD. Listed under Skip are IGNORED.

## Skip
- Enterprise Continuum

## Architecture Domains
### Regulatory Architecture  ← new domain
- Compliance frameworks, audit requirements, data sovereignty
...

## Prioritization
<!-- replaces default — this project uses WSJF exclusively -->
...
```

---

### OSS-2: Mental Model Full Swap Mechanism (Medium Priority)

**Problem:** Some adopters don't want to tweak the default engine — they have a fundamentally different way of thinking about architecture (lean startup, platform engineering, regulated enterprise, etc.).

**Solution:** Named profiles in the toolkit that can be selected as the active mental model.

**How it works:**
1. Profiles live in `core/architecture-thinking/profiles/`
2. The default profile is the current `architecture-thinking.md`
3. Adopters select a profile in their project's `AGENTS.md`: `architecture-thinking: lean-startup`
4. The override mechanism (OSS-1) still works on top of any profile

**Depends on:** OSS-1 (override mechanism should exist first)

**Tasks:**
- [ ] Restructure `core/architecture-thinking.md` into `core/architecture-thinking/default.md`
- [ ] Create profile loading convention (AGENTS.md directive)
- [ ] Document how to contribute a new profile (see CONTRIBUTING.md)
- [ ] Seed 1-2 alternative profiles as examples (e.g., `lean-startup.md`, `platform-eng.md`)
- [ ] Update all internal references from `core/architecture-thinking.md` to new path

**Future profiles (community-contributed):**
- `lean-startup` — hypothesis-driven, MVP-first, minimal ceremony
- `platform-eng` — infrastructure-centric, developer experience, internal platforms
- `regulated-enterprise` — compliance-first, audit trails, data sovereignty as first-class domain
- `data-intensive` — data pipelines, ML/AI systems, data governance as primary concern

---

### OSS-3: README — Mental Model as Engine (High Priority)

**Problem:** The README doesn't explain that `architecture-thinking.md` is the core engine driving all skills. Potential adopters and contributors don't understand the toolkit's central design principle.

**Tasks:**
- [ ] Add "How It Works" or "Architecture" section to README.md explaining:
  - The mental model is the engine; skills are the tools
  - All analysis/architecture skills inherit their lens from this file
  - The override mechanism allows per-project customization
  - Full swaps allow fundamentally different worldviews
- [ ] Add a simple diagram showing: Mental Model → Skills → Outputs
- [ ] Reference override and swap mechanisms

---

### OSS-4: CONTRIBUTING.md (High Priority)

**Problem:** No contributor guide. People don't know how to add skills, adjust the mental model, or what gets accepted.

**Tasks:**
- [ ] Create `CONTRIBUTING.md` covering:
  - **Building a new skill**: directory structure, required files, naming conventions, how to register in manifest.yaml and _index.md
  - **Adjusting the mental model**: when to propose a change to the default vs. creating a profile vs. using project overrides
  - **Modifying existing skills**: what changes are welcome, backwards compatibility expectations
  - **Pull request conventions**: branch naming, commit messages (reference templates/COMMIT.md), PR description format
  - **Code of conduct reference**
  - **Review process**: what maintainers look for, response time expectations
- [ ] Create `CODE_OF_CONDUCT.md` (Contributor Covenant or similar)

---

### OSS-5: Bug & Security Reporting (High Priority)

**Problem:** No security policy or bug reporting guidelines. Especially important since the toolkit includes security analysis skills.

**Tasks:**
- [ ] Create `SECURITY.md` with:
  - How to report security vulnerabilities (private disclosure process)
  - Scope (what counts as a security issue in a documentation toolkit)
  - Response timeline commitment
- [ ] Create `.github/ISSUE_TEMPLATE/bug_report.md`
- [ ] Create `.github/ISSUE_TEMPLATE/feature_request.md`
- [ ] Create `.github/ISSUE_TEMPLATE/new_skill_proposal.md`

---

### OSS-6: LICENSE File (High Priority)

**Problem:** README says MIT but no `LICENSE` file exists. Code is technically all-rights-reserved.

**Tasks:**
- [ ] Decide license: MIT (permissive, maximum adoption) or GPL (copyleft, derivative works must share)
- [ ] Create `LICENSE` file with full license text
- [ ] Verify README license reference matches

**Recommendation:** MIT — this is a knowledge/documentation toolkit, not a library. Maximum adoption matters more than copyleft protection. Users embedding this as a submodule shouldn't worry about license contamination.

---

### OSS-7: CHANGELOG.md (Medium Priority)

**Problem:** At v2.5.0 with no version history. Adopters pulling the submodule need to know what changed between versions.

**Tasks:**
- [ ] Create `CHANGELOG.md` following Keep a Changelog format
- [ ] Backfill key milestones from git history and Progress Log
- [ ] Define versioning policy (semver: major = breaking mental model changes, minor = new skills, patch = fixes)
- [ ] Create git tags for current and past versions

---

### OSS-8: .github Setup (Medium Priority)

**Problem:** No CI, no issue templates, no PR template for the toolkit itself.

**Tasks:**
- [ ] Create `.github/ISSUE_TEMPLATE/bug_report.md`
- [ ] Create `.github/ISSUE_TEMPLATE/feature_request.md`
- [ ] Create `.github/ISSUE_TEMPLATE/new_skill_proposal.md`
- [ ] Create `.github/PULL_REQUEST_TEMPLATE.md` (for contributing TO the toolkit, not the existing template for projects USING it)
- [ ] Create `.github/workflows/validate.yml` — CI pipeline:
  - Lint markdown (markdownlint)
  - Validate manifest.yaml (schema check)
  - Check internal links aren't broken
  - Verify every skill has required files (README.md, workflows.md at minimum)
- ~~`FUNDING.yml`~~ — on ice, may revisit later

---

### OSS-9: Example Project — quantum-blockchain (Medium Priority)

**Problem:** Potential adopters can't see the toolkit in action without installing it. There's no concrete demonstration of what skills produce or how customization works.

**Solution:** Use [quantum-blockchain](https://github.com/metaphorical/quantum-blockchain) (a Python/Flask blockchain microservice) as a showcase project with the toolkit wired up and pre-generated analysis outputs.

**Why this project:**
- Architecturally interesting: distributed P2P system, node discovery, storage layer, REST API
- Right size: small enough to explore in 10 minutes, complex enough for meaningful analysis
- Real analysis targets: acknowledged security gaps (no auth), missing validation, no proof-of-work — skills have genuine findings
- Natural mental model override: "Consensus Architecture" as a custom domain is immediately intuitive
- Same owner — no permission issues

**Depends on:** OSS-1 (override mechanism, to demonstrate it), OSS-6 (LICENSE)

**Tasks:**
- [ ] Create branch or fork: `quantum-blockchain-example`
- [ ] Add `.ai-toolkit/` as git submodule pointing to this repo
- [ ] Create populated `AGENTS.md` with 3-4 skills enabled
- [ ] Create populated `CONTEXT.md` with project state
- [ ] Create `architecture-thinking.local.md` demonstrating override mechanism:
  - Add "Consensus Architecture" domain (proof-of-work, block validation, fork resolution)
  - Add "Network Topology" domain (node discovery, bootstrap sync, P2P)
  - Skip "Enterprise Continuum" (irrelevant for this project)
- [ ] Run arch-analysis and commit outputs to `analysis/architecture-docs/`
- [ ] Run security-analysis and commit output to `analysis/security-report.md`
- [ ] Generate Structurizr C4 workspace (`analysis/workspace.dsl`)
- [ ] Create lightweight TOGAF Phase A vision document
- [ ] Define 2-3 fitness functions with baseline measurements
- [ ] Generate architecture overview presentation
- [ ] Write "Try It Yourself" README section with exact copy-paste prompts:
  - "Analyze the architecture"
  - "Analyze security"
  - "Create C4 model"
- [ ] Link from main toolkit README.md

**Expected output structure:**
```
quantum-blockchain/
├── .ai-toolkit/                        ← this repo as submodule
├── AGENTS.md                           ← populated, skills enabled
├── CONTEXT.md                          ← filled in with real project context
├── architecture-thinking.local.md      ← override: Consensus + Network domains
├── src/                                ← existing application code (unchanged)
├── analysis/
│   ├── architecture-docs/              ← pre-generated arch-analysis output
│   ├── security-report.md              ← pre-generated security-analysis output
│   ├── workspace.dsl                   ← C4 model
│   └── fitness-functions.md            ← baseline measurements
├── presentations/
│   └── architecture-overview.pptx      ← generated deck
└── README.md                           ← "Try It Yourself" walkthrough
```

---

### OSS Execution Order

| Step | Task | Effort | Depends On |
|------|------|--------|------------|
| 1 | LICENSE file (OSS-6) | Small | - |
| 2 | README mental model section (OSS-3) | Small | - |
| 3 | Mental model override mechanism (OSS-1) | Medium | - |
| 4 | CONTRIBUTING.md + CODE_OF_CONDUCT (OSS-4) | Medium | OSS-1 (to document override process) |
| 5 | SECURITY.md + bug reporting (OSS-5) | Small | - |
| 6 | CHANGELOG.md + git tags (OSS-7) | Medium | - |
| 7 | .github setup (OSS-8) | Medium | OSS-4, OSS-5 (templates reference contributing guide) |
| 8 | Mental model full swap (OSS-2) | Large | OSS-1, OSS-4 |
| 9 | Example project — quantum-blockchain (OSS-9) | Medium | OSS-1, OSS-6 |

Steps 1-3 and 5-6 can be done in parallel. Steps 4, 7-9 have dependencies.

---

## Planned Work (Previous — Completed Specs)

### Architecture Synthesis Skill

**Middle-Out Architecture Creation**: Parse visual diagrams and specifications to synthesize architecture models, then feed into full TOGAF analysis.

**Problem:** Currently, we support:
- Bottom-up: Code → Architecture (codebase-analysis)
- Top-down: Requirements → Architecture (TOGAF Phase A)

**Missing:** Specification → Architecture (visual diagrams + descriptions)

**Solution:** Interactive synthesis workflow that requests resources and builds unified architecture model.

#### Workflow: Interactive Resource Collection

When invoked, agent provides **requirements checklist** of what's needed, then iteratively asks for:

**Phase 1: Initial Requirements Gathering**
```
Agent provides checklist:
├── Visual Architecture (choose format)
│   ├── Excalidraw (.excalidraw JSON)
│   ├── Draw.io (.drawio XML)
│   ├── Archi/ArchiMate (.archimate XML)
│   ├── Mermaid (.mmd text)
│   └── Or: Hand-drawn (JPEG/PNG with OCR fallback)
├── Component Specifications (markdown)
│   ├── Component descriptions
│   ├── Responsibilities
│   ├── Dependencies/connections
│   └── Technology stack
├── Code Samples (optional but recommended)
│   ├── Repository links
│   ├── Key modules/files
│   └── Configuration files
└── Business Context
    ├── Business goals
    ├── Stakeholders
    └── Constraints
```

**Phase 2: Parse Visual Architecture**
- [ ] Parse Excalidraw JSON (elements, connections, labels)
- [ ] Parse Draw.io XML (mxCell elements, geometry, metadata)
- [ ] Parse ArchiMate XML (elements, relationships, layers)
- [ ] Parse Mermaid text (nodes, edges, groups)
- [ ] Extract components, boundaries, connections

**Phase 3: Parse Specifications**
- [ ] Parse markdown component descriptions
- [ ] Extract: name, purpose, responsibilities, interfaces
- [ ] Map to visual diagram components
- [ ] Validate: all visual components have descriptions

**Phase 4: Analyze Code Samples**
- [ ] Link code to components
- [ ] Extract: tech stack, dependencies, patterns
- [ ] Validate: code matches specification
- [ ] Enrich component details

**Phase 5: Iterative Clarification**
Agent asks follow-up questions for missing/ambiguous info:
```
Examples:
- "Component 'API Gateway' connects to 'Auth Service'. What protocol? REST/gRPC/GraphQL?"
- "Database component found. What DBMS? PostgreSQL/MySQL/MongoDB?"
- "'User Service' has no code sample. What language/framework?"
- "Unclear boundary. Is 'Cache' part of API or separate service?"
```

**Phase 6: Synthesize Architecture Model**
- [ ] Build unified model (Structurizr C4 or internal format)
- [ ] Validate completeness
- [ ] Generate baseline architecture
- [ ] Output to architecture-docs/baseline/

**Phase 7: Generate TOGAF Input**
- [ ] Create Phase A vision input (stakeholders, goals, scope)
- [ ] Prepare baseline architecture (current state)
- [ ] Set up for full TOGAF cycle (Phases A-H)
- [ ] Option to run full analysis or stop at synthesis

#### Supported Input Formats

| Format | Tool | Parseable | Priority |
|--------|------|-----------|----------|
| Excalidraw | VS Code, excalidraw.com | JSON | P0 |
| Mermaid | Text editors | Text | P0 |
| Draw.io | diagrams.net | XML | P1 |
| ArchiMate | Archi tool | XML | P1 |
| Hand-drawn | Image (OCR) | Image | P2 |

#### Output Formats

Same as analysis output:
- Mermaid diagrams
- Excalidraw files
- ArchiMate export (via adapter)
- Structurizr DSL

#### Documentation

**Tasks:**
- [ ] Create `architecture-synthesis/` skill directory
- [ ] Write process guide: tools and formats users can provide
- [ ] Document interactive workflow and questions
- [ ] Create template for component specifications (MD)
- [ ] Provide examples: Excalidraw + MD → Full TOGAF
- [ ] Add parser implementations for each format

**Files:**
```
skills/architecture-synthesis/
├── README.md                    # Concepts and process guide
├── workflows.md                 # 7-phase workflow
├── templates.md                 # Input templates
│   ├── requirements-checklist.md
│   ├── component-spec-template.md
│   ├── excalidraw-conventions.md
│   ├── drawio-conventions.md
│   └── archimate-guidelines.md
├── parsers.md                   # Format parsing logic
├── examples.md                  # End-to-end examples
└── checklist.md                 # Quick reference
```

**Integration:**
- Links to TOGAF Phase A (feeds synthesized vision)
- Uses Structurizr for model generation
- Outputs to architecture-docs/baseline/
- Can trigger full TOGAF analysis (A-H)

**Location:** `skills/architecture-synthesis/`

---

### High Priority

#### Core Architecture Docs Output (`analysis-outputs/core-architecture/`)

Restructure the primary architecture analysis output. Core architecture docs become the canonical output location; TOGAF phase outputs link TO these docs via their index files.

**Design Principle**: Core docs are the source of truth. Phase-specific outputs (vision, business-architecture, etc.) reference core docs rather than duplicating content.

**Whitelist Principle**: Only explicitly listed artifacts go in core. Everything else remains in phase-specific outputs.

**Core Artifacts (Whitelist):**
| Artifact | Location | Description |
|----------|----------|-------------|
| Baseline Architecture | `baseline/` | Current state across all domains |
| Target Architecture | `target/` | Future state across all domains |
| Gap Analysis | `gap-analysis/` | Baseline vs Target comparison |
| Risk Analysis | `risk-analysis/` | Risk register and mitigations |
| Evolution Plan | `evolution-plan/` | Roadmap, fitness functions, transitions |
| Change Management Summary | `change-management/` | Change tracking and communication plan |

**Output Structure:**
```
core-architecture/
├── index.md                    # Executive summary and navigation
├── baseline/                   # Current state documentation
│   ├── overview.md
│   └── domain-specific files
├── target/                     # Future state documentation
│   ├── overview.md
│   └── domain-specific files
├── gap-analysis/               # Baseline vs Target comparison
│   ├── summary.md
│   └── domain-specific gaps
├── risk-analysis/              # Architecture risks
│   ├── risk-register.md
│   └── mitigation-plans.md
├── evolution-plan/             # Migration/transformation roadmap
│   ├── roadmap.md
│   ├── fitness-functions.md    # Measurable evolution criteria
│   └── transition-states.md
└── change-management/          # Change tracking and communication
    ├── summary.md
    └── communication-plan.md
```

**Tasks:**
- [ ] Define core-architecture as primary output structure
- [ ] Create templates for each section
- [ ] Update TOGAF phase outputs to link to core docs
- [ ] Build mapping from analysis model to core structure
- [ ] Define which artifacts go in core vs remain phase-specific

#### Change Management Communication Plan Enhancement

Enhance Phase H change management with structured communication planning.

**Features:**
- [ ] Communication plan custom table with:
  - Stakeholder/audience
  - Message type
  - Owner
  - Delivery date
  - Team/domain
  - Channel/medium
  - Status
  - **Impact review date/period** (when to assess change effectiveness)
- [ ] Integration into change impact assessment
- [ ] Input workflow for owners, dates, teams, domains
- [ ] Template for communication matrix
- [ ] Examples with realistic scenarios

**Location:** `togaf/change-management/` (enhancement to existing skill)

#### Evolutionary Planning Enhancement ✅

**Status:** Complete - Implemented as standalone `fitness-functions` skill with integration into `migration-planning`.

Enhanced Phase F migration planning with evolutionary architecture approach using fitness functions.

**Implemented Fitness Function Categories (8 total):**
| Category | Example Metrics | Description |
|----------|-----------------|-------------|
| Deployment | Deploy frequency, lead time, MTTR, change failure rate | DORA metrics |
| Performance | Response time, throughput, latency | System speed and capacity |
| Reliability | Availability, error rate, MTBF | System stability |
| Security | Vulnerability count, patch latency, compliance score | Protection posture |
| Scalability | Scale time, elasticity, cost per transaction | Growth capability |
| Maintainability | Complexity, debt ratio, coverage, doc coverage | Ease of change |
| Coupling | Afferent coupling, breaking changes, circular deps | Module independence |
| Data | Consistency, backup success, RPO compliance | Data protection |

**Completed Features:**
- [x] Fitness function framework (standalone skill):
  - 8 fitness categories with detailed metrics
  - Workflows for definition through monitoring
  - Templates for specifications, dashboards, gates
  - Examples for various system types
- [x] Migration planning integration:
  - Step 1b: Establish Fitness Baseline
  - Step 2b: Define Fitness Gates
  - Fitness-based rollback triggers
  - Dashboard configuration
- [x] Independent usability (can analyze any system)
- [x] Integration with TOGAF migration planning

**Location:** `skills/optional/fitness-functions/` + `togaf/migration-planning/` (enhanced)

#### NIS 2 Compliance Framework ✅

**Status:** Complete - Implemented as compliance framework in `security-analysis` skill.

Add EU NIS 2 Directive (2022/2555) as a compliance framework option in `security-analysis`.

**Approach:** Integrate into existing security-analysis skill alongside OWASP ASVS, NIST CSF, CIS Controls, ISO 27001.

**What We CAN Analyze (Technical Controls ~40-50%):**

| NIS 2 Article | Technical Aspect | Maps To |
|---------------|------------------|---------|
| Art. 21(2)(c) Business Continuity | Backup code, retry patterns, failover configs | Phase 1, 4 |
| Art. 21(2)(d) Supply Chain | Dependency analysis, SBOM, vulnerabilities | Phase 6 |
| Art. 21(2)(e) Secure Development | Input validation, secure coding patterns | Phase 5 |
| Art. 21(2)(h) Cryptography | Encryption at rest/transit, key management | Phase 4 |
| Art. 21(2)(i) Access Control | RBAC, authorization, session management | Phase 2, 3 |
| Art. 21(2)(j) MFA | Multi-factor authentication implementation | Phase 2 |

**What We CANNOT Analyze (Organizational ~50-60%):**

| NIS 2 Article | Why Out of Scope |
|---------------|------------------|
| Art. 21(2)(a) Risk Policies | Governance documents, not code |
| Art. 21(2)(b) Incident Handling | Process/procedures, not code |
| Art. 21(2)(f) Effectiveness | Audit processes, not code |
| Art. 21(2)(g) Training | HR/organizational, not code |
| Art. 20 Reporting | 24h/72h incident reporting to authorities |
| Art. 32 Accountability | Board-level oversight, management responsibility |

**Completed Tasks:**
- [x] Add NIS 2 to compliance framework options in README.md
- [x] Create `nis2.md` template in templates.md
- [x] Document scope limitations clearly (link in output)
- [x] Cross-mapping to existing frameworks (NIS 2 ↔ ISO 27001 ↔ NIST CSF)
- [x] Add NIS 2 example to examples.md
- [x] Update checklist.md

**Key Principle:** Be transparent that ~50% of NIS 2 requires organizational assessment beyond code analysis. Output includes clear "Out of Scope" section with guidance for addressing non-technical requirements.

**Location:** `skills/optional/security-analysis/` (enhancement)

---

#### Excalidraw Diagram Support ✅

**Status:** Complete - Added as 4th diagram format option across all analysis skills.

Add Excalidraw as a diagram format option alongside Mermaid, ASCII, and PlantUML.

**Diagram Format Options:**
1. Mermaid (Recommended) - GitHub, GitLab, most markdown viewers
2. ASCII - Universal, no rendering needed
3. PlantUML - Feature-rich, requires renderer
4. **Excalidraw** - Hand-drawn style, collaborative, VS Code extension support

**Completed Features:**
- [x] Add Excalidraw to diagram format preference prompt
- [x] Define `.excalidraw` file output format (JSON-based)
- [x] Create Excalidraw templates for common diagram types:
  - [x] System context diagrams
  - [x] Component diagrams
  - [x] Data flow diagrams
- [x] Embedding strategy (link to .excalidraw files from markdown)
- [x] VS Code extension recommendation (excalidraw-editor)

**Files Updated:**
- `codebase-analysis/workflows.md` - Added option 4
- `arch-analysis/workflows.md` - Added option 4 with comparison table
- `arch-analysis/checklist.md` - Updated format list
- `security-analysis/workflows.md` - Added option 4
- `analysis-outputs/_index.md` - Added excalidraw format
- `analysis-outputs/excalidraw-output.md` - **New** comprehensive generation guide
- `analysis-outputs/architecture-docs/templates.md` - Added Excalidraw note
- `analysis-outputs/core-architecture/templates.md` - Added Excalidraw handling

**Location:** Multiple files across analysis skills

---

### Execution Order (Previous - All Complete)

All items in the previous execution order are complete:

| Step | Task | Status |
|------|------|--------|
| 0 | Architecture Synthesis Skill | ✅ Complete |
| 1 | Core Architecture Output Structure | ✅ Complete |
| 2 | Update TOGAF phases to link to core | ✅ Complete |
| 3 | Change Management Communication Plan | ✅ Complete |
| 4 | Evolutionary Planning with Fitness Functions | ✅ Complete |
| 5 | Excalidraw Diagram Support | ✅ Complete |
| 6 | Presentation Generation | ✅ Complete |

---

## Planned Work: Token Optimization & Structural Cleanup

> **Theme**: The toolkit's content is consumed by LLMs with finite context windows. Every redundant line costs tokens. This phase focuses on deduplication, lazy loading, and structural clarity.

### High Priority

#### 1. Entry Point Consolidation

**Problem:** The same information is repeated across 5 files, wasting significant tokens when agents ingest the toolkit.

| Content | Duplicated In |
|---------|--------------|
| Skills table (full listing) | `README.md`, `AGENTS.md`, `AI_TOOLKIT_CONTEXT.md`, `skills/_index.md`, `docs/skills/README.md` |
| Directory structure tree | `AGENTS.md`, `AI_TOOLKIT_CONTEXT.md`, `README.md` |
| Invokable commands table | `AI_TOOLKIT_CONTEXT.md`, `README.md`, `skills/_index.md` |
| Skill package structure | `AGENTS.md`, `AI_TOOLKIT_CONTEXT.md`, `README.md`, `skills/_index.md` |
| Recommended models table | `README.md`, `AI_TOOLKIT_CONTEXT.md` |
| Setup instructions | `AGENTS.md`, `AI_TOOLKIT_CONTEXT.md` |

**Solution:** Establish clear file roles and eliminate redundancy:

| File | Role | Audience | Content |
|------|------|----------|---------|
| `README.md` | GitHub landing page | Humans only | Overview, quick start, link to docs |
| `AGENTS.md` | Lean routing file | AI agents | Reading order, pointers to specific files, no duplicated tables |
| `AI_TOOLKIT_CONTEXT.md` | Eliminate or merge | - | Merge unique content into `skills/_index.md` |
| `skills/_index.md` | Single source of truth | Both | THE canonical skill listing, activation guide, invokable commands |
| `docs/skills/README.md` | Deep reference | Both | Detailed per-skill documentation (keep as-is) |

**Tasks:**
- [ ] Rewrite `AGENTS.md` as lean pointer (remove all duplicated tables)
- [ ] Rewrite `README.md` as human-only landing page (remove agent-targeted content)
- [ ] Merge unique `AI_TOOLKIT_CONTEXT.md` content into `skills/_index.md`
- [ ] Remove or redirect `AI_TOOLKIT_CONTEXT.md`
- [ ] Update `AGENTS.md` structure tree to reflect actual repository contents
- [ ] Verify all cross-references still work after consolidation

**Estimated savings:** ~300-400 lines of duplicated markdown

#### 2. Remove Bash Safety List from core/instructions.md

**Problem:** Lines 45-151 of `core/instructions.md` enumerate allowed/restricted/prohibited bash commands (~100 lines). This is advisory markdown that:
- Won't actually prevent an agent from running anything (it's not enforcement)
- Duplicates safety mechanisms already built into modern AI agent hosts (Claude Code, Cursor, etc.)
- Wastes ~100 lines of context on every session

**Solution:** Remove the entire "Allowed Bash Scripts" section (Safe Operations, Restricted Operations, Prohibited Operations). Keep only:
- Coding Rules
- Testing Requirements
- Code Review Checklist
- Dependency Management
- Security Guidelines

**Tasks:**
- [ ] Remove "Allowed Bash Scripts" section from `core/instructions.md`
- [ ] Verify no other files reference the removed section

#### 3. Token Budget Guidance

**Problem:** The toolkit's entire value proposition is being fed into AI context windows, but there's no documentation about its own token footprint. Users can't make informed decisions about which skills to enable.

**Solution:** Add a "Context Window Budget" section to `skills/_index.md` and/or `AGENTS.md` with approximate token counts.

**Tasks:**
- [ ] Measure approximate token count for core files
- [ ] Measure approximate token count for each skill package
- [ ] Add budget table showing cumulative cost of enabling skills
- [ ] Add guidance on context window management (e.g., "for 100K context, enable max N skills")

**Example format:**
```markdown
## Context Window Budget

| Scope | Approx. Tokens | Files |
|-------|---------------|-------|
| Core only | ~2K | instructions.md, workflows.md, glossary.md |
| Core + git-workflow | ~4K | + git-workflow skill (4 files) |
| Core + analysis | ~12K | + codebase-analysis, arch-analysis |
| Full toolkit (all skills) | ~35K+ | All 27 skills |
```

---

### Medium Priority

#### 4. Machine-Readable Skill Manifest

**Problem:** Skill metadata (name, description, path, status, dependencies, invocation commands) is maintained in multiple markdown tables across 5 files. Adding or modifying a skill requires updating all of them.

**Solution:** Create a single `skills/manifest.yaml` (or `.json`) as the canonical source. Markdown tables can reference or be generated from this manifest.

**Tasks:**
- [ ] Design manifest schema (name, description, path, tier, status, dependencies, invocations)
- [ ] Create `skills/manifest.yaml` with all current skills
- [ ] Document the manifest format
- [ ] Consider a script to generate markdown tables from manifest (optional)

**Example:**
```yaml
skills:
  - name: git-workflow
    tier: core
    path: skills/core/git-workflow/
    description: Git best practices, branching strategies, commit hygiene
    dependencies: []
    invocations:
      - trigger: null  # always active
  - name: arch-analysis
    tier: optional
    path: skills/optional/arch-analysis/
    description: 8-phase architecture documentation workflow
    dependencies: [codebase-analysis]
    invocations:
      - trigger: "Analyze the architecture"
```

#### 5. Explicit Lazy Loading Guidance

**Problem:** The reading order in `AGENTS.md` tells agents to read core files + all enabled skills upfront. For a 27-skill toolkit, this could consume a large chunk of context before any actual work begins.

**Solution:** Add explicit "read on demand" guidance: agents should only read a skill's files when they're about to invoke that skill, not at session start.

**Tasks:**
- [ ] Update reading order in `AGENTS.md` to specify lazy loading
- [ ] Add "When to Read" column to skill listings (e.g., "on invocation", "always")
- [ ] Update `skills/_index.md` with lazy loading instructions
- [ ] Core files remain always-read; optional skills become read-on-demand

**Proposed reading order:**
```
Session start (always read):
  1. Project root AGENTS.md
  2. Project root CONTEXT.md
  3. Toolkit core/instructions.md
  4. Toolkit core/glossary.md
  5. Toolkit skills/_index.md (for discovery only)

On demand (read when invoking):
  6. Specific skill README.md + workflows.md
  7. Skill templates.md, examples.md, checklist.md (as needed)
```

#### 6. Clarify File Audiences

**Problem:** It's unclear which files are for humans, which for AI agents, and which for both. An agent reads AGENTS.md, then AI_TOOLKIT_CONTEXT.md, accumulating redundant content without knowing it's the same information.

**Solution:** Add a clear audience tag at the top of each file.

**Tasks:**
- [ ] Add `> **Audience:** AI Agents` / `Humans` / `Both` frontmatter to each top-level file
- [ ] Add audience guidance to skill file structure documentation
- [ ] Review and tag all core/ and skills/ files

#### 7. Resolve todo-workflow Dual Location

**Problem:** `todo-workflow` content exists in two places:
- Inline in `core/workflows.md` (lines 59-129) — a summary/quick reference
- Full skill at `skills/core/todo-workflow/` — complete documentation

This creates confusion about which is canonical.

**Solution:** Keep the full skill as canonical, reduce `core/workflows.md` to a brief pointer.

**Tasks:**
- [ ] Reduce todo-workflow section in `core/workflows.md` to 5-10 line summary with link
- [ ] Ensure `skills/core/todo-workflow/` has all the content currently in workflows.md
- [ ] Verify no information is lost

---

### Low Priority (Bug Fixes)

#### 8. Fix .claude/settings.local.json Hardcoded Path

**Problem:** `.claude/settings.local.json` contains a hardcoded absolute path:
```json
"Bash(git -C /home/rastko/dev/agents-setup log --oneline -20)"
```
This is user-specific and won't work for anyone else cloning the repo.

**Tasks:**
- [ ] Remove the hardcoded path entry from settings
- [ ] Consider adding `.claude/settings.local.json` to `.gitignore`

#### 9. Fix Duplicate Invokable Command

**Problem:** `AI_TOOLKIT_CONTEXT.md` lines 153 and 155 both list "Generate presentation":
```
| "Generate presentation" | Create slide decks from markdown (PPTX, PDF, HTML) |
| "Generate presentation" | Create slide decks (PPTX, PDF) from Markdown |
```

**Tasks:**
- [ ] Remove the duplicate entry (keep the more descriptive one)

#### 10. Fix Output Adapter Paths

**Problem:** `AI_TOOLKIT_CONTEXT.md` lines 127-134 use short paths like `analysis-outputs/core-architecture/` but the actual paths are `skills/optional/analysis-outputs/core-architecture/`.

**Tasks:**
- [ ] Update all adapter path references to use full paths from repository root

#### 11. Fix Presentation Skill Categorization

**Problem:** `presentation` skill is categorized inconsistently:
- `README.md` lists it under "Development Workflows"
- `AI_TOOLKIT_CONTEXT.md` lists it under "Output Adapters"
- `skills/_index.md` lists it as standalone optional skill

**Tasks:**
- [ ] Decide canonical category (recommend: Output Adapters)
- [ ] Update all references to use consistent categorization

#### 12. Fix Contradictory Roadmap Status

**Problem:** `skills/_index.md` lines 150-158 list "Future Skills (Roadmap)" including `testing-strategy`, `api-design`, etc. Meanwhile `AI_TOOLKIT_CONTEXT.md` and `ROADMAP-TRACKER.md` previously said "All planned items are complete."

**Tasks:**
- [ ] Either remove the "Future Skills" section from `skills/_index.md` or mark it clearly as aspirational/unplanned
- [ ] Ensure roadmap status messaging is consistent across all files

---

### Execution Order

Address quick fixes first, then tackle structural changes:

| Step | Task | Effort | Depends On |
|------|------|--------|------------|
| 1 | Fix duplicate invokable command (#9) | Small | - |
| 2 | Fix output adapter paths (#10) | Small | - |
| 3 | Fix presentation categorization (#11) | Small | - |
| 4 | Fix contradictory roadmap status (#12) | Small | - |
| 5 | Fix .claude/settings.local.json (#8) | Small | - |
| 6 | Remove bash safety list (#2) | Small | - |
| 7 | Clarify file audiences (#6) | Small | - |
| 8 | Resolve todo-workflow dual location (#7) | Small | - |
| 9 | Explicit lazy loading guidance (#5) | Small | #1 |
| 10 | Entry point consolidation (#1) | Large | #6, #9, #10, #11 |
| 11 | Token budget guidance (#3) | Small | #1 |
| 12 | Machine-readable skill manifest (#4) | Medium | #1 |

**Steps 1-8** can be done independently and in parallel.
**Steps 9-12** depend on earlier cleanup being complete.

---

## Progress Log

| Date | Change | Commit |
|------|--------|--------|
| 2025-01-31 | Arch-analysis Phase 1 complete (deps, data flow, errors) | Multiple |
| 2025-01-31 | Arch-analysis output structure (Phase 0, index, numbered files) | b5d8fa4 |
| 2025-01-31 | TOGAF Foundation complete (core concepts, index, vision skill) | 7beada1 |
| 2025-01-31 | Diagram format options, AI file exclusions | b5d8fa4 |
| 2025-01-31 | Analysis refactoring spec added | 1e2625b |
| 2025-01-31 | Structurizr skills spec added | - |
| 2025-01-31 | TOGAF vision checklist.md complete | - |
| 2025-01-31 | Security analysis skill spec (dual output, 4 frameworks) | - |
| 2025-01-31 | Security analysis skill complete (full skill with 5 files) | - |
| 2025-01-31 | Analysis refactoring Phase 1-2 (codebase-analysis, architecture-docs, coding-context) | - |
| 2026-01-31 | Analysis refactoring Phase 3-4 (product-spec, structurizr, archimate adapters) | - |
| 2026-01-31 | Nonfunctional-analysis skill complete (testing, config, perf, health) | - |
| 2026-01-31 | Structurizr authoring skill complete (C4 modeling with DSL) | - |
| 2026-02-01 | TOGAF Core ADM complete (Phase B/C/D - Business, Info Systems, Technology) | - |
| 2026-02-01 | TOGAF Phase E complete (Opportunities and Solutions) | - |
| 2026-02-01 | TOGAF Phase F complete (Migration Planning) | - |
| 2026-02-01 | TOGAF Phase G complete (Implementation Governance) | - |
| 2026-02-01 | TOGAF Phase H complete (Change Management) | - |
| 2026-02-01 | Tooling research added (Marp, mermaid-cli, python-pptx, Excalidraw) | - |
| 2026-02-02 | Architecture Synthesis skill complete (middle-out from diagrams/specs) | c9e3108 |
| 2026-02-02 | Core Architecture Docs Output adapter complete (canonical output structure) | b1efb77 |
| 2026-02-02 | Change Management Communication Plan enhancement complete | - |
| 2026-02-03 | Fitness Functions skill complete (8 categories, full lifecycle) | - |
| 2026-02-03 | Migration Planning fitness integration complete (baseline, gates, rollback) | - |
| 2026-02-05 | Presentation Generation skill complete (Marp CLI, templates, examples) | - |
| 2026-02-05 | NIS 2 Compliance Framework complete (EU Directive 2022/2555 technical controls) | - |
| 2026-02-05 | Excalidraw Diagram Support complete (4th output format option) | - |
| 2026-02-06 | TOGAF Preliminary Phase complete (principles, governance, capability assessment) | - |
| 2026-02-08 | Added token optimization & structural cleanup roadmap (12 items) | - |

---

## Next Actions

1. ~~Start Arch-Analysis Phase 1~~ ✅ Complete
2. ~~Start TOGAF Foundation~~ ✅ Complete
3. ~~Add missing `togaf/vision/checklist.md`~~ ✅ Complete
4. ~~Build security-analysis skill~~ ✅ Complete
5. ~~Analysis refactoring Phase 1-4~~ ✅ Complete (base engine + 5 adapters)
6. ~~Nonfunctional-analysis skill~~ ✅ Complete
7. ~~Structurizr authoring skill~~ ✅ Complete
8. ~~TOGAF Core ADM (Phase B/C/D)~~ ✅ Complete
9. ~~TOGAF Phase E~~ ✅ Complete
10. ~~TOGAF Phase F~~ ✅ Complete
11. ~~TOGAF Phase G~~ ✅ Complete
12. ~~TOGAF Phase H~~ ✅ Complete
13. ~~Architecture Synthesis Skill~~ ✅ Complete
14. ~~Core Architecture Output Structure~~ ✅ Complete
15. ~~Change Mgmt Communication Plan~~ ✅ Complete
16. ~~Fitness Functions Skill~~ ✅ Complete (standalone + migration integration)
17. ~~Presentation Generation Skill~~ ✅ Complete (Marp CLI, templates, examples)
18. ~~NIS 2 Compliance Framework~~ ✅ Complete (technical controls in security-analysis)
19. ~~Excalidraw Diagram Support~~ ✅ Complete (4th output format with JSON templates)
20. ~~TOGAF Preliminary Phase~~ ✅ Complete (full ADM cycle now implemented)
21. Fix low-priority bugs (O8-O12) — quick wins
22. Remove bash safety list from core/instructions.md (O2)
23. Clarify file audiences and resolve todo-workflow location (O6, O7)
24. Add lazy loading guidance (O5)
25. Consolidate entry points (O1) — largest optimization effort
26. Add token budget guidance (O3)
27. Create machine-readable skill manifest (O4)
28. **Build roadmap-building skill (N1)** — full spec at `specs/roadmap-skills-spec.md`
29. **Build roadmap-analysis skill with 7 modes (N2)** — depends on N1
30. **Update documentation for roadmap skills (N3)** — depends on N1, N2
31. **LICENSE file (OSS-6)** — unblocks everything, 5 minutes
32. **README mental model section (OSS-3)** — explain the engine to the world
33. **Mental model override mechanism (OSS-1)** — core extensibility feature
34. **CONTRIBUTING.md + CODE_OF_CONDUCT (OSS-4)** — depends on OSS-1
35. **SECURITY.md + bug reporting (OSS-5)** — parallel with OSS-4
36. **CHANGELOG.md + git tags (OSS-7)** — parallel with OSS-4
37. **.github setup (OSS-8)** — depends on OSS-4, OSS-5
38. **Mental model full swap (OSS-2)** — depends on OSS-1, OSS-4
39. **Example project — quantum-blockchain (OSS-9)** — depends on OSS-1, OSS-6
