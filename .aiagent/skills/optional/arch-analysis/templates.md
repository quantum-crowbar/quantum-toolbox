# Architectural Analysis Templates

Reusable templates for analysis outputs.

---

## Technology Manifest Template

```markdown
# Technology Manifest: {Project Name}

**Analysis Date**: {YYYY-MM-DD}
**Analyzed By**: {Agent/Person}
**Codebase Version**: {commit hash or version}

## Summary

| Category | Count | Documentation Coverage |
|----------|-------|----------------------|
| Languages | {n} | {%} |
| Frameworks | {n} | {%} |
| Libraries | {n} | {%} |
| Infrastructure | {n} | {%} |

## Languages

| Language | Version | Evidence | Documented | Accuracy |
|----------|---------|----------|------------|----------|
| {lang} | {ver} | {file:line} | Yes/No | Accurate/Outdated/Missing |

## Frameworks

| Framework | Version | Purpose | Evidence | Documented | Accuracy |
|-----------|---------|---------|----------|------------|----------|
| {name} | {ver} | {purpose} | {file:line} | Yes/No | Accurate/Outdated/Missing |

## Libraries

### {Category} (e.g., Authentication, Database, Utilities)

| Library | Version | Purpose | Evidence |
|---------|---------|---------|----------|
| {name} | {ver} | {purpose} | {file:line} |

## Infrastructure Dependencies

| Service | Type | Purpose | Connection Method | Evidence |
|---------|------|---------|-------------------|----------|
| {name} | Database/Cache/Queue/API | {purpose} | {env var or config} | {file:line} |

## Build & DevOps Tools

| Tool | Purpose | Evidence |
|------|---------|----------|
| {tool} | {purpose} | {file} |

## Documentation Gaps

- [ ] {Missing documentation item 1}
- [ ] {Missing documentation item 2}
```

---

## Interface Specification Template

```markdown
# Interface Specification: {Interface Name}

**Type**: REST API / GraphQL / gRPC / Event / Internal
**Base Path**: {/api/v1/resource}
**Evidence**: {file:line}

## Authentication

| Method | Required | Scopes/Roles |
|--------|----------|--------------|
| {JWT/API Key/OAuth} | Yes/No/Optional | {scopes} |

## Endpoints

### {METHOD} {/path}

**Description**: {What this endpoint does}

**Evidence**: {file:line}

**Parameters**:

*Path Parameters*:
| Name | Type | Description |
|------|------|-------------|
| {param} | {type} | {description} |

*Query Parameters*:
| Name | Type | Required | Default | Description |
|------|------|----------|---------|-------------|
| {param} | {type} | Yes/No | {default} | {description} |

*Request Body*:
```json
{
  "field": "{type} - {description}"
}
```

**Responses**:

*Success ({status})*:
```json
{
  "data": {}
}
```

*Errors*:
| Status | Code | Description |
|--------|------|-------------|
| {status} | {ERROR_CODE} | {when this occurs} |

**Documentation Status**: {Accurate/Outdated/Missing}
**Discrepancy**: {details if applicable}

---

## Rate Limiting

| Endpoint | Limit | Window |
|----------|-------|--------|
| {endpoint} | {n} requests | {time period} |

## Pagination

**Pattern**: {offset/cursor}
**Parameters**: {page, limit / cursor, count}
**Max Page Size**: {n}
```

---

## Architecture Diagram Template

```markdown
# Architecture Diagram: {System Name}

## Overview

{Brief description of the system architecture}

## Diagram

```mermaid
graph TB
    subgraph "{Layer/Group Name}"
        {ID}[{Component Name}<br/>{Technology}]
    end

    subgraph "{Another Layer}"
        {ID2}[{Component}]
    end

    subgraph "Data Stores"
        {DB}[({Database Name}<br/>{Type})]
    end

    subgraph "External Services"
        {EXT}[{Service Name}]
    end

    {ID} --> {ID2}
    {ID2} --> {DB}
    {ID2} --> {EXT}
```

## Component Inventory

| Component | Technology | Responsibility | Evidence |
|-----------|------------|----------------|----------|
| {name} | {tech} | {what it does} | {file or dir} |

## Data Flows

| Flow | From | To | Protocol | Purpose |
|------|------|----|----------|---------|
| {name} | {component} | {component} | HTTP/gRPC/AMQP | {purpose} |

## Documentation Comparison

| Aspect | Documented | Accurate | Notes |
|--------|------------|----------|-------|
| Components | Yes/No | Yes/No | {details} |
| Data flows | Yes/No | Yes/No | {details} |
| External deps | Yes/No | Yes/No | {details} |
```

---

## Sequence Diagram Template

