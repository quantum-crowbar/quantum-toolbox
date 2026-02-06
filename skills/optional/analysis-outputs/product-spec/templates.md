# Product Specification Templates

Templates for generating product documentation from analysis model.

---

## Index Template

```markdown
# Product Specification: {meta.project_name}

**Generated**: {meta.analysis_date}
**Source**: Code analysis of {meta.repository}

---

## Overview

{meta.description}

This document describes the product capabilities as extracted from the codebase.

---

## Contents

| Document | Description |
|----------|-------------|
| [Features](features.md) | Complete feature inventory |
| [User Flows](user-flows.md) | Key user journeys |
| [Data Model](data-model.md) | Data entities and relationships |
| [Integrations](integrations.md) | External service connections |

---

## Quick Summary

### Feature Categories

{for category in feature_categories}
- **{category.name}**: {category.feature_count} features
{/for}

### Key Capabilities

{top 5 features by complexity/importance}

### External Dependencies

{for integration in interfaces.integrations}
- {integration.name} ({integration.direction})
{/for}

---

## About This Document

This specification was automatically generated from code analysis. It reflects
what the product currently does based on implemented functionality.

For planned features or business context, refer to product roadmap documents.
```

---

## Features Template

```markdown
# Feature Inventory

**Generated**: {meta.analysis_date}

---

## Summary

| Category | Features | Endpoints |
|----------|----------|-----------|
{for category in feature_categories}
| {category.name} | {category.feature_count} | {category.endpoint_count} |
{/for}
| **Total** | **{total_features}** | **{total_endpoints}** |

---

{for category in feature_categories}
## {category.name}

{category.description}

| Feature | Description | Method | Access |
|---------|-------------|--------|--------|
{for feature in category.features}
| {feature.name} | {feature.description} | {feature.method} | {feature.auth} |
{/for}

{if category.events}
### Background Operations

| Event | Description | Trigger |
|-------|-------------|---------|
{for event in category.events}
| {event.name} | {event.description} | {event.trigger} |
{/for}
{/if}

---

{/for}

## Feature Details

{for feature in all_features where feature.complexity > threshold}
### {feature.name}

**Endpoint**: `{feature.method} {feature.path}`
**Access**: {feature.auth_description}
**Handler**: {feature.handler}

#### Description

{feature.detailed_description}

#### Request

{if feature.request_schema}
```json
{feature.request_schema}
```
{else}
No request body required.
{/if}

#### Response

```json
{feature.response_schema}
```

#### Related Features

{for related in feature.related_features}
- [{related.name}](#{related.anchor})
{/for}

---

{/for}
```

---

## User Flows Template

```markdown
# User Flows

**Generated**: {meta.analysis_date}

---

## Overview

This document describes key user journeys through the product.

### User Types

{for user_type in identified_user_types}
- **{user_type.name}**: {user_type.description}
  - Access level: {user_type.access}
{/for}

---

{for flow in user_flows}
## {flow.name}

**Actor**: {flow.actor}
**Goal**: {flow.goal}
**Complexity**: {flow.step_count} steps

### Prerequisites

{for prereq in flow.prerequisites}
- {prereq}
{/for}

### Flow Diagram

```mermaid
sequenceDiagram
    actor User
    participant UI
    participant API
    participant DB

{for step in flow.steps}
    User->>UI: {step.user_action}
    UI->>API: {step.api_call}
    API->>DB: {step.db_operation}
    DB-->>API: {step.db_response}
    API-->>UI: {step.api_response}
    UI-->>User: {step.ui_feedback}
{/for}
```

### Steps

{for step in flow.steps}
{step.number}. **{step.name}**
   - Action: {step.user_action}
   - API: `{step.method} {step.endpoint}`
   - Result: {step.expected_result}

{/for}

### Outcomes

| Outcome | Condition | Result |
|---------|-----------|--------|
| Success | {flow.success_condition} | {flow.success_result} |
{for error in flow.error_cases}
| {error.name} | {error.condition} | {error.result} |
{/for}

### Related Flows

{for related in flow.related_flows}
- [{related.name}](#{related.anchor}): {related.relationship}
{/for}

---

{/for}

## Flow Categories

### CRUD Flows

Standard create, read, update, delete operations:

{for entity in data.entities where entity.has_crud}
- **{entity.name}**: [Create](#create-{entity.slug}) | [View](#view-{entity.slug}) | [Update](#update-{entity.slug}) | [Delete](#delete-{entity.slug})
{/for}

### Authentication Flows

{for flow in auth_flows}
- [{flow.name}](#{flow.anchor}): {flow.description}
{/for}

### Integration Flows

{for flow in integration_flows}
- [{flow.name}](#{flow.anchor}): {flow.external_service}
{/for}
```

---

## Data Model Template

