# Implementation Governance Examples

Concrete examples for TOGAF Phase G deliverables.

---

## Architecture Contract Example

```markdown
# Architecture Contract

**Contract ID**: AC-001
**Project**: Customer Portal Modernization
**Version**: 1.0
**Effective Date**: 2025-02-01

---

## Parties

| Role | Name | Title | Responsibility |
|------|------|-------|----------------|
| Architecture Authority | Sarah Chen | Enterprise Architect | Standards, guidance, reviews |
| Implementation Lead | Marcus Thompson | Tech Lead | Delivery, compliance, escalation |
| Project Sponsor | Jennifer Walsh | VP Digital | Funding, decisions, acceptance |

---

## Scope

### Project Overview
| Attribute | Value |
|-----------|-------|
| Project Name | Customer Portal Modernization |
| Project ID | PRJ-2025-CP-001 |
| Transition | TA-2 (Core Platform Modernization) |
| Start Date | 2025-02-01 |
| End Date | 2025-08-31 |

### Objectives
1. Replace legacy JSP portal with React-based SPA
2. Migrate from on-premise to AWS cloud infrastructure
3. Implement modern authentication via OAuth 2.0/OIDC
4. Achieve <2 second page load time (P95)

### Deliverables
| Deliverable | Description | Acceptance Criteria |
|-------------|-------------|---------------------|
| Customer Portal SPA | React application with full customer functionality | All user stories complete, UAT passed |
| API Gateway | Kong gateway with rate limiting, auth | Security review passed |
| Authentication Service | Keycloak integration | Pentest passed, SSO functional |
| CDN Configuration | CloudFront distribution | Performance tests met |

---

## Architecture Commitments

### Target Architecture
The implementation shall conform to:

| Artifact | Version | Location |
|----------|---------|----------|
| Transition Architecture | TA-2 v1.2 | /architecture/transitions/TA-2 |
| Solution Design | v2.1 | /projects/customer-portal/design |
| API Specifications | v1.0 | /projects/customer-portal/api-specs |
| Data Model | v1.1 | /projects/customer-portal/data-model |

### Technology Standards
| Standard | Version | Applicability |
|----------|---------|---------------|
| React | 18.x | Frontend framework |
| TypeScript | 5.x | All frontend code |
| Node.js | 20.x LTS | BFF and tooling |
| PostgreSQL | 15.x | Persistent storage |
| Redis | 7.x | Session and caching |
| Kong | 3.x | API Gateway |
| Kubernetes | 1.28+ | Container orchestration |

### Architecture Principles
| Principle | Implication for This Project |
|-----------|------------------------------|
| Cloud-First | All components deployed to AWS, no on-premise dependencies |
| API-First | All data access through documented APIs, no direct DB access from UI |
| Security by Design | OAuth 2.0 for auth, encrypted at rest and in transit, WAF protection |
| Loose Coupling | Components communicate via APIs/events, no shared databases |

### Non-Functional Requirements
| Requirement | Target | Verification Method |
|-------------|--------|---------------------|
| Response Time (P95) | <2 seconds | Load testing with Gatling |
| Availability | 99.9% | AWS monitoring, SLA tracking |
| Scalability | 10,000 concurrent users | Load testing |
| Security | OWASP Top 10 compliant | Penetration testing |
| Recovery | RTO 1hr, RPO 15min | DR drill |

---

## Governance Process

### Review Checkpoints
| Checkpoint | Timing | Deliverables | Reviewers |
|------------|--------|--------------|-----------|
| Design Review | 2025-02-28 | Solution design, API specs | Sarah Chen, Security Team |
| Implementation Check | 2025-05-15 | Working code, test results | Architecture Team |
| Pre-Go-Live Review | 2025-08-15 | All documentation, test reports | Full Architecture Board |

### Review Criteria
Each review will assess:
- [x] Architecture conformance (solution matches target)
- [x] Standards compliance (tech stack per standards)
- [x] Principle adherence (each principle verified)
- [x] Non-functional requirements (performance, security)
- [x] Documentation completeness (design, API, ops docs)

### Communication
| Communication | Frequency | Participants | Format |
|---------------|-----------|--------------|--------|
| Architecture Sync | Bi-weekly | Tech Lead, Architect | 30-min meeting |
| Status Update | Weekly | All parties | Email summary |
| Escalation | As needed | Sponsor, Architect | Immediate call |

---

## Exception Management

### Deviation Types
| Type | Description | Approval Authority |
|------|-------------|-------------------|
| Variance | Minor, low risk | Sarah Chen (Enterprise Architect) |
| Deferral | Temporary, with remediation | Architecture Review Board |
| Waiver | Permanent exception | Architecture Review Board + CTO |

### Exception Process
1. Submit deviation request via architecture portal
2. Impact assessment within 2 business days
3. Decision by appropriate authority within 5 days
4. Document in deviation register
5. Track remediation monthly (for deferrals)

---

## Acceptance

### Acceptance Criteria
- [x] All review checkpoints passed
- [x] No unresolved non-compliances (Critical/High)
- [x] All deferrals have approved remediation plans
- [x] Operational documentation complete
- [x] Production readiness checklist complete
- [x] Security sign-off obtained

### Sign-Off

| Role | Name | Signature | Date |
|------|------|-----------|------|
| Architecture Authority | Sarah Chen | _____________ | ________ |
| Implementation Lead | Marcus Thompson | _____________ | ________ |
| Project Sponsor | Jennifer Walsh | _____________ | ________ |
```

