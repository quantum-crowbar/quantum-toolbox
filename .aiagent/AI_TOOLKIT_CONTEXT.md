# AI Toolkit Context

> **Repository**: AI Agent Toolbox for Architects
> **Purpose**: Reusable submodule providing standardized instructions, workflows, and skills for AI coding agents
> **Last Updated**: 2026-02-05

---

## What This Is

This repository is a **git submodule-based toolbox** that equips AI coding assistants with:
- Architectural analysis skills
- Enterprise architecture patterns (TOGAF ADM, C4 modeling)
- Development workflows (Git conventions, task management, code quality)
- Templates & checklists for consistent deliverables

Designed for software architects and senior developers who want their AI assistants to work systematically.

---

## Repository Structure

```
.
├── .aiagent/                          # Main agent toolbox (submodule entry point)
│   ├── AGENTS.md                      # Submodule entry point & instructions
│   ├── AI_TOOLKIT_CONTEXT.md          # This context file
│   ├── core/                          # Always-loaded base documentation
│   │   ├── instructions.md            # Coding rules, bash safety guidelines
│   │   ├── workflows.md               # Development processes
│   │   ├── architecture-thinking.md   # TOGAF foundations, stakeholder thinking
│   │   └── glossary.md                # Standard terminology
│   ├── skills/                        # Tiered skill packages
│   │   ├── _index.md                  # Skill manifest and activation guide
│   │   ├── core/                      # Always-on skills
│   │   │   └── git-workflow/          # Git best practices, branching, commits
│   │   └── optional/                  # Opt-in skills
│   │       ├── codebase-analysis/     # Base analysis engine
│   │       ├── arch-analysis/         # 8-phase architecture analysis
│   │       ├── security-analysis/     # Security posture + compliance frameworks
│   │       ├── nonfunctional-analysis/# Testing, config, performance, health
│   │       ├── architecture-synthesis/# Middle-out from diagrams/specs
│   │       ├── fitness-functions/     # Evolutionary architecture fitness
│   │       ├── structurizr/           # C4 architecture modeling with DSL
│   │       ├── togaf/                 # TOGAF ADM phases A-H (with fitness integration)
│   │       ├── analysis-outputs/      # Output adapters (core-architecture, docs, context, etc.)
│   │       ├── software-design/       # Design principles, patterns
│   │       ├── tech-stack-decisions/  # Technology evaluation, ADRs
│   │       ├── code-conventions/      # Style guides, naming standards
│   │       └── presentation/          # Marp CLI presentation generation
│   └── templates/                     # Project customization templates
│       ├── AGENTS.template.md         # Template for project-level AGENTS.md
│       ├── CONTEXT.template.md        # Template for project-level CONTEXT.md
│       ├── COMMIT.md                  # Conventional commit format
│       └── PULL_REQUEST.md            # PR template with checklist
├── docs/ai/                           # Human-readable documentation
│   ├── README.md                      # Documentation index
│   └── arch-analysis-guide.md         # How to analyze unfamiliar codebases
├── specs/ai/                          # Developer specifications & roadmaps
│   ├── README.md                      # Specs index
│   ├── ROADMAP-TRACKER.md             # Master tracking for all roadmaps
│   ├── arch-analysis-skills-roadmap.md
│   ├── codebase-analysis-refactor-spec.md
│   ├── security-analysis-skill-spec.md
│   ├── structurizr-skills-spec.md
│   ├── togaf-skill-family-roadmap.md
│   └── workflow-system-spec.md
└── README.md                          # Main repository README
```

---

## Available Skills

### Analysis Skills

| Skill | Location | Status | Description |
|-------|----------|--------|-------------|
| **codebase-analysis** | `skills/optional/codebase-analysis/` | ✅ Complete | Base analysis engine with structured output model |
| **arch-analysis** | `skills/optional/arch-analysis/` | ✅ Complete | 8-phase architecture documentation workflow |
| **security-analysis** | `skills/optional/security-analysis/` | ✅ Complete | Security posture + 4 compliance frameworks (OWASP, NIST, CIS, ISO) |
| **nonfunctional-analysis** | `skills/optional/nonfunctional-analysis/` | ✅ Complete | Testing, config, performance, code health |
| **architecture-synthesis** | `skills/optional/architecture-synthesis/` | ✅ Complete | Middle-out from diagrams + specs |
| **fitness-functions** | `skills/optional/fitness-functions/` | ✅ Complete | Evolutionary architecture fitness measurement |

