# TOGAF Preliminary Phase

Establishes the architecture capability, principles, and governance framework before starting the ADM cycle.

---

## Purpose

The Preliminary Phase prepares the organization for successful architecture work by:

- **Framework Tailoring**: Adapting TOGAF to organizational context
- **Architecture Principles**: Defining guiding principles for decisions
- **Governance Structure**: Establishing architecture governance
- **Capability Assessment**: Evaluating current architecture maturity
- **Stakeholder Buy-In**: Securing commitment to architecture practice

This phase runs **once** to set up the architecture capability, then Phase A begins.

---

## When to Use

Invoke this skill when:

- Establishing enterprise architecture practice for the first time
- Resetting or improving architecture governance
- Defining architecture principles for an organization
- Setting up architecture team structure and processes
- Needing formal architecture framework adoption

**Trigger phrases**:
```
"Set up TOGAF for this organization"
"Define architecture principles"
"Establish architecture governance"
"Prepare for TOGAF ADM"
"Create architecture capability framework"
```

---

## How This Skill Works

This is a **foundation-setting** skill. When invoked:

### Option 1: Quick Setup (Code-Focused)
For software projects wanting lightweight architecture governance:
1. Define 5-7 core architecture principles
2. Document decision-making process
3. Skip formal governance structure

### Option 2: Full Enterprise Setup
For organizations establishing formal architecture practice:
1. Complete capability assessment
2. Full governance framework
3. Tailored TOGAF methodology
4. Stakeholder engagement plan

---

## Deliverables

| Artifact | Purpose | Required |
|----------|---------|----------|
| **Architecture Principles** | Guiding principles for architecture decisions | Yes |
| **Tailored Architecture Framework** | Adapted TOGAF methodology for context | Optional |
| **Architecture Governance Framework** | Decision-making and compliance processes | Optional |
| **Architecture Capability Assessment** | Current maturity and gaps | Optional |
| **Architecture Repository Structure** | How artifacts are organized and stored | Optional |

---

## Key Concepts

### Architecture Principles

Principles guide architecture decisions consistently. Good principles are:

- **Understandable**: Clear to all stakeholders
- **Robust**: Apply across many situations
- **Complete**: Cover key concerns
- **Consistent**: Don't contradict each other
- **Stable**: Don't change frequently

**Categories**:
| Category | Focus |
|----------|-------|
| Business Principles | Alignment with business strategy |
| Data Principles | Data ownership, quality, sharing |
| Application Principles | Application design and integration |
| Technology Principles | Infrastructure and platform choices |

### Governance Framework

Architecture governance ensures:
- Decisions align with principles
- Exceptions are formally handled
- Compliance is monitored
- Architecture evolves appropriately

### Architecture Repository

Where architecture artifacts live:
- Principles and standards
- Reference architectures
- Architecture decisions (ADRs)
- Current and target state models
- Compliance records

---

## Integration with Other Skills

| Skill | Integration |
|-------|-------------|
| `arch-analysis` | Provides baseline for capability assessment |
| `software-design` | Principles feed into design decisions |
| `tech-stack-decisions` | Technology principles guide evaluations |
| All TOGAF phases | Preliminary outputs guide all phases |

### Workflow Position

```
Preliminary Phase (once)
    ↓
[Architecture Capability Established]
    ↓
Phase A: Vision (per initiative)
    ↓
Phase B-H: Architecture Development
```

---

## When to Skip

Skip formal Preliminary Phase when:

- Small team/project (< 10 engineers)
- No enterprise-wide architecture concerns
- Principles already well-established
- Focus is on single system, not enterprise

Instead, define lightweight principles directly in Phase A.

---

## Outputs Feed Into

- **All ADM Phases**: Principles guide decisions
- **Phase A** (Vision): Scope governance applies
- **Phase G** (Governance): Compliance framework used
- **Phase H** (Change): Change management processes

---

## Quick Start

**For lightweight setup**:
1. See [templates.md](templates.md) for Architecture Principles template
2. Define 5-7 core principles
3. Document in project's `docs/architecture/` folder
4. Proceed to Phase A

**For full enterprise setup**:
1. Complete Architecture Capability Assessment
2. Define comprehensive principles (all categories)
3. Establish governance framework
4. Set up architecture repository
5. Get stakeholder approval
6. Proceed to Phase A

---

## References

- [TOGAF Overview](../_index.md) - ADM cycle context
- [Architecture Thinking](../../../../core/architecture-thinking.md) - Core concepts
- [Templates](templates.md) - All Preliminary Phase templates
- [Examples](examples.md) - Sample completed documents
- [Checklist](checklist.md) - Quick reference
- [Workflows](workflows.md) - Step-by-step procedures
