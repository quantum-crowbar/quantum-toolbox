# Preliminary Phase Examples

Sample outputs for architecture capability establishment.

---

## Example 1: Startup Quick Setup

### Context
A 15-person startup with 3 development teams needs lightweight architecture guidance.

### Principles Document

```markdown
# Architecture Principles

> Guiding principles for TechStartup Inc. engineering decisions.
> Last updated: 2026-02-01

## Our Core Principles

### 1. Ship Fast, Iterate Faster

**Statement**: Prefer solutions that can be delivered quickly and improved iteratively.

**Rationale**: As a startup, our competitive advantage is speed. Perfect is the enemy of good.

**Implications**:
- MVP mindset for new features
- Technical debt is acceptable if documented
- Refactoring scheduled regularly

---

### 2. API-First Always

**Statement**: Every service exposes a well-documented REST or GraphQL API.

**Rationale**: APIs enable integration, automation, and future flexibility.

**Implications**:
- Design API before implementation
- OpenAPI spec required for REST
- No direct database access between services

---

### 3. Own Your Data

**Statement**: Each service owns and manages its data exclusively.

**Rationale**: Shared databases create coupling and coordination problems.

**Implications**:
- One database per service
- Data shared via APIs or events
- No foreign keys across service boundaries

---

### 4. Security is Everyone's Job

**Statement**: Security considerations are part of every design and code review.

**Rationale**: Security breaches can destroy a startup. Prevention is cheaper than recovery.

**Implications**:
- Auth required for all endpoints
- Secrets in vault, never in code
- Dependency scanning in CI

---

### 5. Observable by Default

**Statement**: All services emit structured logs, metrics, and traces.

**Rationale**: You can't fix what you can't see. Debugging production requires observability.

**Implications**:
- Structured JSON logging
- Key metrics dashboards
- Distributed tracing enabled

---

### 6. Automate the Boring Stuff

**Statement**: Repetitive tasks should be automated.

**Rationale**: Humans make mistakes. Automation is consistent and scalable.

**Implications**:
- CI/CD for all deployments
- Infrastructure as code
- Automated testing required

---

## Decision Process

| Decision Size | Who Decides | Documentation |
|---------------|-------------|---------------|
| Small (library choice) | Developer | None required |
| Medium (service design) | Tech Lead | Brief ADR |
| Large (new technology) | CTO + Leads | Full ADR |

## Exceptions

Exceptions allowed with:
1. Tech Lead approval
2. Written justification
3. Plan to address later (if technical debt)
```

---

## Example 2: Growth Company Governance

### Context
A 200-person company with 8 product teams needs formal architecture governance.

### Governance Framework

```markdown
# Architecture Governance Framework

**Acme Corp** | Version 1.0 | Effective: 2026-01-15

---

## Governance Scope

| Category | Examples | Governance |
|----------|----------|------------|
| Platform Decisions | New cloud services, core infrastructure | Full ARB Review |
| Technology Adoption | New languages, frameworks, databases | ARB Review |
| Cross-Team Integration | Service contracts, shared schemas | Architecture Review |
| Service Design | New microservices, API design | Domain Architect |
| Implementation | Code patterns, internal design | Team Decision |

---

## Architecture Review Board (ARB)

### Composition

| Role | Name | Focus |
|------|------|-------|
| Chair | Jane Smith (VP Engineering) | Strategic alignment |
| Platform Architect | Bob Johnson | Infrastructure |
| Security Architect | Alice Chen | Security |
| Data Architect | Carlos Rodriguez | Data & analytics |
| Senior Tech Lead (rotating) | Varies | Implementation reality |

### Cadence

- **Regular meetings**: Every Tuesday, 2-3pm
- **Ad-hoc**: Slack channel for urgent items
- **Async review**: Minor items via RFC documents

### Submission Requirements

To get on the ARB agenda:
1. Submit RFC document by Friday EOD
2. Include: Context, Options, Recommendation, Risks
3. Sponsor presents (10 min max)
4. Discussion and decision (20 min max)

---

## Decision Process

```
Developer has design question
        ↓
Is it implementation detail? → Yes → Team decides
        ↓ No
Is it single-service design? → Yes → Domain Architect reviews
        ↓ No
Is it cross-team or new tech? → Yes → ARB reviews
        ↓ No
Escalate to VP Engineering
```

### Decision Outcomes

| Outcome | Meaning | Next Steps |
|---------|---------|------------|
| Approved | Proceed with design | Document as ADR, implement |
| Approved with conditions | Proceed after changes | Address conditions, then implement |
| Deferred | Need more information | Provide requested info, re-submit |
| Rejected | Do not proceed | Consider alternatives or escalate |

---

## Architecture Decision Records

### When Required
- New service introduction
- Technology adoption
- Integration pattern selection
- Significant refactoring
- Principle exception

### Template

Located at: `docs/architecture/decisions/template.md`

### Process
1. Draft ADR using template
2. Submit PR to architecture repo
3. Domain Architect or ARB reviews
4. Merge when approved
5. Update status as implementation proceeds

---

## Exception Process

### Request Format

```markdown
## Exception Request

**Principle**: [Which principle]
**Project**: [Project name]
**Requestor**: [Name]
**Date**: [Date]

### Justification
[Why is exception needed?]