### Architecture & Modeling Skills

| Skill | Location | Status | Description |
|-------|----------|--------|-------------|
| **structurizr** | `skills/optional/structurizr/` | ✅ Complete | C4 architecture modeling with Structurizr DSL |
| **togaf/vision** | `skills/optional/togaf/vision/` | ✅ Complete | Phase A: Architecture Vision |
| **togaf/business-architecture** | `skills/optional/togaf/business-architecture/` | ✅ Complete | Phase B: Capabilities, value streams, processes |
| **togaf/information-systems** | `skills/optional/togaf/information-systems/` | ✅ Complete | Phase C: Data and application architecture |
| **togaf/technology-architecture** | `skills/optional/togaf/technology-architecture/` | ✅ Complete | Phase D: Infrastructure and platforms |
| **togaf/opportunities-solutions** | `skills/optional/togaf/opportunities-solutions/` | ✅ Complete | Phase E: Opportunities and Solutions |
| **togaf/migration-planning** | `skills/optional/togaf/migration-planning/` | ✅ Complete | Phase F: Migration Planning |
| **togaf/implementation-governance** | `skills/optional/togaf/implementation-governance/` | ✅ Complete | Phase G: Implementation Governance |
| **togaf/change-management** | `skills/optional/togaf/change-management/` | ✅ Complete | Phase H: Change Management |

### Development Workflow Skills

| Skill | Location | Status | Description |
|-------|----------|--------|-------------|
| **git-workflow** | `skills/core/git-workflow/` | ✅ Complete | Commit conventions, branching, PR workflow |
| **todo-workflow** | (in core/workflows.md) | ✅ Complete | Task tracking and autonomous development |
| **software-design** | `skills/optional/software-design/` | ✅ Complete | Design principles, patterns, decisions |
| **tech-stack-decisions** | `skills/optional/tech-stack-decisions/` | ✅ Complete | Technology evaluation frameworks, ADRs |
| **code-conventions** | `skills/optional/code-conventions/` | ✅ Complete | Style guides and standards |
| **presentation** | `skills/optional/presentation/` | ✅ Complete | Marp CLI slide generation (PPTX, PDF) |

### Output Adapters

| Adapter | Location | Status | Description |
|---------|----------|--------|-------------|
| **core-architecture** | `analysis-outputs/core-architecture/` | ✅ Complete | Canonical source of truth for TOGAF |
| **architecture-docs** | `analysis-outputs/architecture-docs/` | ✅ Complete | Detailed analysis documentation |
| **coding-context** | `analysis-outputs/coding-context/` | ✅ Complete | AGENTS.md and CONTEXT.md for AI context |
| **product-spec** | `analysis-outputs/product-spec/` | ✅ Complete | Product documentation (features, flows, data model) |
| **structurizr** | `analysis-outputs/structurizr/` | ✅ Complete | C4 model in Structurizr DSL |
| **archimate** | `analysis-outputs/archimate/` | ✅ Complete | ArchiMate enterprise architecture format |

---

## Invokable Commands

| Command | What It Does |
|---------|--------------|
| "Analyze the architecture" | Run full 8-phase codebase analysis |
| "Analyze security" | Security assessment with compliance reports |
| "Analyze code quality" | Testing, config, performance, health check |
| "Synthesize architecture from diagrams" | Parse Excalidraw/Mermaid/Draw.io into model |
| "Define fitness functions" | Evolutionary architecture fitness assessment |
| "Analyze system fitness" | Measure system against fitness functions |
| "Create C4 model" | Generate Structurizr architecture diagrams |
| "Apply TOGAF" | Enterprise architecture using ADM phases |
| "Generate core architecture docs" | Canonical documentation structure |
| "Use todo workflow" | Autonomous task-based development |
| "Generate presentation" | Create slide decks (PPTX, PDF) from Markdown |

---

## Skill Package Standard Structure

Each skill follows a consistent 5-file structure:

| File | Purpose |
|------|---------|
| `README.md` | Concepts, principles, guidelines |
| `workflows.md` | Step-by-step procedures |
| `templates.md` | Reusable document formats |
| `checklist.md` | Quick reference for reviews |
| `examples.md` | Concrete demonstrations |

