# Business Architecture Templates

Artifact templates for TOGAF Phase B deliverables.

---

## Business Capability Map Template

```markdown
# Business Capability Map

**Organization**: {organization_name}
**Version**: {version}
**Date**: {date}

---

## Level 0: Enterprise Capabilities

```
┌──────────────────────────────────────────────────────────────────────┐
│                        {ORGANIZATION NAME}                           │
├──────────────────────────────────────────────────────────────────────┤
│  STRATEGIC CAPABILITIES  │  CORE CAPABILITIES  │  SUPPORTING CAPS   │
├──────────────────────────┼─────────────────────┼────────────────────┤
│ • Strategy & Planning    │ • {Core Cap 1}      │ • Finance          │
│ • Innovation             │ • {Core Cap 2}      │ • HR               │
│ • Governance             │ • {Core Cap 3}      │ • IT               │
│ • Risk Management        │ • {Core Cap 4}      │ • Legal            │
└──────────────────────────┴─────────────────────┴────────────────────┘
```

---

## Level 1: {Core Capability Name}

| L2 Capability | Description | Maturity | Strategic Importance |
|---------------|-------------|----------|---------------------|
| {Sub-cap 1} | {description} | {1-5} | {High/Med/Low} |
| {Sub-cap 2} | {description} | {1-5} | {High/Med/Low} |
| {Sub-cap 3} | {description} | {1-5} | {High/Med/Low} |

### Capability Heatmap

```
┌───────────────┬───────────────┬───────────────┐
│   {Sub 1}     │   {Sub 2}     │   {Sub 3}     │
│   🟢/🟡/🔴    │   🟢/🟡/🔴    │   🟢/🟡/🔴    │
├───────────────┼───────────────┼───────────────┤
│   {Sub 4}     │   {Sub 5}     │   {Sub 6}     │
│   🟢/🟡/🔴    │   🟢/🟡/🔴    │   🟢/🟡/🔴    │
└───────────────┴───────────────┴───────────────┘

Legend: 🟢 Strong (4-5) | 🟡 Adequate (3) | 🔴 Needs Work (1-2)
```

---

## Capability Detail

### {Capability Name}

| Attribute | Value |
|-----------|-------|
| **ID** | CAP-{number} |
| **Level** | {1/2/3} |
| **Parent** | {parent capability or "N/A"} |
| **Description** | {what this capability enables} |
| **Business Outcome** | {what success looks like} |
| **Owner** | {role/person} |
| **Maturity** | {1-5} |
| **Strategic Importance** | {Critical/High/Medium/Low} |

**Supporting Applications**: {list}

**Key Metrics**:
- {metric 1}: {current value}
- {metric 2}: {current value}

**Known Gaps**:
- {gap 1}
- {gap 2}
```

---

## Value Stream Map Template

```markdown
# Value Stream Map

**Value Stream**: {name}
**Customer Segment**: {who benefits}
**Value Proposition**: {what value is delivered}

---

## Value Stream Stages

```
Trigger: {what initiates the value stream}

┌──────────┐    ┌──────────┐    ┌──────────┐    ┌──────────┐
│ Stage 1  │───▶│ Stage 2  │───▶│ Stage 3  │───▶│ Stage 4  │
│ {name}   │    │ {name}   │    │ {name}   │    │ {name}   │
└──────────┘    └──────────┘    └──────────┘    └──────────┘
     │               │               │               │
    ───             ───             ───             ───
 {time}          {time}          {time}          {time}

Total Cycle Time: {sum}
Value-Add Time: {sum of value-adding only}
```

---

## Stage Details

### Stage 1: {Stage Name}

| Attribute | Value |
|-----------|-------|
| **Triggering Event** | {what starts this stage} |
| **Participating Stakeholders** | {who is involved} |
| **Entrance Criteria** | {what must be true to start} |
| **Exit Criteria** | {what must be true to complete} |
| **Cycle Time** | {duration} |
| **Value-Adding?** | {Yes/No} |

**Capabilities Required**:
- {capability 1}
- {capability 2}

**Pain Points (Current State)**:
1. {pain point 1}
2. {pain point 2}

**Improvement Opportunities**:
1. {opportunity 1}
2. {opportunity 2}

---

## Value Stream Metrics

| Metric | Current | Target | Gap |
|--------|---------|--------|-----|
| End-to-end cycle time | {value} | {value} | {diff} |
| Value-add ratio | {%} | {%} | {diff} |
| First-pass yield | {%} | {%} | {diff} |
| Customer satisfaction | {score} | {score} | {diff} |
```

