# Roadmap Analysis Templates

> **Audience:** AI Agents

Templates for all 7 analysis mode outputs.

---

## Mode 1: Initiative Expansion (plan-NNN-name.md)

```markdown
# Implementation Plan: [Initiative Name]

**Initiative:** [N.N]
**Generated:** YYYY-MM-DD
**Status:** Draft

## Prerequisites

Before starting this initiative, the following must be true:
- [ ] [Prerequisite 1]
- [ ] [Prerequisite 2]

## Week-by-Week Plan

### Week 1: [Focus area]

**Goal:** [What is delivered by end of week 1]

| Step | Action | Tooling | Verification |
|------|--------|---------|--------------|
| 1.1 | [Action] | [Tool/command] | [How to verify it worked] |
| 1.2 | [Action] | [Tool/command] | [How to verify it worked] |

**Integration checkpoint:** [Who to sync with at end of week 1]

### Week 2: [Focus area]

[repeat pattern]

## Rollback Triggers

Stop and rollback if:
- [ ] [Condition 1 — e.g. error rate exceeds 1% for 10 min]
- [ ] [Condition 2]

**Rollback procedure:** [Steps to revert]

## Open Questions

- [ ] [Question requiring answer before proceeding]

## Related

- Initiative: [link]
- ADRs: [ADR-NNN]
- Risks: [R-NNN]
```

---

## Mode 2: Research Brief (research-NNN-topic.md)

```markdown
# Research [NNN]: [Topic]

**Initiative:** [N.N — Name]
**Generated:** YYYY-MM-DD
**Status:** Open

## Research Question

[Precise, answerable question — e.g. "Can Kong Gateway handle 50K req/s with <200ms p95 in our Kubernetes setup?"]

## Scope

**In scope:**
- [What will be investigated]

**Out of scope:**
- [What will not be investigated]

## Methodology

1. [Step 1: Setup]
2. [Step 2: Test/investigation]
3. [Step 3: Analysis]
4. [Step 4: Documentation]

## Resources Required

- **People:** [N engineers, roles, allocation]
- **Environment:** [What infrastructure is needed]
- **Tools:** [Software, licences, accounts]
- **Duration:** [N days]

## Decision Impact

| Outcome | Decision |
|---------|---------|
| [Positive result] | Proceed with [approach] |
| [Negative result] | Evaluate [alternative], update ADR-NNN |
| [Marginal result] | [Mitigation action — caching, architecture change] |

## Success Criteria

Research is complete when:
- [ ] [Specific measurable outcome]
- [ ] Recommendation documented (Go / No-Go / Conditions)

## Related

- Initiative: [N.N]
- ADR: [ADR-NNN] (will be updated based on findings)
- Spike: [spike-NNN if this leads to a spike]
```

---

## Mode 3: Complexity Analysis (complexity-analysis.md)

```markdown
# Roadmap Complexity Analysis

**Generated:** YYYY-MM-DD
**Roadmap:** [Project name]

## Executive Summary

Overall complexity: **[Low | Medium | High | Very High]** ([score]/10)
Estimated duration: [N months]
Risk level: [Low | Medium | High]
Overall confidence: [N]%

## Initiative Complexity Breakdown

| Initiative | Technical | Organisational | Risk | Confidence | Notes |
|------------|-----------|---------------|------|------------|-------|
| [N.N Name] | [1–10] | [1–10] | [1–10] | [N]% | [Flag if notable] |

## Critical Path

```
[Initiative A] ([Nw]) → [Initiative B] ([Nw]) → [Initiative C] ([Nw])
Total: [N] weeks minimum
```

## Bottlenecks

| Initiative | Downstream Dependents | Risk |
|-----------|----------------------|------|
| [N.N Name] | [N initiatives blocked] | [High / Medium] |

## Recommendations

1. [Recommendation with rationale]
2. [Recommendation with rationale]

## Confidence by Phase

| Phase | Confidence | Key Risks |
|-------|-----------|-----------|
| Phase 1 | [N]% | [Risk description] |
| Phase 2 | [N]% | [Risk description] |
```

---

## Mode 3: Complexity Metrics (complexity-metrics.json)

```json
{
  "generated": "YYYY-MM-DD",
  "overall": {
    "score": 7.2,
    "level": "High",
    "confidence": 0.65,
    "critical_path_weeks": 36
  },
  "initiatives": [
    {
      "id": "1.1",
      "name": "API Gateway Setup",
      "technical_complexity": 6,
      "organisational_complexity": 4,
      "risk_score": 5,
      "confidence": 0.70,
      "bottleneck": false
    }
  ],
  "bottlenecks": ["1.4"],
  "lowest_confidence": ["1.4", "2.1"]
}
```

---

## Mode 4: Spike (spike-NNN-topic.md)

