# Architecture Documentation Templates

Templates for generating architecture documentation from analysis model.

---

## Index Template

```markdown
# Architecture Documentation

**Project**: {meta.project_name}
**Analysis Date**: {meta.analysis_date}
**Repository**: {meta.repository}
**Status**: Complete

---

## Executive Summary

{Generated from quality and recommendations sections}

### Key Findings

| Category | Status | Notes |
|----------|--------|-------|
| Technology | {summary} | {key tech choices} |
| Architecture | {summary} | {pattern assessment} |
| Dependencies | {summary} | {health assessment} |
| Documentation | {summary} | {coverage assessment} |

### Recommendations

{Top 3-5 recommendations from recommendations.immediate}

---

## Analysis Reports

| Document | Status | Description |
|----------|--------|-------------|
| [Technology Manifest](analysis/01-technology-manifest.md) | ✅ | Languages, frameworks, dependencies |
| [Interface Specification](analysis/02-interface-specification.md) | ✅ | APIs, contracts, boundaries |
| [Architecture Diagrams](analysis/03-architecture-diagrams.md) | ✅ | Visual system overview |
| [Documentation Audit](analysis/04-documentation-audit.md) | ✅ | Existing docs assessment |
| [Dependency Health](analysis/05-dependency-health.md) | ✅ | Security and maintenance status |
| [Data Flow Map](analysis/06-data-flow-map.md) | ✅ | Data lifecycle and movement |
| [Error Handling](analysis/07-error-handling.md) | ✅ | Error patterns and recovery |
| [SRE & Reliability](analysis/08-sre-reliability.md) | ✅ | Observability, reliability patterns, SLO readiness |
| [Code Graph](analysis/09-code-graph.md) | {code_graph active ? ✅ : ⬜ requires code-graph skill} | Call graph, dead code, hotspots |

---

## Reports

| Report | Status | Description |
|--------|--------|-------------|
| [Findings Summary](reports/findings-summary.md) | {generated last, after all views} | Aggregated findings, priority action list |
| [Entry Point Map](reports/entry-point-map.md) | {code_graph active ? ✅ : ⬜ requires code-graph} | All entry points traced to leaves |
| [Dead Code](reports/dead-code.md) | {code_graph active ? ✅ : ⬜ requires code-graph} | Unreachable functions inventory |
| [SRE Hot Paths](reports/sre-hot-paths.md) | {code_graph + sre active ? ✅ : ⬜ requires code-graph + view 08} | Critical call chains with SRE annotations |

---

## Architecture Overview

{High-level architecture diagram from analysis}

---

## Quick Reference

### Technology Stack

| Category | Primary |
|----------|---------|
| Language | {technologies.languages[0].name} {version} |
| Framework | {technologies.frameworks[0].name} |
| Database | {technologies.infrastructure[type=database][0].name} |

### Key Components

{List top 5 components from architecture.components}
```

---

## 01 - Technology Manifest Template

```markdown
# Technology Manifest

**Generated**: {meta.analysis_date}

---

## Languages

| Language | Version | Primary | Evidence |
|----------|---------|---------|----------|
{for lang in technologies.languages}
| {lang.name} | {lang.version} | {lang.primary ? "Yes" : "-"} | {lang.evidence[0]} |
{/for}

---

## Frameworks

| Framework | Version | Purpose | Evidence |
|-----------|---------|---------|----------|
{for fw in technologies.frameworks}
| {fw.name} | {fw.version} | {fw.purpose} | {fw.evidence[0]} |
{/for}

---

## Libraries

### Runtime Dependencies

| Library | Version | Category | Purpose |
|---------|---------|----------|---------|
{for lib in technologies.libraries where lib.category != 'dev'}
| {lib.name} | {lib.version} | {lib.category} | {lib.purpose} |
{/for}

### Development Dependencies

| Library | Version | Category | Purpose |
|---------|---------|----------|---------|
{for lib in technologies.libraries where lib.category == 'dev'}
| {lib.name} | {lib.version} | {lib.category} | {lib.purpose} |
{/for}

---

## Infrastructure

| Component | Type | Purpose | Evidence |
|-----------|------|---------|----------|
{for infra in technologies.infrastructure}
| {infra.name} | {infra.type} | {infra.purpose} | {infra.evidence[0]} |
{/for}

---

## Build Tools

### Package Manager

- **Tool**: {technologies.build_tools.package_manager}
- **Config**: {technologies.build_tools.config_file}

### Key Scripts

| Script | Command | Purpose |
|--------|---------|---------|
{for script in technologies.build_tools.scripts}
| {script.name} | `{script.command}` | {script.purpose} |
{/for}
```

