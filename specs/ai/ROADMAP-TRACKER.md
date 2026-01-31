# Roadmap Tracker

Master tracking document for all skill development roadmaps.

---

## Status Overview

| Roadmap | Phase | Status | Priority |
|---------|-------|--------|----------|
| Arch-Analysis Enhancement | Phase 1 | 🟢 Complete | High |
| Arch-Analysis Output Structure | - | 🟢 Complete | High |
| TOGAF Foundation | Phase 1 | 🟢 Complete | High |
| Structurizr Authoring Skill | - | ⚪ Planned | Medium |
| Structurizr Export Adapter | - | 🟢 Complete | Medium |
| Security-Analysis Skill | Phase 2 | 🟢 Complete | Medium |
| Nonfunctional-Analysis Skill | Phase 3 | ⚪ Planned | Medium |
| TOGAF Core ADM | Phase 2 | ⚪ Planned | Medium |
| Analysis Refactoring | Phase 1-4 | 🟢 Complete | Medium |
| TOGAF Planning & Governance | Phase 3-4 | ⚪ Planned | Low |
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

---

## Remaining Tasks

### Medium Priority

#### Structurizr Skills (New)
See: [structurizr-skills-spec.md](structurizr-skills-spec.md)

**Structurizr Authoring** (`skills/optional/structurizr/`)
- [ ] README.md with C4 concepts and DSL reference
- [ ] workflows.md for create/update/review workspaces
- [ ] templates.md with DSL patterns
- [ ] checklist.md for C4 completeness
- [ ] examples.md with sample workspaces

**Structurizr Export** (`analysis-outputs/structurizr/`) ✅
- [x] Mapping rules from analysis model to DSL
- [x] Workspace generation templates
- [x] Integration with codebase-analysis

#### TOGAF Core ADM (Phase 2)
- [ ] Phase B: Business Architecture skill
- [ ] Phase C: Information Systems skill
- [ ] Phase D: Technology Architecture skill

### Low Priority

#### Nonfunctional-Analysis Skill
- [ ] Testing Coverage Analysis
- [ ] Configuration Audit
- [ ] Performance Hotspots
- [ ] Code Health Indicators

#### TOGAF Planning & Governance
- [ ] Phase E: Opportunities and Solutions
- [ ] Phase F: Migration Planning
- [ ] Phase G: Implementation Governance
- [ ] Phase H: Architecture Change Management

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
| Structurizr authoring skill | Medium | Medium |
| TOGAF Phase B/C/D skills | Large | Medium |
| Nonfunctional-analysis skill | Large | Low |

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

---

## Next Actions

1. ~~Start Arch-Analysis Phase 1~~ ✅ Complete
2. ~~Start TOGAF Foundation~~ ✅ Complete
3. ~~Add missing `togaf/vision/checklist.md`~~ ✅ Complete
4. ~~Build security-analysis skill~~ ✅ Complete
5. ~~Analysis refactoring Phase 1-4~~ ✅ Complete (base engine + 5 adapters)
6. Choose next:
   - **Structurizr authoring** - C4 modeling capability (standalone skill)
   - **TOGAF Phase B** - Business architecture
   - **Nonfunctional-analysis** - Testing, config, performance, code health
