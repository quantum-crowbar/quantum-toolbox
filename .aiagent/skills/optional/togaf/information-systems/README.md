# TOGAF Phase C: Information Systems Architecture

Guidelines for developing Data Architecture and Application Architecture.

---

## Overview

Phase C develops the Information Systems Architecture, consisting of:

1. **Data Architecture** - How data is structured, stored, and managed
2. **Application Architecture** - How applications support business functions

```
Phase A (Vision) → Phase B (Business) → Phase C (Info Systems) → Phase D (Technology)
                                              ↑
                                         YOU ARE HERE
```

---

## When to Use This Skill

Use Phase C when you need to:

- Document data entities and their relationships
- Map data flows across systems
- Design application portfolios
- Plan application integration
- Identify data and application gaps
- Define target state for systems

---

## Key Concepts

### Data Architecture

**Data Entities**: Business objects that need to be stored and managed.

```
┌─────────────────────────────────────────────────────────────┐
│                      DATA ARCHITECTURE                       │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ┌─────────────┐    ┌─────────────┐    ┌─────────────┐     │
│  │   Entity    │    │   Entity    │    │   Entity    │     │
│  │  Customer   │───▶│   Order     │───▶│  Product    │     │
│  └─────────────┘    └─────────────┘    └─────────────┘     │
│                            │                                │
│                            ▼                                │
│                     ┌─────────────┐                        │
│                     │   Entity    │                        │
│                     │  Payment    │                        │
│                     └─────────────┘                        │
│                                                             │
├─────────────────────────────────────────────────────────────┤
│  Data Stores    │  Data Flows    │  Data Quality Rules     │
└─────────────────────────────────────────────────────────────┘
```

**Core Components**:

| Component | Description | Artifact |
|-----------|-------------|----------|
| Data Entities | Business objects | Entity Catalog |
| Data Relationships | How entities relate | Logical Data Model |
| Data Stores | Where data resides | Data Store Catalog |
| Data Flows | How data moves | Data Flow Diagrams |
| Data Quality | Rules and standards | Data Quality Rules |
| Data Governance | Ownership and stewardship | Data Governance Model |

### Application Architecture

**Application Portfolio**: The collection of applications that support business capabilities.

```
┌─────────────────────────────────────────────────────────────┐
│                  APPLICATION ARCHITECTURE                    │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ┌─────────────────────────────────────────────────────┐   │
│  │              APPLICATION PORTFOLIO                   │   │
│  ├─────────────────────────────────────────────────────┤   │
│  │                                                     │   │
│  │  ┌─────────┐  ┌─────────┐  ┌─────────┐  ┌───────┐  │   │
│  │  │Customer │  │  Order  │  │Inventory│  │ Fin   │  │   │
│  │  │  CRM    │  │   OMS   │  │   IMS   │  │  ERP  │  │   │
│  │  └────┬────┘  └────┬────┘  └────┬────┘  └───┬───┘  │   │
│  │       │            │            │           │       │   │
│  │       └────────────┼────────────┼───────────┘       │   │
│  │                    │            │                   │   │
│  │               ┌────▼────────────▼────┐              │   │
│  │               │   Integration Layer   │              │   │
│  │               └──────────────────────┘              │   │
│  │                                                     │   │
│  └─────────────────────────────────────────────────────┘   │
│                                                             │
├─────────────────────────────────────────────────────────────┤
│  Capabilities    │  Integrations  │  Lifecycle State       │
└─────────────────────────────────────────────────────────────┘
```

**Core Components**:

| Component | Description | Artifact |
|-----------|-------------|----------|
| Applications | Systems supporting capabilities | Application Catalog |
| Interfaces | How apps communicate | Interface Catalog |
| Integrations | Connection patterns | Integration Matrix |
| Services | Reusable functions | Service Catalog |
| Lifecycle | App age and status | Application Lifecycle |

---

## Modeling Notations

### Logical Data Model

```
┌──────────────────┐         ┌──────────────────┐
│     CUSTOMER     │         │      ORDER       │
├──────────────────┤         ├──────────────────┤
│ PK customer_id   │◄───┐    │ PK order_id      │
│    name          │    │    │ FK customer_id   │───┐
│    email         │    └────│    order_date    │   │
│    phone         │         │    status        │   │
└──────────────────┘         │    total         │   │
                             └──────────────────┘   │
                                                    │
┌──────────────────┐         ┌──────────────────┐   │
│     PRODUCT      │         │   ORDER_LINE     │   │
├──────────────────┤         ├──────────────────┤   │
│ PK product_id    │◄────────│ PK line_id       │   │
│    name          │         │ FK order_id      │◄──┘
│    description   │         │ FK product_id    │
│    price         │         │    quantity      │
│    category      │         │    line_total    │
└──────────────────┘         └──────────────────┘
```

### Application Communication Diagram

```
┌─────────┐     REST      ┌─────────┐     Events    ┌─────────┐
│   Web   │──────────────▶│   API   │──────────────▶│ Worker  │
│   App   │               │ Gateway │               │ Service │
└─────────┘               └────┬────┘               └─────────┘
                               │
                          gRPC │
                               │
     ┌─────────────────────────┼─────────────────────────┐
     │                         │                         │
     ▼                         ▼                         ▼
┌─────────┐              ┌─────────┐              ┌─────────┐
│  User   │              │  Order  │              │ Product │
│ Service │              │ Service │              │ Service │
└────┬────┘              └────┬────┘              └────┬────┘
     │                        │                        │
     ▼                        ▼                        ▼
┌─────────┐              ┌─────────┐              ┌─────────┐
│ User DB │              │Order DB │              │Prod DB  │
└─────────┘              └─────────┘              └─────────┘
```

