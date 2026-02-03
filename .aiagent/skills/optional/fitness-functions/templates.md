# Fitness Functions Templates

Reusable templates for fitness function documentation and implementation.

---

## Fitness Function Specification Template

```yaml
# Fitness Function Specification
# ================================

id: FF-[category]-[number]  # e.g., FF-PERF-001
name: [Descriptive Name]
version: 1.0
last_updated: [YYYY-MM-DD]
owner: [Team/Person]

# Classification
# --------------
attribute: [Quality attribute being measured]
category: [deployment|performance|reliability|security|scalability|maintainability|coupling|data]
scope: [atomic|holistic|composite]
trigger: [continuous|triggered|temporal|manual]
automation: [automated|semi-automated|manual]

# Measurement
# -----------
description: |
  [Clear description of what this function measures and why it matters]

measurement_method: |
  [How the measurement is performed]

data_source: [Where data comes from]
tool: [Tool(s) used for measurement]
calculation: |
  [Formula or algorithm for calculation]

# Thresholds
# ----------
thresholds:
  target:
    value: [target value]
    operator: [<|<=|=|>=|>]
    description: Desired state
  warning:
    value: [warning threshold]
    operator: [<|<=|=|>=|>]
    description: Degradation alert
  critical:
    value: [critical threshold]
    operator: [<|<=|=|>=|>]
    description: Immediate action required

# Baseline
# --------
baseline:
  value: [measured baseline]
  date: [measurement date]
  conditions: [measurement conditions]
  confidence: [high|medium|low]

# Rationale
# ---------
rationale: |
  [Why this target was chosen, business justification]

# Dependencies
# ------------
dependencies:
  - [Other fitness functions this depends on]
  - [Required infrastructure]

# Notes
# -----
notes: |
  [Additional context, caveats, known limitations]
```

---

## Quality Attribute Prioritization Template

```markdown
# Quality Attribute Prioritization

## System Context
- **System Name**: [name]
- **Assessment Date**: [date]
- **Assessors**: [names]

## Stakeholder Requirements

### Business Stakeholders
| Stakeholder | Key Concerns | Quality Implications |
|-------------|--------------|---------------------|
| [Role] | [Their concerns] | [Implied quality needs] |

### Technical Stakeholders
| Stakeholder | Key Concerns | Quality Implications |
|-------------|--------------|---------------------|
| [Role] | [Their concerns] | [Implied quality needs] |

## Candidate Quality Attributes

| Attribute | Business Impact (1-5) | Technical Risk (1-5) | Priority Score | Rank |
|-----------|----------------------|---------------------|----------------|------|
| Performance | | | | |
| Reliability | | | | |
| Security | | | | |
| Scalability | | | | |
| Maintainability | | | | |
| Deployability | | | | |
| Testability | | | | |
| Observability | | | | |

**Scoring Guide:**
- Business Impact: 5 = Revenue/reputation critical, 1 = Nice to have
- Technical Risk: 5 = High probability of issues, 1 = Well under control

## Selected Priority Attributes

1. **[Attribute 1]**
   - Priority Score: [X]
   - Rationale: [Why this is critical]
   - Key Fitness Functions: [List]

2. **[Attribute 2]**
   - Priority Score: [X]
   - Rationale: [Why this is critical]
   - Key Fitness Functions: [List]

[Continue for top 5-7 attributes]

## Approval

| Role | Name | Date | Signature |
|------|------|------|-----------|
| Business Sponsor | | | |
| Technical Lead | | | |
| Architecture | | | |
```

---

## Fitness Function Catalog Template

