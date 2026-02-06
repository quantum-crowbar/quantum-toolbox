# Information Systems Architecture Examples

Concrete examples for TOGAF Phase C deliverables.

---

## Example 1: Data Entity Catalog - E-Commerce

### Entity Summary

| Entity ID | Entity Name | Description | Domain | Owner | Sensitivity |
|-----------|-------------|-------------|--------|-------|-------------|
| ENT-001 | Customer | Person or organization purchasing | Sales | VP Sales | Confidential |
| ENT-002 | Product | Item available for sale | Product | VP Product | Internal |
| ENT-003 | Order | Customer purchase transaction | Operations | VP Ops | Confidential |
| ENT-004 | OrderLine | Line item within an order | Operations | VP Ops | Confidential |
| ENT-005 | Payment | Financial transaction | Finance | CFO | Restricted |
| ENT-006 | Inventory | Stock levels by location | Operations | VP Ops | Internal |
| ENT-007 | Shipment | Package delivery information | Logistics | VP Ops | Internal |
| ENT-008 | Address | Physical location | Shared | VP Sales | Confidential |

### Entity Detail: ENT-001 Customer

| Attribute | Value |
|-----------|-------|
| **Entity ID** | ENT-001 |
| **Name** | Customer |
| **Description** | A person or organization that has purchased or may purchase products |
| **Domain** | Sales |
| **Owner** | VP Sales |
| **Steward** | CRM Administrator |
| **Sensitivity** | Confidential (contains PII) |

**Key Attributes**:

| Attribute | Type | Required | Description |
|-----------|------|----------|-------------|
| customer_id | UUID | Yes | Unique identifier |
| email | String | Yes | Primary contact email |
| name | String | Yes | Full name or company name |
| phone | String | No | Contact phone number |
| customer_type | Enum | Yes | Individual/Business |
| created_at | Timestamp | Yes | Account creation date |
| status | Enum | Yes | Active/Inactive/Suspended |

**Relationships**:

| Related Entity | Relationship | Cardinality |
|----------------|--------------|-------------|
| Order | Customer places Orders | 1:N |
| Address | Customer has Addresses | 1:N |
| Payment | Customer has Payment Methods | 1:N |

**Data Sources**:
- CRM System (primary, real-time)
- E-commerce Platform (sync)
- Customer Support System (read-only)

**Quality Rules**:
- Email must be valid format and unique
- Status must be valid enum value
- Name cannot be empty
- Phone format validated per country

---

## Example 2: Logical Data Model - Order Domain

### Entity Relationship Diagram

```
┌──────────────────┐         ┌──────────────────┐
│     CUSTOMER     │         │      ORDER       │
├──────────────────┤         ├──────────────────┤
│ PK customer_id   │◄───┐    │ PK order_id      │
│    email         │    │    │ FK customer_id   │───┐
│    name          │    └────│ FK ship_addr_id  │   │
│    phone         │         │ FK bill_addr_id  │   │
│    customer_type │         │    order_date    │   │
│    status        │         │    status        │   │
└──────────────────┘         │    subtotal      │   │
                             │    tax           │   │
                             │    total         │   │
                             └──────────────────┘   │
                                      │             │
┌──────────────────┐                  │             │
│     ADDRESS      │                  │             │
├──────────────────┤                  │             │
│ PK address_id    │◄─────────────────┼─────────────┘
│ FK customer_id   │                  │
│    street        │                  │
│    city          │                  │
│    state         │                  │
│    postal_code   │                  │
│    country       │                  │
│    address_type  │                  │
└──────────────────┘                  │
                                      │
┌──────────────────┐         ┌────────▼─────────┐
│     PRODUCT      │         │   ORDER_LINE     │
├──────────────────┤         ├──────────────────┤
│ PK product_id    │◄────────│ PK line_id       │
│    sku           │         │ FK order_id      │
│    name          │         │ FK product_id    │
│    description   │         │    quantity      │
│    price         │         │    unit_price    │
│    category      │         │    line_total    │
│    status        │         └──────────────────┘
└──────────────────┘

┌──────────────────┐         ┌──────────────────┐
│     PAYMENT      │         │    SHIPMENT      │
├──────────────────┤         ├──────────────────┤
│ PK payment_id    │         │ PK shipment_id   │
│ FK order_id      │─────────│ FK order_id      │
│    amount        │         │    carrier       │
│    method        │         │    tracking_num  │
│    status        │         │    status        │
│    processed_at  │         │    shipped_at    │
└──────────────────┘         │    delivered_at  │
                             └──────────────────┘
```

### Relationships

