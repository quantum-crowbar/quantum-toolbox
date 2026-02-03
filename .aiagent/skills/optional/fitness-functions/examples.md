# Fitness Functions Examples

Concrete demonstrations of fitness functions in various scenarios.

---

## Example 1: E-Commerce Platform Fitness Functions

### Context
- High-traffic e-commerce platform
- Peak load during sales events
- PCI-DSS compliance required
- Mobile and web clients

### Priority Attributes
1. **Performance** - User experience drives conversion
2. **Reliability** - Downtime = lost revenue
3. **Security** - Payment data protection
4. **Scalability** - Handle 10x peak loads

### Fitness Function Catalog

#### FF-PERF-001: Checkout Response Time

```yaml
id: FF-PERF-001
name: Checkout Response Time P95
attribute: Performance
category: performance

measurement:
  method: APM instrumentation on /checkout endpoints
  tool: Datadog APM
  data_source: Request traces
  calculation: |
    percentile(response_time, 95) for path="/checkout/*"

thresholds:
  target: { value: 500, operator: lt, unit: ms }
  warning: { value: 750, operator: gt, unit: ms }
  critical: { value: 1000, operator: gt, unit: ms }

baseline:
  value: 650ms
  date: 2024-01-15
  conditions: Normal load (500 req/s)

rationale: |
  Studies show 53% of mobile users abandon if load > 3s.
  Checkout is highest-intent page. Target 500ms for optimal conversion.
```

#### FF-REL-001: Payment Success Rate

```yaml
id: FF-REL-001
name: Payment Processing Success Rate
attribute: Reliability
category: reliability

measurement:
  method: Payment gateway response tracking
  tool: Custom metrics + Prometheus
  data_source: Payment service logs
  calculation: |
    (successful_payments / attempted_payments) * 100

thresholds:
  target: { value: 99.5, operator: gte, unit: percent }
  warning: { value: 98, operator: lt, unit: percent }
  critical: { value: 95, operator: lt, unit: percent }

baseline:
  value: 98.7%
  date: 2024-01-15
  conditions: Normal operations

rationale: |
  Each failed payment = lost sale + customer service cost.
  Industry benchmark is 99.5% for tier-1 processors.
```

#### FF-SEC-001: PCI-DSS Compliance Score

```yaml
id: FF-SEC-001
name: PCI-DSS Compliance Score
attribute: Security
category: security
scope: composite

measurement:
  method: Automated compliance scanning
  tool: Qualys PCI + custom checks
  calculation: |
    Weighted score across PCI-DSS requirements:
    - Requirement 6 (Secure Systems): 25%
    - Requirement 8 (Access Control): 25%
    - Requirement 10 (Monitoring): 25%
    - Requirement 11 (Testing): 25%

thresholds:
  target: { value: 100, operator: eq, unit: percent }
  warning: { value: 95, operator: lt, unit: percent }
  critical: { value: 90, operator: lt, unit: percent }

rationale: |
  PCI-DSS compliance is legal requirement.
  Non-compliance = fines + loss of payment processing.
```

#### FF-SCALE-001: Auto-Scaling Response Time

```yaml
id: FF-SCALE-001
name: Auto-Scaling Response Time
attribute: Scalability
category: scalability

measurement:
  method: Time from trigger to capacity available
  tool: Kubernetes HPA metrics + custom tracking
  data_source: K8s events + pod readiness
  calculation: |
    time(pod_ready) - time(scale_trigger)

thresholds:
  target: { value: 120, operator: lt, unit: seconds }
  warning: { value: 180, operator: gt, unit: seconds }
  critical: { value: 300, operator: gt, unit: seconds }

rationale: |
  During flash sales, traffic can 10x in minutes.
  Must scale within 2 minutes to prevent degradation.
```

### CI/CD Integration

```yaml
# .github/workflows/deploy.yml
fitness_gates:
  pre_deploy:
    - name: security-scan
      run: npm audit --audit-level=high
      on_failure: block

    - name: code-quality
      run: |
        complexity=$(npx complexity-report src/ --format json | jq '.average')
        [ "$complexity" -lt 15 ] || exit 1
      on_failure: block

  post_deploy:
    - name: smoke-tests
      run: npm run test:smoke
      on_failure: rollback

    - name: performance-check
      run: |
        p95=$(curl -s "https://api.datadog.com/metrics/checkout.latency.p95")
        [ "$p95" -lt 750 ] || exit 1
      on_failure: alert
```