```markdown
# Fitness Function Catalog

## System: [System Name]
## Last Updated: [Date]
## Owner: [Architecture Team]

---

## Overview

| Category | Count | Automated | Coverage |
|----------|-------|-----------|----------|
| Deployment | | | |
| Performance | | | |
| Reliability | | | |
| Security | | | |
| Scalability | | | |
| Maintainability | | | |
| Coupling | | | |
| Data | | | |
| **Total** | | | |

---

## Deployment Functions

### FF-DEPL-001: Deployment Frequency
| Property | Value |
|----------|-------|
| Attribute | Deployability |
| Measurement | Deployments per week |
| Target | ≥ 5 per week |
| Warning | < 3 per week |
| Critical | < 1 per week |
| Automation | Automated (CI/CD metrics) |
| Status | ✅ Active |

### FF-DEPL-002: Lead Time for Changes
| Property | Value |
|----------|-------|
| Attribute | Deployability |
| Measurement | Commit to production (median) |
| Target | < 1 day |
| Warning | > 3 days |
| Critical | > 7 days |
| Automation | Automated (Git + deploy tracking) |
| Status | ✅ Active |

[Continue for each function...]

---

## Performance Functions

### FF-PERF-001: Response Time P95
| Property | Value |
|----------|-------|
| Attribute | Performance |
| Measurement | 95th percentile response time |
| Target | < 200ms |
| Warning | > 300ms |
| Critical | > 500ms |
| Automation | Automated (APM) |
| Status | ✅ Active |

[Continue for each category...]

---

## Composite Functions

### FF-COMP-001: Overall System Health
| Property | Value |
|----------|-------|
| Components | Performance (30%), Reliability (30%), Security (25%), Maintainability (15%) |
| Calculation | Weighted average of component scores (0-100) |
| Target | ≥ 80 |
| Warning | < 70 |
| Critical | < 50 |
| Frequency | Weekly |
| Status | ✅ Active |

---

## Function Status Legend

| Status | Meaning |
|--------|---------|
| ✅ Active | Function operational and measured |
| ⚠️ Degraded | Measurement issues or below threshold |
| 🔧 In Development | Being implemented |
| ⏸️ Paused | Temporarily suspended |
| ❌ Retired | No longer relevant |
```

---

## Fitness Dashboard Template

```markdown
# Fitness Dashboard

## System: [System Name]
## Report Period: [Date Range]
## Generated: [Timestamp]

---

## Executive Summary

**Overall Fitness Score: [XX]/100** [↑↓→] [change from last period]

| Category | Score | Trend | Status |
|----------|-------|-------|--------|
| Deployment | /100 | | |
| Performance | /100 | | |
| Reliability | /100 | | |
| Security | /100 | | |
| Maintainability | /100 | | |

**Key Highlights:**
- ✅ [Positive highlight]
- ⚠️ [Area needing attention]
- 🎯 [Progress toward goal]

---

## Detailed Status

### Deployment Metrics

```
Deployment Frequency    [████████░░] 80%   Target: 5/week   Current: 4/week
Lead Time for Changes   [██████░░░░] 60%   Target: <1 day   Current: 1.5 days
Change Failure Rate     [█████████░] 90%   Target: <15%     Current: 8%
MTTR                    [███████░░░] 70%   Target: <1 hour  Current: 1.2 hours
```

### Performance Metrics

```
Response Time P95       [████████░░] 80%   Target: <200ms   Current: 180ms
Throughput              [█████████░] 90%   Target: >1000rps Current: 1200rps
Error Rate              [██████████] 100%  Target: <0.1%    Current: 0.02%
Database Query Time     [██████░░░░] 60%   Target: <50ms    Current: 65ms
```

[Continue for each category...]

---

## Trend Analysis

### 90-Day Trend: Overall Fitness

```
100 |
 90 |            ___________
 80 |      _____/           \____
 70 |_____/                      \___
 60 |
    +----+----+----+----+----+----+--
    Jan  Feb  Mar  Apr  May  Jun
```

### Notable Trends
- **Improving**: [List functions with positive trend]
- **Stable**: [List functions maintaining target]
- **Declining**: [List functions needing attention]

---

## Threshold Breaches

| Function | Threshold | Current | Duration | Action |
|----------|-----------|---------|----------|--------|
| [Name] | [Level] | [Value] | [Time] | [Action taken/needed] |

---

## Recommendations

### Immediate Actions (This Week)
1. [Action with owner and deadline]

### Short-term Improvements (This Month)
1. [Action with owner and deadline]

### Strategic Initiatives (This Quarter)
1. [Action with owner and deadline]
```

