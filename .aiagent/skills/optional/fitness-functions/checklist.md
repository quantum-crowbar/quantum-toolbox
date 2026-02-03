# Fitness Functions Checklist

Quick reference for fitness function definition and review.

---

## Fitness Function Definition Checklist

### Function Specification
- [ ] **ID assigned** - Unique identifier (FF-[CAT]-[NUM])
- [ ] **Name is descriptive** - Clear what's being measured
- [ ] **Attribute identified** - Links to quality attribute
- [ ] **Category assigned** - deployment/performance/reliability/security/etc.
- [ ] **Owner specified** - Team/person responsible

### Measurement Definition
- [ ] **Clear description** - What and why it measures
- [ ] **Method documented** - How measurement works
- [ ] **Data source identified** - Where data comes from
- [ ] **Tool specified** - What performs measurement
- [ ] **Calculation formula** - How value is computed

### Thresholds
- [ ] **Target defined** - Desired state value
- [ ] **Warning threshold** - Early alert value
- [ ] **Critical threshold** - Immediate action value
- [ ] **Operators specified** - < / <= / = / >= / >
- [ ] **Rationale documented** - Why these values

### Classification
- [ ] **Scope classified** - Atomic / Holistic / Composite
- [ ] **Trigger classified** - Continuous / Triggered / Temporal / Manual
- [ ] **Automation level** - Automated / Semi-automated / Manual
- [ ] **Dependencies listed** - Other functions or systems

---

## Quality Attribute Selection Checklist

### Stakeholder Analysis
- [ ] Business stakeholders identified
- [ ] Technical stakeholders identified
- [ ] Operations stakeholders identified
- [ ] Security/compliance stakeholders identified
- [ ] Requirements gathered from each

### Prioritization
- [ ] Business impact scored (1-5)
- [ ] Technical risk scored (1-5)
- [ ] Priority score calculated
- [ ] Top 5-7 attributes selected
- [ ] Selection rationale documented

### Coverage Validation
- [ ] All critical concerns covered
- [ ] No redundant attributes
- [ ] Measurable attributes only
- [ ] Stakeholder sign-off obtained

---

## Baseline Establishment Checklist

### Preparation
- [ ] Measurement infrastructure ready
- [ ] Data collection period defined
- [ ] Measurement conditions documented
- [ ] Anomaly exclusion criteria defined

### Collection
- [ ] Data collected over representative period
- [ ] Sample size sufficient
- [ ] Conditions recorded
- [ ] Anomalies identified and handled

### Analysis
- [ ] Statistics calculated (mean, p50, p95, p99)
- [ ] Industry benchmarks compared
- [ ] Gaps identified
- [ ] Confidence level assessed

### Documentation
- [ ] Baseline values recorded
- [ ] Collection conditions documented
- [ ] Comparison analysis included
- [ ] Improvement opportunities identified

---

## Target Setting Checklist

### Target Definition
- [ ] Based on baseline data
- [ ] Aligned with business requirements
- [ ] Technically achievable
- [ ] Time-bound (deadline specified)
- [ ] Incremental steps defined

### Justification
- [ ] Business benefit articulated
- [ ] Technical approach outlined
- [ ] Risks identified
- [ ] Effort estimated
- [ ] ROI considered

### Thresholds
- [ ] Target value set
- [ ] Warning threshold set
- [ ] Critical threshold set
- [ ] Appropriate buffer between levels

---

## Measurement Implementation Checklist

### Tool Selection
- [ ] Appropriate tool chosen
- [ ] Tool capabilities verified
- [ ] Integration requirements understood
- [ ] Cost/licensing considered

### Pipeline Integration
- [ ] Data collection automated
- [ ] CI/CD gates configured
- [ ] Failure actions defined
- [ ] Bypass procedures documented

### Dashboard
- [ ] Current value displayed
- [ ] Target clearly shown
- [ ] Historical trend visible
- [ ] Status indicators (green/yellow/red)
- [ ] Last updated timestamp

### Alerting
- [ ] Alert rules configured
- [ ] Notification channels set
- [ ] Escalation path defined
- [ ] Alert fatigue considered

---

## Monitoring & Reporting Checklist

### Daily Monitoring
- [ ] Dashboard reviewed
- [ ] Alerts acknowledged
- [ ] Degradation trends noted

### Weekly Review
- [ ] Trend analysis performed
- [ ] Anomalies investigated
- [ ] Progress toward targets assessed

