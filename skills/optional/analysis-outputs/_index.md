# Analysis Output Adapters

Transform codebase analysis into various output formats.

---

## Overview

Output adapters consume the analysis model from `codebase-analysis` and generate specific deliverables:

```
codebase-analysis → analysis_model → output adapter → formatted output
```

---

## Available Adapters

| Adapter | Output | Use Case |
|---------|--------|----------|
| [core-architecture](core-architecture/) | Canonical architecture docs | Single source of truth for TOGAF |
| [architecture-docs](architecture-docs/) | 9 analysis views + reports/ + index | Detailed analysis documentation |
| [coding-context](coding-context/) | AGENTS.md, CONTEXT.md | AI coding assistance |
| [product-spec](product-spec/) | Features, flows, data model | Product documentation |
| [structurizr](structurizr/) | workspace.dsl | C4 architecture diagrams |
| [archimate](archimate/) | PlantUML or Open Exchange XML | Enterprise architecture |
| [excalidraw-output](excalidraw-output.md) | `.excalidraw` JSON files | Hand-drawn-style diagrams for stakeholders |
| [excalidraw-import](excalidraw-import.md) | Mermaid + optional arch-analysis feed | Parse an existing `.excalidraw` file into a component model |

> **architecture-docs views**: Views 01–08 from standard codebase analysis. View 09 (Code Graph) and all `reports/` require the `code-graph` optional skill.

---

## Adapter Selection

When invoking analysis, select output adapters:

### Single Adapter

```
"Generate core architecture docs"     → core-architecture
"Generate architecture documentation" → architecture-docs
"Create coding context"               → coding-context
"Extract product spec"                → product-spec
"Generate C4 model"                   → structurizr
"Generate ArchiMate model"            → archimate
"Analyse this excalidraw file"        → excalidraw-import
"Convert excalidraw to Mermaid"       → excalidraw-import
"Use this excalidraw as input"        → excalidraw-import
```

### Multiple Adapters

```
"Analyze this codebase"
    ↓
Multi-choice prompt:
  What outputs do you need?
  ☑ Core architecture (canonical docs)
  ☐ Detailed analysis reports
  ☑ Coding context (AGENTS.md)
  ☐ Product specification
  ☐ C4 model (Structurizr)
  ☐ ArchiMate model
```

Analysis runs ONCE, selected adapters generate their outputs in sequence.

---

## Adapter Contract

Each adapter must:

### 1. Declare Required Model Sections

```yaml
required_sections:
  - meta              # Always required
  - technologies      # For tech stack info
  - architecture      # For component info
```

### 2. Handle Partial Models

If optional sections are missing:
- Provide sensible defaults
- Mark sections as "Not analyzed"
- Don't fail on missing optional data

### 3. Generate Output

Transform analysis model to adapter-specific format:
- Markdown reports
- Code files (DSL, config)
- Structured data (JSON, YAML)

---

## Invocation Patterns

### Direct Adapter Request

```
"Generate AGENTS.md for this project"
    ↓
1. Check if analysis model exists (recent)
2. If not, run codebase-analysis first
3. Apply coding-context adapter
4. Output AGENTS.md
```

### Full Analysis with Outputs

```
"Analyze and document this codebase"
    ↓
1. Run codebase-analysis (all phases)
2. Prompt for output adapter selection
3. Apply each selected adapter
4. Report completion
```

### Reuse Existing Analysis

```
"Generate C4 model from last analysis"
    ↓
1. Load cached analysis model
2. Apply structurizr adapter
3. Output workspace.dsl
```

---

## Adapter Reference

### core-architecture

**Purpose**: Canonical architecture documentation - single source of truth

**Output Structure**:
```
{docs}/core-architecture/
├── index.md                    # Executive summary
├── baseline/                   # Current state
│   ├── overview.md
│   ├── business.md
│   ├── information-systems.md
│   └── technology.md
├── target/                     # Future state
├── gap-analysis/               # Baseline vs Target
├── risk-analysis/              # Risk register
├── evolution-plan/             # Roadmap + fitness functions
└── change-management/          # Change tracking
```

**Required Sections**: `meta`, `architecture`

