# Opportunities and Solutions Templates

Artifact templates for TOGAF Phase E deliverables.

---

## Consolidated Gap Register Template

```markdown
# Consolidated Gap Register

**Initiative**: {name}
**Version**: {version}
**Date**: {date}

---

## Gap Summary

| Domain | Critical | High | Medium | Low | Total |
|--------|----------|------|--------|-----|-------|
| Business | {n} | {n} | {n} | {n} | {n} |
| Data | {n} | {n} | {n} | {n} | {n} |
| Application | {n} | {n} | {n} | {n} | {n} |
| Technology | {n} | {n} | {n} | {n} | {n} |
| **Total** | **{n}** | **{n}** | **{n}** | **{n}** | **{n}** |

---

## Gap Register

| Gap ID | Domain | Category | Description | Priority | Related Gaps |
|--------|--------|----------|-------------|----------|--------------|
| G-{domain}-{nnn} | {domain} | {category} | {description} | {Crit/H/M/L} | {gap IDs} |

---

## Gap Clusters

### Cluster: {Cluster Name}

| Attribute | Value |
|-----------|-------|
| **Cluster ID** | CL-{nnn} |
| **Theme** | {common theme} |
| **Gaps Included** | {gap IDs} |
| **Business Capability** | {capability affected} |

**Common Resolution**: {how these gaps will be addressed together}

---

## Cross-Domain Dependencies

| Gap | Depends On | Dependency Type | Rationale |
|-----|------------|-----------------|-----------|
| {gap ID} | {gap ID} | {Technical/Data/Process} | {why dependency exists} |
```

---

## Building Block Catalog Template

```markdown
# Building Block Catalog

**Initiative**: {name}
**Version**: {version}
**Date**: {date}

---

## Architecture Building Blocks (ABBs)

### ABB-{nnn}: {Building Block Name}

| Attribute | Value |
|-----------|-------|
| **ID** | ABB-{nnn} |
| **Name** | {name} |
| **Type** | {Business/Data/Application/Technology} |
| **Description** | {what this building block provides} |
| **Gaps Addressed** | {gap IDs} |

**Interfaces**:
- {interface 1}
- {interface 2}

**Reuse Potential**:
- {where else this could be used}

---

## Solution Building Blocks (SBBs)

### SBB-{nnn}: {Solution Name}

| Attribute | Value |
|-----------|-------|
| **ID** | SBB-{nnn} |
| **Name** | {name} |
| **Implements** | ABB-{nnn} |
| **Technology** | {specific technology/product} |
| **Vendor** | {vendor or "In-house"} |
| **Deployment** | {on-prem/cloud/SaaS} |

**Specification**:
- {specific configuration}
- {sizing/capacity}

**Dependencies**:
- {other SBBs required}

**Cost Estimate**:
- Initial: {$}
- Annual: {$}
```

---

## Solution Options Analysis Template

```markdown
# Solution Options Analysis

**Gap Cluster**: {name}
**Gaps Addressed**: {gap IDs}
**Date**: {date}

---

## Options Considered

### Option 1: {Option Name}

| Attribute | Value |
|-----------|-------|
| **Approach** | {Build/Buy/Rent/Reuse/Partner} |
| **Description** | {what this option entails} |
| **Vendor/Technology** | {if applicable} |

**Pros**:
- {advantage 1}
- {advantage 2}

**Cons**:
- {disadvantage 1}
- {disadvantage 2}

**Estimates**:
| Metric | Value |
|--------|-------|
| Implementation Cost | {$} |
| Annual Running Cost | {$} |
| Time to Value | {months} |
| Team Size | {FTEs} |

---

## Evaluation Matrix

| Criterion | Weight | Opt 1 | Opt 2 | Opt 3 |
|-----------|--------|-------|-------|-------|
| Strategic Fit | {%} | {1-5} | {1-5} | {1-5} |
| Time to Value | {%} | {1-5} | {1-5} | {1-5} |
| Total Cost | {%} | {1-5} | {1-5} | {1-5} |
| Risk | {%} | {1-5} | {1-5} | {1-5} |
| Flexibility | {%} | {1-5} | {1-5} | {1-5} |
| Skills Available | {%} | {1-5} | {1-5} | {1-5} |
| **Weighted Score** | 100% | **{score}** | **{score}** | **{score}** |

---

## Recommendation

| Attribute | Value |
|-----------|-------|
| **Selected Option** | {option name} |
| **Rationale** | {why this option} |

**Alternatives Rejected**:
| Option | Reason |
|--------|--------|
| {option} | {reason not selected} |

**Conditions/Assumptions**:
- {condition 1}
- {condition 2}
```

