# AI Toolkit Context

> **Repository**: AI Agent Toolbox for Architects
> **Purpose**: Reusable submodule providing standardized instructions, workflows, and skills for AI coding agents
> **Last Updated**: 2026-02-01

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
│   │       ├── structurizr/           # C4 architecture modeling with DSL
│   │       ├── togaf/                 # TOGAF ADM phases (Vision, Business, IS, Tech)
│   │       ├── analysis-outputs/      # Output adapters (docs, context, structurizr, etc.)
│   │       ├── software-design/       # Design principles, patterns
│   │       ├── tech-stack-decisions/  # Technology evaluation, ADRs
│   │       └── code-conventions/      # Style guides, naming standards
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

### Architecture & Modeling Skills

| Skill | Location | Status | Description |
|-------|----------|--------|-------------|
| **structurizr** | `skills/optional/structurizr/` | ✅ Complete | C4 architecture modeling with Structurizr DSL |
| **togaf/vision** | `skills/optional/togaf/vision/` | ✅ Complete | Phase A: Architecture Vision |
| **togaf/business-architecture** | `skills/optional/togaf/business-architecture/` | ✅ Complete | Phase B: Capabilities, value streams, processes |
| **togaf/information-systems** | `skills/optional/togaf/information-systems/` | ✅ Complete | Phase C: Data and application architecture |
| **togaf/technology-architecture** | `skills/optional/togaf/technology-architecture/` | ✅ Complete | Phase D: Infrastructure and platforms |
| **togaf/opportunities-solutions** | `skills/optional/togaf/opportunities-solutions/` | ✅ Complete | Phase E: Opportunities and Solutions |

### Development Workflow Skills

| Skill | Location | Status | Description |
|-------|----------|--------|-------------|
| **git-workflow** | `skills/core/git-workflow/` | ✅ Complete | Commit conventions, branching, PR workflow |
| **todo-workflow** | (in core/workflows.md) | ✅ Complete | Task tracking and autonomous development |
| **software-design** | `skills/optional/software-design/` | ✅ Complete | Design principles, patterns, decisions |
| **tech-stack-decisions** | `skills/optional/tech-stack-decisions/` | ✅ Complete | Technology evaluation frameworks, ADRs |
| **code-conventions** | `skills/optional/code-conventions/` | ✅ Complete | Style guides and standards |

### Output Adapters

| Adapter | Location | Status | Description |
|---------|----------|--------|-------------|
| **architecture-docs** | `analysis-outputs/architecture-docs/` | ✅ Complete | Human-readable markdown documentation |
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
| "Create C4 model" | Generate Structurizr architecture diagrams |
| "Apply TOGAF" | Enterprise architecture using ADM phases |
| "Use todo workflow" | Autonomous task-based development |

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

### ✅ Complete (High/Medium Priority)

| Work Item | Status | Date |
|-----------|--------|------|
| Arch-analysis Phase 1 (deps, data flow, errors) | ✅ Complete | 2025-01-31 |
| Arch-analysis output structure (Phase 0, index, numbered files) | ✅ Complete | 2025-01-31 |
| TOGAF Foundation (core concepts, index, vision skill) | ✅ Complete | 2025-01-31 |
| Security analysis skill (full skill with 5 files, 4 frameworks) | ✅ Complete | 2025-01-31 |
| Analysis refactoring Phase 1-4 (base engine + 5 adapters) | ✅ Complete | 2026-01-31 |
| Nonfunctional-analysis skill (testing, config, perf, health) | ✅ Complete | 2026-01-31 |
| Structurizr authoring skill (C4 modeling with DSL) | ✅ Complete | 2026-01-31 |
| TOGAF Core ADM (Phase B/C/D - Business, Info Systems, Technology) | ✅ Complete | 2026-02-01 |
| TOGAF Phase E (Opportunities and Solutions) | ✅ Complete | 2026-02-01 |

### ⚪ Remaining (Low Priority)

| Work Item | Priority | Description |
|-----------|----------|-------------|
| TOGAF Phase F | Low | Migration Planning |
| TOGAF Phase G | Low | Implementation Governance |
| TOGAF Phase H | Low | Architecture Change Management |

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