---

## Business Process Model Template

```markdown
# Business Process Model

**Process Name**: {name}
**Process ID**: BP-{number}
**Owner**: {role}
**Version**: {version}

---

## Process Overview

| Attribute | Value |
|-----------|-------|
| **Purpose** | {why this process exists} |
| **Trigger** | {what initiates the process} |
| **Frequency** | {how often it runs} |
| **Average Duration** | {time} |
| **Inputs** | {list} |
| **Outputs** | {list} |

---

## Process Flow

```
┌─────┐
│Start│
└──┬──┘
   │
   ▼
┌──────────────┐
│ Step 1       │  Actor: {role}
│ {action}     │  System: {system}
└──────┬───────┘
       │
       ▼
   ◇───────◇
   │Decision│
   ◇───────◇
   │Yes     │No
   ▼        ▼
┌──────┐  ┌──────┐
│Step 2│  │Step 3│
└──────┘  └──────┘
   │        │
   └────┬───┘
        ▼
    ○───────○
    │  End  │
    ○───────○
```

---

## Process Steps

### Step 1: {Step Name}

| Attribute | Value |
|-----------|-------|
| **Actor** | {role/system} |
| **Action** | {what happens} |
| **System** | {supporting system} |
| **Input** | {what's needed} |
| **Output** | {what's produced} |
| **Business Rules** | {rules applied} |
| **Exceptions** | {what can go wrong} |

---

## Process Metrics

| Metric | Current | Target |
|--------|---------|--------|
| Cycle Time | {value} | {value} |
| Error Rate | {%} | {%} |
| Automation Level | {%} | {%} |
| Cost per Transaction | {$} | {$} |

---

## RACI Matrix

| Step | {Role 1} | {Role 2} | {Role 3} | {System} |
|------|----------|----------|----------|----------|
| Step 1 | R | A | C | I |
| Step 2 | A | R | I | C |
| Step 3 | I | R | A | R |

R = Responsible, A = Accountable, C = Consulted, I = Informed
```

---

## Organization Map Template

```markdown
# Organization Map

**Scope**: {organization unit}
**Date**: {date}

---

## Organization Structure

```
                    ┌─────────────────┐
                    │ {Executive}     │
                    │ {Title}         │
                    └────────┬────────┘
                             │
         ┌───────────────────┼───────────────────┐
         │                   │                   │
┌────────▼────────┐ ┌────────▼────────┐ ┌────────▼────────┐
│ {Dept 1}        │ │ {Dept 2}        │ │ {Dept 3}        │
│ {Leader}        │ │ {Leader}        │ │ {Leader}        │
│ FTE: {count}    │ │ FTE: {count}    │ │ FTE: {count}    │
└────────┬────────┘ └────────┬────────┘ └────────┬────────┘
         │                   │                   │
    ┌────┴────┐         ┌────┴────┐         ┌────┴────┐
    │ Team 1  │         │ Team 1  │         │ Team 1  │
    │ Team 2  │         │ Team 2  │         │ Team 2  │
    └─────────┘         └─────────┘         └─────────┘
```

---

## Capability-Organization Mapping

| Capability | Primary Owner | Contributing Units |
|------------|---------------|-------------------|
| {Cap 1} | {Dept} | {Other depts} |
| {Cap 2} | {Dept} | {Other depts} |

---

## Role Definitions

### {Role Name}

| Attribute | Value |
|-----------|-------|
| **Department** | {department} |
| **Reports To** | {role} |
| **Headcount** | {number} |
| **Location(s)** | {locations} |

**Key Responsibilities**:
- {responsibility 1}
- {responsibility 2}

**Capabilities Supported**:
- {capability 1}
- {capability 2}

**Key Skills Required**:
- {skill 1}
- {skill 2}
```

