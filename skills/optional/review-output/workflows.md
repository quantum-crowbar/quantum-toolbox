# Skill: review-output — Workflows

## Workflow 1: Produce structured review findings

### Inputs
- Session spec (`session-type: review`) with review type and target
- Crew review outputs (each reviewer's findings)

### Steps

1. **Collect findings by reviewer role**
   Each agent produces findings in their domain:
   - Engineer: correctness, tests, error handling, code quality
   - QA: coverage gaps, edge cases, accessibility, NFRs
   - Architect: structural concerns, ADR alignment, fitness functions
   - DevOps: deployability, observability, pipeline impact
   - Designer: UX completeness, accessibility, component states

2. **Classify each finding**
   Assign severity: 🔴 BLOCKING | 🟡 RECOMMENDED | 💬 NIT

3. **Deduplicate and consolidate**
   If multiple reviewers raise the same concern, merge into one finding with all sources noted.

4. **Write the review report**

### Review report format

```markdown
# Review: [Target Name] — [YYYY-MM-DD]

**Review type:** [code / design / architecture / security]
**Target:** [PR link / file path / ADR number]
**Reviewers:** [list of agents]
**Verdict:** ✅ Approved | ✅ Approved with comments | 🔄 Needs rework

---

## 🔴 Blocking ([N] items)

### [Finding title]
**Reviewer:** [agent]
**What:** [description of the problem]
**Why:** [why it matters — security risk, broken functionality, compliance, etc.]
**Fix:** [specific action required]

---

## 🟡 Recommended ([N] items)

### [Finding title]
**Reviewer:** [agent]
**What:** [description]
**Why:** [why it should be addressed]
**Suggestion:** [specific recommendation]

---

## 💬 Nits ([N] items)

- [Reviewer]: [brief description] — [file:line if applicable]

---

## ✅ What's Done Well

- [Specific thing that was done well and why it matters]

---

## Open Questions

- [Question the reviewer couldn't answer from the review alone — needs author clarification]
```

### Output file
Write to `workspace/sessions/YYYY-MM-DD-[target-name]-review.md`

---

## Workflow 2: Per-language / per-domain checklists

### Code review checklist (all languages)
- [ ] No hardcoded secrets or credentials
- [ ] Input validation at system boundaries
- [ ] Error cases handled and tested
- [ ] No N+1 queries or obvious performance traps
- [ ] Tests cover happy path and main error cases
- [ ] No dead code or commented-out blocks

### Code review additions — TypeScript / JavaScript
- [ ] Types are explicit; no unnecessary `any`
- [ ] Async errors are caught (unhandled promise rejections)
- [ ] No `console.log` in production code

### Code review additions — Python
- [ ] Type hints present on public functions
- [ ] Exceptions are typed; no bare `except`
- [ ] No mutable default arguments

### Design review checklist
- [ ] All component states present (loading, error, empty, populated)
- [ ] Responsive specs for all breakpoints
- [ ] Accessibility annotations (ARIA, focus order, contrast)
- [ ] Design tokens used; no hardcoded values
- [ ] Handoff complete enough for Engineer to implement without questions

### Architecture review checklist
- [ ] Decision aligns with prior ADRs (no silent conflicts)
- [ ] Consequences section is realistic
- [ ] At least one fitness function proposed
- [ ] Rollback strategy defined if infrastructure changes
- [ ] Operational impact documented
