# Core Architecture Templates

Output templates for each section of the core architecture documentation.

---

## index.md - Executive Summary

```markdown
# Core Architecture Documentation

> **Project**: {meta.project_name}
> **Generated**: {meta.analysis_date}
> **Version**: {meta.version}

## Executive Summary

{architecture.summary}

### Architecture Health

| Indicator | Status | Score |
|-----------|--------|-------|
| Technical Debt | {quality.tech_debt.status} | {quality.tech_debt.score}/10 |
| Security Posture | {quality.security.status} | {quality.security.score}/10 |
| Maintainability | {quality.maintainability.status} | {quality.maintainability.score}/10 |
| Scalability | {quality.scalability.status} | {quality.scalability.score}/10 |

### Key Actions Required

{for each recommendations.critical}
1. **{recommendation.title}**: {recommendation.summary}
{end for}

---

## Documentation Index

### Current State
- [Architecture Baseline](baseline/overview.md) - Current architecture overview
  - [Business Architecture](baseline/business.md)
  - [Information Systems](baseline/information-systems.md)
  - [Technology Architecture](baseline/technology.md)

### Future State
- [Architecture Target](target/overview.md) - Target architecture vision
  - [Business Architecture](target/business.md)
  - [Information Systems](target/information-systems.md)
  - [Technology Architecture](target/technology.md)

### Analysis
- [Gap Analysis](gap-analysis/summary.md) - Baseline vs Target comparison
  - [Gap Register](gap-analysis/gap-register.md)
- [Risk Analysis](risk-analysis/risk-register.md) - Architecture risks

### Planning
- [Evolution Plan](evolution-plan/roadmap.md) - Implementation roadmap
  - [Fitness Functions](evolution-plan/fitness-functions.md)
  - [Transition States](evolution-plan/transition-states.md)
- [Change Management](change-management/summary.md) - Change tracking

---

## Related Documentation

- [Detailed Analysis Reports](../architecture-docs/index.md)
- [C4 Architecture Model](../architecture/workspace.dsl)

---

*This document is the canonical source for architecture overview. Phase-specific deliverables link to sections within this structure.*
```

---

## baseline/overview.md - Current State Overview

```markdown
# Architecture Baseline

> Current state architecture as of {meta.analysis_date}

## System Overview

{architecture.baseline.description}

### System Context

```{diagram_format}
{architecture.baseline.context_diagram}
```

### Key Statistics

| Metric | Value |
|--------|-------|
| Components | {architecture.components.count} |
| Services | {architecture.services.count} |
| Databases | {architecture.databases.count} |
| External Integrations | {interfaces.integrations.count} |
| APIs | {interfaces.apis.count} |

---

## Architecture Domains

### Business Architecture
High-level business context and capabilities.
→ [Details](business.md)

| Capability | Maturity | Systems |
|------------|----------|---------|
{for each architecture.baseline.capabilities}
| {capability.name} | {capability.maturity} | {capability.systems} |
{end for}

### Information Systems Architecture
Data and application landscape.
→ [Details](information-systems.md)

**Data Domains**: {data.domains.count}
**Applications**: {architecture.applications.count}

### Technology Architecture
Infrastructure and platforms.
→ [Details](technology.md)

**Primary Stack**: {technologies.primary_stack}
**Cloud Provider**: {technologies.infrastructure.cloud}
**Deployment Model**: {technologies.infrastructure.deployment_model}

---

## Architecture Principles (Current)

| Principle | Adherence |
|-----------|-----------|
{for each architecture.baseline.principles}
| {principle.name} | {principle.adherence} |
{end for}

---

## Known Issues

{for each architecture.baseline.known_issues}
- **{issue.title}**: {issue.description} ({issue.severity})
{end for}

---

## References

- [Technology Manifest](../../architecture-docs/analysis/01-technology-manifest.md)
- [Interface Specification](../../architecture-docs/analysis/02-interface-specification.md)
- [Architecture Diagrams](../../architecture-docs/analysis/03-architecture-diagrams.md)
```

---

## baseline/business.md - Business Architecture Baseline

