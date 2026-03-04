# Roadmap Building Checklist

> **Audience:** AI Agents
> Quick reference for reviewing a generated roadmap before delivery.

---

## Strategic Context

- [ ] Business drivers stated and linked to initiatives
- [ ] Success criteria are measurable (not vague)
- [ ] Constraints and assumptions documented
- [ ] Architecture vision alignment described

## Initiative Completeness

- [ ] Every gap from analysis is covered by at least one initiative
- [ ] Each initiative has: objective, team, complexity, duration, dependencies
- [ ] No initiative is too large (>3 months solo → consider splitting)
- [ ] No initiative is too small (< 1 week → merge into another)
- [ ] Business value stated for each initiative

## Phases & Sequencing

- [ ] Phase boundaries follow dependency order, not arbitrary dates
- [ ] Each phase has success criteria and exit criteria
- [ ] Critical path identified and documented
- [ ] Bottlenecks called out explicitly
- [ ] Some business value delivered in Phase 1 (not all value in final phase)

## Architecture Decision Records

- [ ] One ADR for each significant technology or pattern decision
- [ ] Every ADR has: status, context, options considered, decision, rationale, consequences
- [ ] ADRs cross-referenced in relevant initiative files
- [ ] No major decision made in initiative files without an ADR

## Dependencies

- [ ] Dependency graph generated (Mermaid)
- [ ] All initiative→initiative dependencies captured
- [ ] External dependencies (third-party, other teams) noted
- [ ] No circular dependencies

## Risk Register

- [ ] At least one risk identified per high-complexity initiative
- [ ] Every risk has: impact, probability, mitigation, contingency, owner
- [ ] High-impact × high-probability risks flagged explicitly
- [ ] Risk cross-references in initiative files

## Epic & Ticket Breakdown

- [ ] Every initiative has at least one epic
- [ ] Every epic has: objective, acceptance criteria, owning team, story points
- [ ] Every ticket has: description, acceptance criteria, size, estimate, team
- [ ] No XL tickets without a note recommending split
- [ ] Cross-team tickets have a DRI role
- [ ] Blocked tickets name the blocker and expected resolution

## Roadmap Tracker

- [ ] roadmap-tracker.md generated with all initiatives
- [ ] All statuses start as ⚪ Planned
- [ ] Summary metrics accurate (totals match detail)
- [ ] "Status as of" date set

## Documentation

- [ ] master-roadmap.md is readable without opening any other file
- [ ] detailed-roadmap.md links to all phase, initiative, epic files
- [ ] roadmap-metadata.json generated and totals are consistent
- [ ] Output directory structure matches spec (`roadmaps/`)
