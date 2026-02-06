# Business Architecture Checklist

Quick reference for TOGAF Phase B deliverables.

---

## Phase Entry Criteria

- [ ] Architecture Vision approved (Phase A complete)
- [ ] Statement of Architecture Work signed
- [ ] Business goals and drivers documented
- [ ] Key stakeholders identified
- [ ] Baseline architecture available (or scope for greenfield)

---

## Capability Model Checklist

### Level 0 (Enterprise)

- [ ] All strategic capabilities identified
- [ ] All core capabilities identified
- [ ] All supporting capabilities identified
- [ ] Capabilities categorized correctly

### Level 1-2 (Decomposition)

- [ ] Each L0 capability decomposed to L1
- [ ] Critical L1 capabilities decomposed to L2
- [ ] No orphan capabilities
- [ ] No duplicate capabilities

### Capability Attributes

- [ ] Unique ID assigned (CAP-nnn)
- [ ] Clear description (what, not how)
- [ ] Business outcome defined
- [ ] Owner assigned
- [ ] Maturity assessed (1-5)
- [ ] Strategic importance rated

### Capability Mapping

- [ ] Mapped to supporting applications
- [ ] Mapped to owning organization units
- [ ] Mapped to value streams (where used)

---

## Value Stream Checklist

### Structure

- [ ] Clear trigger event defined
- [ ] All stages identified (typically 4-8)
- [ ] Value proposition stated
- [ ] Customer segment identified
- [ ] End-to-end flow documented

### Stage Details

For each stage:

- [ ] Entry criteria defined
- [ ] Exit criteria defined
- [ ] Participating stakeholders listed
- [ ] Required capabilities identified
- [ ] Cycle time estimated
- [ ] Value-adding status determined (Yes/No)

### Metrics

- [ ] Total cycle time calculated
- [ ] Value-add ratio calculated
- [ ] Current vs target documented
- [ ] Pain points captured
- [ ] Improvement opportunities listed

---

## Process Model Checklist

### Process Definition

- [ ] Unique process ID (BP-nnn)
- [ ] Clear purpose statement
- [ ] Trigger event defined
- [ ] Frequency documented
- [ ] Inputs listed
- [ ] Outputs listed

### Process Flow

- [ ] Start event marked
- [ ] End event(s) marked
- [ ] All steps defined
- [ ] Decision points (gateways) shown
- [ ] Swim lanes for actors (if cross-functional)

### Step Details

For each step:

- [ ] Actor/role assigned
- [ ] Action described
- [ ] Supporting system identified
- [ ] Input defined
- [ ] Output defined
- [ ] Business rules documented
- [ ] Exception handling noted

### Process Governance

- [ ] RACI matrix completed
- [ ] Process owner assigned
- [ ] Metrics defined
- [ ] SLAs documented (if applicable)

---

## Organization Mapping Checklist

### Structure

- [ ] Organization hierarchy documented
- [ ] Reporting lines clear
- [ ] Department/unit boundaries defined
- [ ] FTE counts noted (where relevant)

### Role Definitions

For key roles:

- [ ] Department assignment
- [ ] Reporting relationship
- [ ] Key responsibilities listed
- [ ] Capabilities supported mapped
- [ ] Required skills identified

### Capability-Organization Matrix

- [ ] Primary owner for each capability
- [ ] Contributing units identified
- [ ] Gaps highlighted (no owner)
- [ ] Overlaps flagged (multiple owners)

---

## Gap Analysis Checklist

### Gap Identification

- [ ] All baseline elements documented
- [ ] All target elements documented
- [ ] Gaps categorized (Capability/Process/Organization)
- [ ] Each gap has unique ID (G-nnn)

### Gap Assessment

For each gap:

- [ ] Current state described
- [ ] Target state described
- [ ] Business impact documented
- [ ] Priority assigned (Critical/High/Medium/Low)
- [ ] Resolution approach outlined
- [ ] Dependencies identified
- [ ] Effort estimated (S/M/L/XL)

### Gap Summary

- [ ] Total gaps counted by category
- [ ] Priority distribution reviewed
- [ ] Critical gaps have sponsors
- [ ] No orphan gaps (all addressed in roadmap)

---

## Roadmap Checklist

### Work Packages

For each work package:

- [ ] Unique ID (WP-B-nnn)
- [ ] Clear description
- [ ] Business outcome stated
- [ ] Gaps addressed listed
- [ ] Scope defined (in/out)
- [ ] Dependencies documented
- [ ] Estimates provided (duration, effort, cost)
- [ ] Risks identified with mitigations

### Sequencing

- [ ] Dependencies drive sequence
- [ ] Quick wins identified
- [ ] Critical path clear
- [ ] Resource constraints considered
- [ ] No circular dependencies

---

## Stakeholder Review Checklist

### Documentation

- [ ] Capability map visual ready
- [ ] Value stream diagrams ready
- [ ] Process models ready
- [ ] Organization map ready
- [ ] Gap analysis summary ready
- [ ] Roadmap visual ready

### Validation

- [ ] Capabilities reflect business reality
- [ ] Value streams match customer experience
- [ ] Processes match actual operations
- [ ] Organization structure is current
- [ ] Gaps are real and prioritized correctly
- [ ] Roadmap is achievable

### Sign-off

- [ ] Business sponsors reviewed
- [ ] Domain SMEs validated
- [ ] Feedback incorporated
- [ ] Architecture Board approved
- [ ] Proceed to Phase C authorized

---

## Quality Scoring Matrix

| Dimension | Poor (1) | Adequate (3) | Good (5) |
|-----------|----------|--------------|----------|
| **Completeness** | Major gaps in coverage | Most areas covered | Comprehensive coverage |
| **Accuracy** | Significant errors | Minor inaccuracies | Verified with SMEs |
| **Clarity** | Hard to understand | Understandable | Clear to all stakeholders |
| **Alignment** | Weak link to strategy | Some strategic alignment | Direct strategic mapping |
| **Actionability** | Vague next steps | General direction | Clear work packages |

**Target**: Average score ≥ 4 across all dimensions

---

## Common Issues

| Issue | Symptom | Resolution |
|-------|---------|------------|
| Too granular | 200+ capabilities at L2 | Roll up to higher levels |
| Too abstract | Capabilities = "Do stuff" | Add specific outcomes |
| Missing owners | "TBD" everywhere | Escalate for assignment |
| No metrics | Maturity all "3" | Use defined criteria |
| Orphan elements | Capabilities not in value streams | Map or remove |
| Analysis paralysis | Months in Phase B | Timeboxed iterations |

---

## Phase Exit Criteria

- [ ] Business Architecture artifacts complete
- [ ] Stakeholder concerns addressed
- [ ] Gap analysis complete with priorities
- [ ] Roadmap components defined
- [ ] Architecture Board approval obtained
- [ ] Phase C scope confirmed
- [ ] Updated Architecture Repository
