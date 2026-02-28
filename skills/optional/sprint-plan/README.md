# Skill: sprint-plan

Guidelines for producing a structured sprint plan output from a crew planning session.

## Purpose

A sprint plan output is the written record of a planning session. It communicates:
- **What the team is committing to** — stories and tasks, sequenced and estimated
- **Why** — how the commitment maps to the milestone goal
- **How much** — capacity used vs available
- **What could go wrong** — risks with owners and mitigations

The plan is a living document, not a contract. It is updated as new information arrives.

---

## Principles

### 1. Commit to outcomes, not tasks
The plan's primary commitment is the milestone goal, not a list of tickets.
Tasks are how we get there; the goal is what we're accountable for.

### 2. Estimation is a conversation, not a calculation
Estimates exist to surface disagreement about complexity, not to predict the future.
If two team members disagree on an estimate, the disagreement is the information.

### 3. Capacity is conservative
Apply a realistic capacity factor (typically 70-80% of nominal days).
Ceremonies, reviews, and unplanned work consume the rest.

### 4. Dependencies are explicit
Every inter-story dependency is named. The plan shows which stories block others.
Stories with external dependencies (other teams, services, approvals) are flagged.

### 5. Risk has an owner
Every risk has a named owner and a mitigation plan, not just a description.

---

## Estimation Conventions

| Size | Story Points | Rough Duration |
|------|-------------|----------------|
| XS   | 1           | < 0.5 day      |
| S    | 2           | ~1 day         |
| M    | 3           | ~2 days        |
| L    | 5           | ~3-4 days      |
| XL   | 8           | ~1 week        |
| XXL  | 13          | > 1 week — split the story |

Stories estimated at XXL (13 points) must be split before committing.

---

## Dependency Notation

```
Story A → Story B   (A must complete before B can start)
Story A ⇢ Team X   (A depends on external team X)
Story A ✗ Story B   (A and B cannot be worked simultaneously; share a resource)
```