---

## Baseline Report Template

```markdown
# Fitness Function Baseline Report

## System: [System Name]
## Baseline Date: [Date]
## Conducted By: [Names]

---

## Executive Summary

This report establishes baseline measurements for fitness functions
prior to [migration/improvement initiative/new monitoring].

**Key Findings:**
- [Summary finding 1]
- [Summary finding 2]
- [Summary finding 3]

---

## Measurement Conditions

| Condition | Value |
|-----------|-------|
| Date Range | [Start] to [End] |
| Load Characteristics | [Normal/Peak/etc.] |
| Environment | [Production/Staging] |
| Sample Size | [Number of data points] |
| Exclusions | [Any excluded periods/data] |

---

## Baseline Measurements

### Performance

| Function | Baseline | Industry Benchmark | Gap | Confidence |
|----------|----------|-------------------|-----|------------|
| Response Time P50 | ms | ms | % | |
| Response Time P95 | ms | ms | % | |
| Response Time P99 | ms | ms | % | |
| Throughput | rps | rps | % | |
| Error Rate | % | % | % | |

**Observations:**
- [Key observations about performance baseline]

### Reliability

| Function | Baseline | Industry Benchmark | Gap | Confidence |
|----------|----------|-------------------|-----|------------|
| Availability | % | % | % | |
| MTBF | hours | hours | % | |
| MTTR | minutes | minutes | % | |

**Observations:**
- [Key observations about reliability baseline]

[Continue for each category...]

---

## Recommended Targets

Based on baseline analysis, recommended targets:

| Function | Baseline | Recommended Target | Timeline | Effort |
|----------|----------|-------------------|----------|--------|
| | | | | |

---

## Next Steps

1. [ ] Review and approve recommended targets
2. [ ] Implement measurement automation
3. [ ] Create monitoring dashboards
4. [ ] Schedule first fitness review
```

---

## Fitness-Guided Migration Template

```markdown
# Fitness-Guided Migration Plan

## Migration: [Migration Name]
## Source: [Current State]
## Target: [Future State]
## Date: [Date]

---

## Fitness Preservation Strategy

### Non-Negotiable Fitness (Must Not Degrade)

| Function | Current | Minimum Acceptable | Rationale |
|----------|---------|-------------------|-----------|
| | | | |

### Expected Improvements

| Function | Current | Target | Expected Improvement |
|----------|---------|--------|---------------------|
| | | | |

### Acceptable Temporary Degradation

| Function | Current | Acceptable During Migration | Recovery Target |
|----------|---------|----------------------------|-----------------|
| | | | |

---

## Migration Phases with Fitness Gates

### Phase 1: [Phase Name]

**Scope:** [What happens in this phase]

**Pre-Phase Fitness:**
| Function | Required Value | Check Method |
|----------|---------------|--------------|
| | | |

**Post-Phase Fitness Gate:**
| Function | Must Achieve | Rollback Trigger |
|----------|-------------|------------------|
| | | |

**Proceed Criteria:** [All conditions to proceed to Phase 2]

### Phase 2: [Phase Name]
[Repeat structure...]

---

## Fitness Monitoring During Migration

| Phase | Monitoring Frequency | Dashboard Link | Alert Threshold |
|-------|---------------------|----------------|-----------------|
| 1 | Every 5 minutes | [link] | [threshold] |
| 2 | Every 5 minutes | [link] | [threshold] |

---

## Rollback Triggers

| Condition | Automatic Rollback | Manual Decision |
|-----------|-------------------|-----------------|
| Any critical threshold | ✅ | |
| 2+ warning thresholds | | ✅ |
| [Custom condition] | | ✅ |

---

## Success Criteria

Migration is successful when:
- [ ] All non-negotiable fitness maintained
- [ ] Expected improvements achieved
- [ ] No critical incidents during migration
- [ ] Fitness stable for [X] days post-migration
```

---

## CI/CD Fitness Gate Template

