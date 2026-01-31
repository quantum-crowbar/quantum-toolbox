# Nonfunctional Analysis Templates

Report templates for code quality analysis.

---

## Index Template

```markdown
# Nonfunctional Analysis

**Project**: {project_name}
**Analysis Date**: {date}
**Analyst**: AI Analysis

---

## Executive Summary

### Overall Health Score: {score}/100 ({rating})

| Category | Score | Status |
|----------|-------|--------|
| Testing Coverage | {test_score}/100 | {test_status} |
| Configuration | {config_score}/100 | {config_status} |
| Performance | {perf_score}/100 | {perf_status} |
| Code Health | {health_score}/100 | {health_status} |

### Key Findings

| Priority | Count | Categories |
|----------|-------|------------|
| Critical | {critical_count} | {critical_categories} |
| High | {high_count} | {high_categories} |
| Medium | {medium_count} | {medium_categories} |
| Low | {low_count} | {low_categories} |

---

## Top Recommendations

{for rec in top_recommendations limit 5}
### {rec.number}. {rec.title}

**Priority**: {rec.priority}
**Impact**: {rec.impact}
**Effort**: {rec.effort}

{rec.description}

**Location**: {rec.locations}

{/for}

---

## Detailed Reports

| Report | Summary |
|--------|---------|
| [Testing Coverage](01-testing-coverage.md) | {test_summary} |
| [Configuration Audit](02-configuration-audit.md) | {config_summary} |
| [Performance Hotspots](03-performance-hotspots.md) | {perf_summary} |
| [Code Health](04-code-health.md) | {health_summary} |

---

## Health Trend

{if previous_analysis}
| Metric | Previous | Current | Trend |
|--------|----------|---------|-------|
| Test Coverage | {prev_test}% | {curr_test}% | {test_trend} |
| Duplication | {prev_dup}% | {curr_dup}% | {dup_trend} |
| Complexity Avg | {prev_cx} | {curr_cx} | {cx_trend} |
{else}
*First analysis - no trend data available*
{/if}

---

## Quick Wins

Issues that can be fixed quickly with high impact:

{for win in quick_wins}
- [ ] {win.description} ({win.file})
{/for}
```

---

## Testing Coverage Report Template

```markdown
# Testing Coverage Analysis

**Generated**: {date}

---

## Summary

| Metric | Value | Status |
|--------|-------|--------|
| Total Tests | {total_tests} | - |
| Test Files | {test_files} | - |
| Test-to-Code Ratio | {ratio} | {ratio_status} |
| Estimated Coverage | {coverage}% | {coverage_status} |

---

## Test Inventory

### By Type

| Type | Count | Percentage |
|------|-------|------------|
| Unit | {unit_count} | {unit_pct}% |
| Integration | {int_count} | {int_pct}% |
| E2E | {e2e_count} | {e2e_pct}% |
| Other | {other_count} | {other_pct}% |

### By Location

```
{test_tree}
```

---

## Test Framework

| Aspect | Value |
|--------|-------|
| Framework | {framework} |
| Version | {version} |
| Config File | {config_file} |
| CI Integration | {ci_status} |

---

## Coverage Gaps

### Critical Paths Without Tests

| Path | Risk | Recommendation |
|------|------|----------------|
{for gap in critical_gaps}
| {gap.path} | {gap.risk} | {gap.recommendation} |
{/for}

### Untested Files

{for file in untested_files}
- `{file.path}` - {file.reason}
{/for}

---

## Test Quality Assessment

### Strengths

{for strength in test_strengths}
- {strength}
{/for}

### Concerns

{for concern in test_concerns}
| Issue | Location | Impact |
|-------|----------|--------|
| {concern.issue} | {concern.location} | {concern.impact} |
{/for}

---

## Flaky Test Indicators

{if flaky_indicators}
| Test | File | Indicator |
|------|------|-----------|
{for flaky in flaky_indicators}
| {flaky.name} | {flaky.file} | {flaky.indicator} |
{/for}
{else}
No flaky test indicators detected.
{/if}

---

## Recommendations

### High Priority

{for rec in test_recommendations where rec.priority == "high"}
1. **{rec.title}**
   - Current: {rec.current}
   - Target: {rec.target}
   - Files: {rec.files}
{/for}

### Medium Priority

{for rec in test_recommendations where rec.priority == "medium"}
1. **{rec.title}**: {rec.description}
{/for}
```