---

## 02 - Interface Specification Template

```markdown
# Interface Specification

**Generated**: {meta.analysis_date}

---

## REST API Endpoints

{for api in interfaces.apis}
### {api.method} {api.path}

- **Handler**: `{api.handler}`
- **Authentication**: {api.auth}

**Request**:
```json
{api.request_schema}
```

**Response**:
```json
{api.response_schema}
```

---
{/for}

## Events

| Event | Type | Publishers | Consumers |
|-------|------|------------|-----------|
{for event in interfaces.events}
| `{event.name}` | {event.type} | {event.publishers.join(", ")} | {event.consumers.join(", ")} |
{/for}

---

## External Integrations

| Service | Direction | Type | Auth |
|---------|-----------|------|------|
{for integration in interfaces.integrations}
| {integration.name} | {integration.direction} | {integration.type} | {integration.auth} |
{/for}

---

## CLI Commands

| Command | Description | Handler |
|---------|-------------|---------|
{for cmd in interfaces.cli}
| `{cmd.command}` | {cmd.description} | {cmd.handler} |
{/for}
```

---

## 03 - Architecture Diagrams Template

> **Excalidraw Format**: When `diagram_format` is `excalidraw`, generate `.excalidraw` files in a `diagrams/` subdirectory and reference them as images: `![Component Diagram](./diagrams/component-diagram.excalidraw.png)`. Users can open the `.excalidraw` file directly in VS Code for editing.

```markdown
# Architecture Diagrams

**Generated**: {meta.analysis_date}
**Diagram Format**: {meta.preferences.diagram_format}

---

## Component Diagram

{Generate component diagram from architecture.components}

```mermaid
graph TB
{for component in architecture.components}
    {component.name}["{component.name}"]
{/for}

{for component in architecture.components}
{for dep in component.dependencies}
    {component.name} --> {dep}
{/for}
{/for}
```

---

## Layer Diagram

```mermaid
graph TB
{for layer in architecture.layers}
    subgraph {layer.name}
    {for comp in layer.components}
        {comp}
    {/for}
    end
{/for}
```

---

## Key Flow: {first key flow}

```mermaid
sequenceDiagram
{Generate from traced flow}
```

---

## Data Flow Overview

```mermaid
flowchart LR
{Generate from data.flows}
```
```

---

## 04 - Documentation Audit Template

```markdown
# Documentation Audit

**Generated**: {meta.analysis_date}

---

## Documentation Inventory

| Location | Type | Coverage | Last Updated | Status |
|----------|------|----------|--------------|--------|
{for doc in reconnaissance.documentation}
| {doc.location} | {doc.type} | {doc.coverage} | {doc.last_updated} | {doc.accuracy} |
{/for}

---

## Coverage Assessment

| Area | Documented | Accurate | Notes |
|------|------------|----------|-------|
| Technologies | {assessment} | {accuracy} | {notes} |
| Architecture | {assessment} | {accuracy} | {notes} |
| APIs | {assessment} | {accuracy} | {notes} |
| Setup/Install | {assessment} | {accuracy} | {notes} |

---

## Discrepancies

{for discrepancy in discrepancies}
### {discrepancy.title}

- **Location**: {discrepancy.location}
- **Type**: {discrepancy.type}
- **Documentation says**: {discrepancy.doc_says}
- **Reality**: {discrepancy.reality}
- **Evidence**: {discrepancy.evidence}
- **Impact**: {discrepancy.impact}

**Recommendation**: {discrepancy.recommendation}

---
{/for}

## Missing Documentation

- [ ] {missing item 1}
- [ ] {missing item 2}
```

---

## 05 - Dependency Health Template

```markdown
# Dependency Health Report

**Generated**: {meta.analysis_date}

---

## Summary

| Metric | Count | Status |
|--------|-------|--------|
| Total Packages | {dependencies.health_summary.total} | - |
| Outdated | {dependencies.health_summary.outdated} | {status_emoji} |
| Vulnerable | {dependencies.health_summary.vulnerable} | {status_emoji} |
| Deprecated | {dependencies.health_summary.deprecated} | {status_emoji} |
| Unmaintained | {dependencies.health_summary.unmaintained} | {status_emoji} |

---

## Vulnerabilities

| Package | Version | CVE | Severity | Fixed In |
|---------|---------|-----|----------|----------|
{for pkg in dependencies.packages where pkg.vulnerabilities.length > 0}
{for vuln in pkg.vulnerabilities}
| {pkg.name} | {pkg.current_version} | {vuln.id} | {vuln.severity} | {vuln.fixed_in} |
{/for}
{/for}

---

## Outdated Packages

| Package | Current | Latest | Gap | Action |
|---------|---------|--------|-----|--------|
{for pkg in dependencies.packages where pkg.update_type != 'up-to-date'}
| {pkg.name} | {pkg.current_version} | {pkg.latest_version} | {pkg.update_type} | {action} |
{/for}

---

## License Inventory

| License | Count | Packages |
|---------|-------|----------|
{for license in license_summary}
| {license.name} | {license.count} | {license.packages.join(", ")} |
{/for}

---

## Recommended Actions

1. {priority action 1}
2. {priority action 2}
3. {priority action 3}
```