### Monthly Report
- [ ] Fitness report generated
- [ ] Changes highlighted
- [ ] Threshold breaches explained
- [ ] Recommendations included
- [ ] Stakeholders notified

---

## Review & Adaptation Checklist

### Quarterly Review
- [ ] All functions reviewed for relevance
- [ ] Targets assessed for appropriateness
- [ ] Consistently met targets considered for increase
- [ ] Consistently missed targets investigated
- [ ] Missing coverage identified
- [ ] Obsolete functions retired

### Target Adjustment
- [ ] Adjustment justified
- [ ] Impact assessed
- [ ] Stakeholders notified
- [ ] Documentation updated

### Function Evolution
- [ ] New concerns addressed
- [ ] Complex functions simplified
- [ ] Redundant functions consolidated
- [ ] Measurement accuracy improved

---

## Fitness Function Categories Quick Reference

### Deployment/Operational
| Function | Good Target | Measurement |
|----------|-------------|-------------|
| Deployment Frequency | ≥1/day | Deploys per period |
| Lead Time | <1 day | Commit to production |
| MTTR | <1 hour | Incident to resolution |
| Change Failure Rate | <15% | Failed/total deploys |

### Performance
| Function | Good Target | Measurement |
|----------|-------------|-------------|
| Response Time P95 | <200ms | APM percentiles |
| Throughput | Varies | Requests/second |
| Error Rate | <0.1% | Errors/requests |
| Resource Utilization | <70% | Infrastructure metrics |

### Reliability
| Function | Good Target | Measurement |
|----------|-------------|-------------|
| Availability | ≥99.9% | Uptime monitoring |
| MTBF | >30 days | Incident tracking |
| Circuit Breaker Trips | 0 normal | Observability |

### Security
| Function | Good Target | Measurement |
|----------|-------------|-------------|
| Critical Vulnerabilities | 0 | Dependency scanning |
| Patch Latency | <7 days | Issue tracking |
| Dependency Age | <90 days | Package analysis |

### Scalability
| Function | Good Target | Measurement |
|----------|-------------|-------------|
| Scale Time | <5 min | Infrastructure metrics |
| Load Elasticity | <2 min | Auto-scaling telemetry |
| Cost per Transaction | Varies | Cost allocation |

### Maintainability
| Function | Good Target | Measurement |
|----------|-------------|-------------|
| Cyclomatic Complexity | <10 | Static analysis |
| Technical Debt Ratio | <5% | Code analysis |
| Test Coverage | ≥80% | Coverage tools |
| Doc Coverage | 100% APIs | Doc tools |

### Coupling/Modularity
| Function | Good Target | Measurement |
|----------|-------------|-------------|
| Afferent Coupling | <10/module | Dependency analysis |
| API Breaking Changes | 0/release | API diff tools |
| Circular Dependencies | 0 | Dependency graphs |

### Data Integrity
| Function | Good Target | Measurement |
|----------|-------------|-------------|
| Consistency Checks | 0 failures | DB monitoring |
| Backup Success Rate | 100% | Backup logs |
| RPO Compliance | 100% | DR testing |

---

## Red Flags Checklist

### Definition Problems
- [ ] ❌ Vague measurement method
- [ ] ❌ No clear threshold values
- [ ] ❌ Unmeasurable attribute
- [ ] ❌ No owner assigned
- [ ] ❌ Conflicting with other functions

### Implementation Problems
- [ ] ❌ Manual measurement for continuous need
- [ ] ❌ No alerting configured
- [ ] ❌ Stale baseline data
- [ ] ❌ No historical tracking

### Governance Problems
- [ ] ❌ Alerts ignored consistently
- [ ] ❌ No regular reviews
- [ ] ❌ Targets never adjusted
- [ ] ❌ Functions accumulate without retirement

---

## Quick Decision Guide

### Should I Create a Fitness Function?

```
Is this a measurable quality attribute?
├── No → Don't create (can't measure)
└── Yes → Is it important for stakeholders?
    ├── No → Don't create (no value)
    └── Yes → Can we act on the measurement?
        ├── No → Don't create (no action possible)
        └── Yes → CREATE FUNCTION ✓
```

### What Type of Trigger?

```
Does it need real-time detection?
├── Yes → Continuous
└── No → Does it change with each change/deploy?
    ├── Yes → Triggered (on deploy/PR/etc.)
    └── No → Temporal (daily/weekly/monthly)
```

### What Automation Level?

```
Can measurement be fully automated?
├── Yes → Automated
└── Partially → Semi-automated
    └── No → Manual (schedule reviews)
```