### Impact Assessment
[What are the risks?]

### Mitigation
[How will risks be managed?]

### Duration
[Permanent / Until date / Until condition]

### Exit Plan
[How will we return to compliance?]
```

### Approval

- Domain Architect: Domain-specific exceptions
- ARB: Cross-cutting or high-impact exceptions
- VP Engineering: Principle modifications

---

## Compliance Monitoring

### Design Reviews
- Mandatory for new services
- Conducted by Domain Architect
- Checklist-based assessment
- Findings tracked in Jira

### Quarterly Architecture Audit
- Sample 10% of services
- Check principle adherence
- Identify drift patterns
- Report to leadership

### Metrics

| Metric | Target | Current |
|--------|--------|---------|
| ADR coverage | >90% | 85% |
| Design review completion | 100% | 95% |
| Exception resolution | <6 months | 4.2 months |
```

---

## Example 3: Domain-Specific Principles

### E-Commerce Platform Principles

```markdown
# E-Commerce Architecture Principles

## Business Principles

### BP-1: Customer Experience First
**Statement**: Technical decisions should optimize for customer experience (speed, reliability, usability).

**Rationale**: Happy customers drive revenue. Technical excellence without UX is pointless.

**Implications**:
- Page load targets: <2s
- Checkout availability: 99.99%
- Mobile-first design

### BP-2: Data-Driven Decisions
**Statement**: Business decisions should be supported by data, and systems should enable data collection.

**Rationale**: Intuition is unreliable at scale. Data enables optimization.

**Implications**:
- Analytics events for all user actions
- A/B testing infrastructure required
- Data warehouse accessible to analysts

---

## Data Principles

### DP-1: Customer Data Sovereignty
**Statement**: Customer data is stored and processed in compliance with regional regulations.

**Rationale**: GDPR, CCPA, and similar regulations require data residency and processing controls.

**Implications**:
- Multi-region data storage
- Data residency tagging
- Right to deletion implemented

### DP-2: Eventual Consistency Accepted
**Statement**: Where strong consistency isn't required, eventual consistency is acceptable.

**Rationale**: Strong consistency limits scalability. Many e-commerce operations tolerate eventual consistency.

**Implications**:
- Order confirmation: Strong consistency
- Inventory display: Eventual consistency acceptable
- Recommendations: Eventual consistency acceptable

---

## Application Principles

### AP-1: Cart Never Fails
**Statement**: The shopping cart must remain functional even during partial system failures.

**Rationale**: Abandoned carts directly impact revenue. Cart availability is critical.

**Implications**:
- Cart service has no external dependencies for core operations
- Graceful degradation for enrichment features
- 99.99% availability target

### AP-2: Payments Isolated
**Statement**: Payment processing is isolated from other systems with strict security boundaries.

**Rationale**: PCI compliance requires isolation. Payment breaches are catastrophic.

**Implications**:
- Separate network segment
- No direct database access from other services
- Enhanced monitoring and alerting

---

## Technology Principles

### TP-1: CDN Everything
**Statement**: Static content and cacheable responses should be served from CDN.

**Rationale**: CDN improves performance globally and reduces origin load.

**Implications**:
- Static assets via CDN
- API responses cached where possible
- Cache invalidation strategy required

### TP-2: Scale Horizontally
**Statement**: Services should scale horizontally rather than vertically.

**Rationale**: Horizontal scaling is more cost-effective and resilient than vertical scaling.

**Implications**:
- Stateless service design
- Database read replicas
- Auto-scaling configured
```

---

## Example 4: Capability Assessment Summary

```markdown
# Architecture Capability Assessment

**Company**: GrowthCo
**Date**: 2026-01-20
**Assessor**: Architecture Team

## Maturity Summary

| Capability | Current | Target | Gap |
|------------|---------|--------|-----|
| Principles | L2 (Developing) | L3 (Defined) | Formalize & document |
| Governance | L1 (Initial) | L3 (Defined) | Establish ARB |
| Documentation | L2 (Developing) | L3 (Defined) | Standardize format |
| Decision Records | L1 (Initial) | L3 (Defined) | Implement ADRs |
| Reference Arch | L1 (Initial) | L2 (Developing) | Create templates |
| Reviews | L2 (Developing) | L3 (Defined) | Mandatory reviews |

## Key Findings

### Strengths
- Strong engineering culture
- Good informal communication
- Senior engineers with architecture experience

### Gaps
- No formal decision documentation
- Inconsistent technology choices across teams
- No standard review process
- Knowledge silos forming

## Recommendations

### Immediate (Month 1)
1. Document current principles (they exist informally)
2. Implement ADR process
3. Create architecture folder structure

### Short-term (Month 2-3)
1. Establish Architecture Review Board
2. Define governance scope
3. Conduct first formal reviews

### Medium-term (Month 4-6)
1. Develop reference architectures
2. Create technology radar
3. Train teams on process

## Success Metrics

| Metric | Baseline | 3-Month Target | 6-Month Target |
|--------|----------|----------------|----------------|
| Principles documented | 0 | 15+ | 15+ (refined) |
| ADR coverage | 0% | 50% | 80% |
| Reviews conducted | Ad-hoc | Monthly | Bi-weekly |
| Reference architectures | 0 | 2 | 5 |
```