---

## Dependency Matrix Template

```markdown
# Dependency Matrix

**Initiative**: {name}
**Date**: {date}

---

## Work Package Dependencies

|            | WP-001 | WP-002 | WP-003 | WP-004 | WP-005 |
|------------|--------|--------|--------|--------|--------|
| **WP-001** | - | | | | |
| **WP-002** | {type} | - | | | |
| **WP-003** | | {type} | - | | |
| **WP-004** | {type} | | {type} | - | |
| **WP-005** | | | | {type} | - |

**Legend**:
- FS = Finish-to-Start (predecessor must complete)
- SS = Start-to-Start (can start together)
- FF = Finish-to-Finish (must finish together)
- SF = Start-to-Finish (rare)

---

## Dependency Details

### {Work Package} depends on {Work Package}

| Attribute | Value |
|-----------|-------|
| **Type** | {FS/SS/FF/SF} |
| **Category** | {Technical/Resource/Business/External} |
| **Reason** | {why this dependency exists} |
| **Lag** | {time buffer if any} |
| **Risk if Violated** | {what happens if ignored} |

---

## External Dependencies

| Work Package | External Dependency | Type | Expected Date | Risk |
|--------------|---------------------|------|---------------|------|
| {WP} | {external item} | {Vendor/Regulatory/Partner} | {date} | {H/M/L} |

---

## Critical Path

```
{Work Package 1} ──▶ {Work Package 2} ──▶ {Work Package 4} ──▶ {Final}
                                              ▲
{Work Package 3} ─────────────────────────────┘
```

**Critical Path Duration**: {total weeks/months}
```

---

## Transition Architecture Template

```markdown
# Transition Architecture

**Transition ID**: TA-{n}
**Name**: {transition name}
**Target Date**: {date}

---

## Transition Overview

| Attribute | Value |
|-----------|-------|
| **Theme** | {what this transition achieves} |
| **Predecessor** | {Baseline or previous TA} |
| **Successor** | {Next TA or Target} |
| **Duration** | {time to reach this state} |

---

## Architecture State

### Changed Components

| Component | From (Baseline) | To (This Transition) |
|-----------|-----------------|----------------------|
| {component} | {current state} | {new state} |

### Unchanged Components

| Component | State | Notes |
|-----------|-------|-------|
| {component} | {state} | {why unchanged} |

### Retired Components

| Component | Retirement Date | Migration Path |
|-----------|-----------------|----------------|
| {component} | {date} | {how data/function migrated} |

---

## Transition Diagram

```
┌─────────────────────────────────────────────────────────────┐
│                 TRANSITION {n}: {NAME}                       │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  NEW                    CHANGED              UNCHANGED      │
│  ┌─────────┐           ┌─────────┐         ┌─────────┐     │
│  │ {new}   │           │{changed}│         │{same}   │     │
│  └─────────┘           └─────────┘         └─────────┘     │
│                                                             │
│  ┌─────────┐           ┌─────────┐         ┌─────────┐     │
│  │ {new}   │           │{changed}│         │{same}   │     │
│  └─────────┘           └─────────┘         └─────────┘     │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## Value Delivered

| Value | Stakeholder | Metric |
|-------|-------------|--------|
| {value delivered} | {who benefits} | {how measured} |

---

## Risks

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| {risk} | {H/M/L} | {H/M/L} | {action} |

---

## Work Packages Included

| Work Package | Description |
|--------------|-------------|
| WP-{n} | {description} |
```

---

## Work Package Portfolio Template

```markdown
# Work Package Portfolio

**Initiative**: {name}
**Version**: {version}
**Date**: {date}

