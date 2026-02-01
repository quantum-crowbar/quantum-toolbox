# Opportunities and Solutions Examples

Concrete examples for TOGAF Phase E deliverables.

---

## Example 1: Consolidated Gap Register

### Gap Summary

| Domain | Critical | High | Medium | Low | Total |
|--------|----------|------|--------|-----|-------|
| Business | 1 | 2 | 1 | 0 | 4 |
| Data | 1 | 1 | 2 | 0 | 4 |
| Application | 1 | 2 | 1 | 0 | 4 |
| Technology | 2 | 1 | 1 | 0 | 4 |
| **Total** | **5** | **6** | **5** | **0** | **16** |

### Gap Register

| Gap ID | Domain | Category | Description | Priority | Related Gaps |
|--------|--------|----------|-------------|----------|--------------|
| G-B-001 | Business | Capability | No automated order routing | Critical | G-C-002, G-D-001 |
| G-B-002 | Business | Process | Manual pricing updates | High | G-C-003 |
| G-B-003 | Business | Capability | No demand forecasting | High | G-C-004, G-D-003 |
| G-B-004 | Business | Organization | No data stewardship | Medium | G-C-001 |
| G-C-001 | Data | Governance | No master data management | Critical | G-B-004 |
| G-C-002 | Data | Application | No rules engine | High | G-B-001 |
| G-C-003 | Data | Application | Manual pricing system | Medium | G-B-002 |
| G-C-004 | Data | Analytics | No predictive analytics | Medium | G-B-003 |
| G-A-001 | Application | Integration | Point-to-point integrations | Critical | G-D-002 |
| G-A-002 | Application | Capability | Legacy order system | High | G-B-001 |
| G-A-003 | Application | Lifecycle | ERP end-of-life | High | G-D-004 |
| G-A-004 | Application | Coverage | No mobile channel | Medium | - |
| G-D-001 | Technology | Platform | No event streaming | Critical | G-B-001, G-C-002 |
| G-D-002 | Technology | Integration | No API gateway | Critical | G-A-001 |
| G-D-003 | Technology | Analytics | No ML platform | High | G-B-003, G-C-004 |
| G-D-004 | Technology | Infrastructure | Legacy on-prem servers | Medium | G-A-003 |

### Gap Clusters

| Cluster ID | Theme | Gaps | Primary Capability |
|------------|-------|------|-------------------|
| CL-001 | Order Automation | G-B-001, G-C-002, G-D-001, G-A-002 | Order Management |
| CL-002 | Integration Modernization | G-A-001, G-D-002 | Integration |
| CL-003 | Analytics & Forecasting | G-B-003, G-C-004, G-D-003 | Business Intelligence |
| CL-004 | Data Governance | G-B-004, G-C-001 | Data Management |
| CL-005 | Infrastructure Modernization | G-D-004, G-A-003 | Technology Platform |

---

## Example 2: Building Block Catalog

### Architecture Building Blocks

| ABB ID | Name | Type | Gaps Addressed |
|--------|------|------|----------------|
| ABB-001 | Real-time Event Processing | Technology | G-D-001, G-B-001 |
| ABB-002 | Business Rules Engine | Application | G-C-002, G-B-001 |
| ABB-003 | API Management | Technology | G-D-002, G-A-001 |
| ABB-004 | Master Data Hub | Data | G-C-001, G-B-004 |
| ABB-005 | ML/Analytics Platform | Technology | G-D-003, G-C-004, G-B-003 |

### ABB Detail: ABB-001 Real-time Event Processing

| Attribute | Value |
|-----------|-------|
| **ID** | ABB-001 |
| **Name** | Real-time Event Processing |
| **Type** | Technology |
| **Description** | Platform for publishing, routing, and consuming events in real-time |
| **Gaps Addressed** | G-D-001, G-B-001 |

**Interfaces**:
- Event Producer API (publish events)
- Event Consumer API (subscribe to events)
- Schema Registry (event schemas)
- Admin Console (monitoring, configuration)

**Reuse Potential**:
- Order events
- Inventory updates
- Customer activity
- Analytics pipelines

### Solution Building Blocks

