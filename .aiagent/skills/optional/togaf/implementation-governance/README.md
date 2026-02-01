# TOGAF Phase G: Implementation Governance

Guidelines for ensuring architecture compliance during implementation.

---

## Overview

Phase G ensures implementation projects conform to the defined architecture:

1. **Establish Contracts** - Formal agreements with implementers
2. **Monitor Compliance** - Track adherence to architecture
3. **Handle Deviations** - Manage architecture exceptions
4. **Provide Guidance** - Support implementation teams
5. **Capture Lessons** - Feed improvements back to architecture

```
Phase F (Planning) → Phase G (Governance) → Phase H (Change)
                          ↑
                     YOU ARE HERE
```

---

## When to Use This Skill

Use Phase G when you need to:

- Establish architecture contracts with project teams
- Review implementations for architecture compliance
- Manage architecture exceptions and deviations
- Provide architecture guidance during implementation
- Track architecture conformance across portfolio
- Prepare for architecture change requests

---

## Key Concepts

### Architecture Contract

A formal agreement between architecture and implementation:

```
┌─────────────────────────────────────────────────────────────┐
│                  ARCHITECTURE CONTRACT                       │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  What We Agree To Deliver                                   │
│  ├── Scope and objectives                                   │
│  ├── Architecture artifacts to follow                       │
│  ├── Standards and guidelines to apply                      │
│  └── Deliverables and acceptance criteria                   │
│                                                             │
│  How We'll Work Together                                    │
│  ├── Review checkpoints                                     │
│  ├── Escalation procedures                                  │
│  ├── Change request process                                 │
│  └── Communication cadence                                  │
│                                                             │
│  Consequences                                               │
│  ├── Acceptance process                                     │
│  ├── Non-compliance handling                                │
│  └── Exception process                                      │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Compliance Assessment

Systematic review of implementation conformance:

```
┌─────────────────────────────────────────────────────────────┐
│                 COMPLIANCE ASSESSMENT                        │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  Assessment Dimensions                                      │
│  ├── Architecture Conformance                               │
│  │   ├── Component alignment                                │
│  │   ├── Interface compliance                               │
│  │   └── Data model adherence                               │
│  │                                                          │
│  ├── Standards Compliance                                   │
│  │   ├── Technology standards                               │
│  │   ├── Security standards                                 │
│  │   └── Coding standards                                   │
│  │                                                          │
│  └── Principle Adherence                                    │
│      ├── Architecture principles                            │
│      └── Design principles                                  │
│                                                             │
│  Findings Categories                                        │
│  ├── Compliant ✓                                            │
│  ├── Deviation (approved exception)                         │
│  ├── Non-compliant (requires remediation)                   │
│  └── Not applicable                                         │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Deviation Management

Process for handling architecture exceptions:

```
Exception                Assess               Decision              Track
Request                  Impact               Authority             Outcome
   │                       │                     │                    │
   ▼                       ▼                     ▼                    ▼
┌──────┐              ┌──────┐              ┌──────┐             ┌──────┐
│Submit│────────────▶ │Review│────────────▶ │Decide│───────────▶ │Record│
│Form  │              │Board │              │Approve│            │Track │
└──────┘              └──────┘              │Reject │            └──────┘
                                            │Modify │
                                            └──────┘
```

---

## Governance Levels

### Tiered Governance Model

| Level | Scope | Authority | Review Frequency |
|-------|-------|-----------|------------------|
| **Strategic** | Enterprise architecture | CTO/Architecture Board | Quarterly |
| **Domain** | Business/Technology domain | Domain Architect | Monthly |
| **Solution** | Individual project | Solution Architect | Sprint/Iteration |
| **Technical** | Code/Configuration | Tech Lead | Continuous |

### Governance Intensity

| Project Type | Governance Level | Rationale |
|--------------|------------------|-----------|
| Strategic initiative | High | High risk, enterprise impact |
| Core system change | High | Business critical |
| Standard enhancement | Medium | Moderate risk |
| Maintenance/patch | Low | Low risk, localized |
| Experimental/POC | Minimal | Learning focus |

---

## Compliance Review Types

### Architecture Review Board (ARB)

