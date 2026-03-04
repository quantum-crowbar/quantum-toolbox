# Roadmap Building Skill

> **Audience:** AI Agents
> **Tier:** Optional
> **Invocation:** `"Build implementation roadmap"` / `"Generate roadmap with epics and tickets"`

Generate comprehensive implementation roadmaps from architectural artifacts — with technical depth, ADRs, dependency graphs, risk registers, epic/ticket breakdowns, and a machine-trackable roadmap tracker.

---

## Purpose

Transform architecture gaps, TOGAF outputs, or high-level goals into a structured, actionable delivery roadmap that bridges architecture decisions and the engineering backlog.

**This skill produces:**
- Phased implementation plan with initiatives
- Architecture Decision Records (ADRs)
- Dependency graph and critical path
- Risk register with mitigations
- Epic and ticket breakdown per initiative (with team, complexity, estimates)
- Roadmap tracker (machine-readable status overview)

---

## When to Use

- After `arch-analysis` or `architecture-synthesis` has identified gaps
- After TOGAF Phase E (Opportunities & Solutions) to produce Phase F deliverables
- When a team needs to move from architectural vision to delivery backlog
- When stakeholders need a phased, costed roadmap

---

## Input Sources

### Option A: Architecture Analysis Outputs (recommended)

```
core-architecture/
├── target/
│   ├── business-architecture.md
│   ├── data-architecture.md
│   ├── application-architecture.md
│   └── technology-architecture.md
└── gap-analysis/
    └── consolidated-gaps.md
```

Also reads `architecture-synthesis/synthesized-model.json` if available.

### Option B: TOGAF Phase E/F Outputs

```
togaf/
├── phase-e/opportunities-solutions.md
└── phase-f/                           ← if partially complete
```

### Option C: Standalone Request

User provides goals, current state, target state, and constraints in natural language. Agent synthesizes a lightweight architecture model first, then builds the roadmap.

---

## Output Structure

```
roadmaps/
├── master-roadmap.md                  # Executive overview (1-2 pages)
├── detailed-roadmap.md                # Full technical roadmap
├── roadmap-tracker.md                 # Status overview table (machine-trackable)
├── roadmap-metadata.json              # Machine-readable metadata
├── phases/
│   ├── phase-1-foundation.md
│   ├── phase-2-migration.md
│   └── phase-3-optimization.md
├── initiatives/
│   ├── initiative-001-<name>.md
│   └── initiative-002-<name>.md
├── epics/
│   ├── epic-001-<name>.md             # Epic with full ticket breakdown
│   └── epic-002-<name>.md
├── dependencies/
│   ├── dependency-graph.mmd           # Mermaid diagram
│   └── critical-path.md
├── risks/
│   ├── risk-register.md
│   └── mitigation-strategies.md
└── decisions/
    ├── adr-001-<topic>.md
    └── adr-002-<topic>.md
```

---

## Roadmap Content

### 1. Strategic Context

Every roadmap opens with:
- Business drivers and objectives
- Architecture vision alignment
- Success criteria (measurable)
- Constraints and assumptions

### 2. Technical Foundation

- **Architecture Decisions** — technology choices with rationale (ADRs)
- **Design Patterns** — applied patterns with justification
- **Integration Approaches** — API strategies, event-driven, batch
- **Data Strategies** — migration, synchronization, governance

### 3. Implementation Phases

Phases group initiatives by dependency order and business value delivery. Each phase has:
- Time horizon (quarter or month range)
- List of initiatives with complexity and team
- Phase success criteria
- Phase exit criteria (what must be true before moving on)

### 4. Initiative Detail

Each initiative document includes:
- Business value (ROI, KPIs, user impact)
- Technical approach
- ADR references
- Design patterns applied
- Technology stack
- Complexity: estimated effort, required skills, technical risks
- Dependencies (blockers and downstream)
- Testing strategy
- Rollout plan and rollback strategy
- Monitoring and observability

### 5. Dependency Management

Mermaid dependency graph showing initiative relationships, critical path, and bottlenecks.

### 6. Risk Management

Risk register per initiative:

