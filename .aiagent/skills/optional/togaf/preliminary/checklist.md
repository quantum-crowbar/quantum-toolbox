# Preliminary Phase Checklist

Quick reference for establishing architecture capability.

---

## Quick Path Checklist (Lightweight)

### Scope
- [ ] Architecture scope defined (system/domain/enterprise)
- [ ] Key stakeholders identified
- [ ] Primary objectives documented

### Principles
- [ ] 5-7 core principles drafted
- [ ] Each principle has statement + rationale
- [ ] Principles reviewed with tech leads
- [ ] Documented in `docs/architecture/principles.md`

### Decision Process
- [ ] ADR template created
- [ ] Decision authority defined (who decides what)
- [ ] ADR folder structure set up

### Communication
- [ ] Principles communicated to team
- [ ] Decision process explained
- [ ] Ready to proceed to Phase A

---

## Full Path Checklist (Enterprise)

### Step 1: Scope Definition
- [ ] Architecture scope clearly defined
- [ ] Stakeholder list complete
- [ ] Executive sponsor identified
- [ ] Objectives documented with success criteria

### Step 2: Capability Assessment
- [ ] Current maturity assessed (6 capabilities)
- [ ] Target maturity defined
- [ ] Gaps identified and prioritized
- [ ] Improvement roadmap created

### Step 3: Architecture Principles

**Business Principles**:
- [ ] 3-5 business principles defined
- [ ] Each has statement, rationale, implications
- [ ] Aligned with business strategy

**Data Principles**:
- [ ] 3-5 data principles defined
- [ ] Data ownership addressed
- [ ] Data quality addressed
- [ ] Data sharing addressed

**Application Principles**:
- [ ] 3-5 application principles defined
- [ ] Modularity addressed
- [ ] Integration approach addressed
- [ ] Security addressed

**Technology Principles**:
- [ ] 3-5 technology principles defined
- [ ] Technology selection criteria addressed
- [ ] Automation addressed
- [ ] Cloud/infrastructure addressed

**Principle Quality**:
- [ ] Each principle is clear and understandable
- [ ] No conflicting principles
- [ ] All principles are actionable
- [ ] Stakeholder buy-in obtained

### Step 4: Governance Framework

**Decision Authority**:
- [ ] Decision types categorized
- [ ] Authority levels defined
- [ ] Escalation path documented

**Architecture Review Board**:
- [ ] ARB composition defined
- [ ] Meeting cadence established
- [ ] Inputs/outputs documented
- [ ] First meeting scheduled

**Decision Process**:
- [ ] Decision flow documented
- [ ] Proposal requirements defined
- [ ] ADR template created
- [ ] Exception process defined

**Compliance**:
- [ ] Review types defined
- [ ] Review frequency established
- [ ] Non-compliance handling documented

### Step 5: Repository Setup

**Structure**:
- [ ] Architecture folder structure created
- [ ] Principles document in place
- [ ] ADR folder created with template
- [ ] Standards folder created
- [ ] Reference architecture folder created

**Process**:
- [ ] ADR numbering convention defined
- [ ] Review process for updates defined
- [ ] Ownership assigned

### Step 6: Stakeholder Approval

**Preparation**:
- [ ] Summary document prepared
- [ ] Investment/effort estimated
- [ ] Benefits articulated

**Review**:
- [ ] Executive sponsor approved
- [ ] Development leads reviewed
- [ ] Feedback incorporated

**Communication**:
- [ ] All teams informed
- [ ] Documentation accessible
- [ ] Questions addressed

---

## Principle Quality Checks

For each principle:
- [ ] **Clear**: Can a developer understand it?
- [ ] **Actionable**: Does it guide decisions?
- [ ] **Specific**: Is it concrete enough to apply?
- [ ] **Not Conflicting**: Does it work with other principles?
- [ ] **Justified**: Is the rationale compelling?
- [ ] **Practical**: Can it be followed realistically?

---

## Common Pitfalls

### Principles
- [ ] Not too many (max 15-20 total)
- [ ] Not too vague ("Be good")
- [ ] Not too specific ("Use PostgreSQL 14.2")
- [ ] Not conflicting with each other
- [ ] Not ignored (must be enforced)

### Governance
- [ ] Not too heavy (appropriate to org size)
- [ ] Not too bureaucratic (enables, not blocks)
- [ ] Not unclear (who decides what)
- [ ] Not undocumented (decisions recorded)

### Repository
- [ ] Not scattered (single location)
- [ ] Not stale (regular updates)
- [ ] Not inaccessible (everyone can find it)

---

## Completion Criteria

### Minimum Viable (Quick Path)
- [ ] 5-7 principles documented
- [ ] ADR process defined
- [ ] Ready to begin Phase A

### Full Capability
- [ ] All capability areas addressed
- [ ] Governance framework operational
- [ ] Repository structure in place
- [ ] Stakeholder approval obtained
- [ ] Communication complete
- [ ] Ready to begin Phase A

---

## Next Steps After Completion

1. **Proceed to Phase A**: Begin Architecture Vision for specific initiative
2. **Schedule Reviews**: Set up first architecture review
3. **Monitor Adoption**: Track principle/process usage
4. **Iterate**: Improve based on feedback
