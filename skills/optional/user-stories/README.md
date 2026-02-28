# User Stories

Guidelines for writing effective user stories, acceptance criteria, and BDD scenarios.

## Core Principles

- **Vertical slices** — a story delivers end-to-end value; not UI only or API only
- **Independent** — stories can be developed in any order where possible
- **Negotiable** — the story is a conversation starter, not a contract
- **Valuable** — every story delivers value to a real user or stakeholder
- **Estimable** — the team can size it; if not, it needs refinement or a spike
- **Small** — fits in one sprint (≤ 8 story points)
- **Testable** — acceptance criteria can be verified by a human or automated test

(INVEST criteria — Bill Wake)

## Story Format

### Standard

```
As a [type of user],
I want to [do something],
So that [I achieve a goal / get a benefit].
```

### Job-to-be-Done alternative (when "as a" feels forced)

```
When [situation],
I want to [motivation],
So I can [expected outcome].
```

Example:
```
When I need to share a report with my manager,
I want to export it as a PDF with our company branding,
So I can send it without reformatting it myself.
```

## Acceptance Criteria

### GIVEN / WHEN / THEN (Gherkin-style)

```
Feature: Product catalogue filtering

  Background:
    Given the user is on the product listing page
    And the catalogue contains 50 products across 5 categories

  Scenario: Filter by category
    When the user selects "Electronics" from the category filter
    Then only Electronics products are displayed
    And the result count shows the correct number of Electronics products
    And the filter chip reads "Electronics"

  Scenario: Clear filter
    Given the user has applied the "Electronics" filter
    When the user clicks the "×" on the filter chip
    Then all products are displayed
    And no filter chips are shown

  Scenario: Filter returns no results
    When the user selects a category with no products
    Then the message "No products in this category" is displayed
    And a "Clear filter" button is shown
```

### When to use Gherkin vs plain English

| Use Gherkin when | Use plain English when |
|-----------------|----------------------|
| QA will automate the scenario | Criteria are simple and obvious |
| Multiple teams need shared language | Story is internal tooling |
| Complex conditional behaviour | Criteria are primarily visual |
| BDD workflow is established | Team doesn't use BDD tooling |

## Acceptance Criteria Quality Rules

```
✓ Testable — someone can verify it pass/fail without ambiguity
✓ Specific — concrete values, not vague ("loads quickly" → "loads in < 2 seconds")
✓ Covers the edge cases — empty state, error state, max values
✓ Independent — each criterion can be tested in isolation
✓ No implementation detail — specifies WHAT, not HOW

✗ "The UI should be responsive" — not testable as written
✗ "The API should be fast" — what is fast?
✗ "The user can log in with Google" — how? What happens on failure?
✗ "It should use a modal dialog" — implementation, not behaviour
```

## Story Types

### Feature story
Standard user-facing story delivering new value.
```
As a customer, I want to save items to a wishlist, so I can revisit them later.
```

### Bug story
A defect treated as a story for prioritisation and tracking.
```
As a customer, I want the checkout total to include VAT, so I know the final price before paying.
(Bug: VAT not shown in cart; only applied at payment step)
```

### Spike / research story
Time-boxed investigation producing a decision or recommendation, not deliverable software.
```
Spike: Evaluate three PDF generation libraries (pdfmake, puppeteer, pdf-lib) for our export feature.
Output: A documented recommendation with pros/cons and a proof of concept.
Timebox: 2 days.
```

### Technical story
Infrastructure or tooling work with no direct user-visible output. Needs a clear benefit statement.
```
As a developer, I want database queries to use connection pooling,
so that the API can handle concurrent users without exhausting database connections.
```

Technical stories must have acceptance criteria like any other story — "it's done when the engineer says so" is not acceptable.

### Enabler story
Architecture or infrastructure that enables future feature stories.
```
As a platform team, I want to provision a Redis cluster in the production environment,
so that the session management story (US-142) can be implemented in Sprint 12.
```

## Epic Structure

An epic is a large body of work that spans multiple sprints and breaks down into stories.

```
Epic: User onboarding
  Goal: New users can successfully set up their account and complete their first key action within 10 minutes

  Stories:
    US-101: Email + password registration
    US-102: Email verification
    US-103: Profile setup (name, avatar)
    US-104: Onboarding checklist (guided first steps)
    US-105: Welcome email sequence trigger
    US-106: Skip onboarding option for power users

  Success metrics:
    - % of registered users who complete onboarding checklist: > 60%
    - Time to first key action: < 10 min (P50)
```

## Definition of Ready

A story is ready to enter a sprint when:

```
[ ] Written in agreed format (As / I want / So that)
[ ] Acceptance criteria written and reviewed with QA
[ ] All states designed (if UI story): default, loading, error, empty
[ ] Dependencies identified (other stories, teams, external)
[ ] Estimated by the team (≤ 8 points or flagged for splitting)
[ ] Product owner has prioritised it above other ready items
[ ] Assigned to a sprint or the sprint backlog
```

## Writing for Different Audiences

| Audience | Focus |
|----------|-------|
| **Product owner** | User value and business outcome |
| **Engineer** | Technical behaviour, edge cases, data shapes |
| **QA** | All scenarios including error and edge cases |
| **Designer** | Visual states, copy, interaction |

The story itself covers value. The acceptance criteria detail the behaviour. Design annotations cover visual states. This separation means each audience reads what they need without wading through irrelevant detail.