| SBB ID | Name | Implements | Technology | Vendor |
|--------|------|------------|------------|--------|
| SBB-001 | Kafka Event Platform | ABB-001 | Apache Kafka (MSK) | AWS |
| SBB-002 | Drools Rules Engine | ABB-002 | Drools 8.x | Red Hat |
| SBB-003 | Kong API Gateway | ABB-003 | Kong Enterprise | Kong Inc |
| SBB-004 | Informatica MDM | ABB-004 | Informatica MDM | Informatica |
| SBB-005 | SageMaker ML Platform | ABB-005 | AWS SageMaker | AWS |

### SBB Detail: SBB-001 Kafka Event Platform

| Attribute | Value |
|-----------|-------|
| **ID** | SBB-001 |
| **Name** | Kafka Event Platform |
| **Implements** | ABB-001 |
| **Technology** | Apache Kafka 3.x |
| **Vendor** | AWS (MSK) |
| **Deployment** | Managed service |

**Specification**:
- 3 broker cluster (m5.large)
- 3 availability zones
- 7-day retention default
- Schema Registry (Glue)
- Kafka Connect for integrations

**Dependencies**:
- VPC with private subnets
- IAM roles for producers/consumers

**Cost Estimate**:
- Initial: $50,000 (setup, training)
- Annual: $180,000 (MSK + data transfer)

---

## Example 3: Solution Options Analysis

### Gap Cluster: Order Automation (CL-001)

**Gaps Addressed**: G-B-001, G-C-002, G-D-001, G-A-002

### Options Considered

| Option | Approach | Description |
|--------|----------|-------------|
| OPT-1 | Build | Custom order routing with Kafka + custom rules |
| OPT-2 | Buy | Commercial OMS (Manhattan, Blue Yonder) |
| OPT-3 | Enhance | Extend current system + add Kafka + Drools |

### Option 1: Build Custom

| Attribute | Value |
|-----------|-------|
| **Approach** | Build |
| **Description** | Custom order routing application with Kafka for events and custom rules engine |

**Pros**:
- Full customization
- No license costs
- Competitive advantage

**Cons**:
- Longer time to value (18 months)
- Higher development risk
- Ongoing maintenance burden

**Estimates**:
| Metric | Value |
|--------|-------|
| Implementation Cost | $2,500,000 |
| Annual Running Cost | $400,000 |
| Time to Value | 18 months |
| Team Size | 12 FTEs |

### Option 2: Buy Commercial OMS

| Attribute | Value |
|-----------|-------|
| **Approach** | Buy |
| **Description** | Implement Manhattan OMS with standard integration |

**Pros**:
- Faster implementation (12 months)
- Vendor support
- Proven solution

**Cons**:
- High license costs
- Limited customization
- Integration complexity

**Estimates**:
| Metric | Value |
|--------|-------|
| Implementation Cost | $1,800,000 |
| Annual Running Cost | $800,000 |
| Time to Value | 12 months |
| Team Size | 8 FTEs |

### Option 3: Enhance Existing

| Attribute | Value |
|-----------|-------|
| **Approach** | Enhance |
| **Description** | Extend current order system, add Kafka event platform, integrate Drools for routing rules |

**Pros**:
- Leverages existing investment
- Incremental change
- Known codebase
- Faster (10 months)

**Cons**:
- Legacy constraints
- Some technical debt
- Rules engine learning curve

**Estimates**:
| Metric | Value |
|--------|-------|
| Implementation Cost | $1,200,000 |
| Annual Running Cost | $350,000 |
| Time to Value | 10 months |
| Team Size | 8 FTEs |

### Evaluation Matrix

| Criterion | Weight | OPT-1 | OPT-2 | OPT-3 |
|-----------|--------|-------|-------|-------|
| Strategic Fit | 25% | 5 | 3 | 4 |
| Time to Value | 20% | 2 | 3 | 4 |
| Total Cost | 20% | 3 | 2 | 4 |
| Risk | 15% | 2 | 4 | 3 |
| Flexibility | 10% | 5 | 2 | 4 |
| Skills Available | 10% | 4 | 3 | 5 |
| **Weighted Score** | 100% | **3.35** | **2.85** | **3.95** |

