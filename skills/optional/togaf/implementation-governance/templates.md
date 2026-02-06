# Implementation Governance Templates

Artifact templates for TOGAF Phase G deliverables.

---

## Architecture Contract Template

```markdown
# Architecture Contract

**Contract ID**: AC-{nnn}
**Project**: {project name}
**Version**: {version}
**Effective Date**: {date}

---

## Parties

| Role | Name | Title | Responsibility |
|------|------|-------|----------------|
| Architecture Authority | {name} | {title} | Standards, guidance, reviews |
| Implementation Lead | {name} | {title} | Delivery, compliance, escalation |
| Project Sponsor | {name} | {title} | Funding, decisions, acceptance |

---

## Scope

### Project Overview
| Attribute | Value |
|-----------|-------|
| Project Name | {name} |
| Project ID | PRJ-{nnn} |
| Transition | TA-{n} |
| Start Date | {date} |
| End Date | {date} |

### Objectives
1. {objective 1}
2. {objective 2}
3. {objective 3}

### Deliverables
| Deliverable | Description | Acceptance Criteria |
|-------------|-------------|---------------------|
| {deliverable} | {description} | {criteria} |

---

## Architecture Commitments

### Target Architecture
The implementation shall conform to:

| Artifact | Version | Location |
|----------|---------|----------|
| Transition Architecture | TA-{n} v{x} | {link} |
| Solution Design | v{x} | {link} |
| API Specifications | v{x} | {link} |
| Data Model | v{x} | {link} |

### Technology Standards
| Standard | Version | Applicability |
|----------|---------|---------------|
| {standard name} | {version} | {how it applies} |

### Architecture Principles
| Principle | Implication for This Project |
|-----------|------------------------------|
| {principle} | {specific guidance} |

### Non-Functional Requirements
| Requirement | Target | Verification Method |
|-------------|--------|---------------------|
| Response Time | {target} | {how verified} |
| Availability | {target} | {how verified} |
| Scalability | {target} | {how verified} |
| Security | {standard} | {how verified} |

---

## Governance Process

### Review Checkpoints
| Checkpoint | Timing | Deliverables | Reviewers |
|------------|--------|--------------|-----------|
| Design Review | {date} | {list} | {names} |
| Implementation Check | {date} | {list} | {names} |
| Pre-Go-Live Review | {date} | {list} | {names} |

### Review Criteria
Each review will assess:
- [ ] Architecture conformance
- [ ] Standards compliance
- [ ] Principle adherence
- [ ] Non-functional requirements
- [ ] Documentation completeness

### Communication
| Communication | Frequency | Participants | Format |
|---------------|-----------|--------------|--------|
| Status Update | {freq} | {who} | {format} |
| Escalation | As needed | {who} | {format} |

---

## Exception Management

### Deviation Types
| Type | Description | Approval Authority |
|------|-------------|-------------------|
| Variance | Minor, low risk | Solution Architect |
| Deferral | Temporary, with remediation | Domain Architect |
| Waiver | Permanent exception | Architecture Board |

### Exception Process
1. Submit deviation request with justification
2. Impact assessment by architecture
3. Decision by appropriate authority
4. Document in deviation register
5. Track remediation (for deferrals)

---

## Acceptance

### Acceptance Criteria
- [ ] All review checkpoints passed
- [ ] No unresolved non-compliances
- [ ] All deferrals have remediation plans
- [ ] Documentation complete
- [ ] Production readiness confirmed

### Sign-Off

| Role | Name | Signature | Date |
|------|------|-----------|------|
| Architecture Authority | | | |
| Implementation Lead | | | |
| Project Sponsor | | | |

---

## Appendices

### A. Referenced Documents
| Document | Version | Link |
|----------|---------|------|
| {document} | {version} | {link} |

### B. Glossary
| Term | Definition |
|------|------------|
| {term} | {definition} |
```

---

## Compliance Assessment Template