```yaml
# Fitness Gate Configuration
# Add to CI/CD pipeline configuration

fitness_gates:
  # Performance gate
  - name: performance-gate
    stage: pre-deploy
    checks:
      - metric: response_time_p95
        threshold: 200
        operator: lt
        unit: ms
      - metric: error_rate
        threshold: 1
        operator: lt
        unit: percent
    on_failure: block

  # Security gate
  - name: security-gate
    stage: pre-deploy
    checks:
      - metric: critical_vulnerabilities
        threshold: 0
        operator: eq
      - metric: high_vulnerabilities
        threshold: 5
        operator: lt
    on_failure: block

  # Maintainability gate
  - name: maintainability-gate
    stage: post-test
    checks:
      - metric: cyclomatic_complexity
        threshold: 15
        operator: lt
      - metric: test_coverage
        threshold: 80
        operator: gt
        unit: percent
      - metric: duplicate_code
        threshold: 5
        operator: lt
        unit: percent
    on_failure: warn

  # Dependency gate
  - name: dependency-gate
    stage: pre-deploy
    checks:
      - metric: dependency_age_max
        threshold: 180
        operator: lt
        unit: days
      - metric: deprecated_dependencies
        threshold: 0
        operator: eq
    on_failure: warn
```

---

## Fitness Review Meeting Agenda Template

```markdown
# Fitness Review Meeting

## Meeting Details
- **Date**: [Date]
- **Attendees**: [Names]
- **Duration**: 60 minutes

---

## Agenda

### 1. Overall Status (10 min)
- Review overall fitness score
- Highlight changes since last review
- Identify any critical issues

### 2. Category Deep Dive (30 min)

#### Performance (5 min)
- Current status vs targets
- Trends and concerns
- Actions needed

#### Reliability (5 min)
- [Same structure]

#### Security (5 min)
- [Same structure]

#### [Other categories] (15 min)
- [Same structure]

### 3. Incidents and Learnings (10 min)
- Review any threshold breaches
- Discuss root causes
- Identify preventive measures

### 4. Target Review (5 min)
- Are current targets appropriate?
- Any targets need adjustment?

### 5. Actions and Owners (5 min)
- Assign actions with owners
- Set deadlines
- Confirm next review date

---

## Pre-Meeting Preparation
- [ ] Generate fitness dashboard report
- [ ] List threshold breaches since last review
- [ ] Prepare trend analysis
- [ ] Gather improvement proposals
```

---

## Composite Fitness Function Template

```yaml
# Composite Fitness Function Definition

id: FF-COMP-[number]
name: [Composite Function Name]
version: 1.0
last_updated: [YYYY-MM-DD]
owner: [Team/Person]

# Composition
# -----------
components:
  - function_id: FF-PERF-001
    name: Response Time P95
    weight: 0.25
    normalization:
      method: linear_inverse  # lower is better
      min: 0
      max: 500
      target: 200

  - function_id: FF-REL-001
    name: Availability
    weight: 0.25
    normalization:
      method: linear  # higher is better
      min: 95
      max: 100
      target: 99.9

  - function_id: FF-SEC-001
    name: Vulnerability Score
    weight: 0.30
    normalization:
      method: linear_inverse
      min: 0
      max: 100
      target: 0

  - function_id: FF-MAINT-001
    name: Code Quality Score
    weight: 0.20
    normalization:
      method: linear
      min: 0
      max: 100
      target: 80

# Calculation
# -----------
calculation: |
  For each component:
    1. Normalize raw value to 0-100 scale
    2. Apply weight

  composite_score = sum(normalized_value * weight)

missing_component_handling: |
  If component unavailable:
    - Use last known value if < 24 hours old
    - Otherwise exclude and redistribute weights

# Thresholds
# ----------
thresholds:
  target:
    value: 80
    operator: gte
  warning:
    value: 70
    operator: lt
  critical:
    value: 50
    operator: lt

# Reporting
# ---------
reporting:
  frequency: weekly
  breakdown: true  # Show component contribution
  trend_period: 90 days
```
