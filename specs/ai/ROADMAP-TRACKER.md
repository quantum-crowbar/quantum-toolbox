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
| Roadmap Building & Analysis Skills | Phase 1 | ⚪ Planned | High |

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

**All planned items complete!** The roadmap is fully implemented.

| Task | Effort | Priority |
|------|--------|----------|
| *(None)* | - | - |

---

## Planned Work

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

### Execution Order

Build in sequence - synthesis enables better core architecture, then enhance phases:

| Step | Task | Depends On |
|------|------|------------|
| 0 | Architecture Synthesis Skill | - (new capability) |
| 1 | Core Architecture Output Structure | - |
| 2 | Update TOGAF phases to link to core | Step 1 |
| 3 | Change Management Communication Plan | Step 1 |
| 4 | Evolutionary Planning with Fitness Functions | Step 1 |
| 5 | Excalidraw Diagram Support | - (independent) |

**Note:** Architecture Synthesis (Step 0) can be developed in parallel as it creates a new entry point into the TOGAF workflow.

---

### Presentation & Export (Future Submodule Candidate)

> **Note**: This section may be extracted to a separate git submodule in the future, but remains in the toolkit for now.

#### Presentation Generation

Generate PowerPoint/presentation decks from markdown specifications and architecture documentation.

**Features:**
- [ ] Markdown to PPT conversion
  - Parse structured markdown (headers → slides)
  - Support for speaker notes
  - Code block formatting
  - Table rendering
- [ ] Template system
  - Create custom slide templates
  - Import existing corporate templates
  - Theme customization (colors, fonts, logos)
- [ ] Architecture diagram export
  - Mermaid → PNG/JPG/SVG
  - Excalidraw → PNG/JPG/SVG
  - PlantUML → PNG/JPG/SVG
  - Embed exported images in slides
- [ ] Slide types
  - Title slides
  - Content slides (bullets, numbered lists)
  - Diagram slides (full-bleed images)
  - Comparison slides (before/after, baseline/target)
  - Timeline/roadmap slides

**Use Cases:**
| Source | Output |
|--------|--------|
| Architecture Vision doc | Executive presentation |
| Gap Analysis | Technical review deck |
| Evolution Plan | Roadmap presentation |
| Change Management Summary | Stakeholder briefing |

**Technical Approach:**
- **Marp CLI** (`@marp-team/marp-cli`) - Primary MD→PPTX tool (recommended)
- **python-pptx** - For complex/dynamic presentations requiring programmatic control
- **Mermaid CLI** (`@mermaid-js/mermaid-cli`) - Mermaid→PNG/SVG export
- **PlantUML CLI** - PlantUML→PNG/SVG export (requires Java)
- **Excalidraw** - Manual export via VS Code extension; CI automation possible with Puppeteer scripts

> **Tooling Research:** See [tooling-research.md](tooling-research.md) for detailed analysis and recommendations.

**Installation:**
```bash
# Diagram export
npm install -g @mermaid-js/mermaid-cli
brew install plantuml  # or download plantuml.jar

# Presentation generation
npm install -g @marp-team/marp-cli

# Optional: Python for advanced PPTX
pip install python-pptx
```

**VS Code Extensions:**
| Extension | ID | Purpose |
|-----------|-----|---------|
| Excalidraw Editor | `pomdtr.excalidraw-editor` | Edit .excalidraw files |
| Mermaid Preview | `bierner.markdown-mermaid` | Preview mermaid in MD |
| Marp for VS Code | `marp-team.marp-vscode` | Preview/edit Marp slides |

**Files/Structure:**
```
presentation/
├── README.md           # Concepts and usage
├── workflows.md        # Generation workflows
├── templates/          # Slide templates
│   ├── default/
│   ├── technical/
│   └── executive/
├── exporters/          # Diagram export configs
│   ├── mermaid.md
│   ├── excalidraw.md
│   └── plantuml.md
└── examples/           # Sample presentations
```

**Dependencies:**
- Excalidraw diagram support (Step 5)
- Core architecture docs (provides source content)

---

## Quick Summary: What's Left (Previous)

All TOGAF ADM phases (A through H) are now complete.

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
| 2026-02-06 | Roadmap Skills spec complete (building, analysis with 7 modes, financial estimation) | b3ab8d5 |

---

## Roadmap Building & Analysis Skills ⚪

