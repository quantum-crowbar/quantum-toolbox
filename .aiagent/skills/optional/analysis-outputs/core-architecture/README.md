# Core Architecture Documentation Adapter

Canonical architecture documentation structure. The single source of truth that TOGAF phase outputs reference.

---

## Purpose

Generate the **primary architecture documentation** that serves as the central reference point:

- **Baseline Architecture**: Current state across all domains
- **Target Architecture**: Future state vision
- **Gap Analysis**: Differences between baseline and target
- **Risk Analysis**: Architecture risks and mitigations
- **Evolution Plan**: Roadmap with fitness functions
- **Change Management**: Change tracking and communication

---

## Design Principles

### Single Source of Truth

Core architecture docs are the canonical location for cross-cutting architecture artifacts. TOGAF phase outputs (vision, business-architecture, etc.) **link to** these docs rather than duplicating content.

```
togaf/vision/output/             → links to → core-architecture/baseline/
togaf/business-architecture/     → links to → core-architecture/gap-analysis/
togaf/migration-planning/        → links to → core-architecture/evolution-plan/
```

### Whitelist Principle

Only explicitly listed artifacts go in core. Everything else remains in phase-specific outputs:

| In Core (Whitelist) | Phase-Specific |
|---------------------|----------------|
| Baseline overview | Detailed phase deliverables |
| Target overview | Stakeholder maps |
| Gap register | Business capability maps |
| Risk register | Value stream models |
| Evolution roadmap | Application catalogs |
| Change summary | Technology standards |

### Layered Detail

Core docs provide **overview and navigation**. Detailed analysis lives in phase outputs or analysis reports.

```
core-architecture/baseline/overview.md
    ↓ links to
architecture-docs/analysis/01-technology-manifest.md
togaf/technology-architecture/output/technology-catalog.md
```

---

## Output Structure

```
{docs-directory}/core-architecture/
├── index.md                    # Executive summary and navigation
├── baseline/                   # Current state documentation
│   ├── overview.md             # Architecture overview (current)
│   ├── business.md             # Business architecture summary
│   ├── information-systems.md  # Data and application summary
│   └── technology.md           # Technology architecture summary
├── target/                     # Future state documentation
│   ├── overview.md             # Architecture vision (future)
│   ├── business.md             # Target business architecture
│   ├── information-systems.md  # Target data and applications
│   └── technology.md           # Target technology architecture
├── gap-analysis/               # Baseline vs Target comparison
│   ├── summary.md              # Gap analysis overview
│   ├── gap-register.md         # Detailed gap catalog
│   └── by-domain/              # Domain-specific gaps
│       ├── business-gaps.md
│       ├── data-gaps.md
│       ├── application-gaps.md
│       └── technology-gaps.md
├── risk-analysis/              # Architecture risks
│   ├── risk-register.md        # Risk catalog with scoring
│   └── mitigation-plans.md     # Risk mitigation strategies
├── evolution-plan/             # Migration/transformation roadmap
│   ├── roadmap.md              # Phased implementation plan
│   ├── fitness-functions.md    # Measurable evolution criteria
│   └── transition-states.md    # Intermediate architecture states
└── change-management/          # Change tracking
    ├── summary.md              # Change management overview
    └── communication-plan.md   # Stakeholder communication matrix
```

---

## Required Model Sections

| Section | Required | Used For |
|---------|----------|----------|
| `meta` | Yes | Project info, dates |
| `architecture` | Yes | Baseline structure |
| `architecture.baseline` | Yes | Current state |
| `architecture.target` | Optional | Future state (if defined) |
| `gaps` | Optional | Gap analysis |
| `risks` | Optional | Risk register |
| `roadmap` | Optional | Evolution plan |
| `changes` | Optional | Change management |

---

## Model to Output Mapping

### index.md - Executive Summary

| Model Path | Output Section |
|------------|----------------|
| `meta.project_name` | Title |
| `meta.analysis_date` | Generated date |
| `architecture.summary` | Overview paragraph |
| `quality.scores` | Health indicators |
| `recommendations.critical[]` | Key actions |

### baseline/ - Current State

| Model Path | Output Section |
|------------|----------------|
| `architecture.components[]` | Component inventory |
| `architecture.layers[]` | Layer structure |
| `technologies.*` | Technology summary |
| `interfaces.*` | Integration points |
| `data.entities[]` | Data overview |

### target/ - Future State

| Model Path | Output Section |
|------------|----------------|
| `architecture.target.components[]` | Target components |
| `architecture.target.capabilities[]` | New capabilities |
| `architecture.target.principles[]` | Guiding principles |
| `architecture.target.constraints[]` | Constraints |

