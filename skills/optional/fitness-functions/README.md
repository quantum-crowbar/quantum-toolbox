# Fitness Functions Skill

Evolutionary architecture assessment using fitness functions to guide system evolution.

---

## Overview

Fitness functions are objective measures used to assess how well a system supports specific architectural characteristics. Derived from evolutionary computing, they provide quantifiable targets that guide architectural decisions and validate that changes maintain or improve system quality.

**Key Principle**: Architecture evolves guided by fitness functions, not rigid upfront design.

---

## Core Concepts

### What is a Fitness Function?

A fitness function is an objective function used to assess how close a solution is to achieving set aims. In architecture:

```
Fitness Function = Assessment Mechanism + Target Value + Measurement Frequency
```

**Example**:
- Assessment: Response time at 95th percentile
- Target: < 200ms
- Frequency: Continuous (every request)

### Fitness Function Characteristics

| Characteristic | Description |
|----------------|-------------|
| **Atomic** | Tests a single architectural characteristic |
| **Triggered** | Defines when assessment occurs |
| **Quantifiable** | Produces measurable result |
| **Comparable** | Results can be compared over time |

### Types of Fitness Functions

#### By Scope

| Type | Description | Example |
|------|-------------|---------|
| **Atomic** | Single characteristic | Response time < 200ms |
| **Holistic** | Multiple characteristics combined | Performance + availability score |
| **Composite** | Weighted combination | 0.4×performance + 0.3×security + 0.3×cost |

#### By Trigger

| Type | When | Example |
|------|------|---------|
| **Continuous** | Every transaction | Real-time latency monitoring |
| **Triggered** | On events | Security scan on PR merge |
| **Temporal** | Scheduled | Daily dependency audit |
| **Manual** | On demand | Quarterly architecture review |

#### By Automation

| Type | Description | Example |
|------|-------------|---------|
| **Automated** | No human intervention | CI/CD pipeline checks |
| **Semi-automated** | Partial automation | Automated collection, manual review |
| **Manual** | Human assessment | Architecture review board |

---

## Fitness Function Categories

### 1. Deployment/Operational

Measures how effectively the system can be changed and deployed.

| Metric | Description | Measurement Method |
|--------|-------------|-------------------|
| **Deployment Frequency** | How often code deploys to production | Count deploys per time period |
| **Lead Time for Changes** | Time from commit to production | Track timestamp difference |
| **Mean Time to Recovery** | Time to restore service after failure | Measure incident duration |
| **Change Failure Rate** | Percentage of deployments causing failures | Failed deploys / total deploys |

**Why It Matters**: These DORA metrics indicate organizational capability to deliver value safely and quickly.

### 2. Performance

Measures system responsiveness and resource efficiency.

| Metric | Description | Measurement Method |
|--------|-------------|-------------------|
| **Response Time** | Latency at percentiles (p50, p95, p99) | APM instrumentation |
| **Throughput** | Requests handled per second | Load testing, production metrics |
| **Resource Utilization** | CPU, memory, disk usage | Infrastructure monitoring |
| **Database Query Time** | Slow query percentage | Query logging, profiling |

**Why It Matters**: Poor performance directly impacts user experience and operational costs.

### 3. Reliability

Measures system stability and fault tolerance.

| Metric | Description | Measurement Method |
|--------|-------------|-------------------|
| **Availability** | Uptime percentage | Synthetic monitoring |
| **Error Rate** | Percentage of failed requests | Error tracking, logs |
| **Circuit Breaker Trips** | Frequency of circuit opens | Observability dashboards |
| **MTBF** | Mean time between failures | Incident tracking |

**Why It Matters**: Reliability is the foundation of user trust and business continuity.

### 4. Security

Measures protection against vulnerabilities and threats.

| Metric | Description | Measurement Method |
|--------|-------------|-------------------|
| **Vulnerability Count** | Known CVEs by severity | Dependency scanning |
| **Patch Latency** | Time to remediate vulnerabilities | Issue tracking |
| **Auth Failure Rate** | Failed authentication attempts | Security logs |
| **Dependency Age** | Time since dependency updates | Package manifest analysis |

**Why It Matters**: Security breaches cause financial, reputational, and legal damage.

### 5. Scalability

Measures ability to handle growth.

| Metric | Description | Measurement Method |
|--------|-------------|-------------------|
| **Horizontal Scale Time** | Time to add capacity | Infrastructure automation metrics |
| **Load Elasticity** | Response to demand changes | Auto-scaling telemetry |
| **Max Concurrent Users** | Users before degradation | Load testing |
| **Cost per Transaction** | Infrastructure cost efficiency | Cost allocation + metrics |

**Why It Matters**: Systems must scale economically with business growth.

### 6. Maintainability

Measures ease of understanding and modifying code.