### Recommendation

| Attribute | Value |
|-----------|-------|
| **Selected Option** | OPT-3: Enhance Existing |
| **Rationale** | Highest score, fastest time to value, leverages existing investment, manageable risk |

**Alternatives Rejected**:

| Option | Reason |
|--------|--------|
| OPT-1: Build Custom | Too long (18 months), higher risk, higher cost |
| OPT-2: Buy OMS | High ongoing license cost, limited flexibility, integration complexity |

---

## Example 4: Dependency Matrix

### Work Package Dependencies

|           | WP-E-001 | WP-E-002 | WP-E-003 | WP-E-004 | WP-E-005 |
|-----------|----------|----------|----------|----------|----------|
| **WP-E-001** Event Platform | - | | | | |
| **WP-E-002** API Gateway | | - | | | |
| **WP-E-003** Rules Engine | FS | | - | | |
| **WP-E-004** Order Routing | FS | SS | FS | - | |
| **WP-E-005** Analytics Platform | FS | | | | - |

### Dependency Details

**WP-E-003 depends on WP-E-001**

| Attribute | Value |
|-----------|-------|
| **Type** | Finish-to-Start |
| **Category** | Technical |
| **Reason** | Rules engine consumes events from Kafka; platform must be operational |
| **Lag** | 2 weeks (for integration testing) |
| **Risk if Violated** | Rules engine cannot be tested with real events |

**WP-E-004 depends on WP-E-002**

| Attribute | Value |
|-----------|-------|
| **Type** | Start-to-Start |
| **Category** | Technical |
| **Reason** | Order routing API exposed through gateway; can develop in parallel but need gateway for integration |
| **Lag** | 4 weeks |
| **Risk if Violated** | API development blocked for external testing |

### Critical Path

```
WP-E-001 (10 wks) ──▶ WP-E-003 (8 wks) ──▶ WP-E-004 (12 wks) ──▶ Go-Live
     Event Platform      Rules Engine        Order Routing
```

**Critical Path Duration**: 30 weeks + integration + deployment = ~36 weeks

---

## Example 5: Transition Architecture

### Transition 1: Foundation

| Attribute | Value |
|-----------|-------|
| **Transition ID** | TA-1 |
| **Name** | Foundation |
| **Target Date** | Q4 2025 |
| **Theme** | Platform infrastructure and integration foundation |

### Architecture State

**Changed Components**:

| Component | From (Baseline) | To (TA-1) |
|-----------|-----------------|-----------|
| Event Platform | None | Kafka (MSK) |
| API Gateway | None | Kong Enterprise |
| Order Database | MySQL 5.7 | PostgreSQL 15 |

**Unchanged Components**:

| Component | State | Notes |
|-----------|-------|-------|
| Order Application | Legacy Java | Will be enhanced in TA-2 |
| Customer CRM | Salesforce | No changes needed |
| ERP | SAP | Defer to TA-3 |

### Transition Diagram

```
┌─────────────────────────────────────────────────────────────┐
│                 TRANSITION 1: FOUNDATION                     │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  NEW                    CHANGED              UNCHANGED      │
│  ┌─────────────┐       ┌─────────────┐     ┌─────────────┐ │
│  │ Kafka (MSK) │       │ Order DB    │     │ Order App   │ │
│  │             │       │ MySQL→PG    │     │ (Legacy)    │ │
│  └─────────────┘       └─────────────┘     └─────────────┘ │
│                                                             │
│  ┌─────────────┐                           ┌─────────────┐ │
│  │ Kong API    │                           │ Salesforce  │ │
│  │ Gateway     │                           │ CRM         │ │
│  └─────────────┘                           └─────────────┘ │
│                                                             │
│                                            ┌─────────────┐ │
│                                            │ SAP ERP     │ │
│                                            │             │ │
│                                            └─────────────┘ │
└─────────────────────────────────────────────────────────────┘
```

### Value Delivered

| Value | Stakeholder | Metric |
|-------|-------------|--------|
| Real-time event capability | Engineering | Event throughput: 10K/sec |
| Modern API infrastructure | Partners | API response time < 100ms |
| Database modernization | Operations | 99.95% availability |