```
┌─────────────────────────────────────────────────────────────┐
│              ARCHITECTURE REVIEW BOARD                       │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  When: Key decision points, gate reviews                    │
│                                                             │
│  Who: Chief Architect, Domain Architects, Key Stakeholders  │
│                                                             │
│  What:                                                      │
│  ├── Major architecture decisions                           │
│  ├── Significant deviations                                 │
│  ├── New technology adoption                                │
│  └── Cross-domain impacts                                   │
│                                                             │
│  Outcomes:                                                  │
│  ├── Approved                                               │
│  ├── Approved with conditions                               │
│  ├── Deferred (more info needed)                            │
│  └── Rejected (with rationale)                              │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Solution Design Review

```markdown
## Solution Design Review

**Purpose**: Validate solution architecture before implementation

**Timing**: End of design phase, before development

**Participants**:
- Solution Architect (presenter)
- Domain Architect (reviewer)
- Security Architect
- Data Architect (if data-intensive)
- Infrastructure Architect

**Review Criteria**:
- Alignment with target architecture
- Standards compliance
- Security requirements
- Integration patterns
- Scalability and performance
```

### Implementation Checkpoint

```markdown
## Implementation Checkpoint

**Purpose**: Verify implementation matches approved design

**Timing**: At key milestones (e.g., sprint reviews, phase gates)

**Participants**:
- Tech Lead (presenter)
- Solution Architect (reviewer)
- QA Lead

**Review Criteria**:
- Code structure matches design
- APIs match specifications
- Data models match design
- Security controls implemented
- Non-functional requirements met
```

---

## Deviation Categories

### Deviation Types

| Type | Description | Authority | Documentation |
|------|-------------|-----------|---------------|
| **Waiver** | Permanent exception, accepted risk | ARB | Full justification |
| **Deferral** | Temporary non-compliance, planned remediation | Domain Architect | Remediation plan |
| **Variance** | Minor deviation, low risk | Solution Architect | Brief note |

### Deviation Impact Assessment

| Factor | Low | Medium | High |
|--------|-----|--------|------|
| **Scope** | Single component | Multiple components | Enterprise-wide |
| **Security** | No security impact | Increased exposure | Critical vulnerability |
| **Integration** | Isolated | Domain interfaces | Cross-domain |
| **Precedent** | One-off | May repeat | Sets pattern |
| **Technical Debt** | Minimal | Moderate | Significant |

---

## Phase G Inputs

From previous phases:

| Input | Source | Usage |
|-------|--------|-------|
| Architecture Definition | Phases B-D | Compliance baseline |
| Implementation Plan | Phase F | Project milestones |
| Project Charters | Phase F | Scope and commitments |
| Architecture Principles | Preliminary | Evaluation criteria |
| Standards Catalog | Various | Compliance criteria |

---

## Phase G Outputs

Deliverables from this phase:

| Output | Description | Audience |
|--------|-------------|----------|
| **Architecture Contracts** | Formal agreements | Project teams |
| **Compliance Assessments** | Review findings | Project managers |
| **Deviation Requests** | Exception documentation | Architecture Board |
| **Implementation Recommendations** | Guidance for teams | Developers |
| **Lessons Learned** | Feed into Phase H | Architecture team |

---

## Key Principles

1. **Enable, Don't Block** - Governance should help projects succeed
2. **Proportionate** - Match governance intensity to risk
3. **Transparent** - Clear criteria and processes
4. **Consistent** - Apply standards equally
5. **Constructive** - Focus on improvement, not blame
6. **Documented** - Record decisions and rationale

---

## Common Challenges

| Challenge | Mitigation |
|-----------|------------|
| Governance seen as bureaucracy | Demonstrate value, streamline process |
| Inconsistent reviews | Use checklists, train reviewers |
| Deviations not tracked | Maintain central register |
| Late engagement | Build into project lifecycle |
| Architecture drift | Continuous compliance monitoring |

---

## Related Skills

- [Migration Planning](../migration-planning/) - Provides inputs
- [Change Management](../change-management/) - Handles major changes
- [Architecture Vision](../vision/) - Principles to enforce

---

## References

- TOGAF 10 Chapter 23: Phase G - Implementation Governance
- ISO/IEC 38500 (IT Governance)
- COBIT (Control Objectives for IT)
