# Nonfunctional Analysis Checklist

Quick reference for analysis completion.

---

## Setup (Phase 0)

- [ ] Output directory confirmed
- [ ] Assessment threshold selected
- [ ] Scope phases selected

---

## Phase 1: Testing Coverage

### Test Discovery
- [ ] All test files found
- [ ] Tests classified by type (unit/integration/e2e)
- [ ] Test framework identified
- [ ] Test count recorded

### Coverage Analysis
- [ ] Coverage reports checked (if available)
- [ ] Critical paths identified
- [ ] Untested paths documented
- [ ] Coverage gaps listed

### Test Quality
- [ ] Assertions checked
- [ ] Flaky indicators noted
- [ ] Test isolation assessed
- [ ] Naming quality reviewed

### Infrastructure
- [ ] CI integration documented
- [ ] Test runner configuration noted
- [ ] Parallel execution status
- [ ] Coverage reporting status

**Report**: `01-testing-coverage.md` complete

---

## Phase 2: Configuration Audit

### Discovery
- [ ] All config files found
- [ ] Environment files inventoried
- [ ] Config formats identified

### Environment Variables
- [ ] All env var references found
- [ ] Required vs optional classified
- [ ] Defaults documented
- [ ] Sensitive vars flagged

### Secrets Assessment
- [ ] Potential secrets identified
- [ ] .gitignore checked
- [ ] .env.example reviewed
- [ ] Hardcoded secrets flagged

### Validation
- [ ] Schema validation checked
- [ ] Startup validation documented
- [ ] Missing validation noted

### Environment Parity
- [ ] Environments compared
- [ ] Drift risks identified

**Report**: `02-configuration-audit.md` complete

---

## Phase 3: Performance Hotspots

### Complexity Analysis
- [ ] Cyclomatic complexity calculated
- [ ] Cognitive complexity assessed
- [ ] High complexity functions listed
- [ ] Deep nesting flagged

### Async Patterns
- [ ] Sequential awaits found
- [ ] Missing awaits detected
- [ ] Async loops identified
- [ ] Parallel opportunities noted

### Database Queries
- [ ] N+1 patterns found
- [ ] Unbounded queries flagged
- [ ] Index suggestions made
- [ ] Query patterns documented

### Resource Management
- [ ] Connection pools checked
- [ ] Memory concerns identified
- [ ] Event listener cleanup verified
- [ ] Resource leaks flagged

### Caching
- [ ] Current caching documented
- [ ] Caching opportunities identified

**Report**: `03-performance-hotspots.md` complete

---

## Phase 4: Code Health

### Duplication
- [ ] Duplicate blocks found
- [ ] Duplication percentage calculated
- [ ] Largest duplicates documented
- [ ] Extraction opportunities noted

### Dead Code
- [ ] Unused exports found
- [ ] Unreachable code detected
- [ ] Unused dependencies listed

### Technical Debt
- [ ] TODO markers counted
- [ ] FIXME markers counted
- [ ] HACK markers counted
- [ ] Deprecations noted
- [ ] Priority debt identified

### Consistency
- [ ] Naming conventions analyzed
- [ ] File naming checked
- [ ] Structure patterns reviewed
- [ ] Violations documented

### Scoring
- [ ] Maintainability score calculated
- [ ] Component scores documented
- [ ] Rating assigned

**Report**: `04-code-health.md` complete

---

## Finalization

### Reports
- [ ] All phase reports complete
- [ ] Findings have evidence
- [ ] Recommendations prioritized

### Index
- [ ] Executive summary written
- [ ] Overall score calculated
- [ ] Top recommendations listed
- [ ] Quick wins identified
- [ ] All report links working

**Report**: `index.md` complete

---

## Quick Reference: Thresholds

### Testing

| Metric | Good | Warning | Critical |
|--------|------|---------|----------|
| Coverage | > 80% | 40-80% | < 40% |
| Test ratio | > 1:3 | 1:5-1:3 | < 1:5 |
| Flaky tests | 0 | 1-5 | > 5 |

### Configuration

| Check | Good | Warning | Critical |
|-------|------|---------|----------|
| Secrets in code | 0 | - | Any |
| Validation | Schema | Partial | None |
| .env.example | Complete | Partial | Missing |

### Performance

| Metric | Good | Warning | Critical |
|--------|------|---------|----------|
| Cyclomatic | < 10 | 10-20 | > 20 |
| Cognitive | < 15 | 15-30 | > 30 |
| Nesting | < 3 | 3-5 | > 5 |
| N+1 queries | 0 | 1-3 | > 3 |

### Code Health

| Metric | Good | Warning | Critical |
|--------|------|---------|----------|
| Duplication | < 3% | 3-10% | > 10% |
| Dead code | < 1% | 1-5% | > 5% |
| TODOs | < 10 | 10-50 | > 50 |
| Consistency | > 90% | 70-90% | < 70% |

---

## Scoring Quick Reference

### Overall Score Calculation

```
Overall = (Test × 0.25) + (Config × 0.20) + (Perf × 0.25) + (Health × 0.30)
```

### Rating Scale

| Score | Rating |
|-------|--------|
| 80-100 | Excellent |
| 60-79 | Good |
| 40-59 | Fair |
| 20-39 | Poor |
| 0-19 | Critical |

---

## Evidence Requirements

Each finding should include:

- [ ] File path reference
- [ ] Line number (where applicable)
- [ ] Code snippet (for clarity)
- [ ] Impact assessment
- [ ] Recommendation