---

## Example 2: SaaS Platform Migration

### Context
- Migrating from monolith to microservices
- 50,000 daily active users
- Must maintain availability during migration
- 6-month migration timeline

### Fitness-Guided Migration Strategy

#### Baseline Measurements (Pre-Migration)

| Function | Baseline | Target Post-Migration |
|----------|----------|----------------------|
| Response Time P95 | 800ms | 200ms |
| Availability | 99.5% | 99.9% |
| Deploy Frequency | 1/week | 5/week |
| MTTR | 4 hours | 30 minutes |
| Test Coverage | 45% | 80% |

#### Phase 1: Extract User Service

**Fitness Preservation Requirements:**
```yaml
phase: 1
name: Extract User Service
duration: 4 weeks

non_negotiable:
  - function: FF-REL-001 (Availability)
    minimum: 99.5%
    reason: Cannot degrade current availability

  - function: FF-PERF-001 (Login Response)
    minimum: 1000ms (current baseline)
    reason: User-facing critical path

acceptable_degradation:
  - function: FF-DEPL-001 (Deploy Frequency)
    allowed: 0.5/week (temporarily)
    recovery: Week 5

improvement_target:
  - function: FF-MAINT-001 (User Module Complexity)
    target: 50% reduction
    reason: Validates microservice benefit

fitness_gates:
  - after_extract:
      check: Login latency < 1000ms
      action: Proceed or rollback
  - after_cutover:
      check: Availability > 99.5% for 24h
      action: Confirm or rollback
```

**Monitoring Dashboard (Phase 1):**
```
╔══════════════════════════════════════════════════════════╗
║           MIGRATION PHASE 1 FITNESS DASHBOARD            ║
╠══════════════════════════════════════════════════════════╣
║                                                          ║
║  AVAILABILITY        ████████████████████░  99.6%  ✓     ║
║  Target: 99.5%       Trend: Stable                       ║
║                                                          ║
║  LOGIN LATENCY P95   █████████████░░░░░░░  720ms   ✓     ║
║  Max: 1000ms         Trend: Improving (-12%)             ║
║                                                          ║
║  ERROR RATE          ██░░░░░░░░░░░░░░░░░░  0.8%    ✓     ║
║  Max: 2%             Trend: Stable                       ║
║                                                          ║
║  USER SVC COMPLEXITY █████████░░░░░░░░░░░  45%     ↓     ║
║  Target: 50%         Progress: On track                  ║
║                                                          ║
╠══════════════════════════════════════════════════════════╣
║  GATE STATUS: Phase 1 Gate 2 PASSED  (2024-02-01 14:30)  ║
║  Next Gate: Phase 2 Pre-flight (scheduled 2024-02-05)    ║
╚══════════════════════════════════════════════════════════╝
```

#### Migration Fitness Report (End of Phase 1)

```markdown
# Migration Fitness Report - Phase 1 Complete

## Summary
Phase 1 (User Service Extraction) completed successfully.
All fitness gates passed. Proceeding to Phase 2.

## Fitness Comparison

| Function | Pre-Phase | Post-Phase | Change | Status |
|----------|-----------|------------|--------|--------|
| Availability | 99.52% | 99.61% | +0.09% | ✅ |
| Login P95 | 820ms | 680ms | -17% | ✅ |
| Error Rate | 0.9% | 0.7% | -22% | ✅ |
| Deploy Freq | 1.0/wk | 0.8/wk | -20% | ⚠️ Expected |
| User Complexity | 100% | 48% | -52% | ✅ Target met |

## Key Events
- Day 3: Brief availability dip (99.2%) during DNS cutover
- Day 7: Performance improvement after connection pooling fix
- Day 14: Successful traffic migration to new service

## Learnings
1. DNS TTL should be reduced 48h before cutover
2. Connection pool sizing needs monitoring

## Phase 2 Readiness
- [ ] All fitness gates passed ✓
- [ ] Learnings documented ✓
- [ ] Phase 2 plan reviewed ✓
- [ ] Team capacity confirmed ✓

**Recommendation: PROCEED to Phase 2**
```