---

## Configuration Audit Report Template

```markdown
# Configuration Audit

**Generated**: {date}

---

## Summary

| Metric | Value | Status |
|--------|-------|--------|
| Config Files | {config_count} | - |
| Environment Variables | {env_var_count} | - |
| Secrets Detected | {secrets_count} | {secrets_status} |
| Validation Coverage | {validation_pct}% | {validation_status} |

---

## Configuration Inventory

### Config Files

| File | Type | Purpose |
|------|------|---------|
{for config in config_files}
| `{config.path}` | {config.type} | {config.purpose} |
{/for}

### Environment Variables

| Variable | Required | Has Default | Sensitive | Documented |
|----------|----------|-------------|-----------|------------|
{for var in env_vars}
| `{var.name}` | {var.required} | {var.has_default} | {var.sensitive} | {var.documented} |
{/for}

---

## Security Assessment

### Secrets Management

| Check | Status | Notes |
|-------|--------|-------|
| Secrets in .gitignore | {gitignore_status} | {gitignore_notes} |
| No hardcoded secrets | {hardcoded_status} | {hardcoded_notes} |
| .env.example exists | {example_status} | {example_notes} |
| External secret manager | {manager_status} | {manager_notes} |

### Potential Secrets in Code

{if secrets_in_code}
| Location | Pattern | Recommendation |
|----------|---------|----------------|
{for secret in secrets_in_code}
| `{secret.file}:{secret.line}` | {secret.pattern} | {secret.recommendation} |
{/for}
{else}
No potential secrets detected in code.
{/if}

---

## Configuration Validation

### Schema Validation

{if has_schema_validation}
- Schema library: {schema_lib}
- Config file: {schema_file}
- Coverage: {schema_coverage}%
{else}
**Warning**: No configuration schema validation detected.

Recommendation: Add schema validation using zod, joi, or similar.
{/if}

### Startup Validation

{if startup_validation}
- Validation runs at startup: Yes
- Fails fast on invalid config: {fail_fast}
{else}
**Warning**: No startup configuration validation detected.
{/if}

---

## Environment Comparison

### Variables by Environment

| Variable | Development | Production | Test |
|----------|-------------|------------|------|
{for var in env_comparison}
| `{var.name}` | {var.dev} | {var.prod} | {var.test} |
{/for}

### Drift Risks

{for drift in env_drift}
- **{drift.variable}**: {drift.issue}
{/for}

---

## Recommendations

{for rec in config_recommendations}
### {rec.priority}: {rec.title}

{rec.description}

**Files**: {rec.files}
**Effort**: {rec.effort}
{/for}
```

---

## Performance Hotspots Report Template

```markdown
# Performance Hotspots

**Generated**: {date}

---

## Summary

| Metric | Value | Status |
|--------|-------|--------|
| High Complexity Functions | {high_complexity_count} | {complexity_status} |
| Async Anti-patterns | {async_issues_count} | {async_status} |
| Potential N+1 Queries | {n1_count} | {n1_status} |
| Resource Concerns | {resource_count} | {resource_status} |

---

## Complexity Hotspots

### Most Complex Functions

| Function | File | Cyclomatic | Cognitive | Lines |
|----------|------|------------|-----------|-------|
{for func in complex_functions limit 10}
| `{func.name}` | {func.file}:{func.line} | {func.cyclomatic} | {func.cognitive} | {func.lines} |
{/for}

### Complexity Distribution

```
Cyclomatic Complexity:
  1-5  (Low):      {low_count} functions  ████████████████
  6-10 (Medium):   {med_count} functions  ████████
  11-20 (High):    {high_count} functions ████
  21+  (Critical): {crit_count} functions █