### gap-analysis/ - Gaps

| Model Path | Output Section |
|------------|----------------|
| `gaps.items[]` | Gap register entries |
| `gaps.by_domain.business[]` | Business gaps |
| `gaps.by_domain.data[]` | Data gaps |
| `gaps.by_domain.application[]` | Application gaps |
| `gaps.by_domain.technology[]` | Technology gaps |
| `gaps.summary` | Gap statistics |

### risk-analysis/ - Risks

| Model Path | Output Section |
|------------|----------------|
| `risks.items[]` | Risk register entries |
| `risks.by_category.*` | Categorized risks |
| `risks.mitigations[]` | Mitigation plans |
| `risks.summary` | Risk statistics |

### evolution-plan/ - Roadmap

| Model Path | Output Section |
|------------|----------------|
| `roadmap.phases[]` | Phase definitions |
| `roadmap.milestones[]` | Key milestones |
| `roadmap.fitness_functions[]` | Success metrics |
| `roadmap.transitions[]` | Transition architectures |
| `roadmap.dependencies[]` | Initiative dependencies |

### change-management/ - Changes

| Model Path | Output Section |
|------------|----------------|
| `changes.items[]` | Change register |
| `changes.communication_plan[]` | Communication matrix |
| `changes.stakeholders[]` | Stakeholder impacts |
| `changes.review_dates[]` | Review schedule |

---

## Integration with TOGAF Phases

### How Phases Link to Core

Each TOGAF phase output includes a section linking to relevant core docs:

```markdown
## Related Core Architecture Documents

- **Baseline**: [Core Architecture Baseline](../../core-architecture/baseline/overview.md)
- **Gaps Identified**: [Gap Register](../../core-architecture/gap-analysis/gap-register.md)
- **Risks**: [Risk Register](../../core-architecture/risk-analysis/risk-register.md)
```

### Phase Contribution to Core

| Phase | Contributes To |
|-------|----------------|
| Phase A (Vision) | `target/overview.md` |
| Phase B (Business) | `baseline/business.md`, `target/business.md`, `gap-analysis/business-gaps.md` |
| Phase C (Info Systems) | `baseline/information-systems.md`, `target/information-systems.md` |
| Phase D (Technology) | `baseline/technology.md`, `target/technology.md` |
| Phase E (Opportunities) | `gap-analysis/gap-register.md` |
| Phase F (Migration) | `evolution-plan/*` |
| Phase G (Governance) | `risk-analysis/*` |
| Phase H (Change Mgmt) | `change-management/*` |

### Update Flow

```
Phase execution → Updates phase-specific output
                → Updates relevant core-architecture section
                → Cross-references maintained
```

---

## Invocation

### Standalone

```
"Generate core architecture documentation"
"Create core architecture docs"
"Build architecture baseline and target"
```

### After TOGAF Phases

```
"Compile core architecture from TOGAF outputs"
"Update core architecture with Phase B results"
```

### As Part of Multi-Output

```
"Analyze this codebase"
  ☑ Core architecture documentation
  ☐ Detailed analysis reports
```

---

## Configuration

### Output Directory

```
Where should I create the core architecture documentation?
Default: ./docs
```

Creates `core-architecture/` inside specified directory.

### Scope Selection

```
Which sections should I generate?

☑ Baseline (current state)
☐ Target (future state) - requires vision/target input
☐ Gap Analysis - requires baseline + target
☐ Risk Analysis - can generate from baseline alone
☐ Evolution Plan - requires gaps + priorities
☐ Change Management - requires evolution plan
```

### Detail Level

```
What level of detail?

○ Executive (summaries only)
● Standard (summaries + key details)
○ Comprehensive (full documentation)
```

---

## Relationship to Other Adapters

| Adapter | Relationship |
|---------|--------------|
| `architecture-docs` | Detailed analysis → Core summaries link to details |
| `structurizr` | Diagrams embedded in core docs |
| `archimate` | Enterprise views embedded in core docs |
| `coding-context` | Developer docs separate from architecture |
| `product-spec` | Product docs separate from architecture |

### Recommended Combination

For comprehensive documentation:

```
1. codebase-analysis → architecture-docs (detailed)
2. TOGAF phases → phase outputs (deliverables)
3. Compile → core-architecture (canonical summaries)
```

---

## See Also

- [Templates](templates.md) - Output templates for each section
- [architecture-docs](../architecture-docs/) - Detailed analysis reports
- [analysis-outputs](../_index.md) - Adapter family
- [TOGAF skills](../../togaf/) - Phase-specific outputs
