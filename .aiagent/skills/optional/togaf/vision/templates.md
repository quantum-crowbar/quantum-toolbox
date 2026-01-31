# Architecture Vision Templates

Templates for Phase A deliverables. Fill independently or use during guided interview.

---

## Architecture Vision Document

The primary deliverable of Phase A.

```markdown
# Architecture Vision: {Initiative Name}

**Version**: {1.0}
**Date**: {YYYY-MM-DD}
**Author**: {Name}
**Status**: {Draft | Review | Approved}

---

## 1. Executive Summary

{2-3 sentences describing the initiative, its purpose, and expected outcome}

---

## 2. Background & Drivers

### Business Context
{What situation or environment led to this initiative?}

### Business Drivers
| Driver | Description | Priority |
|--------|-------------|----------|
| {Driver 1} | {Why this matters} | High/Medium/Low |
| {Driver 2} | {Why this matters} | High/Medium/Low |
| {Driver 3} | {Why this matters} | High/Medium/Low |

### Consequences of Inaction
{What happens if we don't proceed?}

---

## 3. Stakeholders

### Sponsor
- **Name**: {Executive sponsor}
- **Role**: {Title/Position}
- **Interest**: {What they care about}

### Key Stakeholders
| Stakeholder | Role | Concerns | Influence |
|-------------|------|----------|-----------|
| {Name/Group} | {Role} | {What they care about} | High/Medium/Low |
| {Name/Group} | {Role} | {What they care about} | High/Medium/Low |

*See Stakeholder Map for detailed analysis*

---

## 4. Scope

### In Scope
| Area | Description |
|------|-------------|
| **Business** | {Processes, capabilities, organizations affected} |
| **Data** | {Data domains, entities, flows affected} |
| **Application** | {Systems, services, integrations affected} |
| **Technology** | {Infrastructure, platforms affected} |

### Out of Scope
| Area | Rationale |
|------|-----------|
| {Exclusion 1} | {Why excluded} |
| {Exclusion 2} | {Why excluded} |

### Scope Boundaries
- **Organizational**: {Teams/departments in scope}
- **Geographic**: {Regions/locations in scope}
- **Temporal**: {Time boundaries, phases}

---

## 5. Vision

### Target State Description
{Describe the desired future state in 3-5 sentences}

### Key Capabilities
| Capability | Current State | Target State |
|------------|---------------|--------------|
| {Capability 1} | {How it works today} | {How it should work} |
| {Capability 2} | {How it works today} | {How it should work} |
| {Capability 3} | {How it works today} | {How it should work} |

### Value Proposition
{What value does achieving this vision deliver?}

---

## 6. Goals & Success Criteria

### Goals
| ID | Goal | Alignment |
|----|------|-----------|
| G1 | {Specific, measurable goal} | {Strategic initiative it supports} |
| G2 | {Specific, measurable goal} | {Strategic initiative it supports} |
| G3 | {Specific, measurable goal} | {Strategic initiative it supports} |

### Success Metrics
| Metric | Current | Target | Measurement Method |
|--------|---------|--------|-------------------|
| {Metric 1} | {Baseline} | {Goal} | {How measured} |
| {Metric 2} | {Baseline} | {Goal} | {How measured} |

---

## 7. Constraints & Assumptions

### Constraints
| Constraint | Impact |
|------------|--------|
| {Budget: $X} | {How this limits options} |
| {Timeline: By Q3} | {How this limits options} |
| {Technology: Must use X} | {How this limits options} |

### Assumptions
| Assumption | Risk if Invalid |
|------------|-----------------|
| {Assumption 1} | {What happens if wrong} |
| {Assumption 2} | {What happens if wrong} |

---

## 8. Risks

| Risk | Probability | Impact | Mitigation |
|------|-------------|--------|------------|
| {Risk 1} | H/M/L | H/M/L | {How to address} |
| {Risk 2} | H/M/L | H/M/L | {How to address} |

---

## 9. Architecture Principles

Principles guiding this initiative (from org standards or initiative-specific):

| Principle | Statement | Implication for This Initiative |
|-----------|-----------|--------------------------------|
| {Principle 1} | {What it says} | {How it applies here} |
| {Principle 2} | {What it says} | {How it applies here} |

---

## 10. Next Steps

### Recommended Architecture Work
- [ ] Phase B: Business Architecture - {if applicable, why}
- [ ] Phase C: Information Systems - {if applicable, why}
- [ ] Phase D: Technology Architecture - {if applicable, why}

### Immediate Actions
1. {Action 1 with owner}
2. {Action 2 with owner}
3. {Action 3 with owner}

---

## Approval

| Role | Name | Date | Signature |
|------|------|------|-----------|
| Sponsor | {Name} | {Date} | _________ |
| Architecture Lead | {Name} | {Date} | _________ |
| {Other Approver} | {Name} | {Date} | _________ |
```

---

## Stakeholder Map

Detailed stakeholder analysis supporting the Vision Document.