```markdown
# Business Architecture Baseline

> Current business architecture state

## Business Context

{architecture.baseline.business.context}

## Business Capabilities

```{diagram_format}
mindmap
  root(({meta.project_name}))
{for each architecture.baseline.capabilities}
    {capability.name}
{for each capability.sub_capabilities}
      {sub.name}
{end for}
{end for}
```

### Capability Inventory

| ID | Capability | Description | Maturity | Supporting Systems |
|----|------------|-------------|----------|-------------------|
{for each architecture.baseline.capabilities}
| {capability.id} | {capability.name} | {capability.description} | {capability.maturity} | {capability.systems} |
{end for}

## Value Streams

{for each architecture.baseline.value_streams}
### {value_stream.name}

{value_stream.description}

**Stages**: {value_stream.stages}
**Primary Systems**: {value_stream.systems}

{end for}

## Organization Mapping

| Business Unit | Capabilities | Systems Owned |
|---------------|--------------|---------------|
{for each architecture.baseline.org_mapping}
| {org.unit} | {org.capabilities} | {org.systems} |
{end for}

---

## References

- [TOGAF Business Architecture](../../togaf/business-architecture/output/)
```

---

## baseline/information-systems.md - Information Systems Baseline

```markdown
# Information Systems Architecture Baseline

> Current data and application architecture

## Data Architecture

### Data Domains

| Domain | Description | Owner | Key Entities |
|--------|-------------|-------|--------------|
{for each data.domains}
| {domain.name} | {domain.description} | {domain.owner} | {domain.entities} |
{end for}

### Conceptual Data Model

```{diagram_format}
{data.conceptual_model_diagram}
```

### Data Quality

| Domain | Quality Score | Issues |
|--------|---------------|--------|
{for each data.quality}
| {domain.name} | {domain.score}/10 | {domain.issues} |
{end for}

---

## Application Architecture

### Application Portfolio

| Application | Type | Technology | Status | Capabilities Supported |
|-------------|------|------------|--------|----------------------|
{for each architecture.applications}
| {app.name} | {app.type} | {app.technology} | {app.status} | {app.capabilities} |
{end for}

### Application Interactions

```{diagram_format}
{architecture.application_interaction_diagram}
```

### Integration Points

| Source | Target | Type | Protocol | Data Exchanged |
|--------|--------|------|----------|----------------|
{for each interfaces.integrations}
| {integration.source} | {integration.target} | {integration.type} | {integration.protocol} | {integration.data} |
{end for}

---

## References

- [TOGAF Information Systems](../../togaf/information-systems/output/)
- [Data Flow Map](../../architecture-docs/analysis/06-data-flow-map.md)
```

---

## baseline/technology.md - Technology Architecture Baseline

```markdown
# Technology Architecture Baseline

> Current technology infrastructure and platforms

## Technology Overview

{architecture.baseline.technology.overview}

## Technology Stack

### Languages & Frameworks

| Category | Technology | Version | Usage |
|----------|------------|---------|-------|
{for each technologies.languages}
| Language | {lang.name} | {lang.version} | {lang.usage} |
{end for}
{for each technologies.frameworks}
| Framework | {framework.name} | {framework.version} | {framework.usage} |
{end for}

### Infrastructure

| Component | Technology | Purpose | Environment |
|-----------|------------|---------|-------------|
{for each technologies.infrastructure}
| {infra.component} | {infra.technology} | {infra.purpose} | {infra.environment} |
{end for}

## Platform Architecture

```{diagram_format}
{architecture.platform_diagram}
```

### Deployment Model

**Model**: {technologies.deployment.model}
**Environments**: {technologies.deployment.environments}
**CI/CD**: {technologies.deployment.cicd}

## Technology Standards

| Category | Standard | Compliance |
|----------|----------|------------|
{for each architecture.baseline.technology_standards}
| {standard.category} | {standard.name} | {standard.compliance} |
{end for}

---

## References

- [Technology Manifest](../../architecture-docs/analysis/01-technology-manifest.md)
- [TOGAF Technology Architecture](../../togaf/technology-architecture/output/)
```

---

## target/overview.md - Target Architecture Overview

```markdown
# Architecture Target

> Target state architecture vision

## Vision Statement

{architecture.target.vision}

## Target State Overview

```{diagram_format}
{architecture.target.context_diagram}
```

## Strategic Drivers

{for each architecture.target.drivers}
- **{driver.name}**: {driver.description}
{end for}

## Target Capabilities

| Capability | Current State | Target State | Gap |
|------------|---------------|--------------|-----|
{for each architecture.target.capabilities}
| {capability.name} | {capability.current} | {capability.target} | {capability.gap} |
{end for}

## Architecture Principles (Target)

| Principle | Statement | Rationale | Implications |
|-----------|-----------|-----------|--------------|
{for each architecture.target.principles}
| {principle.name} | {principle.statement} | {principle.rationale} | {principle.implications} |
{end for}

## Key Changes from Baseline

{for each architecture.target.key_changes}
1. **{change.area}**: {change.description}
{end for}

---

## Domain Details

- [Target Business Architecture](business.md)
- [Target Information Systems](information-systems.md)
- [Target Technology Architecture](technology.md)

---

## References

- [Architecture Vision](../../togaf/vision/output/)
- [Gap Analysis](../gap-analysis/summary.md)
```

