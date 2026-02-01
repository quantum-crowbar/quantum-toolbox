# Information Systems Architecture Templates

Artifact templates for TOGAF Phase C deliverables.

---

## Data Entity Catalog Template

```markdown
# Data Entity Catalog

**Organization**: {organization_name}
**Version**: {version}
**Date**: {date}

---

## Entity Summary

| Entity ID | Entity Name | Description | Domain | Owner | Sensitivity |
|-----------|-------------|-------------|--------|-------|-------------|
| ENT-001 | {name} | {description} | {domain} | {owner} | {level} |
| ENT-002 | {name} | {description} | {domain} | {owner} | {level} |

---

## Entity Details

### ENT-{number}: {Entity Name}

| Attribute | Value |
|-----------|-------|
| **Entity ID** | ENT-{number} |
| **Name** | {entity name} |
| **Description** | {what this entity represents} |
| **Domain** | {business domain - e.g., Sales, Operations} |
| **Owner** | {data owner role} |
| **Steward** | {data steward role} |
| **Sensitivity** | {Public/Internal/Confidential/Restricted} |

**Key Attributes**:

| Attribute | Type | Required | Description |
|-----------|------|----------|-------------|
| {attr_name} | {type} | {Yes/No} | {description} |
| {attr_name} | {type} | {Yes/No} | {description} |

**Relationships**:

| Related Entity | Relationship | Cardinality |
|----------------|--------------|-------------|
| {entity} | {description} | {1:1/1:N/N:M} |

**Data Sources**:
- {source system 1}
- {source system 2}

**Quality Rules**:
- {rule 1}
- {rule 2}
```

---

## Logical Data Model Template

```markdown
# Logical Data Model

**Domain**: {domain name}
**Version**: {version}
**Date**: {date}

---

## Entity Relationship Diagram

```
┌──────────────────┐         ┌──────────────────┐
│     {ENTITY 1}   │         │     {ENTITY 2}   │
├──────────────────┤         ├──────────────────┤
│ PK {id}          │◄───┐    │ PK {id}          │
│    {attr}        │    │    │ FK {fk}          │───┐
│    {attr}        │    └────│    {attr}        │   │
└──────────────────┘         └──────────────────┘   │
                                                    │
┌──────────────────┐         ┌──────────────────┐   │
│     {ENTITY 3}   │         │     {ENTITY 4}   │   │
├──────────────────┤         ├──────────────────┤   │
│ PK {id}          │◄────────│ PK {id}          │   │
│    {attr}        │         │ FK {fk}          │◄──┘
│    {attr}        │         │    {attr}        │
└──────────────────┘         └──────────────────┘
```

---

## Relationships

| From Entity | To Entity | Relationship | Cardinality | Description |
|-------------|-----------|--------------|-------------|-------------|
| {entity} | {entity} | {name} | {1:1/1:N/N:M} | {description} |

---

## Constraints

| Constraint | Type | Entities | Rule |
|------------|------|----------|------|
| {name} | {PK/FK/UK/CK} | {entities} | {rule description} |
```

---

## Data Store Catalog Template

```markdown
# Data Store Catalog

**Organization**: {organization_name}
**Version**: {version}
**Date**: {date}

---

## Store Summary

| Store ID | Name | Type | Technology | Location | Owner |
|----------|------|------|------------|----------|-------|
| DS-001 | {name} | {OLTP/OLAP/Cache/Index} | {tech} | {location} | {owner} |

---

## Store Details

### DS-{number}: {Store Name}

| Attribute | Value |
|-----------|-------|
| **Store ID** | DS-{number} |
| **Name** | {store name} |
| **Type** | {OLTP/OLAP/Document/Key-Value/Graph/Cache/Index} |
| **Technology** | {database technology} |
| **Version** | {version} |
| **Location** | {on-prem/cloud region} |
| **Owner** | {owning team} |

**Hosted Entities**:

| Entity | Access Pattern | Volume | Growth Rate |
|--------|----------------|--------|-------------|
| {entity} | {Read/Write/Both} | {rows/size} | {%/month} |

**Backup & Recovery**:

| Attribute | Value |
|-----------|-------|
| Backup Frequency | {schedule} |
| Retention Period | {duration} |
| RTO | {time} |
| RPO | {time} |

**Access**:
- Read Applications: {list}
- Write Applications: {list}
```

