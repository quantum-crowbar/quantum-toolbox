# Nonfunctional Analysis Skill

Systematic assessment of code quality, testing, configuration, and performance characteristics.

---

## Purpose

Analyze nonfunctional aspects of a codebase that impact maintainability, reliability, and performance:

- **Testing Coverage**: Test inventory, coverage gaps, quality assessment
- **Configuration Audit**: Config sprawl, environment handling, secrets management
- **Performance Hotspots**: Complexity, async patterns, resource usage
- **Code Health**: Duplication, dead code, technical debt indicators

---

## When to Use

This skill complements functional analysis (arch-analysis, security-analysis) by focusing on quality attributes:

```
"Analyze code quality"
"Assess test coverage"
"Audit configuration"
"Find performance issues"
"Check code health"
```

---

## Analysis Phases

| Phase | Focus | Output |
|-------|-------|--------|
| **1: Testing** | Test inventory, coverage, patterns | Testing report |
| **2: Configuration** | Config files, env vars, secrets | Configuration report |
| **3: Performance** | Complexity, async, resources | Performance report |
| **4: Code Health** | Duplication, debt, maintainability | Health report |

---

## Output Structure

```
{docs-directory}/nonfunctional-analysis/
├── index.md                    # Summary and recommendations
├── 01-testing-coverage.md      # Test assessment
├── 02-configuration-audit.md   # Config analysis
├── 03-performance-hotspots.md  # Performance concerns
└── 04-code-health.md           # Maintainability indicators
```

---

## Phase 1: Testing Coverage

### What We Analyze

| Aspect | Questions Answered |
|--------|-------------------|
| **Inventory** | What tests exist? Where are they? |
| **Coverage** | What's tested? What's not? |
| **Quality** | Are tests meaningful? Flaky? |
| **Patterns** | Unit vs integration vs e2e ratio |
| **Infrastructure** | CI integration, test runners |

### Key Metrics

- Test count by type (unit, integration, e2e)
- Test-to-code ratio
- Critical paths with/without tests
- Flaky test indicators
- Test execution time

### Coverage Gaps

Identify untested:
- Public APIs and endpoints
- Error handling paths
- Edge cases and boundary conditions
- Integration points
- Critical business logic

---

## Phase 2: Configuration Audit

### What We Analyze

| Aspect | Questions Answered |
|--------|-------------------|
| **Inventory** | What config files exist? |
| **Environment** | How are envs handled? |
| **Secrets** | Are secrets properly managed? |
| **Defaults** | Are defaults sensible? |
| **Validation** | Is config validated at startup? |

### Configuration Patterns

```
config/
├── default.json       # Base configuration
├── development.json   # Dev overrides
├── production.json    # Prod overrides
└── test.json          # Test overrides
```

vs

```
.env                   # Environment variables
.env.example           # Template
```

### Risk Assessment

| Risk | Indicators |
|------|------------|
| **Secrets in code** | API keys, passwords in source |
| **Missing validation** | No schema, no startup checks |
| **Env drift** | Configs differ between environments |
| **Config sprawl** | Settings scattered across files |

---

## Phase 3: Performance Hotspots

### What We Analyze

| Aspect | Questions Answered |
|--------|-------------------|
| **Complexity** | Where is code most complex? |
| **Async** | Are async patterns correct? |
| **Resources** | Memory leaks, connection handling? |
| **Queries** | N+1, missing indexes? |
| **Caching** | Is caching used appropriately? |

### Complexity Indicators

- Cyclomatic complexity per function
- Nesting depth
- Function/file length
- Parameter counts
- Cognitive complexity

### Common Performance Issues

| Issue | Detection Pattern |
|-------|-------------------|
| N+1 queries | Loop with DB call inside |
| Missing async/await | Promise without await |
| Memory leaks | Event listeners not removed |
| Blocking I/O | Sync file/network in request path |
| No pagination | Unbounded queries |

---

## Phase 4: Code Health

### What We Analyze

| Aspect | Questions Answered |
|--------|-------------------|
| **Duplication** | Copy-paste code? |
| **Dead code** | Unused exports, unreachable code? |
| **Dependencies** | Unused, duplicate packages? |
| **Consistency** | Naming, structure patterns? |
| **Technical debt** | TODOs, FIXMEs, hacks? |

### Health Indicators

| Indicator | Good | Concerning | Critical |
|-----------|------|------------|----------|
| Duplication | < 3% | 3-10% | > 10% |
| Dead code | < 1% | 1-5% | > 5% |
| TODO/FIXME | < 10 | 10-50 | > 50 |
| Avg function length | < 20 lines | 20-50 | > 50 |
| Max nesting | < 3 | 3-5 | > 5 |

### Technical Debt Markers

```javascript
// TODO: Refactor this
// FIXME: Temporary workaround
// HACK: This shouldn't be necessary
// XXX: Known issue
// @deprecated
```

---

## Integration with Other Skills

### With codebase-analysis

Can consume existing analysis model:
- `architecture.components` → Identify critical components for testing
- `interfaces.apis` → Check API test coverage
- `data.entities` → Verify data model tests

### With security-analysis

Complements security findings:
- Config audit reveals secret handling
- Test coverage shows security test gaps
- Performance issues may have security implications

---

## Invocation

### Full Analysis

```
"Analyze nonfunctional aspects"
"Run quality analysis"
"Check code health and tests"
```

### Targeted Analysis

```
"Analyze test coverage"        → Phase 1 only
"Audit configuration"          → Phase 2 only
"Find performance hotspots"    → Phase 3 only
"Assess code health"           → Phase 4 only
```

---

## Configuration

### Output Directory

```
Where should I create the nonfunctional analysis?
Default: ./docs
```

### Thresholds

```
What standards should I use for assessment?

1. Strict - High standards, flag more issues
2. Standard - Balanced assessment
3. Lenient - Focus on critical issues only
```

Default: Standard

---

## Success Criteria

A complete analysis includes:

- [ ] Test inventory with counts by type
- [ ] Coverage gap identification for critical paths
- [ ] Configuration audit with risk assessment
- [ ] Performance hotspot identification
- [ ] Code health metrics calculated
- [ ] Prioritized recommendations
- [ ] Index with executive summary

---

## References

- [Workflows](workflows.md) - Detailed procedures
- [Templates](templates.md) - Report templates
- [Checklist](checklist.md) - Completion tracking
- [Examples](examples.md) - Sample findings