| Field | Description |
|-------|-------------|
| Risk ID | R-NNN |
| Initiative | Which initiative is affected |
| Description | What could go wrong |
| Impact | High / Medium / Low |
| Probability | High / Medium / Low |
| Mitigation | Immediate + ongoing actions |
| Contingency | Fallback if mitigation fails |
| Owner | Role responsible |
| Status | Active / Resolved / Accepted |

### 7. Architecture Decision Records

One ADR per significant technology or approach decision. Format:

- **Status**: Proposed / Accepted / Deprecated / Superseded
- **Context**: Problem being solved
- **Options Considered**: Alternatives evaluated
- **Decision**: What was chosen
- **Rationale**: Why
- **Consequences**: Positive and negative
- **Implementation Notes**: Specifics for execution
- **Related Decisions**: Cross-references

### 8. Roadmap Tracker

A status overview table — the single document any agent or stakeholder reads to understand overall progress without opening individual files.

```markdown
# Roadmap Tracker: [Project Name]
> Status as of: YYYY-MM-DD

## Status Overview

| Initiative | Phase | Status | Team | Priority |
|------------|-------|--------|------|----------|
| API Gateway Setup | Phase 1 | ⚪ Planned | Platform | High |
| Core Service Refactoring | Phase 1 | ⚪ Planned | Backend | High |

Legend: 🟢 Complete | 🟡 In Progress | ⚪ Planned | 🔴 Blocked

## Summary
| Metric | Value |
|--------|-------|
| Total initiatives | N |
| Estimated duration | N months |
| Estimated total effort | N person-weeks |
| Teams involved | ... |
```

Agents update this file as initiative statuses change. It is the authoritative progress snapshot.

### 9. Epic & Ticket Breakdown

Each initiative decomposes into one or more epics, each containing tickets. This bridges the architecture roadmap to the delivery backlog.

**Epic** — a coherent unit of delivery owned by one team, completable in 1–6 weeks.

**Ticket** — a discrete task within an epic, estimable by one person.

**Complexity scale:**

| Size | Story Points | Duration | Description |
|------|-------------|----------|-------------|
| XS | 1–2 | < 1 day | Trivial, no unknowns |
| S | 3–5 | 1–2 days | Well-understood |
| M | 8–13 | 3–5 days | Some complexity |
| L | 20–21 | 1–2 weeks | Significant complexity |
| XL | 40+ | 2+ weeks | High uncertainty — split if possible |

**Team assignment rules:**
- Assign owning team at epic level
- Cross-team tickets must have a single DRI (directly responsible individual role)
- Blocked tickets name the blocking team and expected resolution date

---

## Principles

- **Architecture before backlog** — ADRs and technical approach must be decided before tickets are written; tickets implement decisions, not make them
- **Dependency-first sequencing** — critical path drives phase boundaries, not calendar dates
- **Honest complexity** — size XL items as XL; false confidence compounds downstream
- **Risk-adjusted estimates** — include a risk buffer (15–25%) on all initiative estimates
- **Tracker as truth** — `roadmap-tracker.md` is always kept current; initiative files are the detail

---

## TOGAF Integration

| TOGAF Phase | Invocation |
|-------------|-----------|
| Phase E (Opportunities & Solutions) | `"Build preliminary roadmap from consolidated gaps"` → high-level roadmap with solution building blocks |
| Phase F (Migration Planning) | `"Build detailed migration roadmap with ADRs"` → complete roadmap with full technical depth |
| Phase G (Implementation Governance) | Use `roadmap-analysis` skill to track progress and assess compliance |

---

## Integration Points

**Reads from:**
- `skills/optional/architecture-synthesis/`
- `skills/optional/analysis-outputs/core-architecture/`
- `skills/optional/togaf/opportunities-solutions/`
- `skills/optional/togaf/migration-planning/`
- `skills/optional/software-design/`
- `skills/optional/tech-stack-decisions/`

**Writes to:**
- `roadmaps/` (primary output)
- `core-architecture/evolution-plan/` (optional export)
- `togaf/phase-f/implementation-plan/` (optional export)

---

## Invocation Patterns

```
"Build implementation roadmap"
"Generate roadmap from target architecture"
"Create technical roadmap from gaps"
"Build roadmap with ADRs"
"Generate migration roadmap"
"Build roadmap with epics and tickets"
"Break roadmap into tickets for [team/initiative]"
"Generate roadmap tracker"
```