---

## Compliance Assessment Example

```markdown
# Compliance Assessment Report

**Assessment ID**: CAR-2025-CP-002
**Project**: Customer Portal Modernization
**Review Type**: Implementation Check
**Date**: 2025-05-15

---

## Review Information

| Attribute | Value |
|-----------|-------|
| Project | Customer Portal Modernization |
| Project ID | PRJ-2025-CP-001 |
| Contract Reference | AC-001 |
| Review Type | Implementation Check |
| Date | 2025-05-15 |
| Duration | 3 hours |

### Reviewers
| Name | Role | Focus Area |
|------|------|------------|
| Sarah Chen | Enterprise Architect | Overall architecture |
| David Park | Security Architect | Security controls |
| Lisa Rodriguez | Data Architect | Data handling |

### Attendees
| Name | Role |
|------|------|
| Marcus Thompson | Tech Lead |
| Emily Zhao | Senior Developer |
| James Wilson | DevOps Engineer |

---

## Assessment Summary

### Overall Status
| Dimension | Status | Score |
|-----------|--------|-------|
| Architecture Conformance | ✓ Compliant | 9/10 |
| Standards Compliance | ⚠ Deviations | 7/10 |
| Principle Adherence | ✓ Compliant | 9/10 |
| Documentation | ⚠ Gaps | 7/10 |

### Finding Summary
| Category | Compliant | Deviation | Non-Compliant | N/A |
|----------|-----------|-----------|---------------|-----|
| Architecture | 12 | 1 | 0 | 0 |
| Standards | 8 | 2 | 0 | 1 |
| Principles | 4 | 0 | 0 | 0 |
| **Total** | **24** | **3** | **0** | **1** |

---

## Detailed Findings

### Finding F-001: PostgreSQL Version

| Attribute | Value |
|-----------|-------|
| **Finding ID** | F-001 |
| **Category** | Technology Standard |
| **Reference** | Tech Standard: PostgreSQL 15.x |
| **Severity** | Medium |
| **Status** | Deviation Requested |

**Description**:
Database version review for the customer data store.

**Expected**:
PostgreSQL 15.x per technology standards catalog.

**Actual**:
PostgreSQL 14.11 is deployed, as AWS RDS for PostgreSQL 15 
was not available in ap-southeast-1 at project start.

**Impact**:
Minor - PostgreSQL 14 is still supported. Missing some 15.x 
features (MERGE statement, JSON_TABLE) but workarounds exist.

**Recommendation**:
Submit deferral request with remediation to upgrade when 
RDS 15.x becomes available (expected Q3 2025).

---

### Finding F-002: API Documentation Gaps

| Attribute | Value |
|-----------|-------|
| **Finding ID** | F-002 |
| **Category** | Documentation Standard |
| **Reference** | API-DOC-001: All APIs must have OpenAPI 3.0 specs |
| **Severity** | Medium |
| **Status** | Non-Compliant (remediation in progress) |

**Description**:
Review of API documentation completeness.

**Expected**:
All APIs have complete OpenAPI 3.0 specifications with 
examples and error responses.

**Actual**:
18 of 23 endpoints have complete specs. 5 internal 
endpoints have partial documentation (missing error responses).

**Impact**:
Impacts developer experience for internal consumers. 
No external impact.

**Recommendation**:
Complete documentation before go-live. Action item assigned.

---

### Finding F-003: Observability Standard

| Attribute | Value |
|-----------|-------|
| **Finding ID** | F-003 |
| **Category** | Standard |
| **Reference** | OBS-001: OpenTelemetry for distributed tracing |
| **Severity** | Low |
| **Status** | Variance Approved |

**Description**:
Review of observability implementation.

**Expected**:
OpenTelemetry SDK for all tracing.

**Actual**:
AWS X-Ray SDK used instead of OpenTelemetry. Provides 
equivalent functionality in AWS environment.

**Impact**:
None - X-Ray provides equivalent tracing capability 
and integrates better with AWS infrastructure.

**Recommendation**:
Variance approved by Enterprise Architect. Standard to 
be updated to allow X-Ray for AWS-native deployments.

---

## Action Items

| ID | Action | Owner | Due Date | Priority | Status |
|----|--------|-------|----------|----------|--------|
| A-001 | Submit deferral for PostgreSQL 14 | Marcus Thompson | 2025-05-22 | Medium | Open |
| A-002 | Complete API documentation for 5 endpoints | Emily Zhao | 2025-06-01 | Medium | In Progress |
| A-003 | Update Observability standard for AWS X-Ray | Sarah Chen | 2025-05-30 | Low | Open |

---

## Review Decision

| Decision | Details |
|----------|---------|
| **Outcome** | Approved with Conditions |
| **Authority** | Sarah Chen, Enterprise Architect |
| **Date** | 2025-05-15 |

### Conditions
| Condition | Due Date | Verification |
|-----------|----------|--------------|
| Complete API documentation for all endpoints | 2025-06-01 | Automated spec validation |
| Submit PostgreSQL deferral request | 2025-05-22 | Request in system |

### Next Steps
1. Address action items by due dates
2. Submit PostgreSQL deferral for Architecture Board review
3. Proceed to pre-go-live review (scheduled 2025-08-15)
```