---

## Gap Analysis Template

```markdown
# Business Architecture Gap Analysis

**Initiative**: {name}
**Date**: {date}

---

## Capability Gaps

| ID | Capability | Baseline | Target | Gap Description | Priority |
|----|------------|----------|--------|-----------------|----------|
| G-001 | {cap} | {state} | {state} | {description} | {H/M/L} |
| G-002 | {cap} | {state} | {state} | {description} | {H/M/L} |

### Gap Detail: G-{number}

**Capability**: {name}

| Current State | Target State |
|---------------|--------------|
| {description} | {description} |

**Impact of Gap**:
- {impact 1}
- {impact 2}

**Resolution Approach**:
- {approach}

**Dependencies**:
- {dependency 1}

**Estimated Effort**: {S/M/L/XL}

---

## Process Gaps

| Process | Gap Type | Description | Business Impact |
|---------|----------|-------------|-----------------|
| {process} | {Automation/Integration/New/Remove} | {description} | {impact} |

---

## Organization Gaps

| Area | Gap Type | Current | Target | Resolution |
|------|----------|---------|--------|------------|
| Skills | {type} | {current} | {target} | {how to resolve} |
| Roles | {type} | {current} | {target} | {how to resolve} |
| Structure | {type} | {current} | {target} | {how to resolve} |

---

## Gap Summary

| Category | Critical | High | Medium | Low | Total |
|----------|----------|------|--------|-----|-------|
| Capability | {n} | {n} | {n} | {n} | {n} |
| Process | {n} | {n} | {n} | {n} | {n} |
| Organization | {n} | {n} | {n} | {n} | {n} |
| **Total** | **{n}** | **{n}** | **{n}** | **{n}** | **{n}** |
```

---

## Business Service Catalog Template

```markdown
# Business Service Catalog

**Organization**: {name}
**Version**: {version}

---

## Service Summary

| Service ID | Service Name | Category | Status |
|------------|--------------|----------|--------|
| SVC-001 | {name} | {category} | {Active/Planned/Retiring} |
| SVC-002 | {name} | {category} | {status} |

---

## Service Detail

### SVC-{number}: {Service Name}

| Attribute | Value |
|-----------|-------|
| **Category** | {category} |
| **Description** | {what the service does} |
| **Service Owner** | {role} |
| **Consumers** | {who uses it} |
| **Status** | {Active/Planned/Retiring} |

**Service Levels**:

| Metric | Target | Current |
|--------|--------|---------|
| Availability | {%} | {%} |
| Response Time | {time} | {time} |
| Throughput | {volume} | {volume} |

**Channels**:
- {channel 1}
- {channel 2}

**Supporting Capabilities**:
- {capability 1}
- {capability 2}

**Dependencies**:
- {dependency 1}
```

---

## Work Package Template

```markdown
# Work Package Definition

**Work Package ID**: WP-B-{number}
**Name**: {name}
**Phase**: B - Business Architecture

---

## Overview

| Attribute | Value |
|-----------|-------|
| **Description** | {what this work package delivers} |
| **Business Outcome** | {why it matters} |
| **Sponsor** | {role} |
| **Lead** | {role} |

---

## Gaps Addressed

| Gap ID | Gap Description |
|--------|-----------------|
| G-{n} | {description} |
| G-{n} | {description} |

---

## Scope

**In Scope**:
- {item 1}
- {item 2}

**Out of Scope**:
- {item 1}
- {item 2}

---

## Dependencies

| Dependency | Type | Description |
|------------|------|-------------|
| WP-{n} | Predecessor | {must complete first} |
| WP-{n} | Parallel | {can run together} |

---

## Estimates

| Attribute | Estimate |
|-----------|----------|
| Duration | {weeks/months} |
| Effort | {person-days} |
| Cost | {$} |

---

## Risks

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| {risk} | {H/M/L} | {H/M/L} | {action} |
```
