# Opportunities and Solutions Checklist

Quick reference for TOGAF Phase E deliverables.

---

## Phase Entry Criteria

- [ ] Phase B (Business Architecture) approved
- [ ] Phase C (Information Systems) approved
- [ ] Phase D (Technology Architecture) approved
- [ ] Gap analyses from all domains available
- [ ] Architecture principles documented
- [ ] Stakeholder concerns captured

---

## Gap Consolidation Checklist

### Gap Register

- [ ] All Phase B gaps collected
- [ ] All Phase C gaps collected
- [ ] All Phase D gaps collected
- [ ] Gaps merged into single register
- [ ] Duplicate gaps identified and consolidated
- [ ] Unique ID assigned to each gap

### Gap Relationships

- [ ] Cross-domain dependencies mapped
- [ ] Gap clusters identified
- [ ] Root cause gaps distinguished from symptoms
- [ ] Priority confirmed across domains

### Gap Categorization

- [ ] Gaps categorized by resolution type
  - [ ] New capability
  - [ ] Enhancement
  - [ ] Migration
  - [ ] Retirement
- [ ] Quick wins identified

---

## Building Blocks Checklist

### Continuum Review

- [ ] Industry reference models reviewed
- [ ] Organization's existing solutions cataloged
- [ ] Reuse opportunities identified
- [ ] Reuse vs new build decisions documented

### Architecture Building Blocks

For each ABB:

- [ ] Unique ID assigned (ABB-nnn)
- [ ] Clear description
- [ ] Type specified (Business/Data/App/Tech)
- [ ] Gaps addressed listed
- [ ] Interfaces defined
- [ ] Reuse potential noted

### Solution Building Blocks

For each SBB:

- [ ] Unique ID assigned (SBB-nnn)
- [ ] Implements ABB reference
- [ ] Specific technology/product identified
- [ ] Vendor identified
- [ ] Deployment model specified
- [ ] Cost estimated

---

## Solution Options Checklist

### Options Generation

- [ ] Multiple options identified per gap cluster
- [ ] Build option considered
- [ ] Buy option considered
- [ ] SaaS/rent option considered
- [ ] Reuse option considered
- [ ] Hybrid options considered

### Options Evaluation

- [ ] Evaluation criteria defined
- [ ] Criteria weights assigned
- [ ] Each option scored objectively
- [ ] Weighted scores calculated
- [ ] Sensitivity analysis performed

### Decision Documentation

- [ ] Preferred option selected
- [ ] Rationale documented
- [ ] Rejected alternatives recorded with reasons
- [ ] Assumptions and conditions stated
- [ ] Decision approved by stakeholders

---

## Dependency Analysis Checklist

### Technical Dependencies

- [ ] Infrastructure dependencies mapped
- [ ] Data dependencies mapped
- [ ] API/integration dependencies mapped
- [ ] Sequence constraints identified

### Resource Dependencies

- [ ] Team availability assessed
- [ ] Skills availability assessed
- [ ] Budget phasing considered
- [ ] Vendor dependencies identified

### External Dependencies

- [ ] Regulatory deadlines captured
- [ ] Partner dependencies identified
- [ ] Market timing factors noted
- [ ] Third-party roadmaps reviewed

### Dependency Matrix

- [ ] All work packages listed
- [ ] Dependencies classified (FS/SS/FF/SF)
- [ ] Critical path identified
- [ ] Dependency risks assessed

---

## Transition Architecture Checklist

### Transition Design

- [ ] Number of transitions determined
- [ ] Transition boundaries defined
- [ ] Each transition has clear theme
- [ ] Target dates assigned

### Transition Documentation

For each transition:

- [ ] Changed components listed
- [ ] Unchanged components noted
- [ ] Retired components identified
- [ ] Value delivered articulated
- [ ] Risks assessed
- [ ] Transition diagram created

### Transition Validation

- [ ] Each transition is viable standalone
- [ ] Transitions are properly sequenced
- [ ] No "all or nothing" dependencies
- [ ] Value delivered incrementally

---

## Work Package Checklist

### Work Package Definition

For each work package:

- [ ] Unique ID assigned (WP-E-nnn)
- [ ] Clear name and description
- [ ] Transition assignment
- [ ] Gaps addressed listed
- [ ] SBBs delivered listed
- [ ] Scope defined (in/out)
- [ ] Dependencies documented
- [ ] Resources identified
- [ ] Duration estimated
- [ ] Cost estimated
- [ ] Risks identified

### Portfolio Validation

- [ ] All gaps covered by work packages
- [ ] No orphan work packages
- [ ] Dependencies are feasible
- [ ] Resource conflicts resolved
- [ ] Critical path is acceptable

### Roadmap Draft

- [ ] Work packages sequenced
- [ ] Dependencies respected
- [ ] Resource constraints considered
- [ ] Timeline is realistic

---

## Stakeholder Review Checklist

### Documentation Ready

- [ ] Consolidated gap register complete
- [ ] Building block catalog complete
- [ ] Solution options documented
- [ ] Dependency matrix complete
- [ ] Transition architectures documented
- [ ] Work package portfolio complete
- [ ] Draft roadmap ready

### Reviews Conducted

- [ ] Technical leads reviewed
- [ ] Business stakeholders reviewed
- [ ] PMO reviewed
- [ ] Architecture Board reviewed

### Feedback Incorporated

- [ ] All feedback tracked
- [ ] Responses documented
- [ ] Changes made where appropriate
- [ ] Deferred items noted

### Approvals

- [ ] Transition architectures approved
- [ ] Work package portfolio approved
- [ ] Phase E overall approved
- [ ] Phase F scope confirmed

---

## Quality Scoring Matrix

| Dimension | Poor (1) | Adequate (3) | Good (5) |
|-----------|----------|--------------|----------|
| **Gap Coverage** | Major gaps missing | Most gaps addressed | All gaps addressed |
| **Solution Rigor** | Single option assumed | Options listed | Full analysis |
| **Dependency Clarity** | Ad-hoc sequence | Key deps documented | Full matrix |
| **Transition Design** | Big bang | Some staging | Incremental value |
| **Feasibility** | Unrealistic | Challenging | Achievable |

**Target**: Average score ≥ 4 across all dimensions

---

## Common Issues

| Issue | Symptom | Resolution |
|-------|---------|------------|
| Scope creep | New gaps appearing | Freeze scope, defer new |
| Analysis paralysis | Too many options | Timebox decisions |
| Missing dependencies | Surprises during execution | Thorough review |
| Big bang bias | Single transition | Mandate incremental |
| Optimistic estimates | "We can do it faster" | Add contingency |
| Reuse ignored | Building from scratch | Mandate continuum review |

---

## Phase Exit Criteria

- [ ] Consolidated gap register complete
- [ ] Building block catalog complete
- [ ] Solution decisions documented
- [ ] Dependency matrix complete
- [ ] Transition architectures defined
- [ ] Work package portfolio complete
- [ ] Draft roadmap created
- [ ] Stakeholder concerns addressed
- [ ] Architecture Board approval obtained
- [ ] Phase F scope confirmed
- [ ] Architecture Repository updated