---

## How to Use as Submodule

### Adding to a Project

```bash
# Add as git submodule
git submodule add https://github.com/rastko-vukasinovic/agents-setup.git .aiagent

# Initialize if cloning a project that already has this submodule
git submodule update --init --recursive
```

### Setting Up Your Project

1. Copy templates to project root:
   ```bash
   cp .aiagent/templates/AGENTS.template.md ./AGENTS.md
   cp .aiagent/templates/CONTEXT.template.md ./CONTEXT.md
   ```

2. Customize `AGENTS.md` with project-specific guidelines
3. Fill in `CONTEXT.md` with project's current state
4. Enable optional skills by checking them in your `AGENTS.md`

---

## Current Roadmap Status

### ✅ Complete

| Work Item | Status | Date |
|-----------|--------|------|
| Arch-analysis Phase 1 (deps, data flow, errors) | ✅ Complete | 2025-01-31 |
| TOGAF Foundation + Full ADM Cycle (Phases A-H) | ✅ Complete | 2026-02-01 |
| Security analysis skill (4 compliance frameworks) | ✅ Complete | 2025-01-31 |
| Analysis refactoring (base engine + 6 adapters) | ✅ Complete | 2026-01-31 |
| Nonfunctional-analysis skill | ✅ Complete | 2026-01-31 |
| Structurizr authoring skill | ✅ Complete | 2026-01-31 |
| Architecture Synthesis skill (middle-out from diagrams) | ✅ Complete | 2026-02-02 |
| Core Architecture Docs Output (canonical structure) | ✅ Complete | 2026-02-02 |
| Change Mgmt Communication Plan (with impact reviews) | ✅ Complete | 2026-02-02 |
| Fitness Functions skill (evolutionary architecture) | ✅ Complete | 2026-02-03 |
| Migration Planning with fitness integration | ✅ Complete | 2026-02-03 |
| Presentation Generation skill (Marp CLI) | ✅ Complete | 2026-02-05 |

### ⚪ Remaining

| Work Item | Priority | Description |
|-----------|----------|-------------|
| Excalidraw Diagram Support | Medium | Native Excalidraw output format |
| TOGAF Preliminary Phase | Low | Framework and principles setup |

---

## Key Specifications

| Spec | Location | Description |
|------|----------|-------------|
| Workflow System | `specs/ai/workflow-system-spec.md` | How workflows are structured, invoked, extended |
| Codebase Analysis Refactor | `specs/ai/codebase-analysis-refactor-spec.md` | Shared analysis engine + output adapter pattern |
| Security Analysis | `specs/ai/security-analysis-skill-spec.md` | Dual output format (human + compliance) |
| Structurizr Skills | `specs/ai/structurizr-skills-spec.md` | C4 authoring + export adapters |
| TOGAF Skill Family | `specs/ai/togaf-skill-family-roadmap.md` | ADM phases as layered skills |

---

## Recommended Models

| Model | Best For | When to Use |
|-------|----------|-------------|
| **Claude Haiku** | Fast, simple tasks | Quick edits, simple questions, code formatting |
| **Claude Sonnet** | Balanced performance | Most coding tasks, analysis, debugging |
| **Claude Opus** | Complex reasoning | Architecture design, large refactors, multi-file changes |

---

## Notes for AI Agents

1. **Reading Order**:
   - Project root `AGENTS.md` (project-specific)
   - Project root `CONTEXT.md` (current state)
   - `.aiagent/core/instructions.md` (base rules)
   - `.aiagent/core/workflows.md` (for specific tasks)
   - Enabled skills from `skills/` directory

2. **Analysis Workflow**:
   - Use `codebase-analysis` as the base engine
   - Select output adapters based on user needs
   - Run analysis once, output multiple formats

3. **TOGAF Integration**:
   - Core concepts in `core/architecture-thinking.md` apply automatically
   - ADM phases in `togaf/` are invokable as needed
   - Supports lightweight/partial use (not all-or-nothing)

4. **Skill Activation**:
   - Core skills (`git-workflow`) are always active
   - Optional skills are enabled per-project in `AGENTS.md`
   - Skills can be combined and composed