---

## Deviation Request Example

```markdown
# Deviation Request

**Request ID**: DEV-2025-037
**Status**: Approved
**Date**: 2025-05-28

---

## Request Information

| Attribute | Value |
|-----------|-------|
| **Request ID** | DEV-2025-037 |
| **Project** | Customer Portal Modernization |
| **Project ID** | PRJ-2025-CP-001 |
| **Requestor** | Marcus Thompson |
| **Date Submitted** | 2025-05-22 |
| **Urgency** | Medium |

---

## Deviation Details

### Type
| Type | Selected |
|------|----------|
| Variance (minor, low risk) | ☐ |
| Deferral (temporary, remediation planned) | ☑ |
| Waiver (permanent exception) | ☐ |

### Category
| Category | Selected |
|----------|----------|
| Architecture | ☐ |
| Technology Standard | ☑ |
| Security Standard | ☐ |
| Architecture Principle | ☐ |

### Reference
| Attribute | Value |
|-----------|-------|
| Requirement | PostgreSQL 15.x for all new deployments |
| Source | Technology Standards Catalog, DB-PG-001 |
| Version | v3.2 (2024-06) |

### Deviation Description
Request to deploy with PostgreSQL 14.11 instead of the mandated 
15.x version. AWS RDS for PostgreSQL 15 was not available in 
ap-southeast-1 region when the project database was provisioned 
(2025-02-15). We request a deferral to allow launch with 14.x 
and upgrade when 15.x becomes available.

---

## Justification

### Why Is This Deviation Needed?
PostgreSQL 15.x was not available in our deployment region 
(ap-southeast-1) at the time of database provisioning. Our 
architecture requires the database to be in the same region 
as the application for latency requirements.

### Business Impact of Compliance
| Impact | Description |
|--------|-------------|
| Cost | Would require cross-region deployment ($15K/month additional) |
| Timeline | 3-month delay waiting for regional availability |
| Functionality | Application requires sub-50ms DB latency |

### Alternatives Considered
| Alternative | Analysis | Why Not Viable |
|-------------|----------|----------------|
| Cross-region DB | RDS 15.x in ap-northeast-1 | 120ms latency, breaks NFR |
| Self-managed PostgreSQL | EC2-based PostgreSQL 15 | Operational overhead, no team skills |
| Different cloud provider | GCP offers PG 15 in region | Architecture requires AWS, 6-month migration |

---

## Impact Assessment

### Technical Impact
| Factor | Assessment | Notes |
|--------|------------|-------|
| Security | None | Both 14.x and 15.x receive security patches |
| Performance | Low | PG15 has minor query planner improvements, not critical |
| Scalability | None | Connection and storage limits identical |
| Maintainability | None | Both versions in standard support |
| Integration | None | API compatibility maintained |

### Organizational Impact
| Factor | Assessment | Notes |
|--------|------------|-------|
| Technical Debt | Low | Tracked deferral, clear remediation path |
| Precedent Risk | None | Region-specific issue, not generalizable |
| Skills Impact | None | Team experienced with both versions |

### Risk Assessment
| Risk | Probability | Impact | Mitigation |
|------|-------------|--------|------------|
| Extended delay in 15.x availability | Low | Medium | Monitor AWS announcements, escalate if delayed |
| Security vulnerability in 14.x only | Low | High | Immediate patching process, fallback to cross-region |

---

## Remediation Plan

### Remediation Approach
Upgrade to PostgreSQL 15.x via AWS RDS major version upgrade 
once available in ap-southeast-1. This is a managed upgrade 
process with minimal downtime (typically <10 minutes).

### Timeline
| Milestone | Target Date | Deliverable |
|-----------|-------------|-------------|
| AWS availability monitoring | Ongoing | Monthly status check |
| 15.x availability (est.) | 2025-09-01 | AWS announcement |
| Upgrade planning | 2025-09-15 | Upgrade runbook |
| Upgrade execution | 2025-10-01 | Production on 15.x |

### Resources Required
| Resource | Quantity | Notes |
|----------|----------|-------|
| DBA time | 8 hours | Upgrade planning and execution |
| Maintenance window | 2 hours | Scheduled downtime |

### Tracking
| Attribute | Value |
|-----------|-------|
| Tracking Owner | James Wilson (DevOps) |
| Review Frequency | Monthly |
| Expiry Date | 2025-11-01 |

---

## Decision

### Recommendation
| Recommender | Role | Recommendation | Date |
|-------------|------|----------------|------|
| Sarah Chen | Enterprise Architect | Approve | 2025-05-25 |

**Rationale**:
The deviation is justified by external constraints (AWS regional 
availability). Impact is low and remediation path is clear. No 
security or architectural concerns with PostgreSQL 14.x.

### Decision
| Decision | Authority | Date |
|----------|-----------|------|
| Approved | Architecture Review Board | 2025-05-28 |

### Conditions
1. Monthly status check on PostgreSQL 15.x availability
2. Upgrade within 30 days of regional availability
3. Escalate immediately if 15.x not available by 2025-10-01

---

## Tracking

| Event | Date | By | Notes |
|-------|------|----|----|
| Submitted | 2025-05-22 | Marcus Thompson | |
| Impact Assessed | 2025-05-24 | Sarah Chen | Low risk confirmed |
| Board Reviewed | 2025-05-28 | ARB | Unanimous approval |
| Remediated | | | Pending |
```