```markdown
# Spike [NNN]: [Topic]

**Initiative:** [N.N — Name]
**Time Box:** [N days — max 5 for most spikes]
**Team:** [N engineer(s), roles]
**Generated:** YYYY-MM-DD

## Goal

Prove or disprove: [Specific assumption in one sentence]

## Success Criteria (Go/No-Go)

**Go:**
- [ ] [Measurable threshold — e.g. ">15K req/s at p95 <300ms"]
- [ ] [Measurable threshold]

**No-Go:**
- Any success criterion not met after [N days]

## Tasks

| Day | Task | Owner |
|-----|------|-------|
| 1 | [Setup] | [Role] |
| 2–3 | [Experiment] | [Role] |
| 4 | [Analysis] | [Role] |
| 5 | [Document + decision] | [Role] |

## Output

- Findings document (results, charts, raw data)
- Go/No-Go decision
- Updated ADR-NNN (if decision changes)
- Recommendations for implementation

## Decision Impact

| Decision | Action |
|---------|--------|
| Go | Proceed with [approach] as planned |
| No-Go | [Fallback action — alternative technology, architecture change] |

## Risks

- Non-representative test environment
- [Other risk]
```

---

## Mode 5: Effort Estimation (effort-estimation.md)

```markdown
# Effort Estimation

**Generated:** YYYY-MM-DD
**Confidence:** [N]%

## Initiative Breakdown

### [N.N] [Initiative Name]

| Activity | Hours | Role | Assumptions |
|----------|-------|------|-------------|
| Design & planning | [N] | [Role] | [Assumption] |
| Implementation: [component] | [N] | [Role] | [Assumption] |
| Testing | [N] | [Role] | [Assumption] |
| Documentation | [N] | [Role] | [Assumption] |
| Review & iteration | [N] | [Role] | [Assumption] |
| **Base total** | **[N]** | | |
| Risk buffer ([N]%) | [N] | | |
| **Total with buffer** | **[N]** | | |

**Confidence:** [N]% — [Rationale]

---

## Roadmap Totals

| Phase | Initiatives | Base Hours | Buffer | Total Hours | Person-Weeks |
|-------|-------------|-----------|--------|-------------|--------------|
| Phase 1 | N | N | N | N | N |
| Phase 2 | N | N | N | N | N |
| **Total** | **N** | **N** | **N** | **N** | **N** |

**Overall confidence:** [N]%

**Assumptions:**
- [Assumption 1]
- [Assumption 2]
```

---

## Mode 7: Team Composition (team-composition.md)

```markdown
# Team Composition: [Project Name]

**Generated:** YYYY-MM-DD

## Phase 1: [Name] ([Timeline])

| Role | Count | Seniority | Allocation | Duration |
|------|-------|-----------|------------|----------|
| Technical Lead | 1 | Staff/Senior | 100% | [N months] |
| Backend Engineer | 2 | 1 Senior, 1 Mid | 100% | [N months] |
| DevOps Engineer | 1 | Mid-Senior | 75% | [N months] |
| QA Engineer | 1 | Mid | 50% | [N months] |

**Phase 1 effort:** ~[N] person-hours

## [Repeat per phase]

## Expertise Requirements

### Critical (needed from day 1)

| Skill | Why | Source |
|-------|-----|--------|
| [Skill] | [Why it's critical] | [Hire | Upskill | Contract] |

### Important (needed by Phase 2)

[Same table]

## AI Augmentation Opportunities

| Task Type | AI Leverage | Estimated Saving |
|-----------|-------------|-----------------|
| Boilerplate code | High | 40–60% |
| Test writing | High | 30–50% |
| Documentation | Medium | 20–40% |
| Architecture decisions | Low | 10% (review only) |

**Overall estimated effort reduction:** [15–25]%
```

---

## Mode 7: Financial Plan (financial-plan.md)

```markdown
# Financial Plan: [Project Name]

**Generated:** YYYY-MM-DD
**Region:** [US Remote | EU | Global Hybrid]
**Confidence:** [N]%

## Cost by Phase

| Phase | Duration | Team Size | Labour | Tooling | Total | Monthly |
|-------|----------|-----------|--------|---------|-------|---------|
| Phase 1 | [Nmo] | [N] | $[N] | $[N] | $[N] | $[N] |
| Phase 2 | [Nmo] | [N] | $[N] | $[N] | $[N] | $[N] |
| **Total** | **[N]mo** | | **$[N]** | **$[N]** | **$[N]** | |

## Cost Range

| Scenario | Total | Rationale |
|----------|-------|-----------|
| Optimistic | $[N] | All estimates at base, no delays |
| Base case | $[N] | Includes [N]% risk buffer |
| Pessimistic | $[N] | 2 major scope additions, 2 month delay |

## AI Augmentation Impact

Without AI tools: $[N]
With AI tools ($[N]/mo tooling): $[N] (saving: $[N], [N]%)

## Assumptions

- [Rate assumption]
- [Allocation assumption]
- [Tooling assumption]
```
