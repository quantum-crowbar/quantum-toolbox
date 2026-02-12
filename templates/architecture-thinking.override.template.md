# Architecture Thinking — Project Overrides

> **Instructions for AI agent**: Read this file AFTER the toolkit's
> `core/architecture-thinking.md`. Apply the following rules:
>
> - **Matching headings** REPLACE the corresponding section in the default
> - **New headings** are ADDED to the mental model
> - **Sections listed under `## Skip`** are IGNORED from the default
>
> **Instructions for humans**: Copy this file to your project root as
> `architecture-thinking.local.md`. Uncomment and customize the sections
> you want to override. Delete sections you don't need to change.

---

## Skip

<!-- List section headings from core/architecture-thinking.md to ignore. -->
<!-- Example: -->
<!-- - Enterprise Continuum -->
<!-- - Roadmap Prioritization -->

---

## Architecture Domains

<!-- Add new domains or replace existing ones. -->
<!-- The default domains are: Business, Data, Application, Technology. -->
<!-- To ADD a domain, include only the new one below. -->
<!-- To REPLACE all domains, include the full set you want. -->

<!-- Example: adding a domain for a blockchain project -->
<!--
### Consensus Architecture
- **Validation**: Block validation rules, proof-of-work/stake mechanisms
- **Fork Resolution**: Chain selection, conflict handling, finality
- **Incentives**: Mining/staking rewards, fee structures
- **Governance**: Protocol upgrade process, voting mechanisms

**Questions to ask**:
- What consensus mechanism is used? What are its trade-offs?
- How are forks detected and resolved?
- What is the finality model?
-->

---

## Stakeholder Thinking

<!-- Replace the default stakeholder types if your project has different ones. -->

<!-- Example: for a developer tools project -->
<!--
### Stakeholder Identification

| Stakeholder Type | Concerns | Viewpoint Needed |
|------------------|----------|------------------|
| **Platform Users** | API stability, documentation, migration effort | SDK docs, changelog |
| **Internal Developers** | DX, build times, debugging | Technical design |
| **DevOps/SRE** | Uptime, deployment, observability | Runbooks, dashboards |
| **Product Manager** | Adoption metrics, feature requests | Usage data, roadmap |
-->

---

## Prioritization

<!-- Replace the default prioritization approach. -->
<!-- Default is Weighted Scoring. Alternatives: MoSCoW, WSJF, Value vs Effort. -->

<!-- Example: switching to WSJF -->
<!--
### Prioritization Approach

Use **Weighted Shortest Job First (WSJF)** for all prioritization.

WSJF = Cost of Delay / Job Duration

**Cost of Delay** = User-Business Value + Time Criticality + Risk Reduction

| Item | User Value | Time Crit | Risk Red | CoD | Duration | WSJF |
|------|-----------|-----------|----------|-----|----------|------|
| {item} | {1-10} | {1-10} | {1-10} | {sum} | {1-10} | {calc} |
-->

---

## Risk Analysis

<!-- Add project-specific risk categories or replace the defaults. -->

<!-- Example: adding regulatory risks for a fintech project -->
<!--
### Additional Risk Categories

| Category | Risks |
|----------|-------|
| **Regulatory** | Licensing requirements, KYC/AML compliance, cross-border restrictions |
| **Financial** | Payment processing failures, currency conversion, fraud exposure |
-->

---

<!-- Add any entirely new sections below. They will be added to the mental model. -->
<!-- Example: -->
<!--
## Developer Experience
...

## Data Privacy
...
-->
