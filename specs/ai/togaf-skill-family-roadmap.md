# TOGAF Skill Family Roadmap

Development plan for implementing TOGAF (The Open Group Architecture Framework) as a layered skill family.

---

## Overview

### Approach: Layered Implementation

| Layer | Location | Purpose |
|-------|----------|---------|
| **Core Concepts** | `.aiagent/core/` | Foundational thinking always active |
| **ADM Phase Skills** | `.aiagent/skills/optional/togaf/` | Invokable workflows per phase |
| **Templates & Artifacts** | Within each skill | TOGAF-compliant deliverables |

### Why Layered?

- ADM phases can be used independently (modular)
- Core concepts benefit all architecture work, not just formal TOGAF
- Allows gradual adoption vs all-or-nothing
- Skills can be invoked as needed: "Apply TOGAF Business Architecture"

---

## Layer 1: Core Concepts (Agent Training)

Add to `.aiagent/core/instructions.md` or new `.aiagent/core/architecture-thinking.md`

### TODO

- [ ] **Architecture Domains Awareness**
  - [ ] Business Architecture - processes, organization, capabilities
  - [ ] Data Architecture - data entities, relationships, governance
  - [ ] Application Architecture - application components, interactions
  - [ ] Technology Architecture - infrastructure, platforms, networks
  - [ ] Always consider which domain(s) a task touches

- [ ] **Stakeholder Thinking**
  - [ ] Identify stakeholders affected by architecture decisions
  - [ ] Consider viewpoints and concerns per stakeholder type
  - [ ] Tailor communication to audience
  - [ ] Recognize governance and approval needs

- [ ] **Architecture Principles**
  - [ ] Understand principle structure (statement, rationale, implications)
  - [ ] Reference existing principles when making decisions
  - [ ] Flag when decisions might violate principles