| From Entity | To Entity | Relationship | Cardinality | Description |
|-------------|-----------|--------------|-------------|-------------|
| Customer | Order | Places | 1:N | Customer places orders |
| Customer | Address | Has | 1:N | Customer has addresses |
| Order | OrderLine | Contains | 1:N | Order has line items |
| OrderLine | Product | References | N:1 | Line item for product |
| Order | Payment | Has | 1:N | Order has payments |
| Order | Shipment | Has | 1:N | Order has shipments |
| Order | Address | ShipsTo | N:1 | Order ships to address |
| Order | Address | BillsTo | N:1 | Order bills to address |

---

## Example 3: Data Store Catalog

### Store Summary

| Store ID | Name | Type | Technology | Location | Owner |
|----------|------|------|------------|----------|-------|
| DS-001 | Customer DB | OLTP | PostgreSQL 15 | AWS us-east-1 | Platform Team |
| DS-002 | Order DB | OLTP | PostgreSQL 15 | AWS us-east-1 | Platform Team |
| DS-003 | Product DB | OLTP | MongoDB 6.0 | AWS us-east-1 | Platform Team |
| DS-004 | Analytics DW | OLAP | Snowflake | Snowflake Cloud | BI Team |
| DS-005 | Search Index | Index | Elasticsearch 8 | AWS us-east-1 | Platform Team |
| DS-006 | Session Cache | Cache | Redis 7 | AWS us-east-1 | Platform Team |

### Store Detail: DS-002 Order DB

| Attribute | Value |
|-----------|-------|
| **Store ID** | DS-002 |
| **Name** | Order Database |
| **Type** | OLTP |
| **Technology** | PostgreSQL 15.4 |
| **Version** | 15.4 |
| **Location** | AWS RDS us-east-1 |
| **Owner** | Platform Team |

**Hosted Entities**:

| Entity | Access Pattern | Volume | Growth Rate |
|--------|----------------|--------|-------------|
| Order | Write-heavy | 5M rows | 15%/month |
| OrderLine | Write-heavy | 20M rows | 15%/month |
| Payment | Write-heavy | 6M rows | 15%/month |
| Shipment | Write-heavy | 5M rows | 15%/month |

**Backup & Recovery**:

| Attribute | Value |
|-----------|-------|
| Backup Frequency | Continuous (WAL) + Daily snapshot |
| Retention Period | 35 days |
| RTO | 1 hour |
| RPO | 5 minutes |

**Access**:
- Read Applications: Order API, Analytics ETL, Customer Support
- Write Applications: Order API, Payment Processor

---

## Example 4: Application Catalog

### Application Summary

| App ID | Name | Type | Technology | Owner | Lifecycle |
|--------|------|------|------------|-------|-----------|
| APP-001 | Web Storefront | Custom | React/Next.js | Engineering | Invest |
| APP-002 | Order Service | Custom | Node.js/Express | Engineering | Invest |
| APP-003 | Customer CRM | COTS | Salesforce | Sales | Maintain |
| APP-004 | Legacy ERP | COTS | SAP ECC | Finance | Migrate |
| APP-005 | Product Service | Custom | Python/FastAPI | Engineering | Invest |
| APP-006 | Warehouse Mgmt | SaaS | ShipBob | Operations | Maintain |
| APP-007 | Analytics Platform | SaaS | Looker | BI Team | Invest |

### Application Detail: APP-002 Order Service

| Attribute | Value |
|-----------|-------|
| **App ID** | APP-002 |
| **Name** | Order Service |
| **Description** | Core order management service handling order lifecycle from creation to fulfillment |
| **Type** | Custom |
| **Vendor** | In-house |
| **Technology Stack** | Node.js 20, Express, TypeScript, PostgreSQL |
| **Deployment** | AWS ECS (Fargate) |
| **Owner** | Order Platform Team |
| **Users** | Internal services + 50K daily customers (indirect) |
| **Lifecycle State** | Invest |

**Capabilities Supported**:

| Capability | Support Level |
|------------|---------------|
| Order Capture | Primary |
| Order Validation | Primary |
| Order Pricing | Secondary (uses Pricing Service) |
| Order Tracking | Primary |
| Returns Processing | Primary |

**Integrations**:

| Connected App | Direction | Interface | Data Exchanged |
|---------------|-----------|-----------|----------------|
| Web Storefront | In | REST API | Order requests |
| Product Service | Out | gRPC | Availability check |
| Payment Processor | Out | REST API | Payment requests |
| CRM | Out | Events | Order events |
| Warehouse Mgmt | Out | Events | Fulfillment requests |
| Legacy ERP | Out | File | Order summaries (daily) |

**Technical Health**:

| Dimension | Score (1-5) | Notes |
|-----------|-------------|-------|
| Business Fit | 5 | Core revenue system |
| Technical Health | 4 | Modern stack, good practices |
| Operational Health | 4 | Well-monitored, 99.9% uptime |
| Cost Efficiency | 4 | Efficient resource usage |
| **Overall** | **4.25** | |

