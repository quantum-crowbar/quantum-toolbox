# Information Systems Architecture Checklist

Quick reference for TOGAF Phase C deliverables.

---

## Phase Entry Criteria

- [ ] Business Architecture approved (Phase B complete)
- [ ] Capability model available
- [ ] Process models available
- [ ] Organization mapping complete
- [ ] Architecture principles defined

---

## Data Architecture Checklist

### Entity Catalog

- [ ] All business entities identified
- [ ] Unique ID assigned to each (ENT-nnn)
- [ ] Description provided (business language)
- [ ] Domain assigned
- [ ] Owner identified
- [ ] Steward identified
- [ ] Sensitivity classified (Public/Internal/Confidential/Restricted)

### Logical Data Model

- [ ] All entities in ERD
- [ ] Relationships defined
- [ ] Cardinality specified (1:1, 1:N, N:M)
- [ ] Primary keys identified
- [ ] Foreign keys mapped
- [ ] Key attributes listed
- [ ] No orphan entities

### Data Store Catalog

For each data store:

- [ ] Unique ID (DS-nnn)
- [ ] Type classified (OLTP/OLAP/Cache/Index/etc.)
- [ ] Technology specified
- [ ] Location documented
- [ ] Owner assigned
- [ ] Hosted entities listed
- [ ] Backup/recovery documented

### Data Flows

For each significant flow:

- [ ] Unique ID (DF-nnn)
- [ ] Source and destination identified
- [ ] Entities in flow listed
- [ ] Trigger documented
- [ ] Frequency/timing specified
- [ ] Protocol/mechanism documented
- [ ] Volume estimated

### Data Governance

- [ ] Governance structure defined
- [ ] Data owners assigned per domain
- [ ] Data stewards assigned per entity
- [ ] Data policies documented
- [ ] Quality rules defined
- [ ] Classification scheme applied

---

## Application Architecture Checklist

### Application Catalog

For each application:

- [ ] Unique ID (APP-nnn)
- [ ] Name and description
- [ ] Type (Custom/COTS/SaaS/Legacy)
- [ ] Technology stack documented
- [ ] Owner identified
- [ ] User count estimated
- [ ] Lifecycle state assigned (Invest/Maintain/Migrate/Retire)

### Application Assessment

For each application:

- [ ] Business fit scored (1-5)
- [ ] Technical health scored (1-5)
- [ ] Operational health scored (1-5)
- [ ] Cost efficiency scored (1-5)
- [ ] Overall score calculated
- [ ] Lifecycle recommendation provided

### Capability Mapping

- [ ] All applications mapped to capabilities
- [ ] Support level indicated (Primary/Secondary/Minimal)
- [ ] Coverage gaps identified
- [ ] Redundancy identified
- [ ] No orphan applications

### Interface Catalog

For each interface:

- [ ] Unique ID (INT-nnn)
- [ ] Type specified (REST/GraphQL/gRPC/Event/etc.)
- [ ] Direction documented (In/Out/Both)
- [ ] Protocol specified
- [ ] Authentication method documented
- [ ] Status indicated (Active/Deprecated/Planned)
- [ ] Consumers/providers listed

### Integration Architecture

- [ ] Integration patterns documented
- [ ] Integration matrix complete
- [ ] Standards defined (API style, messaging, auth)
- [ ] Integration diagram created
- [ ] No undocumented integrations

---

## Gap Analysis Checklist

### Data Gaps

- [ ] All baseline data artifacts reviewed
- [ ] All target data artifacts defined
- [ ] Gaps identified and documented
- [ ] Each gap has unique ID (DG-nnn)
- [ ] Impact documented
- [ ] Priority assigned
- [ ] Resolution approach outlined

### Application Gaps

- [ ] All baseline applications reviewed
- [ ] Target applications defined
- [ ] Gaps identified and documented
- [ ] Each gap has unique ID (AG-nnn)
- [ ] Impact documented
- [ ] Priority assigned
- [ ] Resolution approach outlined

### Integration Gaps

- [ ] Current integration patterns assessed
- [ ] Target integration patterns defined
- [ ] Gaps identified
- [ ] Each gap has unique ID (IG-nnn)

### Gap Summary

- [ ] Total gaps counted by category
- [ ] Priority distribution reviewed
- [ ] Critical gaps have owners
- [ ] All gaps addressed in work packages

---

## Roadmap Checklist

### Work Packages

For each work package:

- [ ] Unique ID (WP-C-nnn)
- [ ] Clear description
- [ ] Business outcome stated
- [ ] Gaps addressed listed
- [ ] Scope defined (in/out)
- [ ] Deliverables listed
- [ ] Dependencies documented
- [ ] Estimates provided
- [ ] Risks identified

### Sequencing

- [ ] Dependencies respected
- [ ] Critical path identified
- [ ] Resource constraints considered
- [ ] Phased approach where needed
- [ ] Quick wins identified

---

## Stakeholder Review Checklist

### Documentation Ready

- [ ] Entity catalog complete
- [ ] Logical data model diagram ready
- [ ] Data flow diagrams ready
- [ ] Application catalog complete
- [ ] Capability-application matrix ready
- [ ] Integration architecture documented
- [ ] Gap analysis summary ready
- [ ] Roadmap visual ready

### Validation Complete

- [ ] Data owners validated data model
- [ ] Application owners validated assessments
- [ ] Integration team validated interfaces
- [ ] Business validated capability mapping
- [ ] Security reviewed data classification

### Approvals

- [ ] Data architecture approved
- [ ] Application architecture approved
- [ ] Phase C overall approved by Architecture Board
- [ ] Phase D scope confirmed

---

## Quality Scoring Matrix

| Dimension | Poor (1) | Adequate (3) | Good (5) |
|-----------|----------|--------------|----------|
| **Data Completeness** | Major entities missing | Most entities covered | All entities documented |
| **Application Coverage** | Gaps in portfolio | Most apps documented | Full portfolio mapped |
| **Integration Clarity** | Ad-hoc integrations | Most documented | Full integration matrix |
| **Alignment to Business** | Weak mapping | Some mapping | Clear capability linkage |
| **Actionability** | Vague next steps | General direction | Clear work packages |

**Target**: Average score ≥ 4 across all dimensions

---

## Common Issues

| Issue | Symptom | Resolution |
|-------|---------|------------|
| Missing entities | Process needs data not in model | Review processes systematically |
| Orphan applications | Apps not mapped to capabilities | Validate purpose or mark for retirement |
| Integration spaghetti | Point-to-point everywhere | Introduce integration patterns |
| Shadow IT | Unknown applications | Comprehensive discovery |
| Data silos | Same entity in multiple stores | Master data management |
| Stale assessment | "We fixed that" comments | Regular refresh cycle |

---

## Phase Exit Criteria

- [ ] Data Architecture artifacts complete
- [ ] Application Architecture artifacts complete
- [ ] Integration Architecture documented
- [ ] Gap analysis complete with priorities
- [ ] Work packages defined for Phase C scope
- [ ] Stakeholder concerns addressed
- [ ] Architecture Board approval obtained
- [ ] Phase D scope confirmed
- [ ] Architecture Repository updated