---

## Data Flow Diagram Template

```markdown
# Data Flow Diagram

**Flow Name**: {name}
**Version**: {version}

---

## Flow Diagram

```
              ┌─────────────┐
              │  {Actor}    │
              └──────┬──────┘
                     │ {data description}
                     ▼
┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│  {System}   │◄───│  {System}   │───▶│  {System}   │
│             │    │  (Primary)  │    │             │
└─────────────┘    └──────┬──────┘    └─────────────┘
                         │
          ┌──────────────┼──────────────┐
          │              │              │
          ▼              ▼              ▼
    ┌───────────┐  ┌───────────┐  ┌───────────┐
    │ {System}  │  │ {System}  │  │ {System}  │
    └───────────┘  └───────────┘  └───────────┘
```

---

## Flow Details

| Flow ID | From | To | Data | Trigger | Frequency | Protocol |
|---------|------|-----|------|---------|-----------|----------|
| DF-001 | {source} | {dest} | {entities} | {event} | {rate} | {protocol} |

---

## Flow Specifications

### DF-{number}: {Flow Name}

| Attribute | Value |
|-----------|-------|
| **Flow ID** | DF-{number} |
| **Name** | {flow name} |
| **Source** | {source system} |
| **Destination** | {destination system} |
| **Data Entities** | {list of entities} |
| **Trigger** | {what initiates the flow} |
| **Frequency** | {real-time/batch/scheduled} |
| **Volume** | {records per time period} |
| **Protocol** | {sync/async, technology} |

**Transformations**:
- {transformation 1}
- {transformation 2}

**Error Handling**:
- {error scenario}: {handling approach}
```

---

## Application Catalog Template

```markdown
# Application Catalog

**Organization**: {organization_name}
**Version**: {version}
**Date**: {date}

---

## Application Summary

| App ID | Name | Type | Technology | Owner | Lifecycle |
|--------|------|------|------------|-------|-----------|
| APP-001 | {name} | {Custom/COTS/SaaS} | {tech stack} | {owner} | {state} |

---

## Application Details

### APP-{number}: {Application Name}

| Attribute | Value |
|-----------|-------|
| **App ID** | APP-{number} |
| **Name** | {application name} |
| **Description** | {what the application does} |
| **Type** | {Custom/COTS/SaaS/Legacy} |
| **Vendor** | {vendor or "In-house"} |
| **Technology Stack** | {languages, frameworks, databases} |
| **Deployment** | {on-prem/cloud/hybrid} |
| **Owner** | {owning team or role} |
| **Users** | {user count or range} |
| **Lifecycle State** | {Invest/Maintain/Migrate/Retire} |

**Capabilities Supported**:

| Capability | Support Level |
|------------|---------------|
| {capability} | {Primary/Secondary/Minimal} |

**Integrations**:

| Connected App | Direction | Interface | Data Exchanged |
|---------------|-----------|-----------|----------------|
| {app} | {In/Out/Both} | {type} | {data} |

**Technical Health**:

| Dimension | Score (1-5) | Notes |
|-----------|-------------|-------|
| Business Fit | {score} | {notes} |
| Technical Health | {score} | {notes} |
| Operational Health | {score} | {notes} |
| Cost Efficiency | {score} | {notes} |

**Data Entities**:
- Reads: {entity list}
- Writes: {entity list}
```

---

## Interface Catalog Template