```markdown
# Compliance Assessment Report

**Assessment ID**: CAR-{nnn}
**Project**: {project name}
**Review Type**: {Design/Implementation/Go-Live}
**Date**: {date}

---

## Review Information

| Attribute | Value |
|-----------|-------|
| Project | {project name} |
| Project ID | PRJ-{nnn} |
| Contract Reference | AC-{nnn} |
| Review Type | {type} |
| Date | {date} |
| Duration | {time} |

### Reviewers
| Name | Role | Focus Area |
|------|------|------------|
| {name} | {role} | {area} |

### Attendees
| Name | Role |
|------|------|
| {name} | {role} |

---

## Assessment Summary

### Overall Status
| Dimension | Status | Score |
|-----------|--------|-------|
| Architecture Conformance | {✓ Compliant / ⚠ Deviations / ✗ Non-Compliant} | {n}/10 |
| Standards Compliance | {✓ Compliant / ⚠ Deviations / ✗ Non-Compliant} | {n}/10 |
| Principle Adherence | {✓ Compliant / ⚠ Deviations / ✗ Non-Compliant} | {n}/10 |
| Documentation | {✓ Complete / ⚠ Gaps / ✗ Incomplete} | {n}/10 |

### Finding Summary
| Category | Compliant | Deviation | Non-Compliant | N/A |
|----------|-----------|-----------|---------------|-----|
| Architecture | {n} | {n} | {n} | {n} |
| Standards | {n} | {n} | {n} | {n} |
| Principles | {n} | {n} | {n} | {n} |
| **Total** | **{n}** | **{n}** | **{n}** | **{n}** |

---

## Detailed Findings

### Finding F-{nnn}

| Attribute | Value |
|-----------|-------|
| **Finding ID** | F-{nnn} |
| **Category** | {Architecture/Standard/Principle} |
| **Reference** | {what it should comply with} |
| **Severity** | {Critical/High/Medium/Low} |
| **Status** | {Compliant/Deviation Requested/Non-Compliant} |

**Description**:
{What was reviewed}

**Expected**:
{What compliance looks like}

**Actual**:
{What was found}

**Impact**:
{Consequence of this finding}

**Recommendation**:
{What should be done}

---

## Action Items

| ID | Action | Owner | Due Date | Priority | Status |
|----|--------|-------|----------|----------|--------|
| A-{nnn} | {action description} | {name} | {date} | {H/M/L} | {Open/In Progress/Closed} |

---

## Review Decision

| Decision | Details |
|----------|---------|
| **Outcome** | {Approved / Approved with Conditions / Deferred / Rejected} |
| **Authority** | {name, role} |
| **Date** | {date} |

### Conditions (if applicable)
| Condition | Due Date | Verification |
|-----------|----------|--------------|
| {condition} | {date} | {how verified} |

### Reasons (if Deferred/Rejected)
{Explanation of decision}

### Next Steps
1. {step 1}
2. {step 2}
3. {step 3}

---

## Appendix: Review Checklist

### Architecture Conformance
- [ ] Solution aligns with target architecture
- [ ] Components match architecture definition
- [ ] Interfaces follow specified patterns
- [ ] Data model conforms to architecture

### Standards Compliance
- [ ] Technology stack follows standards
- [ ] Security controls implemented
- [ ] Coding standards applied
- [ ] API standards followed
- [ ] Data standards observed

### Principle Adherence
- [ ] {Principle 1}: {assessment}
- [ ] {Principle 2}: {assessment}
- [ ] {Principle 3}: {assessment}
```

---

## Deviation Request Template

```markdown
# Deviation Request

**Request ID**: DEV-{nnn}
**Status**: {Draft/Submitted/Under Review/Approved/Rejected}
**Date**: {date}

---

## Request Information

| Attribute | Value |
|-----------|-------|
| **Request ID** | DEV-{nnn} |
| **Project** | {project name} |
| **Project ID** | PRJ-{nnn} |
| **Requestor** | {name} |
| **Date Submitted** | {date} |
| **Urgency** | {Critical/High/Medium/Low} |

---

## Deviation Details

### Type
| Type | Selected |
|------|----------|
| Variance (minor, low risk) | {☐/☑} |
| Deferral (temporary, remediation planned) | {☐/☑} |
| Waiver (permanent exception) | {☐/☑} |

### Category
| Category | Selected |
|----------|----------|
| Architecture | {☐/☑} |
| Technology Standard | {☐/☑} |
| Security Standard | {☐/☑} |
| Architecture Principle | {☐/☑} |
| Other: {specify} | {☐/☑} |

### Reference
| Attribute | Value |
|-----------|-------|
| Requirement | {what should be complied with} |
| Source | {document, section} |
| Version | {version} |

### Deviation Description
{Detailed description of what is being requested}

---

## Justification

### Why Is This Deviation Needed?
{Explanation of why compliance is not possible or practical}

### Business Impact of Compliance
| Impact | Description |
|--------|-------------|
| Cost | {additional cost to comply} |
| Timeline | {delay to comply} |
| Functionality | {capability limitation} |

### Alternatives Considered
| Alternative | Analysis | Why Not Viable |
|-------------|----------|----------------|
| {alternative 1} | {analysis} | {reason} |
| {alternative 2} | {analysis} | {reason} |
| {alternative 3} | {analysis} | {reason} |

---

## Impact Assessment

### Technical Impact
| Factor | Assessment | Notes |
|--------|------------|-------|
| Security | {None/Low/Medium/High} | {explanation} |
| Performance | {None/Low/Medium/High} | {explanation} |
| Scalability | {None/Low/Medium/High} | {explanation} |
| Maintainability | {None/Low/Medium/High} | {explanation} |
| Integration | {None/Low/Medium/High} | {explanation} |

### Organizational Impact
| Factor | Assessment | Notes |
|--------|------------|-------|
| Technical Debt | {None/Low/Medium/High} | {explanation} |
| Precedent Risk | {None/Low/Medium/High} | {explanation} |
| Skills Impact | {None/Low/Medium/High} | {explanation} |

### Risk Assessment
| Risk | Probability | Impact | Mitigation |
|------|-------------|--------|------------|
| {risk} | {H/M/L} | {H/M/L} | {mitigation} |

---

## Remediation Plan (For Deferrals)

### Remediation Approach
{How compliance will be achieved in the future}

### Timeline
| Milestone | Target Date | Deliverable |
|-----------|-------------|-------------|
| {milestone 1} | {date} | {deliverable} |
| {milestone 2} | {date} | {deliverable} |
| {milestone 3} | {date} | {deliverable} |

### Resources Required
| Resource | Quantity | Notes |
|----------|----------|-------|
| {resource} | {amount} | {notes} |

### Tracking
| Attribute | Value |
|-----------|-------|
| Tracking Owner | {name} |
| Review Frequency | {frequency} |
| Expiry Date | {date} |

---

## Decision

### Recommendation
| Recommender | Role | Recommendation | Date |
|-------------|------|----------------|------|
| {name} | {role} | {Approve/Reject/Modify} | {date} |

**Rationale**:
{Explanation of recommendation}

### Decision
| Decision | Authority | Date |
|----------|-----------|------|
| {Approved/Approved with Conditions/Rejected} | {name, role} | {date} |

### Conditions (if applicable)
1. {condition 1}
2. {condition 2}

### Rejection Reason (if applicable)
{Why request was rejected}

---

## Tracking

| Event | Date | By | Notes |
|-------|------|----|----|
| Submitted | {date} | {name} | |
| Reviewed | {date} | {name} | |
| Decided | {date} | {name} | |
| Remediated | {date} | {name} | (for deferrals) |
```