```markdown
# Stakeholder Map: {Initiative Name}

**Version**: {1.0}
**Date**: {YYYY-MM-DD}

---

## Stakeholder Register

| ID | Stakeholder | Type | Role | Contact |
|----|-------------|------|------|---------|
| S1 | {Name/Group} | Individual/Group | {Their role} | {Email/channel} |
| S2 | {Name/Group} | Individual/Group | {Their role} | {Email/channel} |

---

## Stakeholder Analysis

### S1: {Stakeholder Name}

**Type**: {Executive | Manager | Technical | End User | External}

**Concerns**:
- {What they care about #1}
- {What they care about #2}

**Success Criteria**:
- {What success looks like to them}

**Influence**: {High | Medium | Low}
**Interest**: {High | Medium | Low}

**Engagement Strategy**:
- {How to communicate with them}
- {Frequency of updates}

---

### S2: {Stakeholder Name}

{Repeat structure for each stakeholder}

---

## Stakeholder Matrix

```
              High Interest
                   │
    ┌──────────────┼──────────────┐
    │   KEEP       │   MANAGE     │
    │  SATISFIED   │   CLOSELY    │
    │              │              │
Low ├──────────────┼──────────────┤ High
Inf │              │              │ Influence
    │   MONITOR    │    KEEP      │
    │              │  INFORMED    │
    │              │              │
    └──────────────┼──────────────┘
                   │
              Low Interest
```

| Quadrant | Stakeholders |
|----------|--------------|
| Manage Closely | {S1, S2} |
| Keep Satisfied | {S3} |
| Keep Informed | {S4, S5} |
| Monitor | {S6} |

---

## Communication Plan

| Stakeholder | Information Needed | Format | Frequency | Owner |
|-------------|-------------------|--------|-----------|-------|
| {S1} | {What they need} | {Meeting/Email/Report} | {Weekly/Monthly} | {Who delivers} |
| {S2} | {What they need} | {Meeting/Email/Report} | {Weekly/Monthly} | {Who delivers} |

---

## Stakeholder Concerns → Architecture Responses

| Concern | Raised By | Architecture Response |
|---------|-----------|----------------------|
| {Concern 1} | {S1, S2} | {How architecture addresses it} |
| {Concern 2} | {S3} | {How architecture addresses it} |
```

---

## Statement of Architecture Work

Formal request/authorization document. Use when formal approval is required.

```markdown
# Statement of Architecture Work

**Initiative**: {Initiative Name}
**Date**: {YYYY-MM-DD}
**Requestor**: {Name, Title}

---

## 1. Purpose

This document requests authorization to proceed with architecture development for:

{Brief description of the initiative}

---

## 2. Architecture Project Scope

### 2.1 Objectives
- {Objective 1}
- {Objective 2}
- {Objective 3}

### 2.2 Scope Statement
**In Scope**:
- {Item 1}
- {Item 2}

**Out of Scope**:
- {Item 1}
- {Item 2}

### 2.3 Architecture Domains
- [ ] Business Architecture
- [ ] Data Architecture
- [ ] Application Architecture
- [ ] Technology Architecture

---

## 3. Deliverables

| Deliverable | Description | Target Date |
|-------------|-------------|-------------|
| {Deliverable 1} | {What it contains} | {Date} |
| {Deliverable 2} | {What it contains} | {Date} |

---

## 4. Resources Required

### 4.1 Team
| Role | Name | Allocation |
|------|------|------------|
| Architecture Lead | {Name} | {%} |
| Business Architect | {Name} | {%} |
| Technical Architect | {Name} | {%} |

### 4.2 Budget
| Category | Amount |
|----------|--------|
| Personnel | ${X} |
| Tools/Infrastructure | ${X} |
| External Services | ${X} |
| **Total** | **${X}** |

---

## 5. Timeline

| Phase | Activities | Start | End |
|-------|------------|-------|-----|
| Phase A | Architecture Vision | {Date} | {Date} |
| Phase B | Business Architecture | {Date} | {Date} |
| Phase C | Information Systems | {Date} | {Date} |
| Phase D | Technology Architecture | {Date} | {Date} |

---

## 6. Governance

### 6.1 Decision Authority
| Decision Type | Authority |
|---------------|-----------|
| Architecture direction | {Name/Role} |
| Scope changes | {Name/Role} |
| Resource allocation | {Name/Role} |

### 6.2 Review Points
| Milestone | Reviewers | Approval Required |
|-----------|-----------|-------------------|
| Vision Complete | {Names} | Yes/No |
| Architecture Complete | {Names} | Yes/No |

---

## 7. Risks & Mitigation

| Risk | Impact | Mitigation |
|------|--------|------------|
| {Risk 1} | {Impact} | {Mitigation} |
| {Risk 2} | {Impact} | {Mitigation} |

---

## 8. Authorization

By signing below, I authorize the architecture work described in this document.

| Role | Name | Signature | Date |
|------|------|-----------|------|
| Executive Sponsor | {Name} | _________ | _____ |
| Architecture Board | {Name} | _________ | _____ |

---

## Appendices

- **Appendix A**: Architecture Vision Document
- **Appendix B**: Stakeholder Map
```

---

## Quick Templates

### Minimal Vision (Lightweight Projects)

```markdown
# Vision: {Initiative Name}

## What
{One paragraph describing what we're building/changing}

## Why
{Business driver in one sentence}

## Who
- **Sponsor**: {Name}
- **Users**: {Who benefits}
- **Team**: {Who builds it}

## Scope
- **In**: {Key items}
- **Out**: {Key exclusions}

## Success
{How we know it worked - 2-3 metrics}

## Risks
- {Top risk and mitigation}
```

### Stakeholder Summary (Lightweight)

```markdown
# Stakeholders: {Initiative Name}

| Who | Cares About | Keep Them |
|-----|-------------|-----------|
| {Name} | {Concern} | Informed/Consulted/Deciding |
```