---

## gap-analysis/summary.md - Gap Analysis Summary

```markdown
# Gap Analysis Summary

> Comparison of baseline and target architectures

## Overview

| Domain | Gaps Identified | Critical | High | Medium | Low |
|--------|-----------------|----------|------|--------|-----|
| Business | {gaps.business.count} | {gaps.business.critical} | {gaps.business.high} | {gaps.business.medium} | {gaps.business.low} |
| Data | {gaps.data.count} | {gaps.data.critical} | {gaps.data.high} | {gaps.data.medium} | {gaps.data.low} |
| Application | {gaps.application.count} | {gaps.application.critical} | {gaps.application.high} | {gaps.application.medium} | {gaps.application.low} |
| Technology | {gaps.technology.count} | {gaps.technology.critical} | {gaps.technology.high} | {gaps.technology.medium} | {gaps.technology.low} |
| **Total** | **{gaps.total.count}** | **{gaps.total.critical}** | **{gaps.total.high}** | **{gaps.total.medium}** | **{gaps.total.low}** |

## Gap Categories

```{diagram_format}
pie title Gap Distribution by Type
    "Missing" : {gaps.by_type.missing}
    "Outdated" : {gaps.by_type.outdated}
    "Incompatible" : {gaps.by_type.incompatible}
    "Redundant" : {gaps.by_type.redundant}
```

## Critical Gaps

{for each gaps.items where priority == "critical"}
### {gap.id}: {gap.title}

| Attribute | Value |
|-----------|-------|
| Domain | {gap.domain} |
| Baseline | {gap.baseline} |
| Target | {gap.target} |
| Type | {gap.type} |
| Impact | {gap.impact} |

**Description**: {gap.description}

**Roadmap Candidate**: {gap.roadmap_candidate}

---
{end for}

## Full Gap Register

→ [Gap Register](gap-register.md)

## Gaps by Domain

- [Business Gaps](by-domain/business-gaps.md)
- [Data Gaps](by-domain/data-gaps.md)
- [Application Gaps](by-domain/application-gaps.md)
- [Technology Gaps](by-domain/technology-gaps.md)
```

---

## gap-analysis/gap-register.md - Full Gap Register

```markdown
# Gap Register

> Complete inventory of architecture gaps

| ID | Domain | Title | Baseline | Target | Type | Priority | Roadmap Item | Dependencies |
|----|--------|-------|----------|--------|------|----------|--------------|--------------|
{for each gaps.items}
| {gap.id} | {gap.domain} | {gap.title} | {gap.baseline} | {gap.target} | {gap.type} | {gap.priority} | {gap.roadmap_item} | {gap.dependencies} |
{end for}

---

## Gap Details

{for each gaps.items}
### {gap.id}: {gap.title}

**Domain**: {gap.domain}
**Type**: {gap.type}
**Priority**: {gap.priority}

#### Current State (Baseline)
{gap.baseline_description}

#### Desired State (Target)
{gap.target_description}

#### Gap Description
{gap.description}

#### Impact
{gap.impact}

#### Dependencies
{gap.dependencies}

#### Recommended Resolution
{gap.resolution}

---
{end for}
```

---

## risk-analysis/risk-register.md - Risk Register