---

## Example 3: API Platform Fitness Functions

### Context
- Public API serving 1000+ integrations
- Strict SLA commitments (99.9% uptime)
- API versioning required
- Rate limiting in place

### Fitness Function Set

#### FF-API-001: API Availability

```yaml
id: FF-API-001
name: API Availability (SLA)
attribute: Reliability
trigger: continuous
automation: automated

measurement:
  method: Synthetic monitoring from 5 regions
  tool: Pingdom + Datadog Synthetic
  calculation: |
    successful_checks / total_checks * 100
    (excluding scheduled maintenance windows)

thresholds:
  target: { value: 99.9, operator: gte, unit: percent }
  warning: { value: 99.7, operator: lt, unit: percent }
  critical: { value: 99.5, operator: lt, unit: percent }

sla_impact: |
  < 99.9% = SLA breach, credit due to customers
  < 99.5% = Major incident, executive escalation
```

#### FF-API-002: API Breaking Changes

```yaml
id: FF-API-002
name: API Breaking Changes per Release
attribute: Coupling
trigger: triggered (on release)
automation: automated

measurement:
  method: OpenAPI schema diff
  tool: oasdiff + custom CI check
  calculation: |
    Count of:
    - Removed endpoints
    - Changed required parameters
    - Changed response schemas (breaking)

thresholds:
  target: { value: 0, operator: eq }
  warning: { value: 1, operator: gt }
  critical: { value: 3, operator: gt }

rationale: |
  Breaking changes require:
  - 6-month deprecation notice
  - Version bump (v1 → v2)
  - Customer communication
```

#### FF-API-003: Rate Limit Headroom

```yaml
id: FF-API-003
name: Rate Limit Headroom
attribute: Scalability
trigger: continuous

measurement:
  method: Compare peak usage to rate limits
  tool: API Gateway metrics
  calculation: |
    For each customer tier:
    headroom = (rate_limit - peak_usage) / rate_limit * 100

thresholds:
  target: { value: 30, operator: gte, unit: percent }
  warning: { value: 20, operator: lt, unit: percent }
  critical: { value: 10, operator: lt, unit: percent }

rationale: |
  Customers hitting rate limits = poor experience.
  Need headroom for traffic spikes.
  < 20% headroom triggers capacity review.
```

#### FF-API-004: Documentation Coverage

```yaml
id: FF-API-004
name: API Documentation Coverage
attribute: Maintainability
trigger: triggered (on merge to main)
automation: automated

measurement:
  method: Compare OpenAPI spec to code
  tool: spectral + custom linter
  calculation: |
    endpoints_documented / total_endpoints * 100
    Each endpoint must have:
    - Summary
    - Description
    - Request/response examples
    - Error responses

thresholds:
  target: { value: 100, operator: eq, unit: percent }
  warning: { value: 95, operator: lt, unit: percent }
  critical: { value: 90, operator: lt, unit: percent }
```

### Composite Function: API Health Score

```yaml
id: FF-API-COMP-001
name: API Health Score
scope: composite
trigger: temporal (daily)

components:
  - id: FF-API-001
    name: Availability
    weight: 0.35
    normalization: linear (95-100 → 0-100)

  - id: FF-API-002
    name: Breaking Changes
    weight: 0.20
    normalization: inverse (0=100, 3+=0)

  - id: FF-API-003
    name: Rate Limit Headroom
    weight: 0.15
    normalization: linear (0-50 → 0-100)

  - id: FF-API-004
    name: Doc Coverage
    weight: 0.10
    normalization: linear (0-100 → 0-100)

  - id: FF-API-005
    name: Response Time P95
    weight: 0.20
    normalization: inverse (0-500ms → 100-0)

thresholds:
  target: { value: 85, operator: gte }
  warning: { value: 70, operator: lt }
  critical: { value: 50, operator: lt }
```

---

## Example 4: Data Pipeline Fitness Functions