| Metric | Description | Measurement Method |
|--------|-------------|-------------------|
| **Cyclomatic Complexity** | Code path complexity | Static analysis |
| **Technical Debt Ratio** | Remediation time / dev time | SonarQube or similar |
| **Test Coverage** | Code exercised by tests | Coverage tools |
| **Documentation Coverage** | Documented public interfaces | Doc generation tools |

**Why It Matters**: Maintainability determines long-term velocity and cost of change.

### 7. Coupling/Modularity

Measures independence and cohesion of components.

| Metric | Description | Measurement Method |
|--------|-------------|-------------------|
| **Afferent Coupling** | Inbound dependencies per module | Dependency analysis |
| **API Breaking Changes** | Breaking changes per release | API diff tools |
| **Circular Dependencies** | Bidirectional dependency count | Dependency graphs |
| **Module Cohesion (LCOM)** | Relatedness of module elements | Static analysis |

**Why It Matters**: Poor modularity increases change risk and slows development.

### 8. Data Integrity

Measures data quality and protection.

| Metric | Description | Measurement Method |
|--------|-------------|-------------------|
| **Data Consistency** | Failed consistency checks | Database monitoring |
| **Backup Success Rate** | Successful backups / attempted | Backup system logs |
| **RPO Compliance** | Actual vs target recovery point | Disaster recovery tests |
| **Data Quality Score** | Valid records / total | Data quality frameworks |

**Why It Matters**: Data is often the most valuable business asset.

---

## Evolutionary Architecture Principles

### 1. Incremental Change

- Make small, reversible changes
- Fitness functions validate each change
- Rollback if fitness degrades

### 2. Guided Evolution

```
Current State → Change → Fitness Assessment → Accept/Reject
```

Fitness functions act as "guardrails" ensuring evolution stays on track.

### 3. Last Responsible Moment

- Defer decisions until you have information
- Use fitness functions to validate decisions
- Adjust targets as context changes

### 4. Bring the Pain Forward

- Run fitness functions early and often
- Catch degradation before production
- Integrate into CI/CD pipeline

---

## When to Use This Skill

### Standalone System Analysis

Analyze any system's architectural characteristics:

```
"Analyze fitness functions for this system"
    ↓
1. Identify key quality attributes
2. Define fitness functions per attribute
3. Establish measurement methods
4. Set initial targets
5. Create monitoring plan
```

### Migration Planning

Guide migrations with fitness functions:

```
"Plan migration with fitness functions"
    ↓
1. Baseline current fitness
2. Define target fitness for new state
3. Create fitness-guided migration steps
4. Monitor fitness throughout migration
```

### Architecture Governance

Ongoing architecture health monitoring:

```
"Set up architecture fitness monitoring"
    ↓
1. Select key fitness functions
2. Integrate into CI/CD
3. Create dashboards
4. Define alerting thresholds
```

---

## Integration Points

### With TOGAF ADM

| Phase | Fitness Function Use |
|-------|---------------------|
| Phase A (Vision) | Define high-level fitness targets |
| Phase B-D (Architecture) | Detailed fitness function specification |
| Phase E (Opportunities) | Fitness-based solution evaluation |
| Phase F (Migration) | Fitness-guided work package sequencing |
| Phase G (Governance) | Fitness monitoring and enforcement |
| Phase H (Change) | Fitness-based change assessment |

### With Codebase Analysis

Fitness functions can leverage analysis data:
- `technologies` → Dependency age, version currency
- `architecture` → Coupling metrics, complexity
- `interfaces` → API stability, breaking changes

### With Security Analysis

Security fitness functions align with:
- OWASP Top 10 → Vulnerability fitness
- NIST CSF → Security posture scoring
- Compliance frameworks → Audit fitness

---

## Getting Started

### 1. Identify Key Quality Attributes

What matters most for this system?
- Performance? (user-facing)
- Security? (sensitive data)
- Scalability? (growth expected)
- Maintainability? (long-lived system)

### 2. Select Fitness Functions

Choose 3-5 critical fitness functions initially:
- Start small, expand as needed
- Focus on measurable characteristics
- Ensure tooling exists for measurement

### 3. Set Realistic Targets

- Baseline current state first
- Set achievable improvement targets
- Plan for incremental improvement

### 4. Implement Measurement

- Automate where possible
- Integrate into existing workflows
- Make results visible

### 5. Review and Adapt

- Regularly review fitness trends
- Adjust targets as system matures
- Add/remove functions as needs change

---

## References

- *Building Evolutionary Architectures* - Ford, Parsons, Kua
- *Accelerate* - Forsgren, Humble, Kim (DORA metrics)
- *Software Architecture Metrics* - Lilienthal
- *Fundamentals of Software Architecture* - Richards, Ford