**Data Entities**:
- Reads: Customer, Product, Inventory
- Writes: Order, OrderLine, Payment, Shipment

---

## Example 5: Application-Capability Matrix

| Capability | APP-001 Web | APP-002 Order | APP-003 CRM | APP-004 ERP | APP-005 Product | APP-006 WMS | Gap? |
|------------|-------------|---------------|-------------|-------------|-----------------|-------------|------|
| **Customer Management** | ★ | ★ | ★★★ | ★ | - | - | No |
| **Product Management** | ★ | - | - | - | ★★★ | - | No |
| **Order Capture** | ★★ | ★★★ | - | - | - | - | No |
| **Order Validation** | - | ★★★ | - | - | - | - | No |
| **Order Pricing** | - | ★★ | - | ★ | ★★★ | - | No |
| **Order Tracking** | ★★ | ★★★ | - | - | - | ★ | No |
| **Inventory Management** | - | ★ | - | ★★ | ★ | ★★★ | No |
| **Fulfillment** | - | - | - | - | - | ★★★ | No |
| **Returns Processing** | ★ | ★★★ | - | - | - | ★★ | No |
| **Financial Reporting** | - | - | - | ★★★ | - | - | No |
| **Customer Analytics** | - | - | ★★ | - | - | - | Partial |
| **Demand Forecasting** | - | - | - | ★ | - | - | YES |

**Legend**: ★★★ = Primary | ★★ = Secondary | ★ = Minimal | - = None

### Gap Analysis Summary

| Capability | Issue | Recommendation |
|------------|-------|----------------|
| Customer Analytics | Only in CRM, limited views | Extend to Looker analytics |
| Demand Forecasting | Rudimentary in ERP | New forecasting solution needed |

---

## Example 6: Interface Catalog

### Order Service Interfaces

| Interface ID | Name | Type | Direction | Status |
|--------------|------|------|-----------|--------|
| INT-001 | Order REST API | REST | Inbound | Active |
| INT-002 | Product Availability | gRPC | Outbound | Active |
| INT-003 | Payment Processing | REST | Outbound | Active |
| INT-004 | Order Events | Event | Outbound | Active |
| INT-005 | Legacy ERP Export | File | Outbound | Deprecated |

### Interface Detail: INT-001 Order REST API

| Attribute | Value |
|-----------|-------|
| **Interface ID** | INT-001 |
| **Name** | Order REST API |
| **Application** | APP-002 Order Service |
| **Type** | REST |
| **Direction** | Inbound |
| **Protocol** | HTTPS |
| **Authentication** | OAuth 2.0 + API Key |
| **Status** | Active |

**Endpoints**:

| Method | Path | Description |
|--------|------|-------------|
| POST | /v2/orders | Create new order |
| GET | /v2/orders/{id} | Get order by ID |
| GET | /v2/orders | List orders (with filters) |
| PATCH | /v2/orders/{id} | Update order |
| POST | /v2/orders/{id}/cancel | Cancel order |
| GET | /v2/orders/{id}/tracking | Get tracking info |

**Consumers**:
- Web Storefront (APP-001)
- Mobile App
- Customer Support Portal

**SLA**:

| Metric | Target |
|--------|--------|
| Availability | 99.9% |
| P50 Response Time | 100ms |
| P99 Response Time | 500ms |
| Throughput | 1000 req/sec |

---

## Example 7: Integration Architecture

### Integration Patterns

| Pattern | Usage | Applications |
|---------|-------|--------------|
| Synchronous REST | Real-time queries and commands | Web ↔ Order, Order ↔ Product |
| Async Events | Domain events, eventual consistency | Order → CRM, Order → WMS |
| gRPC | High-performance internal | Order → Product |
| Batch File | Legacy integration | Order → ERP |

### Integration Diagram

```
┌─────────────┐     REST      ┌─────────────────┐
│    Web      │──────────────▶│   API Gateway   │
│ Storefront  │               │   (Kong)        │
└─────────────┘               └────────┬────────┘
                                       │
                              ┌────────┴────────┐
                              │ REST            │ gRPC
                              ▼                 ▼
                     ┌─────────────┐    ┌─────────────┐
                     │   Order     │───▶│  Product    │
                     │  Service    │    │  Service    │
                     └──────┬──────┘    └─────────────┘
                            │
                     Events │ (Kafka)
          ┌─────────────────┼─────────────────┐
          │                 │                 │
          ▼                 ▼                 ▼
   ┌─────────────┐  ┌─────────────┐  ┌─────────────┐
   │   CRM       │  │  Warehouse  │  │  Analytics  │
   │ (Salesforce)│  │   (WMS)     │  │  (Looker)   │
   └─────────────┘  └─────────────┘  └─────────────┘
          │                                   ▲
          │         ┌─────────────┐           │
          │   File  │  Legacy     │    ETL    │
          └────────▶│    ERP      │───────────┘
                    └─────────────┘
```

