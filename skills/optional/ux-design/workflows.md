# UX Design — Workflows

## Design Review Checklist

```
[ ] Design addresses the stated user goal (not just the feature request)
[ ] All component states designed: default, hover, loading, empty, error, disabled
[ ] Responsive behaviour specified for all breakpoints
[ ] Copy reviewed: concise, consistent tone, correct character limits
[ ] Colour contrast passes WCAG AA (4.5:1 for text, 3:1 for UI components)
[ ] All interactive elements reachable via keyboard
[ ] Focus states visible on all interactive elements
[ ] Form inputs have visible labels (not just placeholder text)
[ ] Errors described in text, not colour alone
[ ] Touch targets ≥ 44×44px on mobile
[ ] Empty state and first-run experience designed (not just happy path)
[ ] Loading states designed (skeleton screens or spinners with context)
[ ] Design tokens used (not hardcoded colour/spacing values)
[ ] Annotations include ARIA roles and screen reader text for non-obvious elements
[ ] Engineering open questions listed and flagged
```

## Usability Test Plan Template

```markdown
# Usability Test Plan — [Feature Name]

## Goal
What do we want to learn?

## Participants
- Number: 5–8
- Criteria: [who qualifies]
- Recruiting: [how we'll find them]

## Tasks
1. [Task description — what we ask them to do, written as a scenario]
   Success criteria: [what "success" looks like]
   Metrics: completion rate, time on task, errors

2. ...

## Metrics
- Task completion rate
- Time on task
- Error rate
- SUS score (post-test questionnaire)
- Qualitative: top 3 pain points per task

## Schedule
- Session length: 45 minutes
- Dates: [range]
- Moderator: [name]
- Observer slots: [up to 2 silent observers per session]

## Analysis
- Synthesise findings within 24h of last session
- Affinity map pain points by theme
- Severity rating: critical (blocks completion) / major (significant difficulty) / minor (cosmetic)
```

## Accessibility Audit Workflow

```
1. Automated scan — run axe, Lighthouse, or Wave on all key screens
   Fix all automated failures before manual audit

2. Keyboard navigation — tab through every screen without a mouse
   Every action must be reachable and activatable via keyboard alone

3. Screen reader — navigate critical user flows with VoiceOver or NVDA
   All meaningful content must be announced; all interactions operable

4. Colour contrast — check text, UI components, focus indicators
   Use Colour Contrast Analyser or Figma's built-in contrast check

5. Zoom — set browser to 200%; verify no content is lost or overlaps

6. Document findings — severity, WCAG criterion, affected component, recommended fix
```

## Discovery Sprint Structure (5 days)

```
Day 1 — Align
  - Review existing research, analytics, support tickets
  - Define research questions: what do we need to learn?
  - Recruit participants (or schedule internal stakeholder interviews)

Day 2 — Research
  - 4–5 user interviews (30–45 min each)
  - Note-taking: one facilitator, one note-taker
  - Raw notes captured verbatim

Day 3 — Synthesise
  - Affinity mapping: cluster insights by theme
  - Draft personas or update existing ones
  - Identify top 3 pain points and opportunities

Day 4 — Ideate
  - "How Might We" exercises from pain points
  - Crazy 8s sketching (8 concepts in 8 minutes)
  - Dot vote on strongest ideas

Day 5 — Define
  - Select concept(s) to prototype
  - Write problem statement and success metrics
  - Present findings to stakeholders
```

## Design System Contribution Workflow

```
1. Check existing components — does something similar already exist?
   If yes, extend rather than create new

2. Design the component in isolation
   - All states (default, hover, focus, error, disabled, loading)
   - All variants needed now (not speculative future variants)
   - Responsive behaviour

3. Accessibility spec
   - ARIA role and properties
   - Keyboard interaction pattern
   - Screen reader announcement

4. Engineering review
   - Share with 1–2 engineers for implementation feasibility check
   - Agree on prop API before locking the design

5. Documentation
   - When to use / when not to use
   - Do / don't examples
   - Copy guidelines (character limits, tone)

6. Add to design system library with token references (not hardcoded values)
```

## Handing Off to Engineering

```bash
# Figma → Dev mode checklist
[ ] Frame named clearly (matches feature/component name in codebase)
[ ] Components use design tokens (not custom fills)
[ ] All text styles use text styles (not manual sizing)
[ ] Exports set up: SVGs for icons, PNG 1x/2x/3x for images
[ ] Prototype links to show interactions (or Loom recording)
[ ] Comment thread with open questions resolved or flagged
[ ] Dev mode enabled on the Figma file
```

Sit with the engineer for the first handoff of a new component — one conversation replaces 20 Slack messages.