Comprehensive specification created for implementation planning and roadmap analysis with 7 modes.

### Phase 1: Roadmap Building (High Priority) ⚪

**Timeline**: 2-3 weeks
**Status**: ⚪ Planned

- [ ] **Skill Structure**
  - [ ] Create `skills/optional/roadmap-building/` directory
  - [ ] README.md (guidelines and principles)
  - [ ] workflows.md (step-by-step procedures)
  - [ ] templates.md (roadmap templates)
  - [ ] checklist.md (quick reference)
  - [ ] examples.md (common scenarios)

- [ ] **Core Workflows**
  - [ ] Input parsing (architecture synthesis, TOGAF, gaps)
  - [ ] Initiative identification
  - [ ] Technical planning (ADRs, patterns)
  - [ ] Dependency analysis
  - [ ] Risk assessment
  - [ ] Output generation (phases, initiatives, dependencies, risks)

- [ ] **Integration**
  - [ ] Integration with architecture-synthesis skill
  - [ ] Integration with core-architecture outputs
  - [ ] Integration with TOGAF Phase E/F workflows
  - [ ] Update TOGAF Phase E, F, G to invoke roadmap skills

### Phase 2: Roadmap Analysis (Medium Priority) ⚪

**Timeline**: 2-3 weeks (can start after Phase 1)
**Status**: ⚪ Planned

- [ ] **Skill Structure**
  - [ ] Create `skills/optional/roadmap-analysis/` directory
  - [ ] README.md (7 analysis modes)
  - [ ] workflows.md (mode-specific workflows)
  - [ ] templates.md (analysis templates)
  - [ ] checklist.md (mode selection guide)
  - [ ] examples.md (analysis examples)

- [ ] **Analysis Modes**
  - [ ] Mode 1: Initiative Expansion (detailed step-by-step plans)
  - [ ] Mode 2: Research Insertion (identify unknowns, document research)
  - [ ] Mode 3: Complexity Analysis (assess complexity, find bottlenecks)
  - [ ] Mode 4: Spike Planning (time-boxed technical validation)
  - [ ] Mode 5: Effort Estimation (task breakdown, effort calculation)
  - [ ] Mode 6: PDF Export (professional PDFs with Mermaid diagrams)
  - [ ] Mode 7: Team Planning & Financial Estimation

- [ ] **Mode 7 Capabilities**
  - [ ] Team composition calculation (roles, seniority, allocation)
  - [ ] Expertise requirements mapping (critical/important/nice-to-have)
  - [ ] Hiring timeline generation
  - [ ] Financial estimation with 3 pricing models:
    - [ ] Standard team templates (Startup/Small/Medium)
    - [ ] Cost per specialty and seniority
    - [ ] Geographic adjustments
  - [ ] Phase-by-phase cost breakdown
  - [ ] Cost per initiative calculation
  - [ ] Budget allocation and payment schedule
  - [ ] Cost optimization analysis (AI, geography, contractors)
  - [ ] ROI analysis (project cost vs business value)
  - [ ] AI augmentation strategy (always included)

- [ ] **Technical Components**
  - [ ] Parser for external roadmaps (JIRA, Linear, etc.)
  - [ ] Complexity calculation algorithms
  - [ ] Effort estimation models
  - [ ] Team planning algorithms
  - [ ] Financial estimation calculator
  - [ ] AI augmentation impact calculator
  - [ ] PDF export workflow (integration with pdf-report skill)
  - [ ] Mermaid diagram export automation (PNG conversion)

### Phase 3: Documentation & Testing (Low Priority) ⚪

**Timeline**: 1 week
**Status**: ⚪ Planned

- [ ] **Documentation Updates**
  - [ ] Update `docs/skills/README.md`
  - [ ] Update `skills/_index.md`
  - [ ] Update `AI_TOOLKIT_CONTEXT.md`
  - [ ] Update project `README.md`

- [ ] **Examples & Testing**
  - [ ] Create end-to-end examples
  - [ ] Test with real-world scenarios
  - [ ] Example roadmaps for common scenarios

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
21. **Start Roadmap Building & Analysis Skills** ⚪ Next Priority
    - Phase 1: Roadmap Building (2-3 weeks)
    - Phase 2: Roadmap Analysis with 7 modes (2-3 weeks)
    - Phase 3: Documentation & Testing (1 week)