### Integration Matrix

| From \ To | Order | Product | CRM | WMS | ERP | Analytics |
|-----------|-------|---------|-----|-----|-----|-----------|
| **Web** | REST | REST | - | - | - | - |
| **Order** | - | gRPC | Events | Events | File | - |
| **Product** | gRPC | - | - | Events | - | - |
| **CRM** | - | - | - | - | File | - |
| **WMS** | Events | Events | - | - | - | - |
| **ERP** | - | - | - | - | - | ETL |

---

## Example 8: IS Gap Analysis

### Data Gaps

| Gap ID | Entity/Area | Baseline | Target | Description | Priority |
|--------|-------------|----------|--------|-------------|----------|
| DG-001 | Customer | No golden record | Single source of truth | Customer data fragmented across CRM, Order, ERP | Critical |
| DG-002 | Product | Batch sync | Real-time | Product availability 15-min stale | High |
| DG-003 | Order | No analytics model | Star schema | Cannot do order analytics efficiently | Medium |

### Gap Detail: DG-001 Customer Golden Record

| Current State | Target State |
|---------------|--------------|
| Customer data in CRM (primary), Order DB (copy), ERP (copy) | Single Customer service as source of truth |
| Sync via nightly batch | Real-time event-driven sync |
| Conflicting data across systems | Consistent data everywhere |

**Impact**:
- Customer service sees different data than sales
- Marketing campaigns sent to wrong addresses
- Compliance risk (GDPR data requests difficult)

**Resolution Approach**:
- Implement Customer Domain Service
- Establish as master data source
- Event-driven sync to consumers
- Data quality rules at source

**Dependencies**:
- AG-004: API Gateway (for routing)

**Estimated Effort**: Large (L)

### Application Gaps

| Gap ID | Application/Area | Baseline | Target | Description | Priority |
|--------|-----------------|----------|--------|-------------|----------|
| AG-001 | Pricing | Hardcoded in apps | Centralized engine | No dynamic pricing capability | High |
| AG-002 | Forecasting | Spreadsheets | ML-based | Cannot predict demand | Medium |
| AG-003 | ERP | SAP ECC (on-prem) | Cloud ERP | Legacy, high maintenance | High |
| AG-004 | Integration | Point-to-point | API Gateway | Inconsistent integration | Critical |

### Gap Summary

| Category | Critical | High | Medium | Low | Total |
|----------|----------|------|--------|-----|-------|
| Data | 1 | 1 | 1 | 0 | 3 |
| Application | 1 | 2 | 1 | 0 | 4 |
| Integration | 1 | 0 | 1 | 0 | 2 |
| **Total** | **3** | **3** | **3** | **0** | **9** |

---

## Example 9: Work Package - Customer Master Data

### Work Package Definition

| Attribute | Value |
|-----------|-------|
| **Work Package ID** | WP-C-001 |
| **Name** | Customer Master Data Management |
| **Phase** | C - Information Systems Architecture |
| **Description** | Implement Customer service as single source of truth with event-driven sync |
| **Business Outcome** | Consistent customer view across all systems, GDPR compliance |
| **Sponsor** | Chief Data Officer |
| **Lead** | Platform Architect |

### Gaps Addressed

| Gap ID | Type | Gap Description |
|--------|------|-----------------|
| DG-001 | Data | Customer data fragmented across systems |
| AG-004 | Application | Point-to-point integration (partial) |

### Scope

**In Scope**:
- Customer domain service design and build
- Customer data model definition
- Event schema for customer changes
- Sync adapters for CRM, Order, ERP
- Data migration from existing sources

**Out of Scope**:
- CRM replacement
- ERP changes (read-only consumer)
- Historical data (last 3 years only)

### Deliverables

| Deliverable | Description |
|-------------|-------------|
| Customer Service | API + event publisher |
| Data Model | Canonical customer entity |
| Event Schema | Customer.Created/Updated/Deleted |
| CRM Adapter | Bidirectional sync |
| Order Adapter | Event consumer |
| Migration Scripts | One-time data load |

### Dependencies

| Dependency | Type | Description |
|------------|------|-------------|
| WP-C-003 | Predecessor | Event bus infrastructure |
| WP-C-002 | Parallel | API Gateway (can proceed together) |

### Estimates

| Attribute | Estimate |
|-----------|----------|
| Duration | 16 weeks |
| Effort | 640 person-days |
| Cost | $600,000 |

### Risks

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| Data quality issues during migration | High | Medium | Data cleansing sprint first |
| CRM integration complexity | Medium | High | Early spike with Salesforce APIs |
| Business resistance to change | Medium | Medium | Change management program |
