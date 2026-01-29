# Architectural Analysis Checklist

Quick reference for systematic codebase analysis.

---

## Pre-Analysis Checklist

Before starting:
- [ ] Access to full codebase confirmed
- [ ] Known constraints documented (time, scope)
- [ ] Output format requirements clear
- [ ] Stakeholder questions collected (if any)

---

## Phase 1: Reconnaissance

### Documentation Discovery
- [ ] Root README.md found and read
- [ ] `/docs` or `/documentation` directory checked
- [ ] ADRs (Architecture Decision Records) located
- [ ] API documentation found (OpenAPI/Swagger)
- [ ] Inline doc comments assessed
- [ ] Wiki/external docs identified

### Structure Mapping
- [ ] Top-level directories catalogued
- [ ] Entry points identified
- [ ] Configuration files located
- [ ] Build scripts found
- [ ] Monorepo vs single-project determined

---

## Phase 2: Technology Inventory

### Languages
- [ ] Primary language(s) identified
- [ ] Version requirements noted
- [ ] Build/compile toolchain documented

### Dependencies
For each package manifest:
- [ ] All dependencies listed
- [ ] Purpose of major dependencies understood
- [ ] Version constraints noted
- [ ] Dev vs production dependencies separated

### Infrastructure
- [ ] Databases identified (type, connection method)
- [ ] Caches identified
- [ ] Message queues identified
- [ ] External services identified
- [ ] Cloud provider specifics noted

### Documentation Verification
- [ ] Technologies cross-referenced with docs
- [ ] Undocumented technologies flagged
- [ ] Outdated version info flagged

---

## Phase 3: Interface Discovery

### External APIs
- [ ] All routes/endpoints catalogued
- [ ] HTTP methods documented
- [ ] Request formats specified
- [ ] Response formats specified
- [ ] Authentication requirements noted
- [ ] Error responses documented

### Internal Interfaces
- [ ] Service boundaries identified
- [ ] Inter-service communication mapped
- [ ] Shared libraries/modules noted

### Event/Async Interfaces
- [ ] Message queues mapped
- [ ] Event publishers identified
- [ ] Event consumers identified
- [ ] Message schemas documented

### Data Interfaces
- [ ] Database schemas documented
- [ ] Data models mapped
- [ ] Import/export formats identified

### Documentation Verification
- [ ] API docs match implementation
- [ ] Undocumented endpoints flagged
- [ ] Schema mismatches flagged

---

## Phase 4: Diagram Creation

### Architecture Diagram
- [ ] All major components shown
- [ ] Dependencies indicated with arrows
- [ ] External systems included
- [ ] Data stores represented
- [ ] Diagram uses Mermaid syntax
- [ ] Legend provided if needed

### Sequence Diagrams
- [ ] Key user flows diagrammed
- [ ] Integration flows diagrammed
- [ ] Orchestration patterns shown
- [ ] Error paths included (if significant)
- [ ] Diagrams use Mermaid syntax

---

## Phase 5: Documentation Audit

### Coverage Check
| Area | Has Docs | Accurate |
|------|----------|----------|
| Technologies | [ ] | [ ] |
| Architecture | [ ] | [ ] |
| API Reference | [ ] | [ ] |
| Setup Guide | [ ] | [ ] |
| Development Guide | [ ] | [ ] |

### Discrepancy Tracking
- [ ] All discrepancies logged
- [ ] Impact level assigned to each
- [ ] Recommendations provided

---

## Output Verification

### Technology Manifest
- [ ] All languages listed with versions
- [ ] All frameworks listed
- [ ] All libraries categorized
- [ ] All infrastructure dependencies listed
- [ ] Evidence/file references included

### Interface Specification
- [ ] All external APIs documented
- [ ] All internal interfaces documented
- [ ] All event interfaces documented
- [ ] Contracts include request/response formats

### Diagrams
- [ ] Architecture diagram is readable
- [ ] Sequence diagrams are accurate
- [ ] Mermaid syntax validates
- [ ] Diagrams render correctly

### Documentation Audit
- [ ] Coverage assessment complete
- [ ] Discrepancies listed
- [ ] Recommendations provided

---

## Quick Analysis Checklist

When time is limited:

- [ ] README reviewed (5 min)
- [ ] Package manifests scanned (10 min)
- [ ] Entry point traced (15 min)
- [ ] Main routes/endpoints listed (10 min)
- [ ] Basic architecture diagram created (10 min)

---

## Verification Questions

Ask these to validate findings:

### Technology
- "What evidence confirms this technology is used?"
- "Is this in the docs? Accurately?"

### Interfaces
- "Where is this endpoint defined?"
- "What calls this interface?"
- "What does the contract look like?"

### Architecture
- "What is the request path from entry to data?"
- "How do these components communicate?"
- "What happens on failure?"

### Documentation
- "Does the code match what docs say?"
- "What's missing from the docs?"
- "What's outdated in the docs?"

---

## Red Flags

Watch for these issues:

- [ ] Documentation that doesn't match code
- [ ] Undocumented external dependencies
- [ ] Hidden API endpoints
- [ ] Inconsistent naming conventions
- [ ] Circular dependencies
- [ ] Dead code paths
- [ ] Hardcoded configuration
- [ ] Missing error handling
- [ ] Outdated dependency versions
