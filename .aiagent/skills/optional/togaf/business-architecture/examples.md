# Business Architecture Examples

Concrete examples for TOGAF Phase B deliverables.

---

## Example 1: Capability Map - E-Commerce Platform

### Level 0: Enterprise Capabilities

```
┌──────────────────────────────────────────────────────────────────────────┐
│                          ACME E-COMMERCE                                  │
├──────────────────────────┬─────────────────────┬────────────────────────┤
│  STRATEGIC CAPABILITIES  │  CORE CAPABILITIES  │  SUPPORTING CAPS       │
├──────────────────────────┼─────────────────────┼────────────────────────┤
│ • Strategy & Planning    │ • Product Mgmt      │ • Finance              │
│ • Market Intelligence    │ • Order Mgmt        │ • Human Resources      │
│ • Partner Management     │ • Customer Mgmt     │ • Information Tech     │
│ • Brand Management       │ • Fulfillment       │ • Legal & Compliance   │
└──────────────────────────┴─────────────────────┴────────────────────────┘
```

### Level 1: Order Management Decomposition

| L2 Capability | Description | Maturity | Strategic Importance |
|---------------|-------------|----------|---------------------|
| Order Capture | Accept orders from all channels | 4 | High |
| Order Validation | Verify order data and availability | 3 | High |
| Order Pricing | Calculate prices, discounts, taxes | 4 | Critical |
| Order Fulfillment Routing | Route to optimal fulfillment center | 2 | High |
| Order Tracking | Provide real-time order status | 3 | High |
| Order Modification | Handle changes and cancellations | 2 | Medium |
| Returns Processing | Manage return requests and refunds | 2 | Medium |

### Capability Heatmap

```
┌───────────────┬───────────────┬───────────────┐
│ Order Capture │ Validation    │ Pricing       │
│      🟢       │      🟡       │      🟢       │
├───────────────┼───────────────┼───────────────┤
│ Routing       │ Tracking      │ Modification  │
│      🔴       │      🟡       │      🔴       │
├───────────────┼───────────────┼───────────────┤
│ Returns       │               │               │
│      🔴       │               │               │
└───────────────┴───────────────┴───────────────┘

Legend: 🟢 Strong (4-5) | 🟡 Adequate (3) | 🔴 Needs Work (1-2)
```

### Capability Detail Example

**CAP-OM-004: Order Fulfillment Routing**

| Attribute | Value |
|-----------|-------|
| **ID** | CAP-OM-004 |
| **Level** | 2 |
| **Parent** | Order Management (CAP-OM) |
| **Description** | Determines optimal fulfillment location based on inventory, proximity, and cost |
| **Business Outcome** | Orders fulfilled faster and cheaper with optimal stock utilization |
| **Owner** | VP Operations |
| **Maturity** | 2 |
| **Strategic Importance** | High |

**Supporting Applications**: Legacy OMS, Manual spreadsheets

**Key Metrics**:
- Average routing decision time: 4 hours (manual)
- Fulfillment cost variance: 15%

**Known Gaps**:
- No automated routing rules
- No real-time inventory visibility
- Cannot handle split shipments

---

## Example 2: Value Stream Map - Customer Order Journey

### Value Stream Overview

**Value Stream**: Customer Purchase Journey
**Customer Segment**: Online retail customers
**Value Proposition**: Easy product discovery to fast delivery

### Value Stream Stages

```
Trigger: Customer has purchase intent

┌──────────┐    ┌──────────┐    ┌──────────┐    ┌──────────┐    ┌──────────┐
│ Discover │───▶│  Select  │───▶│ Purchase │───▶│ Fulfill  │───▶│ Receive  │
│          │    │          │    │          │    │          │    │          │
└──────────┘    └──────────┘    └──────────┘    └──────────┘    └──────────┘
     │               │               │               │               │
    ───             ───             ───             ───             ───
  5 mins          15 mins         3 mins         48 hrs          5 mins

Total Cycle Time: ~50 hours
Value-Add Time: ~2 hours (picking, packing, delivery)
```

### Stage Detail: Fulfill

| Attribute | Value |
|-----------|-------|
| **Triggering Event** | Payment confirmed |
| **Participating Stakeholders** | Warehouse staff, Shipping carriers |
| **Entrance Criteria** | Order validated, payment successful, inventory reserved |
| **Exit Criteria** | Package handed to carrier with tracking |
| **Cycle Time** | 48 hours |
| **Value-Adding?** | Yes (physical transformation) |

**Capabilities Required**:
- Order Fulfillment Routing (CAP-OM-004)
- Inventory Management (CAP-FM-002)
- Warehouse Operations (CAP-FM-003)
- Carrier Integration (CAP-FM-005)

**Pain Points (Current State)**:
1. Manual routing adds 4+ hours delay
2. No visibility into carrier capacity
3. Split shipments handled manually