---

## 06 - Data Flow Map Template

```markdown
# Data Flow Map

**Generated**: {meta.analysis_date}

---

## Entity Catalog

{for entity in data.entities}
### {entity.name}

- **Location**: `{entity.location}`
- **Storage**: {entity.storage}

| Field | Type | Constraints |
|-------|------|-------------|
{for field in entity.fields}
| {field.name} | {field.type} | {field.constraints.join(", ")} |
{/for}

**Relationships**:
{for rel in entity.relationships}
- {rel.type} → {rel.target} (via {rel.foreign_key})
{/for}

---
{/for}

## Data Flows

{for flow in data.flows}
### {flow.name}

**Source**: {flow.source}
**Destination**: {flow.destination}
**Entities**: {flow.data_types.join(", ")}

**Transformations**:
{for step in flow.transformations}
1. {step}
{/for}

---
{/for}

## Data Flow Diagram

```mermaid
flowchart LR
{Generate from data.flows}
```

---

## Entity Lifecycle

{for lifecycle in data.lifecycle}
### {lifecycle.entity}

| Operation | Location/Method |
|-----------|-----------------|
| Create | {lifecycle.create} |
| Read | {lifecycle.read} |
| Update | {lifecycle.update} |
| Delete | {lifecycle.delete} |
| Retention | {lifecycle.retention} |

---
{/for}
```

---

## 07 - Error Handling Template

```markdown
# Error Handling Analysis

**Generated**: {meta.analysis_date}

---

## Error Handling Patterns

| Pattern | Type | Location | Coverage |
|---------|------|----------|----------|
{for pattern in error_handling.patterns}
| {pattern.description} | {pattern.type} | `{pattern.location}` | {pattern.coverage} |
{/for}

---

## Error Propagation

```mermaid
flowchart LR
{Generate from error_handling.propagation}
```

| Source | Handler | Recovery | User-Facing |
|--------|---------|----------|-------------|
{for prop in error_handling.propagation}
| {prop.source} | {prop.handlers.join(" → ")} | {prop.recovery} | {prop.user_facing ? "Yes" : "No"} |
{/for}

---

## Logging & Observability

- **Framework**: {error_handling.logging.framework}
- **Levels**: {error_handling.logging.levels.join(", ")}
- **Destinations**: {error_handling.logging.destinations.join(", ")}

---

## Gaps & Recommendations

| Location | Risk | Issue | Recommendation |
|----------|------|-------|----------------|
{for gap in error_handling.gaps}
| `{gap.location}` | {gap.risk} | {gap.description} | {gap.recommendation} |
{/for}
```

---

## 08 - SRE & Reliability Template