```markdown
# Architecture Risk Register

> Identified architecture risks with assessment and mitigation

## Risk Summary

| Category | Count | Critical | High | Medium | Low |
|----------|-------|----------|------|--------|-----|
| Technical | {risks.technical.count} | {risks.technical.critical} | {risks.technical.high} | {risks.technical.medium} | {risks.technical.low} |
| Organizational | {risks.organizational.count} | {risks.organizational.critical} | {risks.organizational.high} | {risks.organizational.medium} | {risks.organizational.low} |
| Business | {risks.business.count} | {risks.business.critical} | {risks.business.high} | {risks.business.medium} | {risks.business.low} |
| Operational | {risks.operational.count} | {risks.operational.critical} | {risks.operational.high} | {risks.operational.medium} | {risks.operational.low} |

## Risk Map

```{diagram_format}
mindmap
  root((Architecture Risks))
    Technical
{for each risks.technical.items}
      {risk.title}
{end for}
    Organizational
{for each risks.organizational.items}
      {risk.title}
{end for}
    Business
{for each risks.business.items}
      {risk.title}
{end for}
    Operational
{for each risks.operational.items}
      {risk.title}
{end for}
```

## Risk Register

| ID | Risk | Category | Probability | Impact | Score | Mitigation | Owner | Status |
|----|------|----------|-------------|--------|-------|------------|-------|--------|
{for each risks.items}
| {risk.id} | {risk.title} | {risk.category} | {risk.probability} | {risk.impact} | {risk.score} | {risk.mitigation_summary} | {risk.owner} | {risk.status} |
{end for}

---

## Risk Details

{for each risks.items}
### {risk.id}: {risk.title}

| Attribute | Value |
|-----------|-------|
| Category | {risk.category} |
| Probability | {risk.probability} (1-5) |
| Impact | {risk.impact} (1-5) |
| Risk Score | {risk.score} |
| Owner | {risk.owner} |
| Status | {risk.status} |

**Description**: {risk.description}

**Triggers**: {risk.triggers}

**Consequences**: {risk.consequences}

**Mitigation Strategy**: {risk.mitigation}

**Contingency Plan**: {risk.contingency}

**Related Gaps**: {risk.related_gaps}

---
{end for}

## Mitigation Plans

→ [Detailed Mitigation Plans](mitigation-plans.md)
```

---

## evolution-plan/roadmap.md - Evolution Roadmap

```markdown
# Architecture Evolution Roadmap

> Phased implementation plan from baseline to target

## Roadmap Overview

```{diagram_format}
gantt
    title Architecture Roadmap
    dateFormat YYYY-MM
{for each roadmap.phases}
    section {phase.name}
{for each phase.initiatives}
        {initiative.name} :{initiative.start}, {initiative.duration}
{end for}
{end for}
```

## Phases

{for each roadmap.phases}
### Phase {phase.number}: {phase.name}

**Timeline**: {phase.start} - {phase.end}
**Theme**: {phase.theme}

#### Objectives
{for each phase.objectives}
- {objective}
{end for}

#### Initiatives

| ID | Initiative | Description | Dependencies | Fitness Criteria |
|----|------------|-------------|--------------|------------------|
{for each phase.initiatives}
| {initiative.id} | {initiative.name} | {initiative.description} | {initiative.dependencies} | {initiative.fitness_criteria} |
{end for}

#### Exit Criteria
{for each phase.exit_criteria}
- [ ] {criterion}
{end for}

---
{end for}

## Dependencies

```{diagram_format}
flowchart LR
{for each roadmap.dependencies}
    {dependency.from} --> {dependency.to}
{end for}
```

## Milestones

| Milestone | Date | Criteria | Status |
|-----------|------|----------|--------|
{for each roadmap.milestones}
| {milestone.name} | {milestone.date} | {milestone.criteria} | {milestone.status} |
{end for}

---

## Related Documents

- [Fitness Functions](fitness-functions.md)
- [Transition States](transition-states.md)
- [Gap Register](../gap-analysis/gap-register.md)
```

---

## evolution-plan/fitness-functions.md - Fitness Functions

```markdown
# Architecture Fitness Functions

> Measurable criteria for architecture evolution success

## Overview

Fitness functions define measurable criteria to assess whether the architecture is evolving toward the target state.

## Base Categories

| Category | Description | Weight |
|----------|-------------|--------|
| Performance | Response time, throughput, latency | {fitness.weights.performance} |
| Security | Vulnerabilities, compliance, attack surface | {fitness.weights.security} |
| Maintainability | Complexity, test coverage, documentation | {fitness.weights.maintainability} |
| Scalability | Capacity headroom, horizontal scaling readiness | {fitness.weights.scalability} |
| Cost | Infrastructure spend, operational efficiency | {fitness.weights.cost} |

## Fitness Functions

{for each fitness.functions}
### {function.id}: {function.name}

| Attribute | Value |
|-----------|-------|
| Category | {function.category} |
| Type | {function.type} |
| Frequency | {function.frequency} |
| Automated | {function.automated} |

**Description**: {function.description}

**Metric**: {function.metric}

**Current Value**: {function.current_value}

**Target Value**: {function.target_value}

**Threshold (Pass/Fail)**: {function.threshold}

**Measurement Method**: {function.measurement_method}

**Relevant Phases**: {function.phases}

---
{end for}

## Fitness Dashboard

| Function | Current | Target | Status | Trend |
|----------|---------|--------|--------|-------|
{for each fitness.functions}
| {function.name} | {function.current_value} | {function.target_value} | {function.status} | {function.trend} |
{end for}

## Automated Checks

| Function | Tool | Schedule | Last Run | Result |
|----------|------|----------|----------|--------|
{for each fitness.functions where automated == true}
| {function.name} | {function.tool} | {function.schedule} | {function.last_run} | {function.last_result} |
{end for}
```

