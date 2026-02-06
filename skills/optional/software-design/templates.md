# Software Design Templates

Reusable templates for design documentation.

---

## Architecture Decision Record (ADR)

```markdown
# ADR-{NUMBER}: {TITLE}

## Status

{Proposed | Accepted | Deprecated | Superseded by ADR-XXX}

## Context

{Describe the situation and problem that requires a decision.}

## Decision

{State the decision that was made.}

## Consequences

### Positive
- {Benefit 1}
- {Benefit 2}

### Negative
- {Drawback 1}
- {Drawback 2}

### Neutral
- {Side effect that's neither good nor bad}

## Alternatives Considered

### {Alternative 1}
- **Pros**: {benefits}
- **Cons**: {drawbacks}
- **Why rejected**: {reason}

### {Alternative 2}
- **Pros**: {benefits}
- **Cons**: {drawbacks}
- **Why rejected**: {reason}

## References

- {Link to relevant docs, discussions, or resources}
```

---

## Design Document Template

```markdown
# Design: {Feature/System Name}

## Overview

### Problem Statement
{What problem are we solving?}

### Goals
- {Goal 1}
- {Goal 2}

### Non-Goals
- {What this design explicitly does NOT address}

## Background

{Context needed to understand this design. Link to related systems, previous decisions.}

## Design

### High-Level Architecture

{Diagram or description of overall structure}

### Components

#### {Component 1}
- **Responsibility**: {What it does}
- **Interface**: {How other components interact with it}
- **Dependencies**: {What it depends on}

#### {Component 2}
...

### Data Model

{Database schemas, data structures, etc.}

### API Design

{Endpoints, method signatures, etc.}

### Error Handling

{How errors are handled and propagated}

## Security Considerations

- {Security aspect 1}
- {Security aspect 2}

## Performance Considerations

- {Performance aspect 1}
- {Performance aspect 2}

## Testing Strategy

- {How this will be tested}

## Migration/Rollout Plan

- {How this will be deployed}

## Open Questions

- {Unresolved question 1}
- {Unresolved question 2}

## Appendix

{Additional details, calculations, research}
```

---

## Interface Definition Template

```markdown
# Interface: {InterfaceName}

## Purpose

{Why this interface exists and what contract it defines}

## Methods

### `{methodName}({params}): {returnType}`

**Description**: {What this method does}

**Parameters**:
| Name | Type | Required | Description |
|------|------|----------|-------------|
| {param1} | {type} | Yes/No | {description} |

**Returns**: {Description of return value}

**Throws**:
- `{ErrorType}`: {When this error is thrown}

**Example**:
```typescript
const result = interface.methodName(param1, param2);
```

## Invariants

- {Condition that must always be true}

## Thread Safety

{Thread safety guarantees, if applicable}

## Implementation Notes

{Guidance for implementers}
```

---

## Module/Component Specification Template

```markdown
# Component: {ComponentName}

## Responsibility

{Single sentence describing what this component does}

## Public Interface

### Properties
| Property | Type | Description |
|----------|------|-------------|
| {prop} | {type} | {description} |

### Methods
| Method | Parameters | Returns | Description |
|--------|------------|---------|-------------|
| {method} | {params} | {type} | {description} |

### Events
| Event | Payload | When Emitted |
|-------|---------|--------------|
| {event} | {type} | {condition} |

## Dependencies

| Dependency | Purpose |
|------------|---------|
| {dep} | {why needed} |

## Configuration

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| {option} | {type} | {default} | {description} |

## Error Handling

| Error | Condition | Recovery |
|-------|-----------|----------|
| {error} | {when} | {how to handle} |

## Performance Characteristics

- **Time Complexity**: {O notation for key operations}
- **Space Complexity**: {Memory usage}
- **Scaling**: {How it scales}

## Usage Example

```typescript
// Example code showing how to use this component
```
```

---

## API Endpoint Template

```markdown
# API: {Endpoint Name}

## Endpoint

`{METHOD} {/path/{param}}`

## Description

{What this endpoint does}

## Authentication

{Required auth, scopes, etc.}

## Request

### Headers
| Header | Required | Description |
|--------|----------|-------------|
| Authorization | Yes | Bearer token |

### Path Parameters
| Parameter | Type | Description |
|-----------|------|-------------|
| {param} | {type} | {description} |

### Query Parameters
| Parameter | Type | Required | Default | Description |
|-----------|------|----------|---------|-------------|
| {param} | {type} | Yes/No | {default} | {description} |

### Request Body
```json
{
  "field": "type - description"
}
```

## Response

### Success (200 OK)
```json
{
  "data": {}
}
```

### Errors
| Status | Code | Description |
|--------|------|-------------|
| 400 | INVALID_INPUT | {when} |
| 404 | NOT_FOUND | {when} |

## Example

### Request
```bash
curl -X POST https://api.example.com/endpoint \
  -H "Authorization: Bearer token" \
  -d '{"field": "value"}'
```

### Response
```json
{
  "id": "123",
  "created": "2024-01-15T10:00:00Z"
}
```
```

---

## Refactoring Plan Template

```markdown
# Refactoring: {Area/Component}

## Current State

{Description of current code and its problems}

### Code Smells Identified
- [ ] {Smell 1}: {location}
- [ ] {Smell 2}: {location}

## Target State

{Description of desired end state}

## Steps

### Phase 1: {Name}
1. [ ] {Step 1}
2. [ ] {Step 2}

**Verification**: {How to verify this phase is complete}

### Phase 2: {Name}
1. [ ] {Step 1}
2. [ ] {Step 2}

**Verification**: {How to verify this phase is complete}

## Risks

| Risk | Mitigation |
|------|------------|
| {risk} | {how to mitigate} |

## Rollback Plan

{How to revert if something goes wrong}

## Success Criteria

- [ ] All tests pass
- [ ] {Metric} improved by {amount}
- [ ] {Quality indicator}
```