```markdown
# Sequence Diagram: {Flow Name}

## Description

{What this flow accomplishes and when it's triggered}

## Participants

| Participant | Type | Description |
|-------------|------|-------------|
| {name} | User/Service/Database/External | {description} |

## Diagram

```mermaid
sequenceDiagram
    autonumber
    participant {A} as {Display Name}
    participant {B} as {Display Name}
    participant {C} as {Display Name}

    {A}->>+{B}: {Action description}
    {B}->>+{C}: {Action description}
    {C}-->>-{B}: {Response description}
    {B}-->>-{A}: {Response description}

    alt {Condition}
        {A}->>>{B}: {Alternative action}
    else {Other condition}
        {A}->>>{C}: {Other action}
    end

    opt {Optional step}
        {B}->>{C}: {Optional action}
    end
```

## Step Details

| Step | Action | Implementation | Evidence |
|------|--------|----------------|----------|
| 1 | {description} | {how it's done} | {file:line} |
| 2 | {description} | {how it's done} | {file:line} |

## Error Handling

| Step | Error | Handling |
|------|-------|----------|
| {n} | {error type} | {what happens} |

## Documentation Status

- **Documented in**: {doc file or "Not documented"}
- **Accuracy**: {Accurate/Outdated/Missing}
- **Gaps**: {what's missing}
```

---

## Documentation Audit Template

```markdown
# Documentation Audit: {Project Name}

**Audit Date**: {YYYY-MM-DD}
**Auditor**: {Agent/Person}
**Scope**: {Full/Partial - specify areas}

## Executive Summary

**Overall Score**: {percentage}%
**Status**: {Good/Needs Improvement/Critical}

{2-3 sentence summary of findings}

## Coverage Matrix

| Documentation Area | Exists | Accurate | Complete | Score |
|-------------------|--------|----------|----------|-------|
| README/Overview | {Yes/No} | {Yes/Partial/No} | {Yes/Partial/No} | {%} |
| Architecture | {Yes/No} | {Yes/Partial/No} | {Yes/Partial/No} | {%} |
| API Reference | {Yes/No} | {Yes/Partial/No} | {Yes/Partial/No} | {%} |
| Setup/Installation | {Yes/No} | {Yes/Partial/No} | {Yes/Partial/No} | {%} |
| Configuration | {Yes/No} | {Yes/Partial/No} | {Yes/Partial/No} | {%} |
| Development Guide | {Yes/No} | {Yes/Partial/No} | {Yes/Partial/No} | {%} |
| Deployment | {Yes/No} | {Yes/Partial/No} | {Yes/Partial/No} | {%} |

## Discrepancies

### {DISC-NNN}: {Title}

**Type**: Missing | Outdated | Incorrect
**Impact**: Low | Medium | High | Critical
**Location**: {doc file and section}

**Documentation says**:
> {quote or description of what docs claim}

**Reality**:
> {what the code actually does}

**Evidence**: {file:line}

**Recommendation**: {specific action to fix}

---

{Repeat for each discrepancy}

## Missing Documentation

| Area | Priority | Impact | Recommendation |
|------|----------|--------|----------------|
| {missing area} | High/Medium/Low | {who is affected} | {what to write} |

## Recommendations

### Immediate Actions (This Sprint)

1. {Action item with specific file/section}
2. {Action item}

### Short-term (Next 2-4 Weeks)

1. {Action item}
2. {Action item}

### Long-term (Backlog)

1. {Action item}
2. {Action item}

## Appendix: Documentation Inventory

| File | Last Updated | Owner | Status |
|------|--------------|-------|--------|
| {path} | {date} | {team/person} | Current/Stale/Outdated |
```

---

## Discrepancy Entry Template

```markdown
### {DISC-NNN}: {Short Title}

**Type**: Missing | Outdated | Incorrect | Inconsistent
**Impact**: Low | Medium | High | Critical
**Discovered**: {YYYY-MM-DD}

**Location**:
- Documentation: {file:section or "N/A"}
- Code: {file:line}

**Description**:
{Clear explanation of the discrepancy}

**Documentation Claims**:
```
{Quote from docs or "Not documented"}
```

**Code Reality**:
```
{Relevant code snippet or description}
```

**Business Impact**:
{Who is affected and how - developers, users, operations}

**Recommendation**:
{Specific action to resolve}

**Status**: Open | In Progress | Resolved
```

---

## Analysis Session Log Template

```markdown
# Analysis Session: {Project Name}

**Date**: {YYYY-MM-DD}
**Duration**: {time}
**Scope**: {what was analyzed}

## Session Goals

- [ ] {Goal 1}
- [ ] {Goal 2}

## Findings Log

### {HH:MM} - {Finding Title}

**Category**: Technology | Interface | Architecture | Documentation
**Location**: {file:line}
**Finding**: {description}
**Doc Status**: Documented/Accurate | Documented/Outdated | Missing

---

{Repeat for each finding}

## Questions Raised

- [ ] {Question that needs follow-up}
- [ ] {Question that needs clarification}

## Next Steps

- [ ] {Action item}
- [ ] {Action item}

## Session Summary

{Brief summary of what was learned and key findings}
```
