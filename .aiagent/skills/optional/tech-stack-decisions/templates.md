# Tech Stack Decision Templates

Reusable templates for technology evaluation and documentation.

---

## Technology Comparison Matrix

```markdown
# Technology Comparison: {Category}

## Context

{Brief description of why this comparison is needed}

## Candidates

| Option | Description | Website |
|--------|-------------|---------|
| {Option A} | {Brief description} | {URL} |
| {Option B} | {Brief description} | {URL} |
| {Option C} | {Brief description} | {URL} |

## Evaluation Criteria

| Criterion | Weight (1-5) | Description |
|-----------|--------------|-------------|
| {Criterion 1} | {weight} | {What this measures} |
| {Criterion 2} | {weight} | {What this measures} |
| {Criterion 3} | {weight} | {What this measures} |

## Scores

| Criterion | Weight | {Option A} | {Option B} | {Option C} |
|-----------|--------|------------|------------|------------|
| {Criterion 1} | {w} | {1-5} | {1-5} | {1-5} |
| {Criterion 2} | {w} | {1-5} | {1-5} | {1-5} |
| {Criterion 3} | {w} | {1-5} | {1-5} | {1-5} |
| **Weighted Total** | | {sum} | {sum} | {sum} |

## Analysis

### {Option A}
**Pros:**
- {Pro 1}
- {Pro 2}

**Cons:**
- {Con 1}
- {Con 2}

### {Option B}
...

## Recommendation

{Recommended option and rationale}

## Decision

{Final decision, may differ from recommendation based on discussion}
```

---

## Technology ADR (Architecture Decision Record)

```markdown
# ADR-{NUMBER}: {Technology Decision Title}

## Status

{Proposed | Accepted | Deprecated | Superseded by ADR-XXX}

## Date

{YYYY-MM-DD}

## Context

{Describe the technical context and problem that requires a technology decision.}

## Decision Drivers

- {Driver 1: e.g., "Need to reduce build times"}
- {Driver 2: e.g., "Team lacks expertise in current solution"}
- {Driver 3: e.g., "Current solution doesn't scale"}

## Considered Options

1. {Option 1}
2. {Option 2}
3. {Option 3}

## Decision

We will use **{chosen option}**.

## Rationale

{Explain why this option was chosen over alternatives}

### Why not {Option 2}?
{Explanation}

### Why not {Option 3}?
{Explanation}

## Consequences

### Positive
- {Positive consequence 1}
- {Positive consequence 2}

### Negative
- {Negative consequence 1}
- {Negative consequence 2}

### Risks
- {Risk 1 and mitigation}
- {Risk 2 and mitigation}

## Implementation Notes

{Any specific guidance for implementing this decision}

## Review Date

{When this decision should be revisited, if applicable}
```

---

## Proof of Concept (POC) Plan

```markdown
# POC: {Technology Name}

## Objective

{What are we trying to learn/validate?}

## Success Criteria

- [ ] {Criterion 1: e.g., "Can handle 1000 requests/second"}
- [ ] {Criterion 2: e.g., "Integrates with our auth system"}
- [ ] {Criterion 3: e.g., "Team can be productive within 1 day"}

## Scope

### In Scope
- {What will be tested}
- {What will be built}

### Out of Scope
- {What will NOT be tested}
- {What is deferred}

## Timeline

| Phase | Duration | Activities |
|-------|----------|------------|
| Setup | {X days} | {Environment, dependencies} |
| Build | {X days} | {Core functionality} |
| Test | {X days} | {Validation against criteria} |
| Document | {X days} | {Findings, recommendation} |

## Resources

- {Person 1}: {Role/responsibility}
- {Person 2}: {Role/responsibility}

## Test Scenarios

### Scenario 1: {Name}
- **Setup**: {What needs to be in place}
- **Action**: {What to do}
- **Expected**: {What should happen}

### Scenario 2: {Name}
...

## Evaluation Criteria

| Criterion | Target | Actual | Pass/Fail |
|-----------|--------|--------|-----------|
| {Performance metric} | {target} | | |
| {Ease of use metric} | {target} | | |

## Findings

{To be filled after POC}

## Recommendation

{Go / No-Go / Conditional recommendation}
```

