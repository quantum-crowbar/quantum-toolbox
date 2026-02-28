# User Stories — Workflows

## Story Writing Checklist

```
[ ] Written in agreed format (As / I want / So that, or When / I want / So I can)
[ ] User type is specific (not just "user") — identifies who benefits
[ ] Goal describes desired outcome, not a feature ("manage" → "view and cancel")
[ ] Benefit statement explains why this matters to the user
[ ] At least 3 acceptance criteria written
[ ] Happy path covered in AC
[ ] Key error cases covered in AC
[ ] Empty state covered (if applicable)
[ ] No implementation detail in story or AC
[ ] Each AC is independently testable
[ ] Story ≤ 8 points (or flagged for splitting)
[ ] Dependencies noted
```

## Story Refinement Session Agenda

```
Duration: 60–90 min per session; run 2–3 times per sprint

1. Review Definition of Ready (5 min)
   - Quick reminder; flag any DoR debates for after the session

2. Walk through candidate stories (50–70 min)
   - PO reads story aloud
   - Team asks clarifying questions
   - QA identifies missing scenarios
   - Designer confirms design coverage
   - Engineer flags technical concerns or unknowns
   - AC updated in real time

3. Estimate ready stories (15–20 min)
   - Planning poker on stories that passed refinement
   - Split stories that come in > 8 points

4. Action items (5 min)
   - Stories needing design work
   - Spikes to schedule
   - Dependencies to resolve
```

## AC Writing Workshop (30 min exercise)

Use this for teams new to writing acceptance criteria:

```
1. Take a story (5 min)
   - Read the story; identify the user, their goal, and the context

2. Brainstorm scenarios (10 min)
   - What does success look like? (happy path)
   - What could go wrong? (validation, errors, network failures)
   - What are the edge cases? (empty, maximum, minimum, duplicate)
   - What are the security cases? (unauthorised access, injection)

3. Write GWT for each scenario (10 min)
   GIVEN [starting context]
   WHEN [user action or system event]
   THEN [observable outcome]

4. Review for quality (5 min)
   - Is each criterion testable?
   - Are there implementation details to remove?
   - Are any scenarios duplicated or missing?
```

## Common AC Anti-Patterns and Fixes

| Anti-pattern | Problem | Fix |
|-------------|---------|-----|
| "The page loads quickly" | Not measurable | "The page first contentful paint is < 2s on a 4G connection" |
| "The user can log in" | Too vague | Split into: success, wrong password, account locked, forgot password |
| "It should use a toast notification" | Implementation detail | "The user is informed that the action succeeded" |
| "Works on mobile" | Too broad | "The layout is usable at 375px viewport width with no horizontal scroll" |
| "Admin users have access" | Missing scope | "Admin users can view, edit, and delete any user account; basic users can only view and edit their own" |
| "Handle errors gracefully" | Unmeasurable | "If the API returns an error, the message 'Something went wrong. Please try again.' is shown with a retry button" |

## BDD Automation Handoff

When stories have Gherkin-style AC, the QA engineer can map them directly to automated tests:

```python
# Behave (Python) — maps directly to Gherkin scenarios
@given('the user is on the product listing page')
def step_on_listing(context):
    context.browser.get('/products')

@when('the user selects "{category}" from the category filter')
def step_select_category(context, category):
    context.browser.find_element(By.LABEL_TEXT, 'Category').select(category)

@then('only {category} products are displayed')
def step_verify_filter(context, category):
    products = context.browser.find_elements(By.CSS_SELECTOR, '[data-category]')
    assert all(p.get_attribute('data-category') == category for p in products)
```

For this to work, AC must be written with consistent phrasing — the engineer and QA agree on step wording before implementation.

## Story Map Template

```markdown
# Story Map — [Product / Epic Name]

## User Journey Steps (horizontal)
| [Step 1] | [Step 2] | [Step 3] | [Step 4] |
|----------|----------|----------|----------|

## Stories by Priority (vertical — top = must have)

### Must have (MVP)
| [Story A] | [Story B] | [Story C] | [Story D] |

### Should have
| [Story E] | [Story F] | — | [Story G] |

### Could have
| [Story H] | — | [Story I] | — |

## Release Slices
Sprint 1: [Steps 1–2, must have stories]
Sprint 2: [Steps 3–4, must have stories]
Sprint 3: [Should have stories across all steps]
```