**Design Principle**: Core docs are the source of truth. TOGAF phase outputs link TO these docs rather than duplicating content.

**See**: [core-architecture/README.md](core-architecture/README.md)

---

### architecture-docs

**Purpose**: Detailed analysis documentation

**Output Structure**:
```
{docs}/architecture-docs/
├── index.md
└── analysis/
    ├── 01-technology-manifest.md
    ├── 02-interface-specification.md
    ├── 03-architecture-diagrams.md
    ├── 04-documentation-audit.md
    ├── 05-dependency-health.md
    ├── 06-data-flow-map.md
    └── 07-error-handling.md
```

**Required Sections**: All

**See**: [architecture-docs/README.md](architecture-docs/README.md)

---

### coding-context

**Purpose**: AI agent coding assistance context

**Output**:
```
AGENTS.md        # AI agent instructions
CONTEXT.md       # Project context for coding
```

**Required Sections**: `meta`, `technologies`, `architecture`, `interfaces`

**Extracts**:
- Coding conventions from existing code
- Key patterns and practices
- File purposes and responsibilities
- Build/test/deploy workflows

**See**: [coding-context/README.md](coding-context/README.md)

---

### product-spec

**Purpose**: Product documentation from code

**Output Structure**:
```
{docs}/product-spec/
├── features.md       # Feature inventory
├── user-flows.md     # User journeys from routes
├── data-model.md     # Entity descriptions
└── integrations.md   # External connections
```

**Required Sections**: `interfaces`, `data`, `architecture.components`

**See**: [product-spec/README.md](product-spec/README.md)

---

### structurizr

**Purpose**: C4 model for architecture visualization

**Output**:
```
architecture/workspace.dsl
```

**Required Sections**: `architecture`, `interfaces`, `technologies.infrastructure`

**Mapping**:
- `components[type=service]` → Containers
- `components[type=module]` → Components
- `interfaces.integrations` → External Systems
- `technologies.infrastructure` → Data stores

**See**: [structurizr/README.md](structurizr/README.md)

---

### archimate

**Purpose**: Enterprise architecture using ArchiMate notation

**Output**:
```
archimate/
├── overview.puml           # Full model (PlantUML)
├── application-layer.puml  # Application components
├── technology-layer.puml   # Infrastructure
└── model.archimate         # Open Exchange XML (optional)
```

**Required Sections**: `meta`, `architecture`, `technologies`

**Layers Generated**:
- Application Layer: Components, interfaces, data objects
- Technology Layer: Infrastructure, system software
- Business Layer: Inferred from APIs and auth

**See**: [archimate/README.md](archimate/README.md)

---

## Creating New Adapters

To add a new output adapter:

### 1. Create Directory

```
analysis-outputs/{adapter-name}/
├── README.md       # Purpose, usage, output description
└── templates.md    # Output templates
```

### 2. Document Requirements

In README.md:
- Required model sections
- Output format/structure
- Example output

### 3. Create Templates

In templates.md:
- Output file templates
- Transformation rules
- Model-to-output mapping

### 4. Register

Add to this index with:
- Summary description
- Required sections
- Invocation examples

---

## Adapter Development Guidelines

### Model Access

```yaml
# Reference model sections clearly
analysis_model.technologies.languages[0].name
analysis_model.interfaces.apis[].path
```

### Evidence Preservation

Maintain traceability in output:
```markdown
## UserService
*Location: src/services/user.ts*

Responsibilities:
- Handle user CRUD (src/services/user.ts:15)
- Password hashing (src/services/user.ts:45)
```

### Diagram Generation

Use preference from `meta.preferences.diagram_format`:
- `mermaid`: Generate Mermaid syntax (recommended - GitHub/GitLab native support)
- `ascii`: Generate ASCII diagrams (universal compatibility)
- `plantuml`: Generate PlantUML syntax (feature-rich)
- `excalidraw`: Generate `.excalidraw` JSON files (hand-drawn style, VS Code extension)

See [Excalidraw Output Format](excalidraw-output.md) for detailed JSON templates and generation guidance.

### Partial Model Handling

```markdown
## Dependencies

*Dependency analysis not performed. Run Phase 6 for health assessment.*
```
