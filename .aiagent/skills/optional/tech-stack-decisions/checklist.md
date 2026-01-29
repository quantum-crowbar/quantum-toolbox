# Tech Stack Decision Checklists

Quick reference for technology evaluation and selection.

---

## Before Evaluating Technology

- [ ] Problem clearly defined?
- [ ] Requirements documented?
- [ ] Constraints identified (budget, timeline, skills)?
- [ ] Stakeholders aligned on goals?
- [ ] Existing solutions evaluated?

---

## Technology Research Checklist

### Basic Information
- [ ] What does it do?
- [ ] Who maintains it?
- [ ] What's the license?
- [ ] How long has it existed?

### Maturity Signals
- [ ] Production use cases documented?
- [ ] Major companies using it?
- [ ] Version 1.0+ released?
- [ ] Stable API (no frequent breaking changes)?

### Community Health
- [ ] Active development (recent commits)?
- [ ] Issues being addressed?
- [ ] Good documentation?
- [ ] Active community (Discord, forums, Stack Overflow)?

### Red Flags
- [ ] Single maintainer?
- [ ] No recent releases?
- [ ] Many open critical issues?
- [ ] Poor or outdated docs?

---

## Evaluation Criteria Quick Reference

### Functionality (Must work)
- [ ] Solves the core problem?
- [ ] Has required features?
- [ ] Meets performance needs?

### Maturity (Must be reliable)
- [ ] Proven in production?
- [ ] Stable releases?
- [ ] Known failure modes?

### Team Fit (Must be adoptable)
- [ ] Team can learn it?
- [ ] Fits existing workflow?
- [ ] Hiring is possible?

### Ecosystem (Should be supported)
- [ ] Good documentation?
- [ ] Active community?
- [ ] Useful plugins/extensions?

### Cost (Should be affordable)
- [ ] Licensing acceptable?
- [ ] Infrastructure reasonable?
- [ ] Training feasible?

---

## POC (Proof of Concept) Checklist

### Planning
- [ ] Objectives defined?
- [ ] Success criteria set?
- [ ] Time-box established?
- [ ] Resources allocated?

### Execution
- [ ] Environment set up?
- [ ] Core scenarios tested?
- [ ] Edge cases explored?
- [ ] Performance measured?

### Evaluation
- [ ] Results documented?
- [ ] Surprises noted?
- [ ] Team feedback gathered?
- [ ] Recommendation made?

---

## Decision Documentation Checklist

- [ ] Context explained?
- [ ] Options listed?
- [ ] Evaluation criteria defined?
- [ ] Scores/comparison provided?
- [ ] Decision stated?
- [ ] Rationale explained?
- [ ] Consequences noted?
- [ ] Alternatives documented?

---

## Migration Readiness Checklist

### Before Starting
- [ ] Current state documented?
- [ ] Target state defined?
- [ ] Migration path planned?
- [ ] Rollback plan ready?
- [ ] Team trained?
- [ ] Stakeholders informed?

### During Migration
- [ ] Progress tracked?
- [ ] Issues logged?
- [ ] Communication ongoing?
- [ ] Rollback tested?

### After Migration
- [ ] Success criteria met?
- [ ] Old system decommissioned?
- [ ] Documentation updated?
- [ ] Lessons learned captured?

---

## Technology Adoption Stages

| Stage | Criteria | Action |
|-------|----------|--------|
| **Assess** | Interesting, unknown | Research, small experiments |
| **Trial** | Promising, needs validation | POC in non-critical project |
| **Adopt** | Proven, recommended | Use for new projects |
| **Hold** | Known issues, deprecated | Don't start new use |

---

## Quick Decision Matrix

| If... | Then consider... |
|-------|------------------|
| Need it yesterday | Boring, proven tech |
| Team is learning | Well-documented, tutorials |
| Scale is critical | Benchmarked, proven at scale |
| Budget is tight | Open source, free tier |
| Long-term project | Active community, stable |
| Short-term project | Quick to learn, disposable |

---

## Warning Signs (Stop and Reconsider)

### In the Technology
- Only one maintainer
- No production users
- Breaking changes frequently
- Poor error messages
- No migration path

### In the Process
- "Everyone uses it" as primary reason
- No alternatives evaluated
- Ignoring team concerns
- Underestimating learning curve
- Not considering operational cost

### In the Team
- Resume-driven decisions
- Fear of missing out
- Ignoring operational burden
- Underestimating migration effort

---

## Post-Decision Review

After 3-6 months, review:

- [ ] Did it meet expectations?
- [ ] Were there surprises?
- [ ] What would we do differently?
- [ ] Should we continue or change course?
- [ ] Should ADR be updated?