### Risks

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| Database migration complexity | Medium | High | Parallel run period, rollback plan |
| Kafka learning curve | Medium | Medium | Training, AWS support engagement |
| Integration disruption | Low | High | Phased cutover, feature flags |

### Work Packages Included

| Work Package | Description |
|--------------|-------------|
| WP-E-001 | Event Platform Implementation |
| WP-E-002 | API Gateway Implementation |
| WP-E-006 | Database Migration |

---

## Example 6: Work Package Portfolio

### Portfolio Summary

| Transition | Work Packages | Total Effort | Total Cost |
|------------|---------------|--------------|------------|
| TA-1: Foundation | 3 | 1,200 person-days | $1,050,000 |
| TA-2: Capabilities | 4 | 1,600 person-days | $1,400,000 |
| TA-3: Optimization | 2 | 600 person-days | $500,000 |
| **Total** | **9** | **3,400 person-days** | **$2,950,000** |

### Work Package List

| WP ID | Name | Transition | Priority | Duration | Cost |
|-------|------|------------|----------|----------|------|
| WP-E-001 | Event Platform | TA-1 | Critical | 10 weeks | $350,000 |
| WP-E-002 | API Gateway | TA-1 | Critical | 8 weeks | $300,000 |
| WP-E-006 | Database Migration | TA-1 | High | 12 weeks | $400,000 |
| WP-E-003 | Rules Engine | TA-2 | Critical | 8 weeks | $300,000 |
| WP-E-004 | Order Routing | TA-2 | Critical | 12 weeks | $500,000 |
| WP-E-007 | Mobile Channel | TA-2 | Medium | 10 weeks | $350,000 |
| WP-E-008 | Legacy Retirement | TA-2 | Medium | 6 weeks | $250,000 |
| WP-E-005 | Analytics Platform | TA-3 | Medium | 12 weeks | $350,000 |
| WP-E-009 | Forecasting Model | TA-3 | Medium | 8 weeks | $150,000 |

### Implementation Roadmap

```
Q3 2025           Q4 2025           Q1 2026           Q2 2026
    │                 │                 │                 │
    ▼                 ▼                 ▼                 ▼
┌─────────────────────────────┐
│ WP-E-001: Event Platform    │
└─────────────────────────────┘
┌─────────────────────┐
│ WP-E-002: API GW    │
└─────────────────────┘
┌─────────────────────────────────────┐
│ WP-E-006: Database Migration        │
└─────────────────────────────────────┘
                              ════════ TA-1 Complete ════════
                   ┌─────────────────────┐
                   │ WP-E-003: Rules Eng │
                   └─────────────────────┘
                            ┌─────────────────────────────────┐
                            │ WP-E-004: Order Routing         │
                            └─────────────────────────────────┘
                   ┌─────────────────────────────┐
                   │ WP-E-007: Mobile Channel    │
                   └─────────────────────────────┘
                                                ═══ TA-2 Complete ═══
```

---

## Example 7: Make vs Buy Decision

### Evaluation: Master Data Management

**Gap**: G-C-001 - No master data management

| Factor | Build | Informatica MDM | Reltio (SaaS) |
|--------|-------|-----------------|---------------|
| **Customization** | Full | High | Medium |
| **Time to Value** | 18 months | 9 months | 6 months |
| **Initial Cost** | $800K | $600K | $200K |
| **Annual Cost** | $200K | $400K | $350K |
| **3-Year TCO** | $1,400K | $1,400K | $900K |
| **Risk** | High | Medium | Low |
| **Skills Needed** | In-house | Vendor + internal | Vendor managed |
| **Scalability** | Depends | High | High |
| **Integration** | Custom | Connectors | APIs |

**Decision**: Reltio (SaaS)

**Rationale**:
- Fastest time to value (6 months)
- Lowest TCO over 3 years
- Lowest implementation risk
- Modern API-first architecture
- Vendor-managed updates

**Conditions**:
- Must pass security review
- Data residency in approved regions
- Integration with existing SSO
