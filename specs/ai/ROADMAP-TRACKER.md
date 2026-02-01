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
| Architecture Synthesis Skill | - | ⚪ Planned | High |
| Core Architecture Docs Output | - | ⚪ Planned | High |
| Change Mgmt Communication Plan | - | ⚪ Planned | High |
| Evolutionary Planning Enhancement | - | ⚪ Planned | High |
| Excalidraw Diagram Support | - | ⚪ Planned | Medium |
| Presentation Generation | - | ⚪ Planned | Medium |
| TOGAF Advanced | Phase 5 | ⚪ Planned | Low |

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

---

## Quick Summary: What's Left

| Task | Effort | Priority |
|------|--------|----------|
| Core Architecture Docs Output | Medium | High |
| Change Mgmt Communication Plan | Small | High |
| Evolutionary Planning Enhancement | Medium | High |
| TOGAF Preliminary Phase | Medium | Low |

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

#### Evolutionary Planning Enhancement

Enhance Phase F migration planning with evolutionary architecture approach using fitness functions.

**Base Fitness Function Categories:**
| Category | Example Metrics | Description |
|----------|-----------------|-------------|
| Performance | Response time, throughput, latency | System speed and capacity |
| Security | Vulnerability count, compliance score, attack surface | Protection posture |
| Maintainability | Code complexity, test coverage, documentation | Ease of change |
| Scalability | Capacity headroom, horizontal scaling readiness | Growth capability |
| Cost | Infrastructure spend, operational cost, TCO | Financial efficiency |

Agent expands with system-specific fitness functions based on analysis (e.g., "GraphQL query depth < 5", "API response < 200ms P95").

**Features:**
- [ ] Fitness function framework:
  - Base fitness function definitions (5 categories above)
  - Agent expands/customizes based on system being analyzed
  - Measurable criteria for transition completion
  - Automated checks where possible
- [ ] Evolutionary plan generation from gap analysis
- [ ] Leverage existing baseline/target artifacts from core-architecture
- [ ] Incremental migration steps with fitness validation
- [ ] Integration with core-architecture/evolution-plan output

**Location:** `togaf/migration-planning/` (enhancement to existing skill)

#### Excalidraw Diagram Support

Add Excalidraw as a diagram format option alongside Mermaid, ASCII, and PlantUML.

**Current Options:**
1. Mermaid (Recommended) - GitHub, GitLab, most markdown viewers
2. ASCII - Universal, no rendering needed  
3. PlantUML - Feature-rich, requires renderer

**New Option:**
4. **Excalidraw** - Hand-drawn style, collaborative, VS Code extension support

**Features:**
- [ ] Add Excalidraw to diagram format preference prompt
- [ ] Define `.excalidraw` file output format (JSON-based)
- [ ] Create Excalidraw templates for common diagram types:
  - System context diagrams
  - Component diagrams
  - Sequence flows
  - Architecture layers
- [ ] Embedding strategy (link to .excalidraw files from markdown)
- [ ] VS Code extension recommendation (excalidraw-editor)

**Excalidraw Advantages:**
- Hand-drawn aesthetic (approachable, less formal)
- Collaborative editing
- Rich VS Code integration
- Embeddable as SVG/PNG exports
- Version-controllable JSON format

**Files to Update:**
- `codebase-analysis/workflows.md` - Add option 4
- `arch-analysis/workflows.md` - Add option 4
- `arch-analysis/checklist.md` - Update format list
- Analysis model schema - Add excalidraw format
- Templates for each diagram type

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
13. **Next: Step 0 - Architecture Synthesis Skill** (High Priority - New Entry Point)
14. **Next: Step 1 - Core Architecture Output Structure** (High Priority)
15. **Next: Step 2 - Update TOGAF phases to link to core** (High Priority)
16. **Next: Step 3 - Change Mgmt Communication Plan** (High Priority)
17. **Next: Step 4 - Evolutionary Planning with Fitness Functions** (High Priority)
17. Choose next (low priority):
    - **TOGAF Preliminary Phase** - Framework and principles setup
