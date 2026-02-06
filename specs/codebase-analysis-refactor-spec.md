# Codebase Analysis Refactoring Spec

Extract a shared analysis engine with pluggable output adapters.

---

## Problem

Currently `arch-analysis` does comprehensive codebase exploration (expensive) and produces architecture documentation. But the same analysis data could generate:
- Architecture documentation (current)
- Coding context for AI agents (AGENTS.md, CONTEXT.md)
- Product specifications (PRD, features, user stories)
- C4 models (Structurizr DSL)
- Enterprise models (ArchiMate)

Doing analysis once and outputting multiple formats is more efficient.

---

## Proposed Architecture

```
skills/optional/
├── codebase-analysis/              # BASE SKILL - shared analysis engine
│   ├── README.md                   # Core analysis methodology
│   ├── workflows.md                # Phase 1-8 analysis workflows
│   ├── checklist.md                # Analysis checklist
│   └── analysis-model.md           # Internal data model spec
│
├── analysis-outputs/               # OUTPUT ADAPTERS (skill family)
│   ├── _index.md                   # Multi-choice selector, output registry
│   │
│   ├── architecture-docs/          # Current arch-analysis output
│   │   ├── README.md
│   │   └── templates.md            # Architecture documentation templates
│   │
│   ├── coding-context/             # For agentic coding
│   │   ├── README.md
│   │   └── templates.md            # AGENTS.md, CONTEXT.md generation
│   │
│   ├── product-spec/               # Extract product specs
│   │   ├── README.md
│   │   └── templates.md            # PRD, feature list, user stories
│   │
│   ├── structurizr/                # C4 model export
│   │   ├── README.md
│   │   └── templates.md            # Structurizr DSL workspace
│   │
│   └── archimate/                  # ArchiMate export
│       ├── README.md
│       └── templates.md            # ArchiMate XML/PlantUML
```

---

## Invocation Flow

### Option 1: Direct Output Request
```
"Analyze this repo and generate architecture docs"
    → Run codebase-analysis
    → Apply architecture-docs adapter
    → Output to docs/architecture-docs/

"Generate coding context for this repo"
    → Run codebase-analysis
    → Apply coding-context adapter
    → Output AGENTS.md, CONTEXT.md
```

### Option 2: Multi-Choice (Default for "analyze")
```
"Analyze this repo"
    ↓
Multi-choice prompt:
  What outputs do you need?
  ☑ Architecture documentation
  ☑ Coding context (AGENTS.md)
  ☐ Product specification
  ☐ Structurizr C4 model
  ☐ ArchiMate model
    ↓
Run codebase-analysis ONCE
    ↓
Apply selected adapters in sequence
    ↓
Output all selected formats
```

---

## Analysis Model (Internal)

The base analysis produces a structured data model that adapters consume:

```yaml
analysis_model:
  project:
    name: string
    description: string
    repository: string
    commit: string

  technologies:
    languages: [{name, version, evidence}]
    frameworks: [{name, version, purpose, evidence}]
    libraries: [{name, version, category, evidence}]
    infrastructure: [{name, type, purpose, evidence}]

  interfaces:
    apis: [{path, method, auth, request, response, evidence}]
    events: [{name, schema, publishers, consumers, evidence}]
    integrations: [{name, direction, format, auth, evidence}]

  data:
    entities: [{name, fields, storage, relationships}]
    flows: [{source, transformations, destination}]
    lifecycle: [{entity, create, read, update, delete, retention}]

  architecture:
    components: [{name, type, responsibilities, dependencies}]
    layers: [{name, components, boundaries}]
    patterns: [{name, where_used, evidence}]

  health:
    dependencies: [{package, version, latest, vulnerabilities, maintenance}]
    errors: [{source, handler, recovery, gaps}]
    documentation: [{location, coverage, accuracy}]
```

---

## Output Adapters

### 1. Architecture Documentation (Existing)
**Output**: `docs/architecture-docs/` with 7 analysis files + index
**Use case**: Comprehensive architecture understanding

### 2. Coding Context (New)
**Output**:
- `AGENTS.md` - AI agent instructions derived from codebase
- `CONTEXT.md` - Project context for coding assistance

**Extracts**:
- Key patterns and conventions from code
- Important files and their purposes
- Common workflows (build, test, deploy)
- Coding standards inferred from existing code

### 3. Product Specification (New)
**Output**: `docs/product-spec/`
- `features.md` - Feature inventory from code
- `user-flows.md` - User journeys from routes/handlers
- `data-model.md` - Entity descriptions (user-friendly)
- `integrations.md` - External service connections

**Use case**: Onboarding, product documentation, requirements traceability

### 4. Structurizr Export (New)
**Output**: `architecture/workspace.dsl`
**Format**: Structurizr DSL for C4 model

```structurizr
workspace {
  model {
    # Generated from analysis_model.components
  }
  views {
    systemContext ...
    container ...
  }
}
```

**Use case**: Living architecture diagrams, C4 modeling tools

### 5. ArchiMate Export (New)
**Output**: `architecture/archimate.xml` or `architecture/archimate.puml`
**Format**: ArchiMate Open Exchange or PlantUML

**Use case**: Enterprise architecture tools, TOGAF alignment

---

## Implementation Phases

### Phase 1: Refactor Base (Future)
- [ ] Extract analysis phases into `codebase-analysis/`
- [ ] Define analysis model schema
- [ ] Keep `arch-analysis` working during transition

### Phase 2: First Adapter
- [ ] Create `analysis-outputs/_index.md` with selector
- [ ] Move templates to `architecture-docs/`
- [ ] Verify existing output still works

### Phase 3: Coding Context Adapter
- [ ] Create `coding-context/` adapter
- [ ] Templates for AGENTS.md generation
- [ ] Templates for CONTEXT.md generation

### Phase 4: Additional Adapters
- [ ] Product spec adapter
- [ ] Structurizr adapter
- [ ] ArchiMate adapter

---

## Benefits

| Benefit | Description |
|---------|-------------|
| **Efficiency** | Analyze once, output many formats |
| **Consistency** | All outputs from same analysis data |
| **Flexibility** | User chooses what they need |
| **Extensibility** | Easy to add new output formats |
| **Maintenance** | Analysis logic in one place |

---

## Risks & Mitigations

| Risk | Mitigation |
|------|------------|
| Breaking existing arch-analysis | Keep working during transition, feature flag |
| Analysis model too complex | Start simple, extend as needed |
| Adapter maintenance burden | Shared templates, clear contracts |

---

## Status

**Status**: Proposed
**Priority**: Medium (after current roadmap items)
**Depends on**: Completed arch-analysis Phase 1, stable skill structure