---

## Lessons Learned Example

```markdown
# Lesson Learned

**Lesson ID**: LL-2025-012
**Date**: 2025-05-30

---

## Identification

| Attribute | Value |
|-----------|-------|
| **Lesson ID** | LL-2025-012 |
| **Source** | Compliance Review |
| **Source Reference** | CAR-2025-CP-002 (Finding F-002) |
| **Category** | Process |
| **Submitted By** | Sarah Chen |
| **Date** | 2025-05-30 |

---

## Description

### What Happened
During the implementation compliance review for Customer Portal 
Modernization, we found that 5 of 23 API endpoints had incomplete 
OpenAPI documentation (missing error responses). The development 
team had documented the endpoints but didn't know the full 
documentation standard requirements.

### What Was Learned
The API documentation standard (API-DOC-001) is referenced in 
architecture contracts but the specific requirements are not 
communicated at project kickoff. Teams often discover the full 
requirements at compliance reviews, causing rework.

### Impact
| Type | Description |
|------|-------------|
| What happened | 2 weeks of documentation rework, review delay |
| What could have happened | Go-live delay if found later |

---

## Analysis

### Root Cause
API documentation requirements are in the standards catalog but 
not included in project onboarding or architecture contract 
orientation sessions.

### Contributing Factors
1. Standards catalog is comprehensive but not easy to navigate
2. No checklist given to teams at project start
3. Architects assumed teams knew the standards
4. No automated validation until review stage

---

## Recommendation

### Proposed Change
1. Create an "API Project Starter Kit" with documentation templates
2. Add automated OpenAPI validation to CI/CD pipeline
3. Include standards overview in architecture kickoff meeting

### Change Type
| Type | Selected |
|------|----------|
| Architecture update | ☐ |
| Standard update | ☐ |
| Process improvement | ☑ |
| Tooling enhancement | ☑ |
| Training need | ☑ |

### Affected Artifacts
| Artifact | Proposed Change |
|----------|-----------------|
| Project Onboarding Checklist | Add API documentation requirements |
| CI/CD Pipeline Templates | Add spectral/openapi-lint stage |
| Architecture Kickoff Deck | Add "Documentation Requirements" slide |

---

## Action

| Action | Owner | Due Date | Status |
|--------|-------|----------|--------|
| Create API Project Starter Kit | Lisa Rodriguez | 2025-06-15 | Open |
| Add spectral to CI/CD template | Platform Team | 2025-06-30 | Open |
| Update kickoff presentation | Sarah Chen | 2025-06-10 | Open |
| Communicate changes to teams | Sarah Chen | 2025-07-01 | Open |

---

## Tracking

| Event | Date | By |
|-------|------|----|
| Submitted | 2025-05-30 | Sarah Chen |
| Reviewed | 2025-06-02 | Architecture Team |
| Action Assigned | 2025-06-03 | Sarah Chen |
| Closed | | Pending |
```

