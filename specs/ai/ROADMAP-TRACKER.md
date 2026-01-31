# Roadmap Tracker

Master tracking document for all skill development roadmaps.

---

## Status Overview

| Roadmap | Phase | Status | Priority |
|---------|-------|--------|----------|
| Arch-Analysis Enhancement | Phase 1 | 🟢 Complete | High |
| Arch-Analysis Output Structure | - | 🟢 Complete | High |
| TOGAF Foundation | Phase 1 | 🟢 Complete | High |
| Security-Analysis Skill | Phase 2 | ⚪ Planned | Medium |
| Nonfunctional-Analysis Skill | Phase 3 | ⚪ Planned | Medium |
| TOGAF Core ADM | Phase 2 | ⚪ Planned | Medium |
| Analysis Refactoring | Future | ⚪ Proposed | Medium |
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

---

## Remaining Tasks

### High Priority

#### TOGAF Vision Skill - Missing File
- [ ] `togaf/vision/checklist.md` - Quick reference checklist

### Medium Priority

#### Security-Analysis Skill (New)
- [ ] Create skill directory structure
- [ ] README.md with principles
- [ ] workflows.md with security phases
- [ ] Security Surface Analysis
- [ ] Authentication & Authorization Analysis
- [ ] PII Data Handling Analysis
- [ ] templates.md and checklist.md
- [ ] examples.md

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

#### Analysis Refactoring (Future)
See: [codebase-analysis-refactor-spec.md](codebase-analysis-refactor-spec.md)
- [ ] Extract shared analysis engine
- [ ] Create output adapter pattern
- [ ] Coding context adapter (AGENTS.md generation)
- [ ] Product spec adapter
- [ ] Structurizr adapter
- [ ] ArchiMate adapter

---

## Quick Summary: What's Left

| Task | Effort | Priority |
|------|--------|----------|
| TOGAF vision checklist.md | Small | High |
| Security-analysis skill (full) | Large | Medium |
| TOGAF Phase B/C/D skills | Large | Medium |
| Nonfunctional-analysis skill | Large | Low |
| Analysis refactoring | XL | Future |

---

## Progress Log

| Date | Change | Commit |
|------|--------|--------|
| 2025-01-31 | Arch-analysis Phase 1 complete (deps, data flow, errors) | Multiple |
| 2025-01-31 | Arch-analysis output structure (Phase 0, index, numbered files) | b5d8fa4 |
| 2025-01-31 | TOGAF Foundation complete (core concepts, index, vision skill) | 7beada1 |
| 2025-01-31 | Diagram format options, AI file exclusions | b5d8fa4 |
| 2025-01-31 | Analysis refactoring spec added | - |

---

## Next Actions

1. ~~Start Arch-Analysis Phase 1~~ ✅ Complete
2. ~~Start TOGAF Foundation~~ ✅ Complete
3. Add missing `togaf/vision/checklist.md`
4. Decide: Security-analysis skill OR TOGAF Phase B next?
