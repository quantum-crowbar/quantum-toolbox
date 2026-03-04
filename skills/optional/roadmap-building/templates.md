# Roadmap Building Templates

> **Audience:** AI Agents

Reusable templates for all roadmap-building outputs.

---

## master-roadmap.md

```markdown
# Implementation Roadmap: [Project Name]

> **Generated:** YYYY-MM-DD
> **Source:** [arch-analysis outputs | TOGAF Phase E/F | standalone]
> **Status:** [Draft | Review | Approved]

## Executive Summary

[2–3 sentences: what is being built, why, and what the outcome is]

**Timeline:** [N months] ([Q? YYYY] – [Q? YYYY])
**Phases:** [N]
**Initiatives:** [N]
**Estimated Effort:** [N person-weeks]
**Teams:** [Team A, Team B, ...]

## Phase Overview

| Phase | Name | Timeline | Initiatives | Effort | Status |
|-------|------|----------|-------------|--------|--------|
| 1 | Foundation | Q1 YYYY | N | N pw | ⚪ Planned |
| 2 | Migration | Q2–Q3 YYYY | N | N pw | ⚪ Planned |
| 3 | Optimisation | Q4 YYYY | N | N pw | ⚪ Planned |

## Key Architecture Decisions

| ADR | Decision | Status |
|-----|----------|--------|
| ADR-001 | [Technology choice] | Accepted |
| ADR-002 | [Pattern choice] | Accepted |

## Top Risks

| Risk | Impact | Probability | Mitigation |
|------|--------|-------------|------------|
| [Risk description] | High | Medium | [Brief mitigation] |

## Critical Path

[Longest dependency chain → minimum project duration]

`[Initiative A] → [Initiative B] → [Initiative C]` = N weeks

## Success Criteria

- [ ] [Measurable outcome 1]
- [ ] [Measurable outcome 2]
- [ ] [Measurable outcome 3]

---
*Full detail: [detailed-roadmap.md](detailed-roadmap.md)*
*Progress tracking: [roadmap-tracker.md](roadmap-tracker.md)*
```

---

## roadmap-tracker.md

```markdown
# Roadmap Tracker: [Project Name]

> **Audience:** Humans + AI Agents (status overview)
> **Status as of:** YYYY-MM-DD
> **Updated by:** [agent | human] on YYYY-MM-DD

## Status Overview

| Initiative | Phase | Status | Team | Priority |
|------------|-------|--------|------|----------|
| [Initiative name] | Phase 1 | ⚪ Planned | [Team] | High |
| [Initiative name] | Phase 1 | ⚪ Planned | [Team] | High |
| [Initiative name] | Phase 2 | ⚪ Planned | [Team] | Medium |
| [Initiative name] | Phase 3 | ⚪ Planned | [Team] | Low |

Legend: 🟢 Complete | 🟡 In Progress | ⚪ Planned | 🔴 Blocked

## Summary

| Metric | Value |
|--------|-------|
| Total initiatives | N |
| Phases | N |
| Estimated duration | N months |
| Estimated total effort | N person-weeks |
| Teams involved | Team A, Team B, ... |
| Total story points | N |
| Completed story points | 0 |
| Completion | 0% |
```

---

## phase-N-name.md

```markdown
# Phase [N]: [Name]

**Timeline:** [Q? YYYY – Q? YYYY]
**Status:** ⚪ Planned

## Objectives

[What this phase delivers and why it matters]

## Initiatives

| ID | Initiative | Team | Complexity | Duration | Depends On |
|----|-----------|------|------------|----------|------------|
| 1.1 | [Name] | [Team] | Medium | 6 weeks | — |
| 1.2 | [Name] | [Team] | High | 12 weeks | 1.1 |

## Success Criteria

- [ ] [Measurable outcome]
- [ ] [Measurable outcome]

## Phase Exit Criteria

All of the following must be true before Phase [N+1] begins:
- [ ] All initiative success criteria met
- [ ] Integration tests passing
- [ ] Stakeholder sign-off received
- [ ] Risks R-NNN and R-NNN resolved or accepted
```

---

## initiative-NNN-name.md

```markdown
# Initiative [N.N]: [Name]

**Phase:** [N]
**Team:** [Owning team]
**Status:** ⚪ Planned
**Complexity:** [Low | Medium | High | Very High]
**Estimated Duration:** [N weeks]
**Story Points:** [N]
**Depends On:** [Initiative N.N, or —]
**Blocks:** [Initiative N.N, or —]

## Objective

[1–2 sentences: what this initiative delivers and why]

## Business Value

- **ROI/Impact:** [What improves for users or the business]
- **KPIs:** [Measurable indicators of success]

## Technical Approach

[Describe the implementation strategy: migration pattern, architecture pattern, tooling]

**Architecture Decisions:** [ADR-001], [ADR-002]
**Design Patterns:** [Strangler Fig, Repository, etc.]
**Technology Stack:** [Specific tools and versions]

## Complexity Analysis

- **Technical Complexity:** [Low | Medium | High]
- **Estimated Effort:** [N weeks, N engineers at N% allocation]
- **Required Skills:** [Skill 1, Skill 2]
- **Integration Points:** [N systems affected]
- **Risk Buffer:** [15–25%]

## Dependencies

| Type | Dependency | Status |
|------|-----------|--------|
| Blocks | [Initiative or external] | ⚪ |
| Blocked by | [Initiative or external] | ⚪ |
| External | [Third-party or team dependency] | — |

## Testing Strategy

- Unit: [approach]
- Integration: [approach]
- E2E: [approach]
- Performance: [approach if applicable]

## Rollout Plan

- **Deployment approach:** [Blue-green | Canary | Big-bang]
- **Rollback strategy:** [How to revert if needed]
- **Monitoring:** [Key metrics and alerts]

## Risks

See risk register: [R-NNN], [R-NNN]

## Epics

| Epic | Team | Complexity | Duration | Status |
|------|------|------------|----------|--------|
| [epic-NNN-name.md](../epics/epic-NNN-name.md) | [Team] | Medium | 3 weeks | ⚪ |
```

