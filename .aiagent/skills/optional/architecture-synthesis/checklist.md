# Architecture Synthesis Checklist

Quick reference for the synthesis workflow.

---

## Pre-Synthesis Checklist

### Required Inputs

- [ ] **Visual diagram** in parseable format:
  - [ ] Excalidraw (`.excalidraw` JSON)
  - [ ] Mermaid (`.mmd` or code block)
  - [ ] Draw.io (`.drawio` XML)
  - [ ] ArchiMate (`.archimate` XML)

### Recommended Inputs

- [ ] **Component specifications** with:
  - [ ] Purpose/description for each component
  - [ ] Technology stack
  - [ ] Responsibilities
  - [ ] Interfaces (provides/requires)

### Optional Inputs

- [ ] **Code samples**:
  - [ ] Package manifests (package.json, go.mod, etc.)
  - [ ] Configuration files (docker-compose, k8s)
  - [ ] Key source files

- [ ] **Business context**:
  - [ ] Business goals
  - [ ] Stakeholders
  - [ ] Constraints

---

## Phase Checklist

### Phase 1: Requirements Gathering

- [ ] Present requirements checklist to user
- [ ] Identify diagram format
- [ ] Collect diagram file(s)
- [ ] Collect component specs (if available)
- [ ] Collect code samples (if available)
- [ ] Acknowledge resources received

### Phase 2: Parse Visual Architecture

- [ ] Detect diagram format
- [ ] Extract components (shapes with labels)
- [ ] Extract relationships (arrows/connectors)
- [ ] Extract boundaries (groups/containers)
- [ ] Infer component types from shapes
- [ ] Extract technologies from labels
- [ ] Document parse confidence
- [ ] List unclear/ambiguous elements

### Phase 3: Parse Specifications

- [ ] Identify spec format (markdown/table/text)
- [ ] Extract component details:
  - [ ] Purpose
  - [ ] Responsibilities
  - [ ] Technology
  - [ ] Interfaces
  - [ ] Data ownership
- [ ] Map specs to visual components
- [ ] Identify gaps (in spec, not in diagram)
- [ ] Identify orphans (in diagram, not in spec)

### Phase 4: Analyze Code (if provided)

- [ ] Identify code resources
- [ ] Extract technologies from manifests
- [ ] Extract services from docker-compose/k8s
- [ ] Validate against specs
- [ ] Document mismatches
- [ ] Enrich component details

### Phase 5: Clarification

- [ ] Compile list of unknowns
- [ ] Prioritize questions (P0 > P1 > P2)
- [ ] Ask focused questions
- [ ] Process answers
- [ ] Update model
- [ ] Repeat if needed (max 3 iterations)
- [ ] Document remaining assumptions

### Phase 6: Model Synthesis

- [ ] Compile component catalog
- [ ] Compile relationship catalog
- [ ] Run validation checks:
  - [ ] All relationships have valid endpoints
  - [ ] No orphan components (or justified)
  - [ ] No duplicate IDs
  - [ ] Required fields present
- [ ] Document warnings
- [ ] Generate internal model

### Phase 7: Output Generation

- [ ] Determine output formats needed
- [ ] Generate Structurizr workspace
- [ ] Generate architecture baseline docs
- [ ] Generate TOGAF input (if requested)
- [ ] Generate Mermaid diagrams
- [ ] Compile synthesis summary
- [ ] Document assumptions
- [ ] Provide next steps

---

## Output Checklist

### Structurizr Workspace

- [ ] Workspace name and description
- [ ] All persons defined
- [ ] All systems defined
- [ ] All containers defined
- [ ] All relationships defined
- [ ] Views created (context, container)
- [ ] Styles applied
- [ ] Valid DSL syntax

### Architecture Baseline

- [ ] Overview section
- [ ] All components documented
- [ ] Technologies specified
- [ ] Responsibilities listed
- [ ] Interfaces documented
- [ ] Relationships table
- [ ] Diagram included
- [ ] Assumptions listed

### TOGAF Input (if requested)

- [ ] Initiative name
- [ ] Baseline architecture linked
- [ ] Stakeholder placeholders
- [ ] Scope outline
- [ ] Vision section (TBD)

---

## Validation Checklist

### Structural Validation

- [ ] All relationship sources exist
- [ ] All relationship targets exist
- [ ] No orphan components (or documented reason)
- [ ] Boundaries contain their members
- [ ] No circular containment

### Completeness Validation

- [ ] All components have names
- [ ] All components have types
- [ ] Technologies specified (or flagged)
- [ ] Descriptions present (or flagged)
- [ ] All relationships labeled

### Consistency Validation

- [ ] Spec matches diagram
- [ ] Code matches spec (if validated)
- [ ] No conflicting information
- [ ] Naming conventions consistent

---

## Confidence Assessment

| Factor | High | Medium | Low |
|--------|------|--------|-----|
| Component extraction | All labeled | Most labeled | Few labeled |
| Technologies | All specified | Most specified | Few/none |
| Relationships | All labeled | Some labeled | Unlabeled |
| Spec coverage | All components | Most components | Few components |
| Code validation | Validated | Partial | None |

---

## Common Issues & Solutions

| Issue | Solution |
|-------|----------|
| Diagram is image only | Request source file or describe manually |
| No relationships in diagram | Ask user to describe interactions |
| Conflicting information | Ask user to resolve, document decision |
| Unknown technologies | Ask user, mark as TBD if unknown |
| Orphan component | Ask if intentional, document reason |
| Missing boundaries | Infer from spatial grouping or ask |

---

## Quick Commands

### Invocation

```
"Synthesize architecture from these diagrams"
"Parse my Excalidraw file into architecture"
"Create architecture model from this documentation"
"Convert this diagram to Structurizr"
```

### During Workflow

```
"Show me what you've parsed so far"
"What questions do you have?"
"Here are the answers to your questions"
"Generate the outputs now"
"I want Structurizr and baseline docs"
```

### Output Requests

```
"Generate Structurizr workspace"
"Create architecture baseline document"
"Prepare TOGAF Phase A input"
"Show me the Mermaid diagram"
```

---

## File Reference

| File | Purpose |
|------|---------|
| [README.md](README.md) | Skill overview and concepts |
| [workflows.md](workflows.md) | Detailed 7-phase workflow |
| [templates.md](templates.md) | Input templates and conventions |
| [parsers.md](parsers.md) | Format parsing logic |
| [examples.md](examples.md) | End-to-end examples |
| [checklist.md](checklist.md) | This quick reference |
