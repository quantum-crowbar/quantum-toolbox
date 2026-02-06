# Codebase Analysis Skill

Base analysis engine for comprehensive codebase understanding. Produces a structured analysis model that output adapters transform into various formats.

---

## Purpose

This skill performs deep codebase analysis to understand:
- Technology stack and dependencies
- API and integration interfaces
- Architecture and component structure
- Data models and flows
- Dependency health and vulnerabilities
- Error handling patterns

The analysis produces a structured **analysis model** that can be transformed by output adapters into:
- Architecture documentation
- Coding context (AGENTS.md, CONTEXT.md)
- Product specifications
- C4 models (Structurizr DSL)
- ArchiMate models

---

## When to Use

This skill is invoked automatically when using analysis output adapters, or can be run directly:

**Direct invocation**:
```
"Analyze this codebase"
"Run codebase analysis"
"Understand this repository"
```

**Through output adapters**:
```
"Generate architecture documentation"     → codebase-analysis + architecture-docs
"Create coding context for AI agents"     → codebase-analysis + coding-context
"Extract product specifications"          → codebase-analysis + product-spec
"Generate C4 model"                       → codebase-analysis + structurizr
```

---

## Analysis Phases

| Phase | Focus | Model Section |
|-------|-------|---------------|
| **0: Setup** | Establish preferences, output adapters | - |
| **1: Reconnaissance** | Find existing documentation | `reconnaissance` |
| **2: Technology Stack** | Languages, frameworks, libraries | `technologies` |
| **3: Interface Mapping** | APIs, events, integrations | `interfaces` |
| **4: Architecture Synthesis** | Components, layers, patterns | `architecture` |
| **5: Data Flow** | Entities, relationships, lifecycle | `data` |
| **6: Dependency Health** | Outdated, vulnerable packages | `dependencies` |
| **7: Error Handling** | Error patterns, gaps, logging | `error_handling` |

---

## Analysis Model

The analysis produces a structured model defined in [analysis-model.md](analysis-model.md).

Key sections:
- `meta` - Project metadata
- `technologies` - Tech stack discovery
- `interfaces` - API and integration mapping
- `architecture` - Component and pattern analysis
- `data` - Entity and flow mapping
- `dependencies` - Package health assessment
- `error_handling` - Error pattern analysis
- `quality` - Overall quality indicators
- `recommendations` - Prioritized findings

---

## Output Adapters

Analysis results are transformed by adapters in `analysis-outputs/`:

| Adapter | Output | Use Case |
|---------|--------|----------|
| `architecture-docs` | 7 markdown reports + index | Architecture understanding |
| `coding-context` | AGENTS.md, CONTEXT.md | AI coding assistance |
| `product-spec` | Features, flows, data model | Product documentation |
| `structurizr` | workspace.dsl | C4 architecture diagrams |
| `archimate` | ArchiMate XML/PlantUML | Enterprise architecture |

See `analysis-outputs/_index.md` for adapter selection.

---

## Workflow

### Single Output

```
User: "Generate architecture documentation"
    ↓
1. Run codebase-analysis (Phases 1-7)
2. Build analysis model
3. Apply architecture-docs adapter
4. Output to {docs}/architecture-docs/
```

### Multiple Outputs

```
User: "Analyze this repo"
    ↓
1. Prompt: Which outputs do you need?
   ☑ Architecture documentation
   ☑ Coding context
   ☐ Product specification
   ☐ C4 model
    ↓
2. Run codebase-analysis ONCE
3. Apply selected adapters in sequence
4. Output all selected formats
```

---

## Prerequisites

- Codebase accessible for reading
- Common package manager files (package.json, requirements.txt, go.mod, etc.)
- Standard project structure (src/, lib/, tests/, etc.)

Works best with:
- Clear directory organization
- Type definitions (TypeScript, Python type hints, etc.)
- Existing documentation (README, API docs)

---

## Excluded Files

Analysis automatically excludes AI agent configuration:
- AI toolkit submodule directory (e.g., `.ai-toolkit/`)
- `.aider/`, `.cursor/`, `.continue/`
- `AGENTS.md`, `CLAUDE.md`, `.cursorrules`

These contain agent instructions, not application architecture.

---

## Integration

### With arch-analysis

`arch-analysis` is now an alias that runs:
1. `codebase-analysis` (this skill)
2. `architecture-docs` adapter

For backwards compatibility, "Analyze the architecture" still works as before.

### With security-analysis

Security analysis can consume the analysis model for:
- Known CVEs from `dependencies.packages.vulnerabilities`
- API surface from `interfaces.apis`
- Data flow from `data.flows`

```
codebase-analysis → analysis model
                  ↓
security-analysis (enhanced with baseline)
```

---

## Partial Analysis

For faster analysis or specific needs, individual phases can be run:

```
"Just analyze the API endpoints"          → Phase 3 only
"Check dependency health"                 → Phase 6 only
"Map the data flow"                       → Phase 5 only
```

Adapters handle partial models gracefully, marking missing sections as "Not analyzed".

---

## References

- [Analysis Model](analysis-model.md) - Internal data model spec
- [Workflows](workflows.md) - Step-by-step procedures
- [Checklist](checklist.md) - Analysis completion tracking
- [Output Adapters](../analysis-outputs/_index.md) - Available output formats
