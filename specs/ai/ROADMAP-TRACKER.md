# Roadmap Tracker

Master tracking document for all skill development roadmaps.

---

## Status Overview

| Roadmap | Phase | Status | Priority |
|---------|-------|--------|----------|
| Arch-Analysis Enhancement | Phase 1 | 🟡 Ready | High |
| Security-Analysis Skill | Phase 2 | ⚪ Planned | Medium |
| Nonfunctional-Analysis Skill | Phase 3 | ⚪ Planned | Medium |
| TOGAF Foundation | Phase 1 | 🟡 Ready | High |
| TOGAF Core ADM | Phase 2 | ⚪ Planned | Medium |
| TOGAF Planning & Governance | Phase 3-4 | ⚪ Planned | Low |
| TOGAF Advanced | Phase 5 | ⚪ Planned | Low |

Legend: 🟢 Complete | 🟡 In Progress/Ready | ⚪ Planned | 🔴 Blocked

---

## Arch-Analysis Skills Roadmap

### Phase 1: Enhance arch-analysis ⬅️ CURRENT

- [ ] **Dependency Health Check**
  - [ ] Add workflow phase for dependency analysis
  - [ ] Template for dependency manifest
  - [ ] Checklist for outdated/vulnerable packages
  - [ ] Integration with package manager files
  - [ ] Version comparison against latest releases
  - [ ] Abandoned package detection
  - [ ] License compliance inventory

- [ ] **Data Flow Mapping**
  - [ ] Add workflow phase for data flow tracing
  - [ ] Template for data flow diagrams (Mermaid)
  - [ ] Trace data from input sources to storage
  - [ ] Identify transformation points
  - [ ] Map database schemas and relationships
  - [ ] Document data retention patterns
  - [ ] Identify data deletion/anonymization paths

- [ ] **Error Handling Analysis**
  - [ ] Add workflow phase for error analysis
  - [ ] Template for error handling inventory
  - [ ] Map error propagation patterns
  - [ ] Identify logging and monitoring integration
  - [ ] Document retry mechanisms and dead letter handling
  - [ ] Assess graceful degradation patterns
  - [ ] Find unhandled error scenarios

- [ ] **Acceptance Criteria**
  - [ ] All three new phases integrated into workflow
  - [ ] Templates added for each output type
  - [ ] Checklist updated with new items
  - [ ] Examples added demonstrating each analysis
  - [ ] Human guide updated in docs/ai

### Phase 2: Create security-analysis Skill

- [ ] **Skill Structure**
  - [ ] Create directory structure
  - [ ] README.md
  - [ ] workflows.md
  - [ ] checklist.md
  - [ ] templates.md
  - [ ] examples.md

- [ ] **Security Surface Analysis**
  - [ ] Identify all entry points
  - [ ] Map exposed endpoints
  - [ ] Document network boundaries
  - [ ] Find hardcoded secrets
  - [ ] Identify sensitive configuration exposure
  - [ ] Assess input validation patterns

- [ ] **Authentication & Authorization Analysis**
  - [ ] Identify auth mechanisms
  - [ ] Map authentication flows
  - [ ] Document authorization model
  - [ ] Find privilege escalation risks
  - [ ] Assess session management
  - [ ] Check for auth bypass patterns

- [ ] **PII Data Handling**
  - [ ] Identify PII fields in data models
  - [ ] Trace PII through system
  - [ ] Document encryption
  - [ ] Assess logging for PII leakage
  - [ ] Check GDPR/CCPA compliance patterns

### Phase 3: Create nonfunctional-analysis Skill

- [ ] Skill structure (5 files)
- [ ] Testing Coverage Analysis
- [ ] Configuration Audit
- [ ] Performance Hotspots
- [ ] Code Health Indicators

---

## TOGAF Skill Family Roadmap

### Foundation Phase ⬅️ CURRENT

- [ ] **Layer 1: Core Concepts**
  - [ ] Architecture Domains Awareness
  - [ ] Stakeholder Thinking
  - [ ] Architecture Principles
  - [ ] Baseline vs Target Thinking
  - [ ] Gap Analysis templates
  - [ ] Roadmap Prioritization criteria
  - [ ] Risk Analysis with mindmaps
  - [ ] Enterprise Continuum Awareness

- [ ] **Family Index**
  - [ ] Create `togaf/_index.md`
  - [ ] ADM cycle overview
  - [ ] Phase relationships diagram
  - [ ] When to use each phase

- [ ] **Phase A: Architecture Vision**
  - [ ] README.md
  - [ ] workflows.md
  - [ ] checklist.md
  - [ ] templates.md (vision doc, stakeholder map)
  - [ ] examples.md

### Core ADM Phase

- [ ] Phase B: Business Architecture
- [ ] Phase C: Information Systems Architecture
- [ ] Phase D: Technology Architecture

### Planning & Governance Phase

- [ ] Phase E: Opportunities and Solutions
- [ ] Phase F: Migration Planning
- [ ] Preliminary Phase
- [ ] Phase G: Implementation Governance
- [ ] Phase H: Architecture Change Management

### Advanced Phase

- [ ] Architecture Repository templates
- [ ] Building Block catalogs
- [ ] Viewpoint library
- [ ] ArchiMate integration

---

## Implementation Notes

### Skill Creation Pattern

For each new skill:
1. Create directory structure
2. README.md - guidelines, principles, invocation
3. workflows.md - step-by-step procedures
4. templates.md - reusable output templates
5. examples.md - concrete examples
6. checklist.md - quick reference
7. Register in `_index.md`
8. Create human guide in `docs/ai/`
9. Commit each file separately (todo workflow)

### Priority Order

1. **Arch-Analysis Phase 1** - Enhances existing skill
2. **TOGAF Foundation** - Enables enterprise architecture
3. **Security-Analysis** - High-value new capability
4. **TOGAF Core ADM** - Business/Data/Tech architecture
5. **Nonfunctional-Analysis** - Quality attributes
6. **TOGAF remaining phases** - Complete framework

---

## Progress Log

| Date | Change | Commit |
|------|--------|--------|
| 2024-XX-XX | Initial tracker created | - |

---

## Next Actions

1. Start Arch-Analysis Phase 1: Dependency Health Check
2. Start TOGAF Foundation: Core Concepts document