---

## Deviation Register Excerpt

```markdown
# Deviation Register

**As of**: 2025-06-01
**Owner**: Architecture Governance Team

---

## Summary

| Type | Active | Pending | Remediated | Total |
|------|--------|---------|------------|-------|
| Waivers | 3 | 0 | N/A | 3 |
| Deferrals | 7 | 2 | 12 | 21 |
| Variances | 15 | 1 | N/A | 16 |
| **Total** | **25** | **3** | **12** | **40** |

---

## Active Deviations

| ID | Project | Type | Category | Summary | Impact | Expiry | Owner |
|----|---------|------|----------|---------|--------|--------|-------|
| DEV-2025-037 | Customer Portal | Deferral | Tech Standard | PostgreSQL 14 instead of 15 | Low | 2025-11-01 | J. Wilson |
| DEV-2025-029 | Payment Gateway | Waiver | Architecture | Direct DB access from legacy | Medium | Permanent | T. Brown |
| DEV-2025-031 | Mobile App | Deferral | Security | OAuth 1.0 for legacy backend | High | 2025-09-01 | K. Lee |
| DEV-2025-033 | Data Platform | Variance | Standard | Snowflake instead of Redshift | Low | N/A | M. Garcia |
| DEV-2025-035 | API Gateway | Variance | Architecture | Custom rate limiter | Low | N/A | S. Patel |

---

## Expiring Soon (Next 30 Days)

| ID | Project | Type | Expiry | Remediation Status |
|----|---------|------|--------|-------------------|
| DEV-2025-022 | Inventory System | Deferral | 2025-06-15 | At Risk |
| DEV-2025-025 | CRM Integration | Deferral | 2025-06-30 | On Track |

---

## Trends

### By Quarter
| Quarter | Opened | Closed | Net |
|---------|--------|--------|-----|
| Q1 2025 | 14 | 8 | +6 |
| Q2 2025 | 11 | 7 | +4 |

### By Category
| Category | Current | Previous | Trend |
|----------|---------|----------|-------|
| Architecture | 4 | 5 | ↓ |
| Tech Standards | 12 | 10 | ↑ |
| Security | 5 | 6 | ↓ |
| Principles | 4 | 4 | → |
```