```markdown
# SRE & Reliability Analysis

**Project**: {meta.project_name}
**Generated**: {meta.analysis_date}

---

## Summary

| Area | Status | Notes |
|------|--------|-------|
| Observability | {observability_status} | {observability_note} |
| Health & Readiness | {health_status} | {health_note} |
| Reliability Patterns | {reliability_status} | {reliability_note} |
| SLO Readiness | {slo_status} | {slo_note} |
| Deployment Model | {deployment_status} | {deployment_note} |
| Operational Runbooks | {runbooks_status} | {runbooks_note} |

> Status values: ✅ Present | ⚠️ Partial | ❌ Missing | ❓ Unknown

---

## 1. Observability

### Logging

- **Framework**: {error_handling.logging.framework | "Not detected"}
- **Log levels in use**: {error_handling.logging.levels.join(", ") | "Unknown"}
- **Log destinations**: {error_handling.logging.destinations.join(", ") | "Unknown"}
- **Structured logging**: {detect from logging library — yes/no/partial}

### Metrics

| Signal | Detected | Library / Endpoint | Notes |
|--------|----------|--------------------|-------|
| Application metrics | {yes/no} | {e.g. Prometheus client, Micrometer, OpenTelemetry} | {evidence} |
| Metrics endpoint | {yes/no} | {e.g. GET /metrics, /actuator/prometheus} | {location} |
| Custom business metrics | {yes/no} | {library} | {what is tracked} |

### Distributed Tracing

| Signal | Detected | Library | Notes |
|--------|----------|---------|----|
| Trace instrumentation | {yes/no} | {e.g. OpenTelemetry, Jaeger client, Zipkin} | {evidence} |
| Context propagation | {yes/no} | {W3C TraceContext / B3 headers} | {evidence} |
| Span creation (manual) | {yes/no} | — | {evidence} |

### Alerting

| Signal | Detected | Notes |
|--------|----------|-------|
| Alert rules / definitions | {yes/no} | {e.g. Prometheus rules, PagerDuty config, alertmanager.yml} |
| Error budget / burn rate | {yes/no} | {evidence} |

### Observability Gaps

{If any signals missing:}

| Gap | Severity | Recommendation |
|-----|----------|----------------|
{for gap in observability_gaps}
| {gap.description} | {gap.severity} | {gap.recommendation} |
{/for}

---

## 2. Health & Readiness

### Detected Health Endpoints

| Endpoint | Type | Location | What It Checks |
|----------|------|----------|----------------|
{for api in interfaces.apis where path matches /health|/ready|/live|/ping|/status|/actuator}
| `{api.method} {api.path}` | {liveness/readiness/startup/general} | `{api.handler}` | {inferred checks} |
{/for}

{If no health endpoints detected:}
> ❌ No health or readiness endpoints detected. Services without health checks cannot
> be reliably managed by orchestration platforms (Kubernetes, ECS, etc.).

### Health Check Coverage Assessment

| Component | Health Checked | Notes |
|-----------|---------------|-------|
{for component in architecture.components}
| {component.name} | {yes / no / partial} | {evidence or gap} |
{/for}

### Recommendations

{If missing liveness:}  ❌ Add `GET /health/live` — returns 200 if process is alive
{If missing readiness:} ❌ Add `GET /health/ready` — returns 200 only when all dependencies are up
{If checks are shallow:} ⚠️ Health checks should verify DB connectivity, cache availability, and required external services

---

## 3. Reliability Patterns

### Pattern Inventory

| Pattern | Status | Location | Library / Implementation |
|---------|--------|----------|--------------------------|
| Circuit breaker | {detected/missing} | {location or "—"} | {e.g. resilience4j, Polly, cockatiel, opossum} |
| Retry with backoff | {detected/missing} | {location or "—"} | {e.g. axios-retry, retry, spring-retry} |
| Timeout | {detected/missing} | {location or "—"} | {e.g. axios timeout, AbortController, http.Client timeout} |
| Bulkhead | {detected/missing} | {location or "—"} | {e.g. thread pool isolation, p-limit} |
| Rate limiter | {detected/missing} | {location or "—"} | {e.g. express-rate-limit, bucket4j, throttle-debounce} |
| Fallback / default | {detected/missing} | {location or "—"} | {implementation} |
| Idempotency | {detected/missing} | {location or "—"} | {idempotency-key headers, deduplication logic} |

### Reliability Pattern Assessment

```mermaid
flowchart LR
    Client --> RateLimit{Rate Limiter?}
    RateLimit -->|{detected: ✅ / missing: ❌}| Timeout{Timeout?}
    Timeout -->|{detected: ✅ / missing: ❌}| CB{Circuit Breaker?}
    CB -->|{detected: ✅ / missing: ❌}| Retry{Retry?}
    Retry -->|{detected: ✅ / missing: ❌}| Service[Downstream Service]
