# Skill: review-output

Guidelines for producing structured review findings from a crew review session.

## Purpose

A review output communicates findings clearly to the author and to the team.
The goal is to make the author's next action obvious: what must change, what should change,
and what is optional.

Review types covered by this skill:
- **Code review** — correctness, security, maintainability, test coverage
- **Design review** — usability, accessibility, component completeness, handoff quality
- **Architecture review** — ADR completeness, fitness functions, operational readiness
- **Security review** — vulnerability surface, compliance gaps, pipeline security

---

## Severity Tiers

### 🔴 BLOCKING
Must be resolved before this work is merged, shipped, or approved.
The reviewer cannot approve without this being addressed.

Examples: security vulnerability, broken functionality, missing required test coverage,
WCAG accessibility failure, data loss risk, missing rollback plan.

### 🟡 RECOMMENDED
Should be addressed in this PR or as an immediate follow-up task.
Can ship with a documented exception and a tracked follow-up.

Examples: code clarity improvement, performance concern, edge case not handled,
incomplete error state, missing structured logging.

### 💬 NIT
Optional improvement. Author decides. No follow-up required.

Examples: naming preference, style inconsistency below the lint threshold,
minor comment improvement.

---

## Principles

### 1. Findings are actionable
Every finding states: what the problem is, why it matters, and what to do about it.
"This is bad" is not a finding. "This SQL query is vulnerable to injection because..." is.

### 2. Blocking findings must be unambiguous
If it's blocking, say exactly what must change. The author should not have to guess.

### 3. Praise good work
If something is done well, say so. A review that only finds problems is demoralising.

### 4. Separate opinion from requirement
Label opinions as such. "I prefer X" is different from "X is required by the standard".

### 5. The verdict is explicit
Every review ends with a clear verdict — not implied by the absence of comments.