---

## Deviation Register Template

```markdown
# Deviation Register

**As of**: {date}
**Owner**: {name}

---

## Summary

| Type | Active | Pending | Remediated | Total |
|------|--------|---------|------------|-------|
| Waivers | {n} | {n} | N/A | {n} |
| Deferrals | {n} | {n} | {n} | {n} |
| Variances | {n} | {n} | N/A | {n} |
| **Total** | **{n}** | **{n}** | **{n}** | **{n}** |

---

## Active Deviations

| ID | Project | Type | Category | Summary | Impact | Expiry | Owner |
|----|---------|------|----------|---------|--------|--------|-------|
| DEV-{nnn} | {project} | {type} | {category} | {summary} | {H/M/L} | {date} | {owner} |

---

## Pending Decisions

| ID | Project | Type | Submitted | Urgency | Status |
|----|---------|------|-----------|---------|--------|
| DEV-{nnn} | {project} | {type} | {date} | {level} | {Under Review/Awaiting Info} |

---

## Expiring Soon (Next 30 Days)

| ID | Project | Type | Expiry | Remediation Status |
|----|---------|------|--------|-------------------|
| DEV-{nnn} | {project} | Deferral | {date} | {On Track/At Risk/Overdue} |

---

## Recently Remediated

| ID | Project | Type | Remediated | Notes |
|----|---------|------|------------|-------|
| DEV-{nnn} | {project} | Deferral | {date} | {notes} |

---

## Trends

### By Quarter
| Quarter | Opened | Closed | Net |
|---------|--------|--------|-----|
| {Q} | {n} | {n} | {+/-n} |

### By Category
| Category | Current | Previous | Trend |
|----------|---------|----------|-------|
| Architecture | {n} | {n} | {↑/↓/→} |
| Standards | {n} | {n} | {↑/↓/→} |
| Security | {n} | {n} | {↑/↓/→} |
| Principles | {n} | {n} | {↑/↓/→} |
```

---

## Lesson Learned Template

```markdown
# Lesson Learned

**Lesson ID**: LL-{nnn}
**Date**: {date}

---

## Identification

| Attribute | Value |
|-----------|-------|
| **Lesson ID** | LL-{nnn} |
| **Source** | {Compliance Review/Deviation/Incident/Feedback} |
| **Source Reference** | {CAR-nnn / DEV-nnn / INC-nnn} |
| **Category** | {Architecture Gap/Standard Issue/Process/Tool/Training} |
| **Submitted By** | {name} |
| **Date** | {date} |

---

## Description

### What Happened
{Describe the situation}

### What Was Learned
{Key insight or learning}

### Impact
| Type | Description |
|------|-------------|
| What happened | {actual impact} |
| What could have happened | {potential impact} |

---

## Analysis

### Root Cause
{Why did this situation occur?}

### Contributing Factors
1. {factor 1}
2. {factor 2}
3. {factor 3}

---

## Recommendation

### Proposed Change
{What should change to prevent recurrence or capture benefit}

### Change Type
| Type | Selected |
|------|----------|
| Architecture update | {☐/☑} |
| Standard update | {☐/☑} |
| Process improvement | {☐/☑} |
| Tooling enhancement | {☐/☑} |
| Training need | {☐/☑} |

### Affected Artifacts
| Artifact | Proposed Change |
|----------|-----------------|
| {artifact} | {change} |

---

## Action

| Action | Owner | Due Date | Status |
|--------|-------|----------|--------|
| {action} | {name} | {date} | {Open/Complete} |

---

## Tracking

| Event | Date | By |
|-------|------|----|
| Submitted | {date} | {name} |
| Reviewed | {date} | {name} |
| Action Assigned | {date} | {name} |
| Closed | {date} | {name} |
```