### Context
- ETL pipeline processing 10M records/day
- Data quality critical for downstream analytics
- SLA: Data available by 6 AM daily
- Multiple data sources

### Fitness Functions

#### FF-DATA-001: Pipeline Completion Time

```yaml
id: FF-DATA-001
name: Daily Pipeline Completion
attribute: Performance
trigger: temporal (daily at 6 AM)

measurement:
  method: Pipeline orchestrator completion time
  tool: Airflow metrics
  calculation: time(pipeline_complete) - time(pipeline_start)

thresholds:
  target: { value: 4, operator: lt, unit: hours }  # Complete by 5 AM
  warning: { value: 5, operator: gt, unit: hours }
  critical: { value: 6, operator: gt, unit: hours }  # SLA breach

sla: Data must be available by 6 AM
```

#### FF-DATA-002: Data Quality Score

```yaml
id: FF-DATA-002
name: Data Quality Score
attribute: Data Integrity
scope: composite
trigger: triggered (after pipeline completion)

components:
  - name: Completeness
    check: row_count >= expected_count * 0.99
    weight: 0.30

  - name: Freshness
    check: max(updated_at) >= today - 1
    weight: 0.20

  - name: Validity
    check: invalid_records / total_records < 0.001
    weight: 0.30

  - name: Uniqueness
    check: duplicate_keys / total_records < 0.0001
    weight: 0.20

thresholds:
  target: { value: 95, operator: gte }
  warning: { value: 90, operator: lt }
  critical: { value: 80, operator: lt }
```

#### FF-DATA-003: Schema Drift Detection

```yaml
id: FF-DATA-003
name: Source Schema Drift
attribute: Reliability
trigger: triggered (before each pipeline run)

measurement:
  method: Compare source schema to expected
  tool: Great Expectations + custom checks
  calculation: |
    For each source:
    - Check column existence
    - Check data types
    - Check nullable constraints

thresholds:
  target: { value: 0, operator: eq, unit: drifts }
  warning: { value: 1, operator: gt }
  critical: { value: 3, operator: gt }

action_on_breach: |
  - Critical: Halt pipeline, alert on-call
  - Warning: Alert team, continue with logging
```

---

## Example 5: Microservices Architecture Fitness

### Context
- 25 microservices
- Kubernetes deployment
- Service mesh (Istio)
- Event-driven communication

### Architecture Fitness Functions

#### FF-ARCH-001: Service Independence

```yaml
id: FF-ARCH-001
name: Service Independence Score
attribute: Coupling
trigger: temporal (weekly)

measurement:
  method: Analyze service dependencies
  tool: Custom analysis of K8s network policies + code
  calculation: |
    For each service:
    - Count synchronous dependencies
    - Count shared database connections
    - Count shared libraries (non-common)

    independence_score = 100 - (sync_deps * 10 + shared_db * 20 + shared_libs * 5)

thresholds:
  target: { value: 80, operator: gte }
  warning: { value: 60, operator: lt }
  critical: { value: 40, operator: lt }
```

#### FF-ARCH-002: Service Size

```yaml
id: FF-ARCH-002
name: Service Size Distribution
attribute: Maintainability
trigger: triggered (on deploy)

measurement:
  method: Lines of code per service
  tool: cloc + custom aggregation
  calculation: |
    Check that services stay within bounds:
    - min_size: 500 LOC (too small = overhead)
    - max_size: 10000 LOC (too large = mini-monolith)
    - ideal: 2000-5000 LOC

thresholds:
  target: { value: 100, operator: eq, description: "All services in range" }
  warning: { value: 2, operator: gt, description: "Services out of range" }
```

#### FF-ARCH-003: Circuit Breaker Health

```yaml
id: FF-ARCH-003
name: Circuit Breaker Health
attribute: Reliability
trigger: continuous

measurement:
  method: Istio circuit breaker metrics
  tool: Prometheus + Grafana
  calculation: |
    For each service pair:
    - Track circuit open events
    - Track half-open transitions
    - Track consecutive failures

thresholds:
  target: { value: 0, operator: eq, description: "No circuits open" }
  warning: { value: 1, operator: gt, description: "Any circuit open" }
  critical: { value: 3, operator: gt, description: "Multiple circuits open" }

rationale: |
  Open circuits indicate service health issues.
  Multiple open = systemic problem requiring investigation.
```