**Improvement Opportunities**:
1. Automated routing based on rules engine
2. Real-time carrier API integration
3. Intelligent order splitting algorithm

### Value Stream Metrics

| Metric | Current | Target | Gap |
|--------|---------|--------|-----|
| End-to-end cycle time | 50 hours | 24 hours | -26 hours |
| Value-add ratio | 4% | 15% | +11% |
| First-pass yield | 85% | 98% | +13% |
| Customer satisfaction | 3.8/5 | 4.5/5 | +0.7 |

---

## Example 3: Business Process Model - Order Processing

### Process Overview

| Attribute | Value |
|-----------|-------|
| **Process Name** | Order Processing |
| **Process ID** | BP-OM-001 |
| **Owner** | Order Management Team Lead |
| **Purpose** | Transform customer order into fulfillment request |
| **Trigger** | Customer completes checkout |
| **Frequency** | ~5,000/day |
| **Average Duration** | 15 minutes |
| **Inputs** | Cart contents, customer info, payment token |
| **Outputs** | Validated order, fulfillment request |

### Process Flow

```
┌─────┐
│Start│ Customer completes checkout
└──┬──┘
   │
   ▼
┌──────────────┐
│ Validate     │  Actor: System
│ Order Data   │  System: Order API
└──────┬───────┘
       │
       ▼
   ◇───────◇
   │ Valid? │
   ◇───────◇
   │Yes     │No
   │        ▼
   │    ┌──────────┐
   │    │ Reject & │
   │    │ Notify   │───▶ End (Error)
   │    └──────────┘
   ▼
┌──────────────┐
│ Check        │  Actor: System
│ Inventory    │  System: Inventory Service
└──────┬───────┘
       │
       ▼
   ◇───────────◇
   │ Available? │
   ◇───────────◇
   │Yes         │No
   │            ▼
   │        ┌──────────┐
   │        │ Backorder│
   │        │ or Cancel│───▶ End (Backorder)
   │        └──────────┘
   ▼
┌──────────────┐
│ Process      │  Actor: System
│ Payment      │  System: Payment Gateway
└──────┬───────┘
       │
       ▼
   ◇──────────◇
   │ Approved? │
   ◇──────────◇
   │Yes        │No
   │           ▼
   │       ┌──────────┐
   │       │ Payment  │
   │       │ Failed   │───▶ End (Failed)
   │       └──────────┘
   ▼
┌──────────────┐
│ Create       │  Actor: System
│ Fulfillment  │  System: Fulfillment Service
│ Request      │
└──────┬───────┘
       │
       ▼
    ○───────○
    │  End  │
    │Success│
    ○───────○
```

### RACI Matrix

| Step | Order Team | Warehouse | Finance | Customer | System |
|------|------------|-----------|---------|----------|--------|
| Validate Order | C | - | - | I | R |
| Check Inventory | I | C | - | - | R |
| Process Payment | C | - | A | I | R |
| Create Fulfillment | A | R | - | I | R |

R = Responsible, A = Accountable, C = Consulted, I = Informed

### Process Metrics

| Metric | Current | Target |
|--------|---------|--------|
| Cycle Time | 15 min | 2 min |
| Error Rate | 5% | 0.5% |
| Automation Level | 60% | 95% |
| Cost per Transaction | $2.50 | $0.50 |

---

## Example 4: Organization Map - E-Commerce Division

### Organization Structure

```
                    ┌─────────────────┐
                    │ CEO             │
                    │ Jane Smith      │
                    └────────┬────────┘
                             │
         ┌───────────────────┼───────────────────┐
         │                   │                   │
┌────────▼────────┐ ┌────────▼────────┐ ┌────────▼────────┐
│ Product         │ │ Operations      │ │ Technology      │
│ SVP: Tom Brown  │ │ SVP: Lisa Chen  │ │ CTO: Mike Jones │
│ FTE: 45         │ │ FTE: 200        │ │ FTE: 80         │
└────────┬────────┘ └────────┬────────┘ └────────┬────────┘
         │                   │                   │
    ┌────┴────┐         ┌────┴────┐         ┌────┴────┐
    │ Catalog │         │ Fulfillment       │ Platform │
    │ Pricing │         │ Customer Svc      │ Data     │
    │ Merch   │         │ Logistics         │ Security │
    └─────────┘         └─────────┘         └─────────┘
```

### Capability-Organization Mapping

| Capability | Primary Owner | Contributing Units |
|------------|---------------|-------------------|
| Product Management | Product | Technology (Platform) |
| Order Management | Operations | Technology (Platform) |
| Customer Management | Operations (CustSvc) | Technology (Data) |
| Fulfillment | Operations (Fulfillment) | Operations (Logistics) |
| Pricing | Product (Pricing) | Finance |

### Role Definition Example

**Role: Order Management Team Lead**

| Attribute | Value |
|-----------|-------|
| **Department** | Operations |
| **Reports To** | Director of Order Operations |
| **Headcount** | 1 (manages team of 8) |
| **Location(s)** | Austin, TX |

