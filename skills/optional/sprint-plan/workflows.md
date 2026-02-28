# Skill: sprint-plan — Workflows

## Workflow 1: Produce a sprint plan from a planning session

### Inputs
- Session spec (`session-type: planning`) and crew outputs
- Candidate stories / tasks from the spec
- Team capacity from the spec

### Steps

1. **Confirm milestone goal**
   State the goal in one sentence. All planning decisions reference back to this.

2. **Estimate all candidate stories**
   Use Fibonacci points (1, 2, 3, 5, 8, 13). Stories at 13 must be split.
   Record the estimate and the key assumption behind it.

3. **Map dependencies**
   For each story, identify: does it depend on another story? on an external team?
   Draw the dependency graph (text notation is fine).

4. **Calculate available capacity**
   Sum individual capacities. Apply 75% factor for realistic commitment.
   `Committable points = (team velocity or total capacity in days × avg points/day) × 0.75`

5. **Sequence and select**
   Order stories by: dependency order first, then priority.
   Select stories until committable capacity is consumed.
   Stories not selected → backlog with rationale.

6. **Identify risks**
   For each selected story, note the main risk.
   Produce a risk register: risk, likelihood (H/M/L), impact (H/M/L), owner, mitigation.

7. **Write the plan document**

### Sprint plan output format

```markdown
# Sprint Plan: [Milestone Name] — [YYYY-MM-DD to YYYY-MM-DD]

**Goal:** [one sentence]
**Capacity:** [X days available → X committable after 75% factor]

## Committed Stories

| ID | Story | Points | Owner | Depends on |
|----|-------|--------|-------|-----------|
| S1 | [title] | 3 | [name] | — |
| S2 | [title] | 5 | [name] | S1 |

**Total committed:** [X] points / [X] days

## Dependency Map

S1 → S2 → S4
S3 (independent)
S5 ⇢ Platform team (external dependency — confirm by [date])

## Backlog (not committed this sprint)

| Story | Points | Reason not committed |
|-------|--------|---------------------|
| [title] | 5 | Capacity; deprioritised vs S3 |

## Risk Register

| Risk | L | I | Owner | Mitigation |
|------|---|---|-------|-----------|
| [risk] | M | H | [name] | [action] |

## Open Questions

- [question that must be resolved for the plan to hold] — owner: [name] — by: [date]
```

### Output file
Write to `workspace/sessions/YYYY-MM-DD-[milestone-name]-sprint-plan.md`

---

## Workflow 2: Sprint plan review (mid-sprint)

At the sprint midpoint:
1. Re-assess completed vs in-progress stories
2. Flag any stories at risk (blocked, larger than estimated)
3. Decide: re-plan remaining capacity, or park a committed story
4. Update the plan document with current state