#### FF-ARCH-004: Event Schema Compatibility

```yaml
id: FF-ARCH-004
name: Event Schema Compatibility
attribute: Coupling
trigger: triggered (on schema change)

measurement:
  method: Schema registry compatibility check
  tool: Confluent Schema Registry (BACKWARD mode)
  calculation: |
    For each schema change:
    - Check backward compatibility
    - Check forward compatibility (optional)
    - Track compatibility breaks

thresholds:
  target: { value: 100, operator: eq, unit: "% compatible" }
  warning: { value: 1, operator: gt, unit: "breaking changes" }

action_on_breach: |
  Breaking schema change requires:
  - New topic/version
  - Consumer migration plan
  - Architecture review approval
```

---

## Example 6: Security-First Fitness Functions

### Context
- Financial services application
- Handles PII and financial data
- SOC 2 Type II certified
- Regular penetration testing

### Security Fitness Suite

```yaml
# FF-SEC-SUITE: Comprehensive Security Fitness

functions:
  - id: FF-SEC-001
    name: Critical Vulnerability Count
    measurement: Snyk/Dependabot scan
    target: 0
    trigger: continuous (on PR)
    action: Block merge if > 0

  - id: FF-SEC-002
    name: High Vulnerability Age
    measurement: Days since high vuln identified
    target: < 7 days
    trigger: daily
    action: Alert if > 3 days

  - id: FF-SEC-003
    name: Secret Detection
    measurement: Gitleaks scan results
    target: 0 secrets in code
    trigger: pre-commit + CI
    action: Block commit/merge

  - id: FF-SEC-004
    name: HTTPS Enforcement
    measurement: SSL Labs grade
    target: A+
    trigger: weekly
    action: Alert if < A

  - id: FF-SEC-005
    name: Auth Token Lifetime
    measurement: JWT expiry configuration
    target: < 1 hour (access), < 7 days (refresh)
    trigger: on config change
    action: Block deploy if exceeded

  - id: FF-SEC-006
    name: Failed Login Rate
    measurement: Failed logins / hour / IP
    target: < 10 (then rate limit)
    trigger: continuous
    action: Auto-block at threshold

  - id: FF-SEC-007
    name: Encryption at Rest
    measurement: Encrypted storage percentage
    target: 100%
    trigger: weekly audit
    action: Critical alert if < 100%
```

### Security Fitness Dashboard

```
╔════════════════════════════════════════════════════════════════╗
║              SECURITY FITNESS DASHBOARD                        ║
╠════════════════════════════════════════════════════════════════╣
║                                                                ║
║  VULNERABILITY STATUS                                          ║
║  ┌────────────┬────────┬────────┬─────────────────────┐        ║
║  │ Severity   │ Count  │ Target │ Status              │        ║
║  ├────────────┼────────┼────────┼─────────────────────┤        ║
║  │ Critical   │   0    │   0    │ ✅ Compliant        │        ║
║  │ High       │   2    │   0    │ ⚠️ 3 days old       │        ║
║  │ Medium     │  12    │  <20   │ ✅ Within limit     │        ║
║  │ Low        │  45    │  <100  │ ✅ Within limit     │        ║
║  └────────────┴────────┴────────┴─────────────────────┘        ║
║                                                                ║
║  COMPLIANCE SCORES                                             ║
║  SOC 2:     ██████████████████░░  92%  Target: 95%             ║
║  OWASP:     ████████████████████  100% Target: 100%            ║
║  PCI-DSS:   ███████████████████░  95%  Target: 100%            ║
║                                                                ║
║  RECENT EVENTS                                                 ║
║  • 2h ago:  High vuln CVE-2024-1234 detected (redis)           ║
║  • 1d ago:  Penetration test completed (2 findings)            ║
║  • 3d ago:  SSL certificate renewed (A+ maintained)            ║
║                                                                ║
╚════════════════════════════════════════════════════════════════╝
```
