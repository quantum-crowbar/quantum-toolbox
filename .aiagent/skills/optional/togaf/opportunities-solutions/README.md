# TOGAF Phase E: Opportunities and Solutions

Guidelines for identifying implementation approaches and consolidating gaps into projects.

---

## Overview

Phase E bridges architecture definition and implementation planning:

1. **Consolidate Gaps** - Combine gaps from Phases B, C, D
2. **Identify Solutions** - Determine how to address gaps
3. **Define Building Blocks** - Reusable solution components
4. **Create Transition Architectures** - Intermediate states
5. **Assess Dependencies** - Understand implementation order

```
Phase A (Vision) → Phase B-D (Architecture) → Phase E (Solutions) → Phase F (Planning)
                                                    ↑
                                               YOU ARE HERE
```

---

## When to Use This Skill

Use Phase E when you need to:

- Consolidate gaps from multiple architecture domains
- Identify solution alternatives
- Define reusable building blocks
- Plan transition states
- Assess make vs buy decisions
- Determine implementation dependencies

---

## Key Concepts

### Gap Consolidation

Combine gaps from all domains into a unified view:

```
┌─────────────────────────────────────────────────────────────┐
│                    GAP CONSOLIDATION                         │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  Phase B Gaps        Phase C Gaps        Phase D Gaps       │
│  (Business)          (Information)       (Technology)       │
│                                                             │
│  ┌─────────┐         ┌─────────┐         ┌─────────┐       │
│  │ Gap B1  │         │ Gap C1  │         │ Gap D1  │       │
│  │ Gap B2  │         │ Gap C2  │         │ Gap D2  │       │
│  │ Gap B3  │         │ Gap C3  │         │ Gap D3  │       │
│  └────┬────┘         └────┬────┘         └────┬────┘       │
│       │                   │                   │             │
│       └───────────────────┼───────────────────┘             │
│                           │                                 │
│                           ▼                                 │
│                 ┌─────────────────┐                        │
│                 │ Consolidated    │                        │
│                 │ Gap Register    │                        │
│                 └─────────────────┘                        │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Solution Building Blocks

Reusable components that address multiple gaps:

```
┌─────────────────────────────────────────────────────────────┐
│                   BUILDING BLOCKS                            │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  Architecture Building Blocks (ABB)                        │
│  ┌─────────────────────────────────────────────────────┐   │
│  │ Generic, reusable architecture components           │   │
│  │ Example: "Customer Data Service"                    │   │
│  └─────────────────────────────────────────────────────┘   │
│                           │                                 │
│                           ▼                                 │
│  Solution Building Blocks (SBB)                            │
│  ┌─────────────────────────────────────────────────────┐   │
│  │ Specific, implementable components                  │   │
│  │ Example: "Salesforce CRM with custom integration"   │   │
│  └─────────────────────────────────────────────────────┘   │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Transition Architectures

Intermediate states between baseline and target:

```
Baseline          Transition 1       Transition 2       Target
   │                   │                  │               │
   ▼                   ▼                  ▼               ▼
┌──────┐           ┌──────┐          ┌──────┐        ┌──────┐
│ AS-IS │ ───────▶ │ TA-1 │ ───────▶ │ TA-2 │ ─────▶ │TO-BE │
└──────┘           └──────┘          └──────┘        └──────┘

   Year 0           Year 1             Year 2          Year 3
```

**Why Transitions?**
- Large changes are risky
- Incremental value delivery
- Manage dependencies
- Reduce disruption

---

## Solution Options

### Make vs Buy Analysis

| Factor | Build | Buy | SaaS |
|--------|-------|-----|------|
| **Customization** | Full control | Limited | Very limited |
| **Time to Value** | Longer | Medium | Faster |
| **Initial Cost** | Higher | Medium | Lower |
| **Ongoing Cost** | Maintenance | Licenses | Subscription |
| **Risk** | Higher | Medium | Lower |
| **Expertise** | Need in-house | Vendor support | Vendor managed |

### Solution Categories

| Category | Description | When to Use |
|----------|-------------|-------------|
| **Buy** | Commercial off-the-shelf (COTS) | Standard capability, mature market |
| **Build** | Custom development | Unique requirements, competitive advantage |
| **Rent** | SaaS/Cloud service | Commodity capability, rapid deployment |
| **Reuse** | Existing internal solution | Already have capability elsewhere |
| **Partner** | Outsource/co-develop | Lack expertise, share risk |

