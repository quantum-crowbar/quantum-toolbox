# Skills Documentation

Comprehensive documentation for all available AI agent skills in the Architecture Toolkit.

---

## Table of Contents

1. [Overview](#overview)
2. [Quick Start](#quick-start)
3. [Skill Categories](#skill-categories)
4. [Analysis Skills](#analysis-skills)
5. [Architecture & Modeling Skills](#architecture--modeling-skills)
6. [Development Workflow Skills](#development-workflow-skills)
7. [Output Adapters](#output-adapters)
8. [Skill Activation](#skill-activation)
9. [Invocation Patterns](#invocation-patterns)
10. [Skill Dependencies](#skill-dependencies)

---

## Overview

The Architecture Toolkit provides **25+ specialized skills** organized into 4 main categories:

| Category | Count | Purpose |
|----------|-------|---------|
| **Analysis** | 6 | Understand codebases and systems |
| **Architecture & Modeling** | 11 | TOGAF ADM, Structurizr, enterprise patterns |
| **Workflow** | 2 | Git operations, task management |
| **Output Adapters** | 8 | Export to various formats |

### Skill Structure

Each skill contains 5 standard files:

| File | Purpose |
|------|---------|
| `README.md` | Concepts, principles, guidelines |
| `workflows.md` | Step-by-step procedures |
| `templates.md` | Reusable document formats |
| `checklist.md` | Quick reference for reviews |
| `examples.md` | Concrete demonstrations |

---

## Quick Start

### Viewing Available Skills

```
"What skills do you have?"
"List available analysis skills"
"Show me TOGAF skills"
```

### Using a Skill

```
"Analyze the architecture"              → arch-analysis
"Analyze security posture"              → security-analysis
"Apply TOGAF Business Architecture"     → togaf/business-architecture
"Export to Structurizr"                 → analysis-outputs/structurizr
"Generate presentation"                 → presentation
```

### Enabling Optional Skills

In your project's `AGENTS.md`:

```markdown
## Enabled Skills

- [x] arch-analysis
- [x] security-analysis
- [x] togaf (ADM phases)
- [x] structurizr
- [ ] software-design (optional)
```

---

## Skill Categories

### Analysis Skills

**Purpose**: Understand codebases, identify patterns, assess quality and security.

| Skill | Use When |
|-------|----------|
| `codebase-analysis` | Base analysis engine (internal) |
| `arch-analysis` | Document architecture comprehensively |
| `security-analysis` | Assess security posture + compliance |
| `nonfunctional-analysis` | Check testing, config, performance |
| `architecture-synthesis` | Start from diagrams/specs |
| `fitness-functions` | Define architecture guardrails |

### Architecture & Modeling Skills

**Purpose**: Apply enterprise architecture frameworks, create architectural models.

| Skill | Use When |
|-------|----------|
| `structurizr` | Create C4 diagrams |
| `togaf/preliminary` | Set up architecture capability |
| `togaf/vision` | Define architecture vision |
| `togaf/business-architecture` | Model capabilities, processes |
| `togaf/information-systems` | Data and application architecture |
| `togaf/technology-architecture` | Infrastructure design |
| `togaf/opportunities-solutions` | Evaluate implementation options |
| `togaf/migration-planning` | Plan transformation roadmap |
| `togaf/implementation-governance` | Govern implementation |
| `togaf/change-management` | Manage architecture changes |

### Development Workflow Skills

**Purpose**: Software development best practices.

| Skill | Use When |
|-------|----------|
| `git-workflow` | Commits, branching, PRs (always active) |
| `todo-workflow` | Autonomous task management |

### Output Adapters

**Purpose**: Export analysis results to different formats.

| Adapter | Use When |
|---------|----------|
| `core-architecture` | TOGAF canonical documentation |
| `architecture-docs` | Detailed technical analysis |
| `coding-context` | Generate AGENTS.md, CONTEXT.md |
| `product-spec` | Product documentation |
| `structurizr` | C4 model DSL |
| `archimate` | Enterprise architecture XML |
| `presentation` | Slide decks (Marp, PPTX, PDF) |
| `pdf-report` | PDF reports from markdown |

---

## Analysis Skills

### 1. Codebase Analysis (Base Engine)

**Location**: `skills/optional/codebase-analysis/`  
**Status**: Complete

**Purpose**: Base analysis engine that produces a structured analysis model consumed by output adapters.

**Key Features**:
- 8-phase analysis workflow
- Structured data model
- Technology manifest
- Dependency mapping
- Interface discovery
- Data flow analysis

**Output**: Internal analysis model (JSON/structured format)

**When to Use**:
- As foundation for other analysis skills
- When you need machine-readable analysis results
- For custom output adapter development

**Typical Workflow**:
1. Invoke codebase-analysis
2. Select output adapter(s)
3. Generate formatted outputs

**Invocation**:
```
"Run codebase analysis"
"Analyze this codebase"
```

---

### 2. Architecture Analysis

**Location**: `skills/optional/arch-analysis/`  
**Status**: Complete

**Purpose**: Generate comprehensive architecture documentation for unfamiliar codebases.

**Key Features**:
- 8-phase analysis process
- 7 detailed markdown reports
- Technology stack inventory
- Component architecture mapping
- Integration patterns
- Data flow analysis
- Dependency visualization
- Infrastructure design
- Recommendations

**Output**: 
```
analysis/architecture-docs/
├── index.md
├── 01-technology-manifest.md
├── 02-interface-specification.md
├── 03-component-architecture.md
├── 04-integration-patterns.md
├── 05-data-flow-analysis.md
├── 06-dependency-analysis.md
└── 07-infrastructure-recommendations.md
```

**When to Use**:
- Onboarding to new codebase
- Technical due diligence
- Architecture review
- Modernization planning
- Documentation generation

**Typical Workflow**:
1. Navigate to repository root
2. Invoke arch-analysis
3. Wait for analysis completion (~15-30 min)
4. Review generated documentation
5. Export to other formats if needed

**Invocation**:
```
"Analyze the architecture"
"Document this system's architecture"
"Run architecture analysis"
```

**Integration**:
- Uses `codebase-analysis` internally
- Outputs to `architecture-docs` adapter
- Can feed TOGAF baseline assessment

**See Also**: [Architecture Guide](../arch-analysis-guide.md)

---

### 3. Security Analysis

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

### 4. Nonfunctional Analysis

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

### 5. Architecture Synthesis

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

### 6. Fitness Functions

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

## Architecture & Modeling Skills

### 7. Structurizr

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

### 8-17. TOGAF ADM Phases

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

### 18. Git Workflow (Core - Always Active)

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

### 19. Todo Workflow

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

## Output Adapters

Output adapters transform analysis results into different formats. They consume the structured analysis model from `codebase-analysis`.

### 20. Core Architecture

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

### 21. Architecture Docs

**Location**: `skills/optional/analysis-outputs/architecture-docs/`  
**Status**: Complete

**Purpose**: Detailed technical architecture documentation.

**Output**: 7 comprehensive markdown reports (as described in arch-analysis)

**When to Use**:
- Technical documentation
- Developer onboarding
- Architecture reviews

---

### 22. Coding Context

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

### 23. Product Spec

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

### 24. Structurizr Export

**Location**: `skills/optional/analysis-outputs/structurizr/`  
**Status**: Complete

**Purpose**: Convert analysis to Structurizr DSL.

**Output**: `workspace.dsl` with C4 model

**When to Use**:
- Automated C4 generation
- Visualization pipeline
- Diagram generation

---

### 25. ArchiMate Export

**Location**: `skills/optional/analysis-outputs/archimate/`  
**Status**: Complete

**Purpose**: Convert to ArchiMate enterprise architecture format.

**Output**: ArchiMate XML model

**When to Use**:
- Enterprise architecture tools
- Archimate compliance
- Tool integration

---

### 26. Presentation

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

### 27. PDF Report

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

- `git-workflow` - Always available

### Optional Skills (Opt-In)

Enable in your project's `AGENTS.md`:

```markdown
## Enabled Skills

### Analysis
- [x] arch-analysis
- [x] security-analysis
- [ ] nonfunctional-analysis

### Architecture
- [x] togaf
- [x] structurizr

### Workflows
- [x] todo-workflow

### Output Adapters
- [x] architecture-docs
- [x] pdf-report
- [x] presentation
```

---

## Invocation Patterns

### Discovery

```
"What skills do you have?"
"List available analysis skills"
"Show me TOGAF skills"
"What can you help me with?"
```

### Direct Invocation

```
"Analyze the architecture"
"Analyze security with OWASP"
"Apply TOGAF Business Architecture"
"Create C4 model"
"Generate presentation"
"Export to PDF"
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

## Skill Dependencies

| Skill | Prerequisites | Optional Dependencies |
|-------|--------------|----------------------|
| `arch-analysis` | None | `codebase-analysis` (uses internally) |
| `security-analysis` | None | `arch-analysis` (recommended) |
| `nonfunctional-analysis` | None | `codebase-analysis` (optional) |
| `architecture-synthesis` | None | None |
| `fitness-functions` | None | `togaf/migration-planning` (optional) |
| `structurizr` | None | None |
| `togaf/*` | None | `arch-analysis` (for baseline) |
| `todo-workflow` | `git-workflow` | None |
| `analysis-outputs/*` | `codebase-analysis` | Varies by adapter |

---

## Additional Resources

- [Skills Index](../../skills/_index.md) - Full skill listing
- [TOGAF Index](../../skills/optional/togaf/_index.md) - ADM phases guide
- [Analysis Outputs Index](../../skills/optional/analysis-outputs/_index.md) - Export formats
- [Architecture Guide](../arch-analysis-guide.md) - Analysis methodology
- [AI Toolkit Context](../../AI_TOOLKIT_CONTEXT.md) - Complete repository context

---

## Contributing

To add new skills or improve documentation:

1. Follow the 5-file standard structure
2. Update this index
3. Update AI_TOOLKIT_CONTEXT.md
4. Submit pull request

See [AGENTS.md](../../AGENTS.md) for contribution guidelines.