- [ ] **Baseline vs Target Thinking**
  - [ ] Distinguish current state (baseline) from desired state (target)
  - [ ] Consider transition states

  - [ ] **Gap Analysis**
    - [ ] Identify gaps between baseline and target per domain
    - [ ] Categorize gaps: missing, outdated, incompatible, redundant
    - [ ] Map gaps to capabilities/components affected
    - [ ] Each gap = potential roadmap candidate
    - [ ] Template for gap register
    ```markdown
    | ID | Domain | Baseline | Target | Gap Type | Roadmap Candidate | Dependencies |
    |----|--------|----------|--------|----------|-------------------|--------------|
    ```

  - [ ] **Roadmap Prioritization**
    - [ ] Define prioritization criteria (select/weight per engagement)
    - [ ] Score each gap/roadmap candidate
    - [ ] Generate prioritized roadmap

    **Standard Prioritization Criteria:**
    ```markdown
    | Criterion | Description | Weight |
    |-----------|-------------|--------|
    | Business Value | Revenue impact, cost savings, strategic alignment | 1-5 |
    | Risk Reduction | Security, compliance, operational risk mitigated | 1-5 |
    | Dependencies | Enables other initiatives, blocked by others | 1-5 |
    | Complexity | Effort, technical difficulty, organizational change | 1-5 |
    | Time Sensitivity | Regulatory deadlines, market windows, contracts | 1-5 |
    | Resource Availability | Skills, budget, vendor capacity | 1-5 |
    ```

    **Prioritization Matrix Template:**
    ```markdown
    | Gap ID | Candidate | BizVal | Risk | Deps | Complexity | Time | Resources | Score | Rank |
    |--------|-----------|--------|------|------|------------|------|-----------|-------|------|
    ```

    **Prioritization Approaches:**
    - [ ] Weighted scoring (default)
    - [ ] MoSCoW (Must/Should/Could/Won't)
    - [ ] Value vs Effort quadrant
    - [ ] WSJF (Weighted Shortest Job First) for SAFe alignment
    - [ ] Business Impact / Value Added assessment

    **Output: Roadmap View**
    ```
    gantt
      title Architecture Roadmap
      dateFormat YYYY-MM
      section Foundation
        Gap-001 Enable API Gateway :2024-01, 3M
        Gap-003 Data Platform     :2024-02, 4M
      section Growth
        Gap-002 Mobile Capability :2024-04, 3M
      section Optimization
        Gap-004 Legacy Retirement :2024-06, 6M
    ```

  - [ ] **Risk Analysis**
    - [ ] Identify risks from each gap
    - [ ] Assess probability and impact
    - [ ] Define mitigation strategies
    - [ ] Track risk ownership

    **Manual Input Required - Non-Technical Risks:**
    ```
    Agent should prompt user for input on risks that cannot be inferred from code/docs:

    - Ownership risks: unclear accountability, shared ownership conflicts
    - Political risks: competing priorities, executive sponsorship gaps
    - Organizational risks: restructuring, M&A activity, key person dependencies
    - Operating model risks: outsourcing changes, vendor relationships, SLA gaps
    - Cultural risks: change fatigue, skill resistance, innovation appetite
    - Governance risks: approval bottlenecks, compliance interpretation
    - Financial risks: budget cycles, funding uncertainty, cost allocation disputes
    ```

    - [ ] Risk mindmap structure:
    ```
    mindmap
      root((Architecture Risks))
        Technical
          Integration complexity
          Legacy dependencies
          Scalability limits
          Security vulnerabilities
        Organizational
          Skill gaps
          Change resistance
          Resource constraints
          Vendor dependencies
        Business
          Timeline pressure
          Budget limitations
          Regulatory compliance
          Market changes
        Operational
          Migration disruption
          Data quality
          Performance degradation
          Support readiness
    ```
    - [ ] Template for risk register
    ```markdown
    | ID | Risk | Category | Probability | Impact | Score | Mitigation | Owner | Status |
    |----|------|----------|-------------|--------|-------|------------|-------|--------|
    ```
    - [ ] Risk-to-gap traceability matrix

- [ ] **Enterprise Continuum Awareness**
  - [ ] Recognize reusable assets (patterns, building blocks)
  - [ ] Prefer standard solutions over custom
  - [ ] Classify solutions: Foundation → Common Systems → Industry → Organization

### Acceptance Criteria

- [ ] Core concepts documented in agent training
- [ ] Concepts apply automatically during architecture discussions
- [ ] No explicit invocation required

---

## Layer 2: ADM Phase Skills

Location: `.aiagent/skills/optional/togaf/`

### Skill Family Structure

```
togaf/
├── _index.md                      # Family overview, ADM cycle, when to use
├── preliminary/                   # Preliminary Phase
│   ├── README.md
│   ├── workflows.md
│   ├── checklist.md
│   ├── templates.md
│   └── examples.md
├── vision/                        # Phase A: Architecture Vision
├── business-architecture/         # Phase B: Business Architecture
├── information-systems/           # Phase C: Data + Application
├── technology-architecture/       # Phase D: Technology Architecture
├── opportunities-solutions/       # Phase E: Opportunities & Solutions
├── migration-planning/            # Phase F: Migration Planning
├── implementation-governance/     # Phase G: Implementation Governance
└── change-management/             # Phase H: Architecture Change Management
```

### Phase Skills TODO

#### Preliminary Phase
- [ ] **Skill Structure**
  - [ ] README.md - purpose, when to use, outputs
  - [ ] workflows.md - preliminary phase workflow
  - [ ] checklist.md - readiness checklist
  - [ ] templates.md - Architecture Principles template, Governance Framework template
  - [ ] examples.md - sample outputs

- [ ] **Key Deliverables**
  - [ ] Architecture Principles catalog
  - [ ] Governance framework definition
  - [ ] Architecture team structure
  - [ ] Tailored Architecture Framework
  - [ ] Architecture Repository structure

#### Phase A: Architecture Vision
- [ ] **Skill Structure** (5 standard files)

- [ ] **Key Deliverables**
  - [ ] Request for Architecture Work
  - [ ] Statement of Architecture Work
  - [ ] Architecture Vision document
  - [ ] Stakeholder Map
  - [ ] Business Scenario analysis
  - [ ] High-level architecture views

- [ ] **Workflows**
  - [ ] Stakeholder identification and analysis
  - [ ] Business scenario development
  - [ ] Vision creation
  - [ ] Scope definition

#### Phase B: Business Architecture
- [ ] **Skill Structure** (5 standard files)

- [ ] **Key Deliverables**
  - [ ] Baseline Business Architecture
  - [ ] Target Business Architecture
  - [ ] Gap Analysis (Business)
  - [ ] Business Architecture components:
    - [ ] Organization structure
    - [ ] Business capabilities
    - [ ] Value streams
    - [ ] Business processes
    - [ ] Business functions

- [ ] **Diagrams**
  - [ ] Business Capability Map
  - [ ] Value Stream diagram
  - [ ] Process flow diagrams
  - [ ] Organization chart

#### Phase C: Information Systems Architecture
- [ ] **Skill Structure** (5 standard files)

- [ ] **Data Architecture Deliverables**
  - [ ] Baseline Data Architecture
  - [ ] Target Data Architecture
  - [ ] Data Entity catalog
  - [ ] Data Flow diagrams
  - [ ] Conceptual/Logical Data Models

- [ ] **Application Architecture Deliverables**
  - [ ] Baseline Application Architecture
  - [ ] Target Application Architecture
  - [ ] Application Portfolio catalog
  - [ ] Application Communication diagram
  - [ ] Application/Function matrix

#### Phase D: Technology Architecture
- [ ] **Skill Structure** (5 standard files)

- [ ] **Key Deliverables**
  - [ ] Baseline Technology Architecture
  - [ ] Target Technology Architecture
  - [ ] Technology Standards catalog
  - [ ] Platform decomposition diagram
  - [ ] Infrastructure diagrams
  - [ ] Technology portfolio

#### Phase E: Opportunities and Solutions
- [ ] **Skill Structure** (5 standard files)

- [ ] **Key Deliverables**
  - [ ] Project list
  - [ ] Consolidated gaps, solutions, dependencies
  - [ ] Transition Architectures
  - [ ] Implementation roadmap (draft)
  - [ ] Build vs Buy analysis

#### Phase F: Migration Planning
- [ ] **Skill Structure** (5 standard files)

- [ ] **Key Deliverables**
  - [ ] Implementation and Migration Plan
  - [ ] Transition Architecture specifications
  - [ ] Project charters (architecture work)
  - [ ] Resource estimates
  - [ ] Risk assessment

#### Phase G: Implementation Governance
- [ ] **Skill Structure** (5 standard files)

- [ ] **Key Deliverables**
  - [ ] Architecture Contract
  - [ ] Compliance assessments
  - [ ] Change requests
  - [ ] Implementation recommendations

#### Phase H: Architecture Change Management
- [ ] **Skill Structure** (5 standard files)

- [ ] **Key Deliverables**
  - [ ] Change request assessments
  - [ ] Architecture updates
  - [ ] New Request for Architecture Work (if significant)
  - [ ] Lessons learned

---

## Layer 3: Cross-Cutting Components

### Architecture Repository Structure

- [ ] Define standard repository structure
- [ ] Templates for:
  - [ ] Architecture Landscape (strategic, segment, capability)
  - [ ] Reference Library (standards, patterns)
  - [ ] Governance Log
  - [ ] Standards Information Base

### Building Blocks

- [ ] Define ABB (Architecture Building Block) template
- [ ] Define SBB (Solution Building Block) template
- [ ] Catalog structure for reusable blocks

### Viewpoints and Views

- [ ] Catalog of standard viewpoints
- [ ] View templates per stakeholder type
- [ ] Mapping: Concern → Viewpoint → View

---

## Invocation Patterns

```
"Apply TOGAF"                           → Determine phase, guide through
"Create Architecture Vision"            → Phase A workflow
"Develop Business Architecture"         → Phase B workflow
"Map business capabilities"             → Phase B specific task
"Assess architecture compliance"        → Phase G workflow
"What TOGAF phase for {task}?"          → ADM navigation help
```

---

## Integration with Existing Skills

| Existing Skill | TOGAF Integration |
|----------------|-------------------|
| `arch-analysis` | Feeds into Baseline Architecture (B/C/D) |
| `software-design` | Aligns with Application Architecture (C) |
| `tech-stack-decisions` | Supports Technology Architecture (D) |
| `security-analysis` | Cross-cuts all phases (security viewpoint) |

---

## Implementation Priority

### Phase 1: Foundation
1. [ ] Core concepts in agent training
2. [ ] Family index (`togaf/_index.md`)
3. [ ] Phase A: Architecture Vision (most commonly used standalone)

### Phase 2: Core ADM
4. [ ] Phase B: Business Architecture
5. [ ] Phase C: Information Systems Architecture
6. [ ] Phase D: Technology Architecture

### Phase 3: Planning & Governance
7. [ ] Phase E: Opportunities and Solutions
8. [ ] Phase F: Migration Planning

### Phase 4: Operations
9. [ ] Preliminary Phase
10. [ ] Phase G: Implementation Governance
11. [ ] Phase H: Architecture Change Management

### Phase 5: Advanced
12. [ ] Architecture Repository templates
13. [ ] Building Block catalogs
14. [ ] Viewpoint library

---

## Notes

### Tailoring Principle

TOGAF is meant to be tailored. Skills should:
- Support full formal application
- Allow lightweight/partial use
- Not enforce rigid process when inappropriate

### Relationship to ADM Iterations

ADM is iterative, not waterfall. Skills should:
- Support re-entry at any phase
- Handle iteration between phases
- Track architecture versions/iterations

### ArchiMate Consideration

ArchiMate is the modeling language often used with TOGAF. Consider:
- [ ] ArchiMate notation in diagram templates
- [ ] Mapping TOGAF artifacts to ArchiMate models
- [ ] Could be separate skill or integrated
