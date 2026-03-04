# Roadmap Analysis Examples

> **Audience:** AI Agents

---

## Mode 1: Expand — "Expand initiative 1.4"

**Input:** `roadmaps/initiatives/initiative-004-data-decomposition.md`

**Agent output (summary):**

```
Expanding Initiative 1.4: Data Layer Decomposition

Reading initiative file and ADR-004 (Strangler Fig pattern)...

Week 1–2: Schema Analysis
  Step 1.1 — Audit current schema:
    Query PostgreSQL information_schema to map all tables, FKs, indexes
    Command: psql -c "\d+ tablename" for each table, export to CSV
    Verify: schema-audit.csv committed, reviewed by Tech Lead

  Step 1.2 — Identify coupling points:
    Map which services read/write each table
    Flag tables accessed by 3+ services → highest extraction risk

  Step 1.3 — Design target schemas per service:
    Each service owns its data; no cross-service FK references
    Document in: core-architecture/target/data-architecture.md

⚠️ Step 1.3 assumes services can tolerate eventual consistency.
   This needs validation before proceeding. Flagging for Research 002.

Week 3–6: Shadow Write for Service A
  Step 2.1 — Add write mirror:
    Intercept write path in Service A → write to both old and new schema
    Pattern: Write-through proxy (see ADR-004)
    ...

Rollback trigger: Data consistency check fails for >0.1% of records
Rollback procedure: Disable write mirror, revert to single-write path
```

**Written to:** `roadmaps/analysis/plans/plan-004-data-decomposition.md`

---

## Mode 3: Complexity — "Analyze roadmap complexity"

**Agent output:**

```
Roadmap Complexity Analysis

Reading 5 initiative files...

Initiative Scores:
  1.1 API Gateway       — Technical: 6  Org: 3  Risk: 5  Confidence: 70%
  1.2 Observability     — Technical: 4  Org: 2  Risk: 3  Confidence: 80%
  1.3 CI/CD Pipeline    — Technical: 3  Org: 4  Risk: 2  Confidence: 85%
  1.4 Data Decomp       — Technical: 9  Org: 6  Risk: 8  Confidence: 45% ⚠️
  1.5 Rate Limiting     — Technical: 3  Org: 2  Risk: 2  Confidence: 85%

Overall Complexity: High (6.7/10)
Overall Confidence: 65%

Critical Path: 1.3 (3w) → 1.1 (8w) → 1.4 (16w) = 27 weeks minimum

Bottleneck: Initiative 1.4 blocks 0 others but is the longest and lowest-confidence.
            Recommend starting research and spike in parallel with Phase 1 work.

⚠️ Initiative 1.4 confidence is 45% — do not commit to detailed estimates
   until Spike 001 (data migration approach) completes.

Written: roadmaps/analysis/complexity-analysis.md
         roadmaps/analysis/metrics/complexity-metrics.json

Recommended next step: Run Mode 4 (Spike Identification) for initiative 1.4?
```

---

## Mode 4: Spikes — "What needs a proof of concept?"

**Agent output:**

```
Identified 2 spike candidates:

Spike 001: Zero-downtime data migration approach
  Assumption: We can shadow-write to new schema while keeping old schema live,
              then cut over with <1 minute downtime.
  Time box: 5 days
  Go: Shadow writes consistent for 48h in staging, cutover rehearsed successfully
  No-Go: Data inconsistency >0.01% OR cutover takes >5 minutes
  Decision impact (No-Go): Evaluate blue-green DB approach, extend Initiative 1.4 by 4 weeks

Spike 002: Event sourcing feasibility for Service A
  Assumption: Kafka can handle our write volume (2K events/sec) with <50ms p95 lag.
  Time box: 3 days
  Go: Benchmark shows >3K events/sec, p95 <30ms, consumer lag recovers within 60s
  No-Go: Cannot meet throughput without >$5K/mo additional infrastructure
  Decision impact (No-Go): Fall back to synchronous API calls, remove event sourcing from ADR-005

Written:
  roadmaps/analysis/spikes/spike-001-data-migration.md
  roadmaps/analysis/spikes/spike-002-kafka-feasibility.md
```

---

## Mode 7: Team Planning — "What team do we need?"

**Agent output:**

```
Reading complexity analysis and effort estimation...

Team Composition:

Phase 1 (Q1 2026, 12 weeks) — 5 people
  Technical Lead        ×1   Senior/Staff   100%
  Backend Engineer      ×2   1 Sr + 1 Mid   100%
  DevOps Engineer       ×1   Mid-Senior      75%
  QA Engineer           ×1   Mid             50%
  → Phase 1 effort: ~1,440 person-hours

Phase 2 (Q2–Q3 2026, 20 weeks) — 7 people
  Technical Lead        ×1   Senior/Staff   100%
  Backend Engineer      ×3   1 Sr + 2 Mid   100%
  Data Engineer         ×1   Senior         100%
  DevOps Engineer       ×1   Mid-Senior     100%
  QA Engineer           ×1   Mid-Senior      75%
  → Phase 2 effort: ~3,200 person-hours

Critical gap: No data engineer currently on team.
  Options: Hire (8-week lead time), contract (available in 2 weeks),
           upskill existing backend engineer (12 weeks to readiness)

AI Augmentation: ~20% effort reduction on boilerplate, tests, and docs
  Without AI: 4,640 person-hours ($928K at $200/hr blended rate)
  With AI:    3,712 person-hours ($742K) + ~$6K/yr tooling = net saving: $180K

Written:
  roadmaps/team-planning/team-composition.md
  roadmaps/team-planning/expertise-requirements.md
  roadmaps/team-planning/financial-plan.md
```