```

### Missing Pattern Risks

{for pattern in missing_reliability_patterns}
| **{pattern.name}** missing | Risk: {pattern.risk} | Recommendation: {pattern.recommendation} |
{/for}

---

## 4. SLO Readiness

Assesses how measurable this system is — whether SLIs (Service Level Indicators) can be
computed from current instrumentation.

### SLI Coverage

| SLI Type | Instrumented | How Measured | Gap |
|----------|-------------|--------------|-----|
| Availability (error rate) | {yes/partial/no} | {e.g. HTTP 5xx rate from metrics} | {gap if any} |
| Latency (p99 response time) | {yes/partial/no} | {e.g. histogram metric, trace spans} | {gap if any} |
| Throughput (request rate) | {yes/partial/no} | {e.g. request counter metric} | {gap if any} |
| Saturation (resource usage) | {yes/partial/no} | {e.g. CPU/memory metrics, queue depth} | {gap if any} |

### SLO Readiness Assessment

{If all SLIs instrumented:}
> ✅ System is SLO-ready. All four golden signal SLIs can be computed from existing instrumentation.

{If partially instrumented:}
> ⚠️ Partial SLO readiness. {list missing SLIs}. SLOs can be defined for available signals only.

{If no instrumentation:}
> ❌ SLO not possible with current instrumentation. No metrics or tracing detected.
> Add application metrics library and expose a metrics endpoint before defining SLOs.

---

## 5. Deployment Model

### Detected Signals

| Signal | Detected | Evidence |
|--------|----------|----------|
| Feature flags | {yes/no} | {e.g. LaunchDarkly, Unleash, env-based flags, config flags} |
| Canary / progressive delivery | {yes/no} | {e.g. Argo Rollouts config, Spinnaker pipeline, weighted routing} |
| Blue/green deployment | {yes/no} | {e.g. deployment config, traffic switching config} |
| Database migration strategy | {yes/no} | {e.g. Flyway, Liquibase, backward-compatible migrations} |
| Rollback capability | {yes/no} | {e.g. versioned artifacts, migration rollback scripts} |
| Graceful shutdown | {yes/no} | {e.g. SIGTERM handler, drain logic, connection.close on exit} |

### Assessment

{Summarise: is the deployment model conducive to low-risk releases?}
{Key risks: e.g. no feature flags → all-or-nothing releases; no graceful shutdown → request drops on deploy}

---

## 6. Operational Runbooks

### Documentation Inventory

| Document | Location | Coverage | Quality |
|----------|----------|----------|---------|
{for doc in reconnaissance.documentation where type matches runbook|playbook|on-call|incident|ops}
| {doc.location} | [{doc.location}]({doc.location}) | {doc.coverage} | {doc.accuracy} |
{/for}

{If no runbooks detected:}
> ❌ No operational runbooks, playbooks, or on-call documentation detected.

### Coverage Assessment

| Scenario | Runbook Exists | Notes |
|----------|---------------|-------|
| Service down / restart | {yes/no} | |
| High error rate | {yes/no} | |
| Database connection failure | {yes/no} | |
| Dependency outage (downstream) | {yes/no} | |
| Deployment rollback | {yes/no} | |
| Data recovery | {yes/no} | |

---

## 7. Incident Response Gaps

### Single Points of Failure

| Component | Type | Mitigation Present | Risk |
|-----------|------|--------------------|------|
{for component in architecture.components where is_spof = true}
| {component.name} | {component.type} | {mitigation or "None detected"} | {risk} |
{/for}

{Detect SPOFs from: single database with no replica config, single cache node, no queue DLQ,
 components with fan_in >> 10 and no fallback pattern detected.}

### Infrastructure Reliability Signals

| Infrastructure | HA Configured | Backup / Failover | Notes |
|----------------|--------------|-------------------|-------|
{for infra in technologies.infrastructure}
| {infra.name} ({infra.type}) | {yes/no/unknown} | {yes/no/unknown} | {evidence} |
{/for}

### Observability Blind Spots

{Cross-reference error_handling.gaps with observability signals:}

| Component / Path | Gap Type | Severity | Recommendation |
|------------------|----------|----------|----------------|
{for gap in error_handling.gaps where risk = high}
| `{gap.location}` | No error handling | High | {gap.recommendation} |
{/for}
{for component lacking metrics or tracing}
| {component.name} | No observability signals | Medium | Add metrics + structured logging |
{/for}

---

## Reliability Score

| Area | Score | Weight | Notes |
|------|-------|--------|-------|
| Observability | {0-3} / 3 | High | Logging/metrics/tracing |
| Health checks | {0-2} / 2 | High | Liveness + readiness |
| Reliability patterns | {0-5} / 5 | High | CB, retry, timeout, bulkhead, rate limit |
| SLO readiness | {0-4} / 4 | Medium | 4 golden signals |
| Deployment safety | {0-3} / 3 | Medium | Feature flags, graceful shutdown, rollback |
| Runbooks | {0-2} / 2 | Low | Presence + scenario coverage |
| **Total** | **{sum}** / **19** | | |

> **{0-6}: ❌ Critical gaps** — reliability incidents likely; address immediately
> **{7-12}: ⚠️ Partial** — foundational elements present; significant gaps remain
> **{13-17}: ✅ Good** — solid foundation; targeted improvements recommended
> **{18-19}: 🟢 Excellent** — production-grade reliability posture
```