```markdown
# Data Model

**Generated**: {meta.analysis_date}

---

## Overview

This document describes the data entities managed by the product.

### Entity Summary

| Entity | Description | Fields | Relationships |
|--------|-------------|--------|---------------|
{for entity in data.entities}
| [{entity.name}](#{entity.slug}) | {entity.description} | {entity.field_count} | {entity.relationship_count} |
{/for}

---

## Entity Relationship Diagram

```mermaid
erDiagram
{for entity in data.entities}
    {entity.name} {
{for field in entity.key_fields}
        {field.type} {field.name}
{/for}
    }
{/for}

{for rel in all_relationships}
    {rel.source} {rel.cardinality} {rel.target} : "{rel.label}"
{/for}
```

---

{for entity in data.entities}
## {entity.name}

{entity.description}

### Fields

| Field | Type | Description | Required |
|-------|------|-------------|----------|
{for field in entity.fields}
| {field.display_name} | {field.user_friendly_type} | {field.description} | {field.required ? "Yes" : "No"} |
{/for}

### Relationships

{for rel in entity.relationships}
- **{rel.display_name}**: {rel.description}
  - Type: {rel.type_description} (e.g., "Each user has many orders")
  - Related entity: [{rel.target}](#{rel.target_slug})
{/for}

### Lifecycle

| Stage | Description | Trigger |
|-------|-------------|---------|
{if entity.lifecycle}
| Created | {entity.lifecycle.create} | {entity.lifecycle.create_trigger} |
| Updated | {entity.lifecycle.update} | {entity.lifecycle.update_trigger} |
| Deleted | {entity.lifecycle.delete} | {entity.lifecycle.delete_trigger} |
{/if}

### Business Rules

{for rule in entity.inferred_rules}
- {rule.description}
{/for}

---

{/for}

## Data Flow Summary

### Input Sources

{for source in data_sources}
- **{source.name}**: {source.description}
{/for}

### Output Destinations

{for dest in data_destinations}
- **{dest.name}**: {dest.description}
{/for}
```

---

## Integrations Template

```markdown
# External Integrations

**Generated**: {meta.analysis_date}

---

## Overview

This product connects to the following external services:

| Service | Direction | Purpose |
|---------|-----------|---------|
{for integration in interfaces.integrations}
| [{integration.name}](#{integration.slug}) | {integration.direction} | {integration.purpose} |
{/for}

---

## Integration Architecture

```mermaid
flowchart LR
    subgraph Product
        API[Product API]
        Workers[Background Jobs]
    end

{for integration in interfaces.integrations}
    {integration.id}["{integration.name}"]
{/for}

{for integration in interfaces.integrations}
{if integration.direction == "outbound"}
    API --> {integration.id}
{else if integration.direction == "inbound"}
    {integration.id} --> API
{else}
    API <--> {integration.id}
{/if}
{/for}
```

---

{for integration in interfaces.integrations}
## {integration.name}

**Direction**: {integration.direction_description}
**Type**: {integration.type}
**Base URL**: {integration.base_url}

### Purpose

{integration.detailed_purpose}

### Authentication

{integration.auth_description}

### Operations

| Operation | Description | Endpoint |
|-----------|-------------|----------|
{for op in integration.operations}
| {op.name} | {op.description} | `{op.method} {op.path}` |
{/for}

### Data Exchanged

**Sent to {integration.name}**:
{for data in integration.outbound_data}
- {data.description}
{/for}

**Received from {integration.name}**:
{for data in integration.inbound_data}
- {data.description}
{/for}

### Error Handling

{integration.error_handling_description}

### Dependencies

- Required for: {integration.dependent_features}
- Fallback: {integration.fallback_behavior}

---

{/for}

## Integration Summary

### By Direction

| Direction | Count | Services |
|-----------|-------|----------|
| Outbound | {outbound_count} | {outbound_services} |
| Inbound | {inbound_count} | {inbound_services} |
| Bidirectional | {bidirectional_count} | {bidirectional_services} |

### By Type

| Type | Count | Services |
|------|-------|----------|
{for type in integration_types}
| {type.name} | {type.count} | {type.services} |
{/for}
```

---

## Template Variables Reference

### Feature Extraction

```yaml
feature_categories:
  - Derived from API path prefixes
  - Mapped to handling components
  - Events grouped separately

features:
  - name: Friendly name from handler
  - description: From comments or inferred
  - method: HTTP method
  - path: API path
  - auth: none, authenticated, admin
  - complexity: simple, medium, complex
```

### User Flow Extraction

```yaml
user_flows:
  - Identified from multi-step API sequences
  - Auth flows from authentication endpoints
  - CRUD flows from entity operations
  - Integration flows from external calls

flow_steps:
  - Inferred from handler logic
  - Request/response shapes
  - Error handling paths
```

### Data Translation

```yaml
field_type_mapping:
  string: "Text"
  number: "Number"
  boolean: "Yes/No"
  date: "Date"
  datetime: "Date and Time"
  uuid: "Identifier"
  json: "Structured Data"

relationship_descriptions:
  one-to-one: "has one"
  one-to-many: "has many"
  many-to-many: "connects to multiple"
```
