# Skills Documentation

> **Audience:** Humans (detailed per-skill reference)

Comprehensive documentation for all available AI agent skills in the Architecture Toolkit.

---

## Table of Contents

1. [Overview](#overview)
2. [Quick Start](#quick-start)
3. [Analysis Skills](#analysis-skills)
4. [Architecture & Modeling Skills](#architecture--modeling-skills)
5. [Development Workflow Skills](#development-workflow-skills)
6. [Output Adapters](#output-adapters)
7. [Skill Activation](#skill-activation)
8. [Invocation Patterns](#invocation-patterns)

---

## Overview

For the full skill catalog, activation guide, token budget, and loading strategy, see [skills/_index.md](../../skills/_index.md).

This document provides **detailed per-skill documentation** for each skill in the toolkit.

---

## Quick Start

### Starting a Session

```
/start
```

Runs the bootstrap skill: detects first-time setup vs. established project. Prints enabled skills, code-graph status, dependency warnings, and available commands.

### Viewing Available Skills

```
/skills
```

Lists all registered skills from `manifest.yaml` with enabled/disabled status for your project.

### Using a Skill

```
"Analyze the architecture"              → arch-analysis (default)
"Analyze this codebase"                → arch-analysis
"Extract the code graph"               → code-graph
"Analyze security posture"             → security-analysis
"Apply TOGAF Business Architecture"    → togaf/business-architecture
"Export to Structurizr"                → analysis-outputs/structurizr
"Generate presentation"                → presentation
```

### Enabling Optional Skills

In your project's `AGENTS.md`:

```markdown
## Enabled Skills

- [x] arch-analysis
- [x] code-graph
- [x] security-analysis
- [x] togaf (ADM phases)
- [x] structurizr
- [ ] nonfunctional-analysis
- [ ] roadmap-building
```


---

## Analysis Skills

### 1. Architecture Analysis *(Default entry point)*

**Location**: `skills/optional/arch-analysis/`  
**Status**: Complete — Default analysis skill

**Purpose**: Comprehensive architecture analysis of real codebases — from reconnaissance through diagnosis to evidence-based diagrams. The default entry point for all analysis work; invoked by `"Analyze the architecture"`, `"Analyze this codebase"`, `"Run analysis"`, `"Analyze this repo"`.

**Key Features**:
- Phase 0.5: Code-graph pre-check (Y/S/D dialogue; 90–98% token reduction with SQLite)
- Phase 4.0: Mandatory per-edge evidence verification before any diagram is drawn — edges sourced from `view_cross_repo_edges` on SQLite path, config files on AI-only path
- Phase 4B.6: SQL Dispatch — 13-rule routing table for SQLite-first views
- 9-phase analysis: setup → reconnaissance → tech deep-dive → interface discovery → architecture synthesis → docs audit → dependency health → data flow → error handling
- View 08 (SRE & Reliability) and View 09 (Code-Graph Summary)
- Post-work hook: auto-syncs `CONTEXT.md`, `AGENTS.md`, and commits

**Output**:
```
analysis/architecture-docs/
├── index.md
├── 01-technology-manifest.md
├── 02-interface-specification.md
├── 03-architecture-diagrams.md    ← evidence-based edges
├── 04-integration-patterns.md
├── 05-data-flow-analysis.md
├── 06-dependency-analysis.md
├── 07-infrastructure-recommendations.md
├── 08-sre-reliability.md
└── 09-code-graph.md               ← SQLite-sourced
```

**When to Use**: Default for all architecture work — onboarding, technical due diligence, architecture review, modernization planning, documentation generation.

**Invocation**:
```
"Analyze the architecture"
"Analyze this codebase"
"Run analysis"
"Analyze this repo"
```

**See Also**: [Architecture Guide](../arch-analysis-guide.md)

---

### 2. Codebase Analysis *(Deprecated — use arch-analysis)*

**Location**: `skills/optional/codebase-analysis/`  
**Status**: **Deprecated** as of v3.0.0 — retained for migration compatibility, will be removed in v4.

Use `arch-analysis` instead. See migration notes in `skills/optional/codebase-analysis/README.md`.

---

### 3. Code Graph

**Location**: `skills/optional/code-graph/`  
**Status**: Complete

**Purpose**: Extract a full call-graph from source code into `code_graph.sqlite` — enabling SQL-speed queries at near-zero token cost. Required for the SQLite-first analysis path.

**Key Features**:
- Phase 0.0: Scope & setup dialogue (single vs multi-repo)
- Phase 2.5: Incremental update — only re-extracts changed files via `git diff`
- 8 materialized view tables: `view_entry_traces`, `view_cycles`, `view_db_entry_paths`, `view_refactor_priority`, `view_cross_repo_edges`, and more
- Phase 4B.5: Auto-generates `reports/sqlite-cookbook.md` with project-specific SQL queries
- YAML stub mode: when SQLite active, YAML contains stats + `sqlite_path` pointer only

**Output**: `code_graph.sqlite` + `reports/sqlite-cookbook.md` + YAML stub

**When to Use**: Enable this skill to make arch-analysis and nonfunctional-analysis SQLite-first. Essential for medium/large codebases or multi-repo analysis.

**Dependency**: `arch-analysis` must be enabled.

**Invocation**:
```
"Extract the code graph"
"Build code graph"
"Run code-graph extraction"
```

---

### 4. Security Analysis

**Location**: `skills/optional/security-analysis/`  
**Status**: Complete

**Purpose**: Assess security posture and generate compliance framework reports.

**Key Features**:
- Vulnerability detection
- Threat modeling
- Security best practices audit
- 5 compliance frameworks:
  - OWASP ASVS (Application Security)
  - NIST Cybersecurity Framework
  - CIS Controls
  - ISO 27001
  - NIS 2 Directive

**Output**:
```
analysis/security/
├── security-analysis.md          # Human-readable findings
└── compliance/
    ├── owasp-asvs.md
    ├── nist-csf.md
    ├── cis-controls.md
    ├── iso-27001.md
    └── nis2-directive.md
```

**When to Use**:
- Security assessment
- Compliance audits
- Vulnerability identification
- Risk analysis
- Security documentation

**Typical Workflow**:
1. Run codebase analysis (optional, for context)
2. Invoke security-analysis
3. Select compliance frameworks
4. Review findings and recommendations
5. Prioritize remediation

**Invocation**:
```
"Analyze security"
"Security analysis with OWASP"
"Check compliance with NIST CSF"
"Assess security posture"
```

**Integration**:
- Can use `codebase-analysis` for context
- Standalone skill (doesn't require prior analysis)
- Outputs can be converted to PDF reports

---

### 5. Nonfunctional Analysis

**Location**: `skills/optional/nonfunctional-analysis/`  
**Status**: Complete

**Purpose**: Assess code quality, testing, configuration, and operational concerns.

**Key Features**:
- Testing coverage assessment
- Configuration audit
- Performance analysis
- Code health metrics
- Build and deployment review

**Output**:
```
analysis/nonfunctional/
├── testing-coverage.md
├── configuration-audit.md
├── performance-analysis.md
└── code-health.md
```

**When to Use**:
- Code quality assessment
- Testing strategy review
- Configuration validation
- Performance optimization
- Technical debt identification

**Typical Workflow**:
1. Run nonfunctional-analysis
2. Review each report
3. Identify improvement areas
4. Prioritize technical debt

**Invocation**:
```
"Analyze code quality"
"Check testing coverage"
"Audit configuration"
"Assess technical health"
```

---

### 6. Architecture Synthesis

**Location**: `skills/optional/architecture-synthesis/`  
**Status**: Complete

**Purpose**: Create architecture from hand-drawn diagrams, specifications, and partial documentation.

**Key Features**:
- Middle-out approach (start from existing artifacts)
- Diagram parsing: Excalidraw, Mermaid, Draw.io, ArchiMate
- Interactive resource collection
- Requirements checklist
- Integration with TOGAF phases

**Output**: Structured architecture model ready for analysis or documentation

**When to Use**:
- Starting from whiteboard diagrams
- Have partial specifications
- Collaborative architecture design
- Reverse engineering from diagrams

**Typical Workflow**:
1. Gather diagrams and specs
2. Invoke architecture-synthesis
3. Agent asks clarifying questions
4. Provide missing information
5. Agent synthesizes complete model
6. Export to desired format

**Invocation**:
```
"Synthesize architecture from diagrams"
"Create architecture from specs"
"Parse Excalidraw diagram"
```

**Supported Formats**:
- Excalidraw JSON
- Mermaid diagrams
- Draw.io XML
- ArchiMate models
- Markdown specifications

---

### 7. Fitness Functions

**Location**: `skills/optional/fitness-functions/`  
**Status**: Complete

**Purpose**: Define and implement evolutionary architecture fitness functions.

**Key Features**:
- Automated architecture governance
- Testable architecture characteristics
- Continuous validation
- Integration with CI/CD
- Metrics and monitoring

**Output**:
```
fitness-functions/
├── README.md                 # Fitness function catalog
├── tests/                    # Automated tests
└── monitoring/               # Runtime metrics
```

**When to Use**:
- Evolutionary architecture
- Architecture guardrails
- Continuous compliance
- Migration governance
- Technical standards enforcement

**Typical Workflow**:
1. Define architecture characteristics
2. Create fitness functions
3. Implement as automated tests
4. Integrate with CI/CD
5. Monitor and adjust thresholds

**Invocation**:
```
"Define fitness functions"
"Create architecture guardrails"
"Set up evolutionary architecture"
```

**Integration**:
- Works with TOGAF Phase F (Migration Planning)
- Supports Phase G (Implementation Governance)

---

### 8. Roadmap Building

**Location**: `skills/optional/roadmap-building/`  
**Status**: Complete

**Purpose**: Generates full phased implementation roadmaps from architecture analysis, TOGAF Phase E/F output, or standalone requirements. Produces initiatives, ADRs, risk register, epic/ticket breakdown with XS–XL complexity sizing and team assignments.

**Invocation**:
```
"Build a roadmap"
"Create implementation roadmap"
"Generate phased roadmap from analysis"
```

---

### 9. Roadmap Analysis

**Location**: `skills/optional/roadmap-analysis/`  
**Status**: Complete

**Purpose**: Seven-mode deep-dive analysis of an existing roadmap: expand initiative, research questions, complexity scoring, spike candidates, effort estimates, PDF export, team/financial model.

**Invocation**:
```
"Analyse this roadmap"
"Score roadmap complexity"
"Estimate effort for this roadmap"
```

---

### 10. Coding Profile

**Location**: `skills/optional/coding-profile/`  
**Status**: Complete

**Purpose**: Reads real repository code and generates per-stack coding skill files that agents load before writing code. Captures naming conventions, async style, testing framework, error handling, API design, and review standards — from actual code, not generic best practices.

**Invocation**:
```
"Build coding profile"
"Generate coding conventions from this repo"
```

---

## Architecture & Modeling Skills

### 11. Structurizr

**Location**: `skills/optional/structurizr/`  
**Status**: Complete

**Purpose**: Create and maintain C4 architecture models using Structurizr DSL.

**Key Features**:
- C4 model (Context, Container, Component, Code)
- Structurizr DSL authoring
- Workspace management
- View generation
- Export adapter available

**Output**:
```
architecture/
├── workspace.dsl
├── model/
│   ├── people.dsl
│   ├── systems.dsl
│   └── containers.dsl
└── views/
    ├── context.dsl
    └── containers.dsl
```

**When to Use**:
- C4 diagrams
- Architecture visualization
- System context modeling
- Container architecture
- Component relationships

**Typical Workflow**:
1. Create workspace
2. Define systems and containers
3. Add relationships
4. Generate views
5. Export to diagrams

**Invocation**:
```
"Create C4 model"
"Generate Structurizr workspace"
"Export to Structurizr"
```

**Integration**:
- Can export from `codebase-analysis`
- Output adapter available

---

### 12-21. TOGAF ADM Phases

**Location**: `skills/optional/togaf/`  
**Status**: All phases complete

TOGAF provides a comprehensive framework for enterprise architecture. Each phase is a separate skill:

| Phase | Skill | Purpose |
|-------|-------|---------|
| **Preliminary** | `togaf/preliminary` | Set up architecture capability |
| **Phase A** | `togaf/vision` | Architecture Vision |
| **Phase B** | `togaf/business-architecture` | Business capabilities, processes |
| **Phase C** | `togaf/information-systems` | Data and application architecture |
| **Phase D** | `togaf/technology-architecture` | Infrastructure and platforms |
| **Phase E** | `togaf/opportunities-solutions` | Evaluate solutions |
| **Phase F** | `togaf/migration-planning` | Plan transformation |
| **Phase G** | `togaf/implementation-governance` | Govern implementation |
| **Phase H** | `togaf/change-management` | Manage changes |

**Common Features**:
- TOGAF-compliant deliverables
- Templates and checklists
- Stakeholder engagement
- Decision frameworks
- Artifact management

**When to Use TOGAF**:
- Enterprise architecture
- Large transformations
- Formal governance required
- Multi-year roadmaps
- Regulatory compliance

**Invocation Patterns**:
```
"Apply TOGAF"                          → Guide to appropriate phase
"Create Architecture Vision"           → Phase A
"Develop Business Architecture"        → Phase B
"Map business capabilities"            → Phase B specific task
"Plan migration roadmap"               → Phase F
"Assess architecture compliance"       → Phase G
```

**See Also**: [TOGAF Index](../../skills/optional/togaf/_index.md)

---

## Development Workflow Skills

### 22. Bootstrap *(Core — Session Lifecycle)*

**Location**: `skills/core/bootstrap/`  
**Status**: Complete — Core skill (always active)

**Purpose**: Standardised session entry point and upgrade lifecycle. Provides `/start`, `/help`, `/skills`, `/update`, `/upgrade`.

**When to Use**: Run `/start` at the beginning of every session.

**See Also**: [Bootstrap README](../../skills/core/bootstrap/README.md)

---

### 23. Git Workflow *(Core — Always Active)*

**Location**: `skills/core/git-workflow/`  
**Status**: Complete

**Purpose**: Best practices for git operations.

**Key Features**:
- Conventional commits
- Branching strategies
- Pull request workflow
- Commit message format
- Code review process

**When to Use**: Always active (core skill)

**Invocation**: Automatic during git operations

**See Also**: [Git Workflow README](../../skills/core/git-workflow/README.md)

---

### 24. Todo Workflow

**Location**: `skills/optional/todo-workflow/`  
**Status**: Complete

**Purpose**: Autonomous task-based development with progress tracking.

**Key Features**:
- Task breakdown
- Progress tracking
- Sequential execution
- Checkpoint management
- Status reporting

**When to Use**:
- Multi-step tasks
- Complex features
- Refactoring work
- Systematic development

**Invocation**:
```
"Use todo workflow"
"Break this into tasks"
"Track progress on this feature"
```

---

### 25. Update Logs

**Location**: `skills/optional/update-logs/`  
**Status**: Complete

**Purpose**: Structured log generation for project update communications — changelogs, release notes, sprint summaries.

**Invocation**:
```
"Generate update log"
"Write release notes"
"Create sprint summary"
```

---

## Output Adapters

Output adapters transform analysis results into different formats.

### 26. Core Architecture

**Location**: `skills/optional/analysis-outputs/core-architecture/`  
**Status**: Complete

**Purpose**: Canonical TOGAF documentation structure.

**Output**:
```
analysis/core-architecture/
├── baseline/              # Current state
├── target/                # Future state
├── gap-analysis/          # Differences
├── risk-analysis/         # Risks and mitigations
└── evolution-plan/        # Roadmap and transitions
```

**When to Use**:
- TOGAF projects
- Enterprise architecture
- Source of truth needed

---

### 27. Architecture Docs

**Location**: `skills/optional/analysis-outputs/architecture-docs/`  
**Status**: Complete

**Purpose**: Detailed technical architecture documentation.

**Output**: 7 comprehensive markdown reports (as described in arch-analysis)

**When to Use**:
- Technical documentation
- Developer onboarding
- Architecture reviews

---

### 28. Coding Context

**Location**: `skills/optional/analysis-outputs/coding-context/`  
**Status**: Complete

**Purpose**: Generate AI agent context files.

**Output**:
```
AGENTS.md       # Guidelines for AI coding assistants
CONTEXT.md      # Current project state
```

**When to Use**:
- New project setup
- AI-assisted development
- Context documentation

---

### 29. Product Spec

**Location**: `skills/optional/analysis-outputs/product-spec/`  
**Status**: Complete

**Purpose**: Product documentation from codebase.

**Output**:
```
product-spec/
├── features.md
├── user-flows.md
└── data-model.md
```

**When to Use**:
- Product documentation
- Stakeholder communication
- Reverse engineering specs

---

### 30. Structurizr Export

**Location**: `skills/optional/analysis-outputs/structurizr/`  
**Status**: Complete

**Purpose**: Convert analysis to Structurizr DSL.

**Output**: `workspace.dsl` with C4 model

**When to Use**:
- Automated C4 generation
- Visualization pipeline
- Diagram generation

---

### 31. ArchiMate Export

**Location**: `skills/optional/analysis-outputs/archimate/`  
**Status**: Complete

**Purpose**: Convert to ArchiMate enterprise architecture format.

**Output**: ArchiMate XML model

**When to Use**:
- Enterprise architecture tools
- Archimate compliance
- Tool integration

---

### 32. Excalidraw Import

**Location**: `skills/optional/analysis-outputs/excalidraw-import.md`  
**Status**: Complete

**Purpose**: Parses `.excalidraw` JSON files and feeds them into the architecture model. 5-phase pipeline: parse elements → map colours to component roles → disambiguation dialogue → write Mermaid diagram → optionally pre-populate `architecture_model` and hand off to `arch-analysis`.

**Invocation**:
```
"Analyse this excalidraw file"
"Convert excalidraw to Mermaid"
"Use this excalidraw as architecture input"
```

---

### 33. Presentation

**Location**: `skills/optional/analysis-outputs/presentation/`  
**Status**: Complete

**Purpose**: Generate presentations from architecture documentation.

**Output**:
```
presentations/topic/
├── slides.md          # Marp markdown
├── slides.pptx        # PowerPoint export
├── slides.pdf         # PDF export
└── slides.html        # HTML export
```

**Key Features**:
- Marp CLI integration
- Multiple export formats
- Diagram embedding
- Custom themes

**When to Use**:
- Stakeholder presentations
- Architecture reviews
- Executive summaries

**Invocation**:
```
"Generate presentation"
"Create slides from architecture docs"
"Export to PowerPoint"
```

**See Also**: [Presentation README](../../skills/optional/analysis-outputs/presentation/README.md)

---

### 34. PDF Report

**Location**: `skills/optional/analysis-outputs/pdf-report/`  
**Status**: Complete

**Purpose**: Convert markdown reports to professional PDF documents.

**Output**:
```
analysis/pdf/
├── architecture-analysis.pdf  # Combined report
├── 01-tech-stack.pdf
├── 02-components.pdf
└── ...
```

**Key Features**:
- Pandoc-based generation
- Diagram rendering
- TOC and bookmarks
- Syntax highlighting
- Custom styling
- Batch processing

**When to Use**:
- Stakeholder delivery
- Archival documentation
- Compliance reports
- Executive presentations

**Invocation**:
```
"Export to PDF"
"Generate PDF report"
"Convert reports to PDF"
```

**See Also**: [PDF Report README](../../skills/optional/analysis-outputs/pdf-report/README.md)

---

## Skill Activation

### Core Skills (Always Active)

- `bootstrap` — Session lifecycle (`/start`, `/help`, `/skills`, `/update`, `/upgrade`)
- `git-workflow` — Git conventions and commit format

### Optional Skills (Opt-In)

Enable in your project's `AGENTS.md`:

```markdown
## Enabled Skills

- [x] arch-analysis
- [x] code-graph
- [x] security-analysis
- [x] togaf (ADM phases)
- [x] structurizr
- [ ] nonfunctional-analysis
- [ ] roadmap-building
- [ ] roadmap-analysis
- [ ] coding-profile
```

---

## Invocation Patterns

### Discovery

```
/start       ← orient the agent at session start
/skills      ← list all registered skills
/help        ← full command reference
```

### Direct Invocation

```
"Analyze the architecture"           → arch-analysis (default)
"Analyze this codebase"             → arch-analysis
"Extract the code graph"            → code-graph
"Analyse this excalidraw file"      → excalidraw-import
"Analyze security with OWASP"       → security-analysis
"Apply TOGAF Business Architecture" → togaf/business-architecture
"Create C4 model"                   → structurizr
"Generate presentation"             → presentation
"Export to PDF"                     → pdf-report
```

### Task-Specific

```
"Map business capabilities"          → TOGAF Phase B
"Assess threat model"                → Security Analysis
"Check testing coverage"             → Nonfunctional Analysis
"Create fitness functions"           → Fitness Functions
"Plan migration roadmap"             → TOGAF Phase F
```

### Output Selection

```
"Output as architecture-docs"
"Export to Structurizr"
"Generate AGENTS.md"
"Create PDF report"
"Make a presentation"
```

---

## Additional Resources

- [Skills Index](../../skills/_index.md) - Full skill listing
- [TOGAF Index](../../skills/optional/togaf/_index.md) - ADM phases guide
- [Analysis Outputs Index](../../skills/optional/analysis-outputs/_index.md) - Export formats
- [Architecture Guide](../arch-analysis-guide.md) - Analysis methodology
- [AGENTS.md](../../AGENTS.md) - Agent entry point and reading order

---

## Contributing

To add new skills or improve documentation:

1. Follow the 5-file standard structure
2. Update `skills/_index.md` and `skills/manifest.yaml`
3. Submit pull request

See [CONTRIBUTING.md](../../CONTRIBUTING.md) for the full contribution guide, PR process, and release checklist.