**Key Responsibilities**:
- Oversee daily order processing operations
- Manage exception handling and escalations
- Coordinate with warehouse teams
- Report on order metrics

**Capabilities Supported**:
- Order Capture (CAP-OM-001)
- Order Validation (CAP-OM-002)
- Order Tracking (CAP-OM-005)

**Key Skills Required**:
- E-commerce operations experience
- Order management systems
- Team leadership

---

## Example 5: Gap Analysis - Order Fulfillment

### Capability Gaps

| ID | Capability | Baseline | Target | Gap Description | Priority |
|----|------------|----------|--------|-----------------|----------|
| G-001 | Order Routing | Manual (4hr) | Automated (<5min) | No automated routing rules engine | Critical |
| G-002 | Inventory Visibility | Batch (hourly) | Real-time | No real-time inventory sync | High |
| G-003 | Split Shipment | Manual | Automated | Cannot auto-split orders across warehouses | High |
| G-004 | Carrier Selection | Fixed carrier | Dynamic selection | No carrier API integration | Medium |

### Gap Detail: G-001

**Capability**: Order Fulfillment Routing (CAP-OM-004)

| Current State | Target State |
|---------------|--------------|
| Orders manually reviewed by team | Rules engine auto-routes 95% of orders |
| 4+ hour routing delay | Sub-5-minute routing |
| Decisions based on tribal knowledge | Codified business rules |
| No cost optimization | Cost-optimized routing |

**Impact of Gap**:
- 4+ hours added to fulfillment cycle
- Inconsistent routing decisions
- Higher fulfillment costs (15% variance)
- Staff bottleneck at peak times

**Resolution Approach**:
- Implement order routing rules engine
- Integrate with inventory service
- Define routing rules with business
- Automate carrier selection

**Dependencies**:
- G-002: Real-time inventory required for routing decisions
- New carrier API integrations

**Estimated Effort**: Large (L)

### Gap Summary

| Category | Critical | High | Medium | Low | Total |
|----------|----------|------|--------|-----|-------|
| Capability | 1 | 2 | 1 | 0 | 4 |
| Process | 0 | 1 | 2 | 1 | 4 |
| Organization | 0 | 0 | 1 | 0 | 1 |
| **Total** | **1** | **3** | **4** | **1** | **9** |

---

## Example 6: Work Package - Automated Order Routing

### Work Package Definition

| Attribute | Value |
|-----------|-------|
| **Work Package ID** | WP-B-001 |
| **Name** | Automated Order Routing |
| **Phase** | B - Business Architecture |
| **Description** | Implement rules-based order routing to eliminate manual fulfillment decisions |
| **Business Outcome** | Reduce fulfillment cycle time by 4+ hours, cut costs by 10% |
| **Sponsor** | SVP Operations |
| **Lead** | Director of Order Operations |

### Gaps Addressed

| Gap ID | Gap Description |
|--------|-----------------|
| G-001 | No automated routing rules engine |
| G-002 | No real-time inventory visibility (partial) |

### Scope

**In Scope**:
- Routing rules definition with business
- Rules engine selection/implementation
- Integration with order management system
- Integration with inventory service
- Routing dashboard and reporting

**Out of Scope**:
- Carrier API integrations (separate WP)
- Warehouse management changes
- International orders (Phase 2)

### Dependencies

| Dependency | Type | Description |
|------------|------|-------------|
| WP-B-002 | Predecessor | Inventory real-time sync must complete first |
| WP-B-003 | Parallel | Carrier integration can proceed in parallel |

### Estimates

| Attribute | Estimate |
|-----------|----------|
| Duration | 12 weeks |
| Effort | 480 person-days |
| Cost | $400,000 |

### Risks

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| Rules complexity underestimated | Medium | High | Prototype with top 10 scenarios first |
| Business rules not documented | High | Medium | Dedicated BA for rule capture |
| Integration delays | Medium | Medium | Early spike on integration approach |

---

## Example 7: Business Service Catalog Entry

### Service: Order Status Inquiry

| Attribute | Value |
|-----------|-------|
| **Service ID** | SVC-OM-003 |
| **Category** | Order Management |
| **Description** | Provides real-time order status and tracking information to customers |
| **Service Owner** | Order Management Team Lead |
| **Consumers** | Customers, Customer Service Agents |
| **Status** | Active |

**Service Levels**:

| Metric | Target | Current |
|--------|--------|---------|
| Availability | 99.9% | 99.5% |
| Response Time | <500ms | 800ms |
| Data Freshness | <5 min | 15 min |

**Channels**:
- Website order history
- Mobile app
- Customer service portal
- Email notifications

**Supporting Capabilities**:
- Order Tracking (CAP-OM-005)
- Customer Communication (CAP-CM-003)

**Dependencies**:
- Carrier tracking APIs
- Order Management System
- Notification Service