---

## change-management/summary.md - Change Management Summary

```markdown
# Change Management Summary

> Architecture change tracking and governance

## Change Overview

| Status | Count |
|--------|-------|
| Pending Review | {changes.pending} |
| Approved | {changes.approved} |
| In Progress | {changes.in_progress} |
| Completed | {changes.completed} |
| Rejected | {changes.rejected} |

## Recent Changes

| ID | Title | Type | Status | Submitted | Impact |
|----|-------|------|--------|-----------|--------|
{for each changes.recent}
| {change.id} | {change.title} | {change.type} | {change.status} | {change.submitted} | {change.impact} |
{end for}

## Change Categories

```{diagram_format}
pie title Changes by Type
    "Enhancement" : {changes.by_type.enhancement}
    "Bug Fix" : {changes.by_type.bug_fix}
    "Technical Debt" : {changes.by_type.tech_debt}
    "New Capability" : {changes.by_type.new_capability}
    "Deprecation" : {changes.by_type.deprecation}
```

## Governance

### Change Review Board

| Role | Name | Responsibility |
|------|------|----------------|
{for each changes.review_board}
| {member.role} | {member.name} | {member.responsibility} |
{end for}

### Review Schedule

| Day | Time | Focus |
|-----|------|-------|
{for each changes.review_schedule}
| {schedule.day} | {schedule.time} | {schedule.focus} |
{end for}

---

## Communication Plan

→ [Communication Plan](communication-plan.md)
```

---

## change-management/communication-plan.md - Communication Plan

```markdown
# Architecture Communication Plan

> Stakeholder communication matrix for architecture changes

## Communication Matrix

| Stakeholder | Message Type | Owner | Delivery Date | Team/Domain | Channel | Status | Impact Review Date |
|-------------|--------------|-------|---------------|-------------|---------|--------|-------------------|
{for each communication.items}
| {item.stakeholder} | {item.message_type} | {item.owner} | {item.delivery_date} | {item.team} | {item.channel} | {item.status} | {item.review_date} |
{end for}

## Stakeholder Groups

{for each communication.stakeholder_groups}
### {group.name}

**Members**: {group.members}
**Primary Concerns**: {group.concerns}
**Preferred Channel**: {group.channel}
**Frequency**: {group.frequency}

{end for}

## Message Templates

### Major Architecture Change

```
Subject: Architecture Change Notification - {change.title}

Summary: {change.summary}

Impact: {change.impact}

Timeline: {change.timeline}

Action Required: {change.action_required}

Questions: Contact {change.contact}
```

### Milestone Achieved

```
Subject: Architecture Milestone - {milestone.name}

We have successfully completed: {milestone.description}

Key Outcomes:
{milestone.outcomes}

Next Steps:
{milestone.next_steps}
```

## Review Schedule

| Change ID | Review Date | Reviewer | Focus Areas |
|-----------|-------------|----------|-------------|
{for each communication.reviews}
| {review.change_id} | {review.date} | {review.reviewer} | {review.focus} |
{end for}
```

---

## Partial Model Handling

When optional sections are missing, use these fallback templates:

### Missing Target Architecture

```markdown
## Target Architecture

*Target architecture not yet defined. Complete TOGAF Phase A (Vision) to establish target state.*

→ [Start Architecture Vision](../../togaf/vision/README.md)
```

### Missing Gap Analysis

```markdown
## Gap Analysis

*Gap analysis requires both baseline and target architectures.*

**Status**: Baseline ✓ | Target ✗

→ [Define Target Architecture](target/overview.md) first
```

### Missing Risk Analysis

```markdown
## Risk Analysis

*Risk analysis not yet performed.*

→ Run risk assessment or complete TOGAF Phase G (Implementation Governance)
```

### Missing Evolution Plan

```markdown
## Evolution Plan

*Evolution plan requires completed gap analysis and prioritization.*

**Prerequisites**:
- [ ] Baseline architecture documented
- [ ] Target architecture defined
- [ ] Gaps identified and analyzed
- [ ] Priorities established

→ [Complete Gap Analysis](gap-analysis/summary.md) first
```
