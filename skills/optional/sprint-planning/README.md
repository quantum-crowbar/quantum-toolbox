# Sprint Planning

Guidelines for structured sprint and milestone planning — story mapping, estimation, capacity, and dependency management.

## Core Principles

- **Plan the sprint, not the project** — detailed planning for the next sprint; rough for beyond
- **Capacity before commitment** — never commit to more work than the team can actually deliver
- **Dependencies surface early** — identify cross-team dependencies before the sprint starts, not mid-sprint
- **Definition of Done agreed upfront** — every story has clear, testable acceptance criteria before it enters the sprint
- **Prioritise ruthlessly** — a sprint with 5 well-done items beats 10 half-done items

## Sprint Anatomy

```
Sprint duration: 2 weeks (adjust to team rhythm; 1–4 weeks)

Day 1:   Sprint planning (half day)
  - Review and refine backlog items
  - Agree sprint goal
  - Assign and size stories
  - Identify dependencies

Days 2–9: Development
  - Daily standup (15 min): what I did, what I'll do, blockers
  - Mid-sprint check (Day 5): on track? Scope creep? Remove items early if needed

Day 10:  Sprint close
  - Demo / review (1 hour): show working software
  - Retrospective (1 hour): what worked, what didn't, one improvement to try
  - Backlog refinement (ongoing, not a separate event): keep next sprint ready
```

## Story Mapping

Story mapping places user stories in a narrative — horizontal axis is user journey, vertical axis is priority/iteration.

```
Epic:     [Browse Catalogue] → [Add to Cart] → [Checkout] → [Order Tracking]

          ↓ priority / iteration

Sprint 1: View products     Add item       Enter address     View order status
          Filter by cat     View cart      Choose shipping

Sprint 2: Search            Save for later Payment           Email notification
          Product detail    Remove item    Review order

Sprint 3: Recommendations   Wishlist       Saved addresses   Push notification
```

Use story mapping to:
- Identify the minimum viable slice across the whole journey
- Avoid building deep features in one area while neglecting others
- Make trade-off decisions visible (what's in Sprint 1 vs later)

## User Stories

### Format

```
As a [type of user],
I want to [accomplish something],
So that [reason / benefit].
```

### Acceptance criteria (GIVEN / WHEN / THEN)

```
Story: As a customer, I want to filter products by category,
       so that I can find relevant items faster.

AC 1: GIVEN I am on the product listing page
      WHEN I select "Electronics" from the category filter
      THEN only products in the Electronics category are shown
      AND the filter label shows "Electronics"

AC 2: GIVEN I have applied a category filter
      WHEN I click "Clear filters"
      THEN all products are shown
      AND the filter label returns to "All categories"

AC 3: GIVEN no products exist in a selected category
      WHEN I apply that filter
      THEN an empty state message is shown: "No products in this category"
```

Rules:
- Acceptance criteria are testable — a QA engineer can write an automated test from each one
- Each criterion is independent — one GIVEN/WHEN/THEN per scenario
- Cover the happy path and the main edge/error cases
- No implementation details in the story ("using a dropdown" is not an AC)

## Estimation

### Story points (Fibonacci: 1, 2, 3, 5, 8, 13)

| Points | Complexity / effort |
|--------|---------------------|
| 1 | Trivial change — a few lines; well-understood |
| 2 | Small but real work — confident in approach |
| 3 | Moderate — some unknowns but manageable |
| 5 | Significant — real unknowns; may need spikes |
| 8 | Large — should consider splitting |
| 13 | Too large — split before bringing into sprint |

**Planning Poker rules:**
- Everyone estimates simultaneously (cards face down) — avoids anchoring
- Reveal together; discuss discrepancy between highest and lowest scores
- One round of discussion; re-estimate once if needed; don't debate to exhaustion
- If team can't agree on ≤ 5 after two rounds, spike it to reduce uncertainty

### T-shirt sizing (for roadmap / rough planning)

| Size | Story points equivalent | Typical scope |
|------|------------------------|---------------|
| XS | 1–2 | Hours |
| S | 3–5 | 1–2 days |
| M | 5–8 | 3–5 days |
| L | 8–13 | 1–2 weeks; consider splitting |
| XL | 13+ | Must split before sprint |

### Velocity

```
Velocity = average story points completed per sprint (last 3–5 sprints)

Sprint capacity = velocity × team availability factor
  (e.g. team of 4 at 80% capacity, velocity 40 → plan for 32 points)

Availability factor accounts for:
  - PTO, holidays, company events
  - On-call rotation
  - Planned support/maintenance time
  - Carryover from previous sprint
```

## Dependency Management

```
Types of dependencies:
  Team dependencies    — work that blocks you requires another team's input
  Technical deps       — this story requires that story to be merged first
  External deps        — waiting on vendor, API, legal, design
  Knowledge deps       — only one person knows how to do this

For each dependency:
  1. Identify it before the sprint starts
  2. Name the owner (who resolves it)
  3. Set a date by which it must be resolved
  4. Flag it if unresolved at mid-sprint check
```

Dependency tracking in sprint board: use a blocker label or linked issue. Make blockers visible — don't let them hide in comments.

## Definition of Done

Agree this once per team; apply consistently to every story:

```
[ ] Acceptance criteria met (all scenarios pass)
[ ] Code reviewed and approved
[ ] Unit and integration tests written and passing
[ ] CI pipeline green (lint, type check, tests, security scan)
[ ] No new accessibility violations introduced
[ ] Feature flagged if not ready for all users
[ ] Product owner has accepted the story (demo'd or async sign-off)
[ ] Documentation updated if public-facing API or user-visible behaviour changed
[ ] Deployed to staging (or production if continuous delivery)
```

## Sprint Retrospective Formats

### Start / Stop / Continue

```
Start:  What should we begin doing?
Stop:   What is slowing us down or causing harm?
Continue: What is working well that we should keep doing?
```

### 4Ls

```
Liked:     What went well?
Learned:   What did we discover?
Lacked:    What was missing?
Longed for: What did we wish we had?
```

### Rules for effective retros:
- Blameless — focus on systems and processes, not individuals
- One concrete improvement action per retro (with an owner and a date)
- Check last retro's action item — was it done? What happened?
- Timebox: 60 min max for a 2-week sprint
