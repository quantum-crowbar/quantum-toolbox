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