---

## Technology Evaluation Checklist

```markdown
# Evaluation: {Technology Name}

## Basic Information

| Attribute | Value |
|-----------|-------|
| Name | {Technology name} |
| Version evaluated | {Version} |
| License | {License type} |
| Website | {URL} |
| Repository | {GitHub/GitLab URL} |

## Maturity Assessment

| Indicator | Value | Notes |
|-----------|-------|-------|
| Years in production | | |
| GitHub stars | | |
| NPM weekly downloads | | |
| Stack Overflow questions | | |
| Major companies using | | |
| Last release date | | |
| Release frequency | | |

## Community Health

- [ ] Active maintainers (commits in last 3 months)
- [ ] Issues being addressed (response time)
- [ ] Pull requests being reviewed
- [ ] Documentation is current
- [ ] Community channels exist (Discord, Slack, etc.)

## Technical Evaluation

### Functionality
- [ ] Meets core requirements
- [ ] {Specific feature 1}
- [ ] {Specific feature 2}

### Performance
- [ ] Meets performance requirements
- [ ] Benchmarks available/verified

### Security
- [ ] No known critical vulnerabilities
- [ ] Security policy exists
- [ ] Regular security updates

### Integration
- [ ] Works with our stack
- [ ] {Specific integration 1}
- [ ] {Specific integration 2}

## Operational Considerations

- [ ] Monitoring/observability support
- [ ] Logging support
- [ ] Configuration management
- [ ] Deployment complexity
- [ ] Scaling approach

## Team Assessment

- [ ] Existing team expertise
- [ ] Learning resources available
- [ ] Training requirements identified
- [ ] Hiring market assessed

## Cost Analysis

| Cost Type | Estimate | Notes |
|-----------|----------|-------|
| Licensing | | |
| Infrastructure | | |
| Training | | |
| Migration | | |
| Ongoing maintenance | | |

## Summary

| Category | Score (1-5) | Notes |
|----------|-------------|-------|
| Functionality | | |
| Maturity | | |
| Community | | |
| Team fit | | |
| Cost | | |
| **Overall** | | |

## Recommendation

{Adopt | Trial | Assess | Hold}
```

---

## Migration Plan Template

```markdown
# Migration Plan: {From} to {To}

## Overview

| Attribute | Value |
|-----------|-------|
| Current technology | {What we're migrating from} |
| Target technology | {What we're migrating to} |
| Estimated duration | {Timeline} |
| Risk level | {Low/Medium/High} |

## Motivation

{Why are we doing this migration?}

## Scope

### Systems Affected
- {System 1}
- {System 2}

### Data to Migrate
- {Data type 1}: {Volume}
- {Data type 2}: {Volume}

## Phases

### Phase 1: Preparation ({Duration})
- [ ] {Task 1}
- [ ] {Task 2}

### Phase 2: Implementation ({Duration})
- [ ] {Task 1}
- [ ] {Task 2}

### Phase 3: Validation ({Duration})
- [ ] {Task 1}
- [ ] {Task 2}

### Phase 4: Cutover ({Duration})
- [ ] {Task 1}
- [ ] {Task 2}

### Phase 5: Cleanup ({Duration})
- [ ] {Task 1}
- [ ] {Task 2}

## Rollback Plan

{How to revert if things go wrong}

## Risk Assessment

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| {Risk 1} | {L/M/H} | {L/M/H} | {How to mitigate} |

## Success Criteria

- [ ] {Criterion 1}
- [ ] {Criterion 2}
- [ ] {Criterion 3}

## Communication Plan

| Audience | Message | Timing |
|----------|---------|--------|
| {Stakeholders} | {What to communicate} | {When} |
```