---

## epic-NNN-name.md

```markdown
# Epic: [Name]

**Initiative:** [N.N] — [Initiative name]
**Phase:** [N] ([Q? YYYY])
**Team:** [Owning team]
**Status:** ⚪ Planned
**Complexity:** [High | Medium | Low]
**Estimated Duration:** [N weeks]
**Story Points:** [N total]

## Objective

[1 sentence: what does completing this epic deliver?]

## Acceptance Criteria

- [ ] [Verifiable outcome 1]
- [ ] [Verifiable outcome 2]
- [ ] [Verifiable outcome 3]

## Tickets

| ID | Title | Team | Size | Estimate | Status |
|----|-------|------|------|----------|--------|
| T-NNN | [Title] | [Team] | S | 2d | ⚪ |
| T-NNN | [Title] | [Team] | M | 4d | ⚪ |
| T-NNN | [Title] | [Team] | L | 8d | ⚪ |

**Total:** [N] story points · [N] days

---

## Ticket Detail

### T-NNN: [Title]

**Epic:** [Epic name]
**Team:** [Team name]
**Owner role:** [e.g. Senior Backend Engineer]
**Size:** [XS | S | M | L | XL]
**Estimate:** [N days]
**Status:** ⚪ Planned
**Dependencies:** [T-NNN or —]

**Description:**
[What needs to be done and why. 2–4 sentences.]

**Acceptance Criteria:**
- [ ] [Verifiable condition 1]
- [ ] [Verifiable condition 2]

**Technical Notes:**
- [Implementation detail or reference]
- [Reference: ADR-NNN if applicable]

---

### T-NNN: [Title]

[repeat for each ticket]
```

---

## adr-NNN-topic.md

```markdown
# ADR-[NNN]: [Decision Title]

**Status:** [Proposed | Accepted | Deprecated | Superseded by ADR-NNN]
**Date:** YYYY-MM-DD
**Deciders:** [Role or team]

## Context

[What problem is being solved? What are the requirements and constraints?]

## Options Considered

1. **[Option A]** — [Brief description]
2. **[Option B]** — [Brief description]
3. **[Option C]** — [Brief description]

## Decision

[Option X] — [One sentence rationale]

## Rationale

- [Reason 1]
- [Reason 2]
- [Reason 3]

## Consequences

**Positive:**
- [Benefit 1]
- [Benefit 2]

**Negative:**
- [Trade-off 1]
- [Trade-off 2]

## Implementation Notes

- [Specific version, configuration, or approach]
- [Reference to relevant initiative or ticket]

## Related Decisions

- [ADR-NNN: Title]
```

---

## risk-register.md

```markdown
# Risk Register: [Project Name]

> **Updated:** YYYY-MM-DD

| ID | Initiative | Description | Impact | Probability | Owner | Status |
|----|-----------|-------------|--------|-------------|-------|--------|
| R-001 | [N.N] | [Risk description] | High | Medium | [Role] | Active |
| R-002 | [N.N] | [Risk description] | Medium | Low | [Role] | Active |

---

## Risk Detail

### R-001: [Risk title]

**Initiative:** [N.N — Name]
**Description:** [What could go wrong]
**Impact:** High — [Why this matters, what it delays or breaks]
**Probability:** Medium — [Why this is plausible]

**Mitigation:**
- Immediate: [Action to take now]
- Ongoing: [Monitoring or process]

**Contingency:** [Fallback plan if mitigation fails]

**Owner:** [Role]
**Status:** Active

---
```

---

## roadmap-metadata.json

```json
{
  "project": "[Project name]",
  "generated": "YYYY-MM-DD",
  "source": "option-a",
  "version": "1.0.0",
  "phases": 3,
  "initiatives": 8,
  "epics": 12,
  "tickets": 64,
  "total_story_points": 320,
  "estimated_duration_weeks": 36,
  "estimated_effort_person_weeks": 96,
  "teams": ["Platform", "Backend", "Data", "QA"],
  "adrs": 5,
  "risks": {
    "high": 2,
    "medium": 4,
    "low": 3
  },
  "critical_path_weeks": 36,
  "confidence": "medium"
}
```