```markdown
# Interface Catalog

**Application**: {app_name}
**Version**: {version}
**Date**: {date}

---

## Interface Summary

| Interface ID | Name | Type | Direction | Status |
|--------------|------|------|-----------|--------|
| INT-001 | {name} | {REST/GraphQL/gRPC/Event} | {In/Out} | {Active/Deprecated} |

---

## Interface Details

### INT-{number}: {Interface Name}

| Attribute | Value |
|-----------|-------|
| **Interface ID** | INT-{number} |
| **Name** | {interface name} |
| **Application** | {owning application} |
| **Type** | {REST/GraphQL/gRPC/SOAP/Event/File} |
| **Direction** | {Inbound/Outbound/Bidirectional} |
| **Protocol** | {HTTP/AMQP/gRPC/SFTP} |
| **Authentication** | {OAuth2/API Key/mTLS/None} |
| **Status** | {Active/Deprecated/Planned} |

**Endpoints** (if API):

| Method | Path | Description |
|--------|------|-------------|
| {GET/POST/etc} | {path} | {description} |

**Events** (if event-driven):

| Event | Description | Payload |
|-------|-------------|---------|
| {event.name} | {description} | {payload schema ref} |

**Consumers/Providers**:
- {list of consuming/providing applications}

**SLA**:

| Metric | Target |
|--------|--------|
| Availability | {%} |
| Response Time | {ms} |
| Throughput | {requests/sec} |
```

---

## Application-Capability Matrix Template

```markdown
# Application-Capability Matrix

**Organization**: {organization_name}
**Date**: {date}

---

## Matrix

| Capability | APP-001 | APP-002 | APP-003 | APP-004 | Gap? |
|------------|---------|---------|---------|---------|------|
| {Cap 1} | ★★★ | ★ | - | - | No |
| {Cap 2} | - | ★★★ | ★★ | - | No |
| {Cap 3} | - | - | - | - | YES |
| {Cap 4} | ★ | ★ | ★ | - | Partial |

**Legend**:
- ★★★ = Primary (core function)
- ★★ = Secondary (significant support)
- ★ = Minimal (basic support)
- - = None
- Gap = No application coverage

---

## Gap Analysis

| Capability | Current State | Required Applications |
|------------|---------------|----------------------|
| {Cap 3} | No coverage | Need new system |
| {Cap 4} | Fragmented across 3 apps | Consolidate to single app |
```

---

## Integration Architecture Template

```markdown
# Integration Architecture

**Organization**: {organization_name}
**Version**: {version}
**Date**: {date}

---

## Integration Patterns

| Pattern | Usage | Applications |
|---------|-------|--------------|
| Synchronous API | Real-time queries | {list} |
| Asynchronous Messaging | Event-driven | {list} |
| Batch File Transfer | Large volume | {list} |
| Data Replication | Sync databases | {list} |

---

## Integration Diagram

```
┌─────────┐     REST      ┌─────────────────┐     Events    ┌─────────┐
│ {App}   │──────────────▶│   API Gateway   │──────────────▶│ {App}   │
└─────────┘               └────────┬────────┘               └─────────┘
                                   │
                              ┌────┴────┐
                              │         │
                         ┌────▼───┐ ┌───▼────┐
                         │ {App}  │ │ {App}  │
                         └────────┘ └────────┘
```

---

## Integration Matrix

| From \ To | APP-001 | APP-002 | APP-003 | APP-004 |
|-----------|---------|---------|---------|---------|
| APP-001 | - | REST | Events | - |
| APP-002 | REST | - | gRPC | DB Link |
| APP-003 | Events | gRPC | - | Events |
| APP-004 | - | DB Link | Events | - |

---

## Integration Standards

| Standard | Value |
|----------|-------|
| API Style | REST (OpenAPI 3.0) |
| Messaging | Apache Kafka |
| Authentication | OAuth 2.0 / API Keys |
| Data Format | JSON |
| Error Handling | RFC 7807 Problem Details |
```

---

## IS Gap Analysis Template