```

---

## Async Pattern Issues

### Sequential Awaits (Could Be Parallel)

{for issue in sequential_awaits}
#### {issue.file}:{issue.line}

```{issue.language}
{issue.code}
```

**Recommendation**: Use `Promise.all()` for independent operations.

{/for}

### Missing Await

{for issue in missing_await}
| File | Line | Expression |
|------|------|------------|
| `{issue.file}` | {issue.line} | `{issue.expression}` |
{/for}

### Async in Loops

{for issue in async_loops}
| File | Line | Pattern | Impact |
|------|------|---------|--------|
| `{issue.file}` | {issue.line} | {issue.pattern} | {issue.impact} |
{/for}

---

## Database Query Issues

### Potential N+1 Queries

{for issue in n1_queries}
#### {issue.file}:{issue.line}

```{issue.language}
{issue.code}
```

**Pattern**: {issue.pattern}
**Recommendation**: {issue.recommendation}

{/for}

### Unbounded Queries

{for issue in unbounded_queries}
| File | Line | Query | Fix |
|------|------|-------|-----|
| `{issue.file}` | {issue.line} | {issue.query} | Add pagination |
{/for}

### Suggested Indexes

| Table | Column(s) | Evidence |
|-------|-----------|----------|
{for index in suggested_indexes}
| {index.table} | {index.columns} | {index.evidence} |
{/for}

---

## Resource Management

### Connection Pools

| Resource | Configured | Max | Concerns |
|----------|------------|-----|----------|
{for pool in connection_pools}
| {pool.name} | {pool.configured} | {pool.max} | {pool.concerns} |
{/for}

### Memory Concerns

{for concern in memory_concerns}
| Pattern | File | Risk | Recommendation |
|---------|------|------|----------------|
| {concern.pattern} | `{concern.file}` | {concern.risk} | {concern.recommendation} |
{/for}

---

## Caching Opportunities

| Endpoint/Function | Frequency | Currently Cached | Recommendation |
|-------------------|-----------|------------------|----------------|
{for opp in caching_opportunities}
| {opp.target} | {opp.frequency} | {opp.cached} | {opp.recommendation} |
{/for}

---

## Recommendations

### Critical

{for rec in perf_recommendations where rec.priority == "critical"}
1. **{rec.title}**: {rec.description}
   - Location: {rec.location}
   - Impact: {rec.impact}
{/for}

### High Priority

{for rec in perf_recommendations where rec.priority == "high"}
1. **{rec.title}**: {rec.description}
{/for}
```

---

## Code Health Report Template

