# Tech Stack Decision Examples

Real-world examples of technology evaluation and selection.

---

## Example 1: Choosing a Web Framework

### Context

Building a new B2B SaaS application. Team of 5 developers, 2 have React experience, 3 have Vue experience.

### Requirements

- Server-side rendering for SEO
- Type safety
- Component library ecosystem
- Active community

### Candidates

1. Next.js (React)
2. Nuxt (Vue)
3. SvelteKit (Svelte)

### Evaluation

| Criterion | Weight | Next.js | Nuxt | SvelteKit |
|-----------|--------|---------|------|-----------|
| SSR capability | 5 | 5 | 5 | 5 |
| Type safety | 4 | 5 | 4 | 4 |
| Team expertise | 5 | 3 | 5 | 1 |
| Ecosystem | 4 | 5 | 4 | 3 |
| Community | 3 | 5 | 4 | 3 |
| **Weighted Total** | | 93 | 95 | 65 |

### Decision

**Nuxt** selected because:
- Majority of team has Vue experience
- Meets all technical requirements
- Reduces ramp-up time
- Good ecosystem for B2B components

### ADR Summary

```markdown
# ADR-001: Web Framework Selection

## Status
Accepted

## Decision
Use Nuxt 3 with Vue 3 for the new SaaS application.

## Consequences
- Team can start productive immediately
- May need to hire Vue developers (smaller pool than React)
- TypeScript support is good but not as mature as Next.js
```

---

## Example 2: Database Selection for E-commerce

### Context

Building an e-commerce platform. Need to handle:
- Product catalog (100K+ products)
- User accounts
- Order history
- Shopping carts
- Search functionality

### Candidates

1. PostgreSQL
2. MongoDB
3. PostgreSQL + Elasticsearch

### Evaluation

| Requirement | PostgreSQL | MongoDB | PG + ES |
|-------------|------------|---------|---------|
| Product catalog | ✅ | ✅ | ✅ |
| Complex queries (orders, reports) | ✅ | ⚠️ | ✅ |
| Full-text search | ⚠️ | ⚠️ | ✅ |
| Schema flexibility (product variants) | ⚠️ | ✅ | ✅ |
| ACID for orders | ✅ | ⚠️ | ✅ |
| Operational simplicity | ✅ | ✅ | ❌ |

### Decision

**PostgreSQL** selected for MVP:
- ACID compliance critical for orders
- JSONB columns provide schema flexibility for products
- Built-in full-text search sufficient for initial launch
- Single database simplifies operations

**Future consideration**: Add Elasticsearch when search becomes a bottleneck.

---

## Example 3: Cloud Provider Selection

### Context

Startup moving from single server to cloud infrastructure. Team has AWS experience but exploring options.

### Requirements

- Kubernetes support
- Managed database services
- CDN for global users
- Budget: <$5K/month initially
- Compliance: SOC 2

### Candidates

1. AWS
2. Google Cloud Platform (GCP)
3. Azure

### Evaluation

| Criterion | Weight | AWS | GCP | Azure |
|-----------|--------|-----|-----|-------|
| K8s experience | 4 | 4 | 5 | 4 |
| Managed DB options | 4 | 5 | 5 | 4 |
| Team expertise | 5 | 5 | 2 | 2 |
| Cost (estimated) | 3 | 3 | 4 | 3 |
| Compliance (SOC 2) | 5 | 5 | 5 | 5 |
| **Weighted Total** | | 91 | 84 | 75 |

### Decision

**AWS** selected because:
- Team already has certifications
- Reduced learning curve
- Extensive documentation and community
- Easy to hire AWS-experienced engineers

### Cost Analysis

| Service | Monthly Cost |
|---------|--------------|
| EKS (Kubernetes) | $73 |
| RDS PostgreSQL | $150 |
| ElastiCache | $50 |
| S3 + CloudFront | $100 |
| Networking | $50 |
| **Total** | ~$423 base + compute |

---

## Example 4: API Technology Decision

### Context

Building public API for third-party integrations. Expected 1000+ API consumers.

### Candidates

1. REST
2. GraphQL
3. gRPC

### Requirements

- Easy for third parties to consume
- Good documentation tools
- Caching support
- Versioning strategy

### Evaluation

| Criterion | REST | GraphQL | gRPC |
|-----------|------|---------|------|
| Ease of consumption | ✅ | ⚠️ | ❌ |
| Learning curve (consumers) | Low | Medium | High |
| Documentation tools | Excellent | Good | Limited |
| Caching | ✅ | ⚠️ | ❌ |
| Browser support | ✅ | ✅ | ❌ |
| Overfetching | ⚠️ | ✅ | ⚠️ |

### Decision

**REST** selected because:
- Most developers already know REST
- Better tooling for API documentation (OpenAPI/Swagger)
- HTTP caching works out of the box
- Simpler for third-party integration

### Implementation Notes

- Use OpenAPI 3.0 specification
- Version via URL path (/v1/, /v2/)
- Provide SDKs in popular languages
- GraphQL considered for internal use later

---

## Example 5: State Management Library

### Context

React application growing in complexity. Currently using prop drilling and Context API.

### Pain Points

- Props being passed 5+ levels deep
- Context re-renders causing performance issues
- Difficult to debug state changes

### Candidates

1. Redux Toolkit
2. Zustand
3. Jotai
4. Continue with Context + useReducer

### POC Results

| Library | Setup Time | Bundle Size | Learning Curve | DevTools |
|---------|------------|-------------|----------------|----------|
| Redux Toolkit | 2 hours | 11KB | Medium | Excellent |
| Zustand | 30 min | 1KB | Low | Good |
| Jotai | 45 min | 2KB | Low | Good |
| Context | N/A | 0KB | N/A | Basic |

### Decision

**Zustand** selected because:
- Minimal boilerplate
- Tiny bundle size
- Easy to adopt incrementally
- Good enough DevTools
- Team found it intuitive in POC

### Migration Plan

1. Keep Context for truly global state (theme, user)
2. Migrate complex state to Zustand stores
3. Create one store per domain (cart, products, filters)
4. Remove prop drilling gradually

---

## Example 6: CI/CD Platform Migration

### Context

Currently using Jenkins. Pain points:
- High maintenance burden
- Frequent plugin conflicts
- Slow build times
- No auto-scaling

### Candidates

1. GitHub Actions
2. GitLab CI
3. CircleCI

### Evaluation

| Criterion | Jenkins | GH Actions | GitLab CI | CircleCI |
|-----------|---------|------------|-----------|----------|
| Maintenance | High | None | Low | None |
| Config as code | ✅ | ✅ | ✅ | ✅ |
| Self-hosted option | ✅ | ✅ | ✅ | ❌ |
| Cost (our usage) | $200/mo | Free* | $50/mo | $150/mo |
| Integration | Manual | Native | Native | Good |

*Free tier sufficient for current needs

### Decision

**GitHub Actions** selected because:
- Already using GitHub for source control
- Native integration (no webhooks)
- Free tier covers current needs
- Zero maintenance overhead
- Growing marketplace of actions

### Migration Plan

1. Week 1: Set up basic CI (lint, test, build)
2. Week 2: Add deployment workflows
3. Week 3: Migrate remaining jobs
4. Week 4: Decommission Jenkins
