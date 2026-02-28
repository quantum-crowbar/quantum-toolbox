# Sprint Planning — Workflows

## Sprint Planning Meeting Agenda

```
Duration: 2–4 hours for a 2-week sprint (scale with team size and sprint length)

1. Sprint goal (15 min)
   - Product owner proposes goal
   - Team refines and commits to a single, clear sprint goal sentence

2. Backlog review (30 min)
   - Top items reviewed for readiness: AC written, design ready, dependencies known
   - Items not ready are returned to backlog with clear next action

3. Estimation (60–90 min)
   - Planning poker on unestimated ready items
   - Flag any story > 8 points for splitting

4. Capacity check (15 min)
   - Calculate team capacity (velocity × availability factor)
   - Select stories that fit; don't overcommit

5. Dependency check (15 min)
   - Identify blockers for selected stories
   - Assign an owner and resolution date for each dependency

6. Task breakdown (30 min, optional)
   - Break stories into tasks (not required for all teams)
   - Assign initial ownership

7. Sprint commitment (5 min)
   - Team confirms commitment to the sprint goal
   - Board set up; ready to start
```

## Backlog Refinement Checklist

Run this before bringing an item to sprint planning:

```
[ ] User story follows As/I want/So that format
[ ] Acceptance criteria written (GIVEN/WHEN/THEN, covers happy path + edge cases)
[ ] Design ready and signed off (for UI stories)
[ ] Technical approach agreed or spike completed
[ ] Dependencies identified and either resolved or scheduled
[ ] Story is ≤ 8 points (or flagged for splitting)
[ ] Definition of Done applies to this story (no exceptions noted)
[ ] Product owner has prioritised this above other ready items
```

## Story Splitting Patterns

When a story is too large (> 8 points), split using one of these patterns:

| Pattern | Example |
|---------|---------|
| **By workflow step** | "Checkout" → "Enter address" + "Choose shipping" + "Payment" |
| **By user type** | "Dashboard" → "Admin dashboard" + "User dashboard" |
| **By data variation** | "Import file" → "Import CSV" + "Import Excel" |
| **Happy path first** | "Upload photo" → "Upload photo (success)" + "Upload photo (error handling)" |
| **CRUD operations** | "Manage users" → "View users" + "Create user" + "Edit user" + "Delete user" |
| **Defer validation** | "User registration" → "Basic registration" + "Email validation + confirmation" |

Anti-patterns when splitting:
- Don't split by front-end / back-end — each part isn't independently valuable
- Don't split by component — "navbar" is not a story
- Each split story should be independently shippable and valuable

## Velocity Calculation

```
Sprint 1: 34 points
Sprint 2: 28 points (one engineer on PTO)
Sprint 3: 38 points
Sprint 4: 32 points
Sprint 5: 36 points

Average velocity: (34+28+38+32+36) / 5 = 33.6 ≈ 34 points

Next sprint capacity:
  - Team of 5; one taking 3 days PTO → availability: 85%
  - Plan for: 34 × 0.85 = 29 points
```

## Dependency Tracking Template

```markdown
## Sprint [N] Dependencies

| Story | Depends on | Owner | Due | Status |
|-------|-----------|-------|-----|--------|
| User auth | Design sign-off on login screen | @designer | Day 2 | ✅ Done |
| Payment API | Stripe webhook secret from @devops | @devops | Day 3 | 🟡 In progress |
| Export feature | Legal approval on data format | @po | Day 5 | ⚪ Waiting |
```

Flag at mid-sprint check: any dependency not resolved by its due date needs escalation.

## Mid-Sprint Health Check (Day 5 of 10)

```
Questions to answer:
1. Are we on track for the sprint goal? (story points done vs expected)
2. Are any stories blocked? What's the resolution plan?
3. Are there any scope creep additions? What was removed to compensate?
4. Is there any work started that hasn't been committed to the board?
5. Are there any technical risks discovered mid-sprint?

Actions:
- Remove stories if behind — better to finish fewer stories well
- Escalate unresolved blockers
- Update the sprint scope formally (not silently)
```