```markdown
# Code Health Analysis

**Generated**: {date}

---

## Summary

| Metric | Value | Status |
|--------|-------|--------|
| Duplication | {dup_pct}% | {dup_status} |
| Dead Code | {dead_pct}% | {dead_status} |
| Tech Debt Markers | {debt_count} | {debt_status} |
| Consistency Score | {consistency_score}/100 | {consistency_status} |

---

## Duplication Analysis

### Overview

| Metric | Value |
|--------|-------|
| Duplicate Lines | {dup_lines} |
| Duplicate Percentage | {dup_pct}% |
| Duplicate Blocks | {dup_blocks} |

### Largest Duplicate Blocks

{for dup in duplicates limit 5}
#### Block {dup.index}: {dup.lines} lines ({dup.instances} instances)

Locations:
{for loc in dup.locations}
- `{loc}`
{/for}

**Recommendation**: {dup.recommendation}

{/for}

---

## Dead Code

### Unused Exports

| Export | File | Confidence |
|--------|------|------------|
{for unused in unused_exports}
| `{unused.name}` | {unused.file} | {unused.confidence} |
{/for}

### Unreachable Code

{for unreachable in unreachable_code}
| File | Line | Reason |
|------|------|--------|
| `{unreachable.file}` | {unreachable.line} | {unreachable.reason} |
{/for}

### Unused Dependencies

| Package | Evidence | Action |
|---------|----------|--------|
{for dep in unused_deps}
| `{dep.name}` | {dep.evidence} | {dep.action} |
{/for}

---

## Technical Debt

### Debt Markers Summary

| Type | Count | Oldest |
|------|-------|--------|
| TODO | {todo_count} | {oldest_todo} |
| FIXME | {fixme_count} | {oldest_fixme} |
| HACK | {hack_count} | {oldest_hack} |
| XXX | {xxx_count} | {oldest_xxx} |
| @deprecated | {deprecated_count} | - |

### High Priority Debt

{for debt in priority_debt}
#### {debt.type}: {debt.text}

- **File**: `{debt.file}:{debt.line}`
- **Age**: {debt.age}
- **Context**: {debt.context}
- **Recommendation**: {debt.recommendation}

{/for}

### All Debt Markers

{for debt in all_debt}
| Type | Text | File | Line |
|------|------|------|------|
| {debt.type} | {debt.text} | {debt.file} | {debt.line} |
{/for}

---

## Consistency Analysis

### Naming Conventions

| Element | Convention | Violations |
|---------|------------|------------|
| Files | {file_convention} | {file_violations} |
| Functions | {func_convention} | {func_violations} |
| Classes | {class_convention} | {class_violations} |
| Variables | {var_convention} | {var_violations} |

### Naming Violations

{for violation in naming_violations}
| File | Element | Current | Expected |
|------|---------|---------|----------|
| `{violation.file}` | {violation.element} | {violation.current} | {violation.expected} |
{/for}

### Structure Consistency

| Pattern | Status | Notes |
|---------|--------|-------|
{for pattern in structure_patterns}
| {pattern.name} | {pattern.status} | {pattern.notes} |
{/for}

---

## Maintainability Score

### Component Scores

| Component | Score | Weight | Weighted |
|-----------|-------|--------|----------|
| Test Coverage | {test_score} | 25% | {test_weighted} |
| Duplication | {dup_score} | 20% | {dup_weighted} |
| Complexity | {cx_score} | 25% | {cx_weighted} |
| Consistency | {cons_score} | 15% | {cons_weighted} |
| Documentation | {doc_score} | 15% | {doc_weighted} |
| **Total** | | 100% | **{total_score}** |

### Rating

| Score Range | Rating |
|-------------|--------|
| 80-100 | Excellent |
| 60-79 | Good |
| 40-59 | Fair |
| 20-39 | Poor |
| 0-19 | Critical |

**Current Rating**: {rating} ({total_score}/100)

---

## Recommendations

### Immediate Actions

{for rec in immediate_recommendations}
1. **{rec.title}**
   - Impact: {rec.impact}
   - Effort: {rec.effort}
   - Details: {rec.details}
{/for}

### Long-term Improvements

{for rec in longterm_recommendations}
1. **{rec.title}**: {rec.description}
{/for}
```

---

## Scoring Reference

### Test Coverage Score

```yaml
score_calculation:
  - coverage >= 80%: 100
  - coverage >= 60%: 80
  - coverage >= 40%: 60
  - coverage >= 20%: 40
  - coverage < 20%: 20
```

### Duplication Score

```yaml
score_calculation:
  - duplication < 3%: 100
  - duplication < 5%: 80
  - duplication < 10%: 60
  - duplication < 15%: 40
  - duplication >= 15%: 20
```

### Complexity Score

```yaml
score_calculation:
  - avg_cyclomatic < 5: 100
  - avg_cyclomatic < 10: 80
  - avg_cyclomatic < 15: 60
  - avg_cyclomatic < 20: 40
  - avg_cyclomatic >= 20: 20
```