### Data Flow Diagram

```
              ┌─────────────┐
              │  Customer   │
              └──────┬──────┘
                     │ Order Request
                     ▼
┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│  Product    │◄───│  Order      │───▶│  Inventory  │
│  Catalog    │    │  System     │    │  System     │
└─────────────┘    └──────┬──────┘    └─────────────┘
                         │
          ┌──────────────┼──────────────┐
          │              │              │
          ▼              ▼              ▼
    ┌───────────┐  ┌───────────┐  ┌───────────┐
    │  Payment  │  │ Warehouse │  │ Shipping  │
    │  Gateway  │  │  System   │  │  Carrier  │
    └───────────┘  └───────────┘  └───────────┘
```

---

## Application Assessment Criteria

### Lifecycle States

| State | Description | Action |
|-------|-------------|--------|
| **Invest** | Strategic, growing | Enhance capabilities |
| **Maintain** | Stable, meets needs | Keep current |
| **Migrate** | Being replaced | Plan transition |
| **Retire** | End of life | Decommission |

### Health Assessment

| Dimension | Questions |
|-----------|-----------|
| **Business Fit** | Does it support current/future capabilities? |
| **Technical Health** | Is tech stack supported? Security current? |
| **Operational Health** | Is it stable? Well-monitored? |
| **Cost Efficiency** | Is TCO justified by value? |

### Integration Patterns

```
┌─────────────────────────────────────────────────────────────┐
│                   INTEGRATION PATTERNS                       │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  Point-to-Point          Hub-and-Spoke         Event-Driven │
│                                                             │
│  ┌───┐   ┌───┐          ┌───┐                    ┌───┐     │
│  │ A │───│ B │          │ A │                    │ A │     │
│  └───┘   └───┘          └─┬─┘                    └─┬─┘     │
│    │       │              │      ┌─────┐           │       │
│    └───────┘              └─────▶│ Hub │◀───┐      ▼       │
│  ┌───┐   ┌───┐                   └──┬──┘    │   ┌─────┐   │
│  │ C │───│ D │          ┌───┐      │     ┌───┐  │Event│   │
│  └───┘   └───┘          │ B │◀─────┘     │ C │  │ Bus │   │
│                         └───┘            └───┘  └──┬──┘   │
│                                                    │       │
│                                                 ┌──┴──┐    │
│                                                 │ B C │    │
│                                                 └─────┘    │
└─────────────────────────────────────────────────────────────┘
```

---

## Data Governance Concepts

### Data Ownership

| Role | Responsibility |
|------|----------------|
| **Data Owner** | Accountable for data quality and policies |
| **Data Steward** | Day-to-day data management |
| **Data Custodian** | Technical storage and security |
| **Data Consumer** | Uses data within policies |

### Data Classification

| Level | Description | Handling |
|-------|-------------|----------|
| **Public** | No restrictions | Open access |
| **Internal** | Company only | Authentication required |
| **Confidential** | Need-to-know | Role-based access |
| **Restricted** | Highly sensitive | Encryption + audit |

---

## Phase C Inputs

From previous phases:

| Input | Source | Usage |
|-------|--------|-------|
| Business Capabilities | Phase B | Map to applications |
| Business Processes | Phase B | Identify data needs |
| Organization Map | Phase B | Data ownership |
| Architecture Vision | Phase A | Scope and constraints |
| Gap Analysis | Phase B | Input for IS gaps |

---

## Phase C Outputs

Deliverables from this phase:

| Output | Description | Audience |
|--------|-------------|----------|
| **Data Architecture** | | |
| Entity Catalog | List of data entities | Data architects, developers |
| Logical Data Model | Entity relationships | Data architects, DBAs |
| Data Flow Diagrams | Data movement | Architects, security |
| Data Store Catalog | Where data lives | DBAs, operations |
| Data Governance Model | Ownership and rules | Data stewards, compliance |
| **Application Architecture** | | |
| Application Catalog | All applications | Portfolio managers |
| Interface Catalog | App connections | Integration team |
| Application/Capability Matrix | Apps to capabilities | Business, architecture |
| Integration Architecture | How apps connect | Integration team |
| Application Lifecycle | Status of each app | Portfolio managers |
| **Combined** | | |
| IS Gap Analysis | Gaps in data and apps | Architecture Board |
| Work Packages | Projects to address gaps | PMO |

---

## Key Principles

1. **Data as an Asset** - Treat data with same rigor as other assets
2. **Single Source of Truth** - One authoritative source per entity
3. **Loose Coupling** - Applications connect via well-defined interfaces
4. **Reuse Over Rebuild** - Leverage existing applications and data
5. **Service Orientation** - Expose capabilities as services
6. **Security by Design** - Data protection built in, not bolted on

---

## Related Skills

- [Business Architecture](../business-architecture/) - Capabilities that drive IS needs
- [Technology Architecture](../technology-architecture/) - Infrastructure that hosts IS
- [Structurizr](../../structurizr/) - C4 modeling for application architecture
- [Architecture Analysis](../../arch-analysis/) - Existing system analysis

---

## References

- TOGAF 10 Chapter 19: Phase C - Information Systems Architectures
- Data Management Body of Knowledge (DMBOK)
- Application Portfolio Management practices
