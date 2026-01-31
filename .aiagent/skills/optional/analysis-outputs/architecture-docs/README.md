# Architecture Documentation Adapter

Transforms codebase analysis into comprehensive architecture documentation.

---

## Purpose

Generate structured architecture documentation from analysis model:
- Technology manifest
- Interface specifications
- Architecture diagrams
- Documentation audit
- Dependency health
- Data flow maps
- Error handling patterns

---

## Output Structure

```
{docs-directory}/architecture-docs/
├── index.md                              # Main entry, executive summary
└── analysis/
    ├── 01-technology-manifest.md         # Languages, frameworks, libraries
    ├── 02-interface-specification.md     # APIs, events, integrations
    ├── 03-architecture-diagrams.md       # Visual system overview
    ├── 04-documentation-audit.md         # Existing docs assessment
    ├── 05-dependency-health.md           # Package health, vulnerabilities
    ├── 06-data-flow-map.md               # Data lifecycle and movement
    └── 07-error-handling.md              # Error patterns and recovery
```

---

## Required Model Sections

| Section | Required | Used For |
|---------|----------|----------|
| `meta` | Yes | Project info, dates |
| `technologies` | Yes | Technology manifest |
| `interfaces` | Yes | Interface specification |
| `architecture` | Yes | Architecture diagrams |
| `reconnaissance` | Optional | Documentation audit |
| `dependencies` | Optional | Dependency health |
| `data` | Optional | Data flow map |
| `error_handling` | Optional | Error handling report |
| `quality` | Optional | Executive summary |
| `recommendations` | Optional | Action items |

---

## Model to Output Mapping

### 01 - Technology Manifest

| Model Path | Output Section |
|------------|----------------|
| `technologies.languages[]` | Languages table |
| `technologies.frameworks[]` | Frameworks table |
| `technologies.libraries[]` | Libraries by category |
| `technologies.infrastructure[]` | Infrastructure table |
| `technologies.build_tools[]` | Build & tooling section |

### 02 - Interface Specification

| Model Path | Output Section |
|------------|----------------|
| `interfaces.apis[]` | REST/GraphQL endpoints |
| `interfaces.events[]` | Event/message catalog |
| `interfaces.integrations[]` | External integrations |
| `interfaces.cli[]` | CLI commands |

### 03 - Architecture Diagrams

| Model Path | Output Diagram |
|------------|----------------|
| `architecture.components[]` | Component diagram |
| `architecture.layers[]` | Layer diagram |
| `interfaces.apis[]` + handlers | Sequence diagrams |
| `data.flows[]` | Data flow diagram |

### 04 - Documentation Audit

| Model Path | Output Section |
|------------|----------------|
| `reconnaissance.documentation[]` | Inventory table |
| Comparison: model vs docs | Discrepancy report |
| Missing items | Gap list |

### 05 - Dependency Health

| Model Path | Output Section |
|------------|----------------|
| `dependencies.packages[]` | Package inventory |
| `dependencies.packages[].vulnerabilities[]` | Security report |
| `dependencies.health_summary` | Risk summary |

### 06 - Data Flow Map

| Model Path | Output Section |
|------------|----------------|
| `data.entities[]` | Entity catalog |
| `data.flows[]` | Flow diagrams |
| `data.lifecycle[]` | Lifecycle documentation |

### 07 - Error Handling

| Model Path | Output Section |
|------------|----------------|
| `error_handling.patterns[]` | Pattern inventory |
| `error_handling.propagation[]` | Propagation diagram |
| `error_handling.gaps[]` | Gap analysis |
| `error_handling.logging` | Observability section |

---

## Invocation

```
"Generate architecture documentation"
"Create architecture docs"
"Document the architecture"
```

Or as part of multi-output:
```
"Analyze this codebase"
  ☑ Architecture documentation
```

---

## Configuration

### Output Directory

Prompt user for documentation directory:
```
Where should I create the architecture documentation?
Default: ./docs
```

Creates `architecture-docs/` inside specified directory.

### Diagram Format

Use `meta.preferences.diagram_format`:
- `mermaid` (default): Mermaid.js syntax
- `ascii`: ASCII art diagrams
- `plantuml`: PlantUML syntax

---

## Backwards Compatibility

This adapter replaces direct `arch-analysis` output.

`arch-analysis` skill now:
1. Runs `codebase-analysis`
2. Applies `architecture-docs` adapter

Same output, refactored implementation.

---

## See Also

- [Templates](templates.md) - Output templates
- [codebase-analysis](../../codebase-analysis/) - Analysis engine
- [analysis-outputs](../_index.md) - Adapter family