---

## Portfolio Summary

| Transition | Work Packages | Total Effort | Total Cost |
|------------|---------------|--------------|------------|
| TA-1 | {count} | {person-days} | {$} |
| TA-2 | {count} | {person-days} | {$} |
| **Total** | **{count}** | **{person-days}** | **{$}** |

---

## Work Package List

| WP ID | Name | Transition | Priority | Duration | Cost |
|-------|------|------------|----------|----------|------|
| WP-E-{nnn} | {name} | TA-{n} | {H/M/L} | {weeks} | {$} |

---

## Work Package Detail

### WP-E-{nnn}: {Work Package Name}

| Attribute | Value |
|-----------|-------|
| **ID** | WP-E-{nnn} |
| **Name** | {name} |
| **Transition** | TA-{n} |
| **Description** | {what this delivers} |
| **Gaps Addressed** | {gap IDs} |
| **SBBs Delivered** | {SBB IDs} |

**Scope**:

| In Scope | Out of Scope |
|----------|--------------|
| {item} | {item} |

**Dependencies**:

| Type | Work Package | Description |
|------|--------------|-------------|
| Predecessor | WP-{n} | {must complete first} |
| Parallel | WP-{n} | {can run together} |

**Resources**:

| Resource | Requirement |
|----------|-------------|
| Team | {team name} |
| Skills | {skills needed} |
| External | {vendors/contractors} |

**Estimates**:

| Metric | Estimate |
|--------|----------|
| Duration | {weeks} |
| Effort | {person-days} |
| Cost | {$} |

**Risks**:

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| {risk} | {H/M/L} | {H/M/L} | {action} |

---

## Implementation Roadmap (Draft)

```
{Quarter}      {Quarter}      {Quarter}      {Quarter}
    │              │              │              │
    ▼              ▼              ▼              ▼
┌──────────────────────┐
│ WP-E-{nnn}: {name}   │
└──────────────────────┘
         ┌──────────────────────────────┐
         │ WP-E-{nnn}: {name}           │
         └──────────────────────────────┘
                    ┌──────────────────────────────┐
                    │ WP-E-{nnn}: {name}           │
                    └──────────────────────────────┘
```
```

---

## Implementation Factor Assessment Template

```markdown
# Implementation Factor Assessment

**Initiative**: {name}
**Date**: {date}

---

## Business Factors

| Factor | Assessment | Impact on Implementation |
|--------|------------|-------------------------|
| Urgency | {H/M/L} | {implications} |
| Stakeholder Buy-in | {H/M/L} | {implications} |
| Change Readiness | {H/M/L} | {implications} |
| Funding Availability | {H/M/L} | {implications} |

---

## Technical Factors

| Factor | Assessment | Impact on Implementation |
|--------|------------|-------------------------|
| Technical Complexity | {H/M/L} | {implications} |
| Integration Complexity | {H/M/L} | {implications} |
| Data Migration Volume | {H/M/L} | {implications} |
| Technology Maturity | {H/M/L} | {implications} |

---

## Resource Factors

| Factor | Assessment | Impact on Implementation |
|--------|------------|-------------------------|
| Skills Availability | {H/M/L} | {implications} |
| Team Capacity | {H/M/L} | {implications} |
| Vendor Availability | {H/M/L} | {implications} |
| Infrastructure Readiness | {H/M/L} | {implications} |

---

## Risk Factors

| Factor | Assessment | Impact on Implementation |
|--------|------------|-------------------------|
| Technical Risk | {H/M/L} | {implications} |
| Organizational Risk | {H/M/L} | {implications} |
| Dependency Risk | {H/M/L} | {implications} |
| External Risk | {H/M/L} | {implications} |

---

## Overall Assessment

| Dimension | Score (1-5) | Notes |
|-----------|-------------|-------|
| Business Readiness | {score} | {notes} |
| Technical Readiness | {score} | {notes} |
| Resource Readiness | {score} | {notes} |
| Risk Level | {score} | {notes} |
| **Overall** | **{avg}** | {overall assessment} |

**Recommendation**: {proceed/adjust/delay}
```
