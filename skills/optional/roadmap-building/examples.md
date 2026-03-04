# Roadmap Building Examples

> **Audience:** AI Agents

---

## Example 1: Option A — From Architecture Analysis

**Invocation:** `"Build implementation roadmap"`

**Input state:** `arch-analysis` has run. `core-architecture/gap-analysis/consolidated-gaps.md` exists with 6 gaps.

**Agent execution:**

```
Phase 1 — Input Analysis:
  Read: core-architecture/gap-analysis/consolidated-gaps.md
  Read: core-architecture/target/application-architecture.md
  Extracted gaps:
    - No API gateway (all services exposed directly)
    - Monolithic data layer blocking independent scaling
    - No observability stack (no tracing, no dashboards)
    - Authentication scattered across 4 services
    - Manual deployment process (no CI/CD)
    - No rate limiting or DDoS protection

Phase 2 — Initiative Identification:
  → Initiative 1.1: API Gateway + Auth Centralisation (Platform, High, 8w)
  → Initiative 1.2: Observability Stack (Platform, Medium, 4w)
  → Initiative 1.3: CI/CD Pipeline (DevOps, Medium, 3w)
  → Initiative 1.4: Data Layer Decomposition (Backend + Data, Very High, 16w)
  → Initiative 1.5: Rate Limiting & DDoS Protection (Platform, Low, 2w, depends 1.1)

  [Presents list to user — user confirms]

Phase 3 — Technical Planning:
  ADR-001: API Gateway Selection (Kong vs AWS API GW vs NGINX)
    → Decision: Kong (DB-less, GitOps-compatible)
  ADR-002: Observability Stack (Grafana OSS vs Datadog vs NewRelic)
    → Decision: Grafana OSS (Prometheus + Loki + Tempo)
  ADR-003: CI/CD Platform (GitHub Actions vs Jenkins vs ArgoCD)
    → Decision: GitHub Actions + ArgoCD for GitOps
  ADR-004: Data Decomposition Pattern
    → Decision: Strangler Fig over 4 quarters

Phase 4 — Sequencing:
  Critical path: 1.3 (CI/CD) → 1.1 (API GW) → 1.5 (Rate Limiting) = 13 weeks
  Parallel: 1.2 (Observability) alongside 1.1
  Long tail: 1.4 (Data) starts in Phase 2, runs through Phase 3

  Phase 1 (Q1): 1.3, 1.1, 1.2 (parallel where possible)
  Phase 2 (Q2): 1.5, 1.4 begins
  Phase 3 (Q3–Q4): 1.4 continues and completes

Phase 5 — Risks:
  R-001: Team unfamiliar with Kong → training + spike (1 week)
  R-002: Data migration data loss risk → shadow run + rollback plan
  R-003: CI/CD adoption resistance → champion in each team

Phase 6 — Epics & Tickets:
  Initiative 1.1 → Epic E-001 (API Gateway), Epic E-002 (Auth Centralisation)
  Epic E-001: 8 tickets, Platform team, 42 story points, 6 weeks
    T-001: Provision Kong (S, 2d)
    T-002–T-005: Route each service (S–M, 1–3d each)
    T-006: Rate limiting config (S, 1d)
    T-007: Load test (M, 3d)
    T-008: Runbook (S, 2d)

Phase 7 — Documentation:
  Generated:
    roadmaps/master-roadmap.md
    roadmaps/detailed-roadmap.md
    roadmaps/roadmap-tracker.md
    roadmaps/phases/phase-1-foundation.md
    roadmaps/phases/phase-2-migration.md
    roadmaps/phases/phase-3-optimisation.md
    roadmaps/initiatives/initiative-001-api-gateway.md  (+ 4 more)
    roadmaps/epics/epic-001-api-gateway.md              (+ 7 more)
    roadmaps/decisions/adr-001-api-gateway.md           (+ 3 more)
    roadmaps/risks/risk-register.md
    roadmaps/dependencies/dependency-graph.mmd
    roadmaps/roadmap-metadata.json
```

**Agent output to user:**

```
Roadmap complete.

  5 initiatives · 3 phases · ~29 weeks · 8 epics · 48 tickets

  Critical path: CI/CD → API Gateway → Rate Limiting (13 weeks)
  Longest initiative: Data Layer Decomposition (16 weeks, Phase 2–3)
  Highest risk: Data migration (R-002) — shadow run recommended

  ⚠️ 1 XL ticket found: T-019 (Data schema migration). Recommend splitting.

  Next steps:
  - "Expand initiative 1.4" → detailed step-by-step plan
  - "Run complexity analysis" → full complexity report
  - "Export to PDF" → stakeholder package
```

---

## Example 2: Option C — Standalone Request

**Invocation:** `"Build a roadmap for migrating our PHP monolith to microservices"`

**Agent:**

```
I don't see existing architecture analysis. Before building the roadmap,
I need to understand a few things:

1. Current state: What does the PHP monolith look like?
   (rough size, key modules, database, integrations)

2. Target state: Full microservices, or selective decomposition?

3. Key constraints:
   - Team size and skills?
   - Timeline pressure?
   - Can you run a parallel system or is it zero-downtime migration?
   - Technology preferences (keep PHP? Move to Node/Python/Go?)
```

**User responds** with context → agent synthesises lightweight architecture model → runs full roadmap workflow → produces same output structure as Example 1.

---

## Example 3: Epics-Only for Existing Roadmap

**Invocation:** `"Break initiative 1.4 into epics and tickets"`

**Input state:** `roadmaps/initiatives/initiative-004-data-decomposition.md` exists.

**Agent:**

```
Read: initiative-004-data-decomposition.md
  Duration: 16 weeks
  Complexity: Very High
  Team: Backend + Data Engineering

Decomposing into epics:

  Epic E-008: Schema Analysis & Migration Plan (Data, 2 weeks)
    T-031: Audit current schema and identify coupling points (M, 4d)
    T-032: Design target schemas per service (L, 8d)
    T-033: Write migration scripts (dry-run only) (M, 4d)

  Epic E-009: Read-Model Extraction — Service A (Backend, 3 weeks)
    T-034: Extract read queries for Service A to separate repo (M, 3d)
    T-035: Add read replica for Service A data (S, 2d)
    T-036: Route Service A reads to replica (M, 3d)
    T-037: Integration tests (M, 4d)

  Epic E-010: Write-Path Migration — Service A (Backend + Data, 4 weeks)
    T-038: Shadow write to new schema (L, 5d)
    T-039: Validate data consistency (M, 4d)
    T-040: Cut over writes (M, 3d)  ← DRI: Backend Lead (cross-team)
    T-041: Decommission old write path (S, 2d)

  [+ 3 more epics for remaining services]

Generated:
  roadmaps/epics/epic-008-schema-migration-plan.md
  roadmaps/epics/epic-009-service-a-read.md
  roadmaps/epics/epic-010-service-a-write.md
  roadmaps/roadmap-tracker.md  ← updated with epics
```