---

## Dependency Analysis

### Types of Dependencies

```
┌─────────────────────────────────────────────────────────────┐
│                    DEPENDENCY TYPES                          │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  Technical Dependencies                                     │
│  ├── Infrastructure must exist before apps                 │
│  ├── Data models before data migration                     │
│  └── APIs before integrations                              │
│                                                             │
│  Business Dependencies                                      │
│  ├── Process changes before system changes                 │
│  ├── Training before go-live                               │
│  └── Organizational changes before ownership               │
│                                                             │
│  Resource Dependencies                                      │
│  ├── Same team, sequential projects                        │
│  ├── Budget phasing                                        │
│  └── Vendor availability                                   │
│                                                             │
│  External Dependencies                                      │
│  ├── Regulatory deadlines                                  │
│  ├── Partner readiness                                     │
│  └── Market timing                                         │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Dependency Matrix

```
              Project A    Project B    Project C    Project D
Project A         -            -            -            -
Project B        FS            -            -            -
Project C         -           SS            -            -
Project D        FF           FS           SS            -

FS = Finish-to-Start (B needs A to finish)
SS = Start-to-Start (C starts when B starts)
FF = Finish-to-Finish (D finishes when A finishes)
```

---

## Work Package Grouping

### Grouping Strategies

| Strategy | Description | When to Use |
|----------|-------------|-------------|
| **By Capability** | Group by business capability | Business-driven transformation |
| **By Domain** | Group by architecture domain | Technical modernization |
| **By Timeline** | Group by target date | Regulatory deadlines |
| **By Risk** | High-risk together for focus | Risk-sensitive initiatives |
| **By Team** | Group by delivery team | Resource optimization |

### From Gaps to Projects

```
Gaps                    Work Packages              Projects
────                    ─────────────              ────────
Gap B1 ─────┐
Gap B2 ─────┼──────▶ WP-001: Customer  ───┐
Gap C1 ─────┤        Platform           │
Gap C2 ─────┘                           ├──▶ Project Alpha
                                        │     (Customer Experience)
Gap C3 ─────┐                           │
Gap D1 ─────┼──────▶ WP-002: Integration ─┘
Gap D2 ─────┘        Layer

Gap B3 ─────┐
Gap D3 ─────┼──────▶ WP-003: Analytics  ───▶ Project Beta
            │        Platform                (Data & Analytics)
```

---

## Phase E Inputs

From previous phases:

| Input | Source | Usage |
|-------|--------|-------|
| Gap Analysis (Business) | Phase B | Gaps to address |
| Gap Analysis (IS) | Phase C | Gaps to address |
| Gap Analysis (Technology) | Phase D | Gaps to address |
| Architecture Requirements | All phases | Constraints |
| Architecture Vision | Phase A | Scope and principles |

---

## Phase E Outputs

Deliverables from this phase:

| Output | Description | Audience |
|--------|-------------|----------|
| **Consolidated Gap Register** | All gaps in one view | Architecture Board |
| **Solution Building Blocks** | Reusable components | Solution architects |
| **Transition Architectures** | Intermediate states | Program managers |
| **Implementation Options** | Make/buy/rent analysis | Stakeholders |
| **Dependency Analysis** | Project dependencies | PMO |
| **Work Package Portfolio** | Grouped work packages | PMO |
| **Implementation Roadmap (Draft)** | Preliminary sequencing | All |

---

## Key Principles

1. **Value-Driven** - Prioritize by business value
2. **Risk-Aware** - Consider implementation risks
3. **Dependency-Conscious** - Respect technical dependencies
4. **Incremental** - Plan for transitions, not big bang
5. **Reuse-First** - Leverage existing capabilities
6. **Stakeholder-Aligned** - Balance competing interests

---

## Related Skills

- [Business Architecture](../business-architecture/) - Source of business gaps
- [Information Systems](../information-systems/) - Source of IS gaps
- [Technology Architecture](../technology-architecture/) - Source of tech gaps
- [Migration Planning](../migration-planning/) - Consumes this phase output

---

## References

- TOGAF 10 Chapter 21: Phase E - Opportunities and Solutions
- Enterprise Architecture as Strategy (Ross, Weill, Robertson)
- Managing Successful Programmes (MSP)
