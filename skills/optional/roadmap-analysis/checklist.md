# Roadmap Analysis Checklist

> **Audience:** AI Agents
> Quick reference per analysis mode.

---

## Before Starting Any Mode

- [ ] master-roadmap.md or equivalent input is available
- [ ] Roadmap source understood (generated vs external)
- [ ] Mode confirmed with user (don't run all modes unprompted)

---

## Mode 1: Expand

- [ ] Prerequisites listed (concrete, not vague)
- [ ] Week-by-week plan includes verification steps
- [ ] All tooling/commands are realistic for the tech stack
- [ ] Integration checkpoints identified (who to sync with and when)
- [ ] Rollback triggers defined
- [ ] XL steps flagged with a recommendation to spike

---

## Mode 2: Research

- [ ] Research question is precise and answerable (not "is X good?")
- [ ] Scope defines what is out of scope
- [ ] Methodology is step-by-step (not vague)
- [ ] Decision impact covers Go, No-Go, and Marginal outcomes
- [ ] Success criteria are binary (answered or not)
- [ ] Linked to initiating initiative and relevant ADR

---

## Mode 3: Complexity

- [ ] Every initiative scored on all three axes (technical, organisational, risk)
- [ ] Confidence levels have rationale
- [ ] Critical path calculated (not just listed)
- [ ] Bottlenecks identified (initiatives blocking ≥2 others)
- [ ] Lowest-confidence initiatives called out with recommendation

---

## Mode 4: Spikes

- [ ] Each spike has a specific binary assumption being tested
- [ ] Time box is fixed (not open-ended)
- [ ] Go/No-Go criteria are measurable (not subjective)
- [ ] Day-by-day task plan included
- [ ] Decision impact specifies fallback if No-Go

---

## Mode 5: Estimation

- [ ] Every activity is itemised (no "misc" or "other")
- [ ] Risk buffer applied (15–25% based on complexity)
- [ ] Confidence level stated with rationale
- [ ] Assumptions are explicit (not buried)
- [ ] Low-confidence initiatives (<60%) flagged for spike before committing
- [ ] Rollup totals are consistent with initiative detail

---

## Mode 6: PDF Export

- [ ] Package type confirmed with user (executive / technical / initiative)
- [ ] Mermaid diagrams exported to PNG before PDF generation
- [ ] Cover page includes: project name, date, package type, audience
- [ ] File saved to roadmaps/pdf/ with date in filename

---

## Mode 7: Team Planning

- [ ] Team composition derived from initiative complexity (not guessed)
- [ ] Seniority matched to complexity level
- [ ] Critical vs important expertise distinguished
- [ ] AI augmentation section included
- [ ] If financial: confidence level and assumptions explicit
- [ ] If hiring needed: hiring-plan.md includes timeline