```markdown
# Information Systems Gap Analysis

**Initiative**: {name}
**Date**: {date}

---

## Data Gaps

| Gap ID | Entity/Area | Baseline | Target | Description | Priority |
|--------|-------------|----------|--------|-------------|----------|
| DG-001 | {entity} | {current} | {target} | {description} | {H/M/L} |

### Gap Detail: DG-{number}

| Current State | Target State |
|---------------|--------------|
| {description} | {description} |

**Impact**:
- {impact 1}
- {impact 2}

**Resolution Approach**: {approach}

**Effort**: {S/M/L/XL}

---

## Application Gaps

| Gap ID | Application/Area | Baseline | Target | Description | Priority |
|--------|-----------------|----------|--------|-------------|----------|
| AG-001 | {app/area} | {current} | {target} | {description} | {H/M/L} |

### Gap Detail: AG-{number}

| Current State | Target State |
|---------------|--------------|
| {description} | {description} |

**Impact**:
- {impact 1}
- {impact 2}

**Resolution Approach**: {approach}

**Effort**: {S/M/L/XL}

---

## Gap Summary

| Category | Critical | High | Medium | Low | Total |
|----------|----------|------|--------|-----|-------|
| Data | {n} | {n} | {n} | {n} | {n} |
| Application | {n} | {n} | {n} | {n} | {n} |
| Integration | {n} | {n} | {n} | {n} | {n} |
| **Total** | **{n}** | **{n}** | **{n}** | **{n}** | **{n}** |
```

---

## Work Package Template (Phase C)

```markdown
# Work Package Definition

**Work Package ID**: WP-C-{number}
**Name**: {name}
**Phase**: C - Information Systems Architecture

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

| Gap ID | Type | Gap Description |
|--------|------|-----------------|
| DG-{n} | Data | {description} |
| AG-{n} | Application | {description} |

---

## Scope

**In Scope**:
- {item 1}
- {item 2}

**Out of Scope**:
- {item 1}
- {item 2}

---

## Deliverables

| Deliverable | Description |
|-------------|-------------|
| {deliverable 1} | {description} |
| {deliverable 2} | {description} |

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

---

## Data Governance Model Template

```markdown
# Data Governance Model

**Organization**: {organization_name}
**Version**: {version}
**Date**: {date}

---

## Governance Structure

```
┌─────────────────────────────────────────┐
│          Data Governance Council        │
│         (Executive Oversight)           │
└───────────────────┬─────────────────────┘
                    │
    ┌───────────────┼───────────────┐
    │               │               │
┌───▼───┐       ┌───▼───┐       ┌───▼───┐
│ Data  │       │ Data  │       │ Data  │
│Domain │       │Domain │       │Domain │
│   A   │       │   B   │       │   C   │
└───────┘       └───────┘       └───────┘
```

---

## Roles and Responsibilities

| Role | Scope | Responsibilities |
|------|-------|------------------|
| Data Governance Council | Enterprise | Policy approval, strategic direction |
| Data Owner | Domain | Accountable for data quality |
| Data Steward | Entity | Day-to-day management |
| Data Custodian | Technical | Storage, security, backup |

---

## Data Ownership

| Domain | Data Owner | Steward | Key Entities |
|--------|------------|---------|--------------|
| {domain} | {role} | {role} | {entities} |

---

## Data Policies

| Policy | Description | Enforcement |
|--------|-------------|-------------|
| {policy name} | {description} | {how enforced} |

---

## Data Quality Rules

| Entity | Rule | Measure | Target | Current |
|--------|------|---------|--------|---------|
| {entity} | {rule} | {metric} | {%} | {%} |

---

## Data Classification

| Level | Definition | Handling Requirements |
|-------|------------|----------------------|
| Public | {definition} | {requirements} |
| Internal | {definition} | {requirements} |
| Confidential | {definition} | {requirements} |
| Restricted | {definition} | {requirements} |
```
