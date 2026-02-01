# AI Agent Toolbox for Architects

A toolbox of skills, workflows, and patterns for AI coding agents - designed for software architects and senior developers.

## Overview

Equip your AI coding assistant with architectural knowledge, analysis skills, and proven patterns. This toolbox includes:

- **Analysis Skills** - Understand codebases systematically
- **Architecture Patterns** - TOGAF ADM, C4 modeling, enterprise architecture
- **Development Workflows** - Git conventions, task management, code quality
- **Templates & Checklists** - Consistent, high-quality deliverables

Designed to be used as a git submodule that AI agents can reference when working on your code.

---

## Quick Start

### Recommended Models

| Model | Best For | When to Use |
|-------|----------|-------------|
| **Claude Haiku** | Fast, simple tasks | Quick edits, simple questions, code formatting |
| **Claude Sonnet** | Balanced performance | Most coding tasks, analysis, debugging |
| **Claude Opus** | Complex reasoning | Architecture design, large refactors, multi-file changes |

### Adding to Your Project

Ask your AI assistant:

> Add my agent toolbox by adding a git submodule from `https://github.com/rastko-vukasinovic/agents-setup.git` into the `.aiagent` directory and adopt using its content once downloaded.

### Immediate Codebase Analysis

To set up and immediately analyze your codebase:

> Add my agent toolbox by adding a git submodule from `https://github.com/rastko-vukasinovic/agents-setup.git` into the `.aiagent` directory. After you are ready to use the .aiagent toolbox, perform architecture analysis.

This will:
1. Add the toolbox as a submodule
2. Analyze your codebase structure
3. Generate architecture documentation
4. Prepare context for effective coding assistance

---

## What's Included

### Analysis Skills

| Skill | Description | Status |
|-------|-------------|--------|
| **codebase-analysis** | Base analysis engine with structured output model | Complete |
| **arch-analysis** | Architecture documentation (8-phase workflow) | Complete |
| **security-analysis** | Security posture + compliance frameworks (OWASP, NIST, CIS, ISO) | Complete |
| **nonfunctional-analysis** | Testing, config, performance, code health | Complete |

### Architecture & Modeling

| Skill | Description | Status |
|-------|-------------|--------|
| **structurizr** | C4 architecture modeling with Structurizr DSL | Complete |
| **togaf/vision** | Phase A: Architecture Vision | Complete |
| **togaf/business-architecture** | Phase B: Capabilities, value streams, processes | Complete |
| **togaf/information-systems** | Phase C: Data and application architecture | Complete |
| **togaf/technology-architecture** | Phase D: Infrastructure and platforms | Complete |

### Development Workflows

| Skill | Description | Status |
|-------|-------------|--------|
| **git-workflow** | Commit conventions, branching, PR workflow | Complete |
| **todo-workflow** | Task tracking and autonomous development | Complete |
| **software-design** | Design principles, patterns, decisions | Complete |
| **tech-stack-decisions** | Technology evaluation frameworks, ADRs | Complete |
| **code-conventions** | Style guides and standards | Complete |

### Output Adapters

Analysis can be exported in multiple formats:

| Adapter | Output |
|---------|--------|
| **architecture-docs** | Human-readable markdown documentation |
| **coding-context** | AGENTS.md and CONTEXT.md for AI context |
| **product-spec** | Product documentation (features, flows, data model) |
| **structurizr** | C4 model in Structurizr DSL |
| **archimate** | ArchiMate enterprise architecture format |

---

## Invokable Skills

Trigger specific workflows during your session:

| Command | What It Does |
|---------|--------------|
| "Analyze the architecture" | Run full 8-phase codebase analysis |
| "Analyze security" | Security assessment with compliance reports |
| "Analyze code quality" | Testing, config, performance, health check |
| "Create C4 model" | Generate Structurizr architecture diagrams |
| "Apply TOGAF" | Enterprise architecture using ADM phases |
| "Use todo workflow" | Autonomous task-based development |

---

## Repository Structure

```
.
├── .aiagent/                  # Agent toolbox
│   ├── AGENTS.md              # Main agent instructions
│   ├── core/                  # Core concepts and workflows
│   │   ├── instructions.md    # Coding rules, safety
│   │   ├── workflows.md       # Development processes
│   │   └── architecture-thinking.md  # TOGAF foundations
│   ├── skills/                # Modular skill packages
│   │   ├── core/              # Always-active skills
│   │   └── optional/          # Opt-in skills
│   └── templates/             # Commit, PR templates
├── docs/ai/                   # Human-readable guides
└── specs/ai/                  # Specifications & roadmaps
```

---

## Skill Package Structure

Each skill contains:

| File | Purpose |
|------|---------|
| `README.md` | Concepts, principles, guidelines |
| `workflows.md` | Step-by-step procedures |
| `templates.md` | Reusable document formats |
| `checklist.md` | Quick reference for reviews |
| `examples.md` | Concrete demonstrations |

---

## Roadmap

### Complete

- Analysis engine with 5 output adapters
- Security analysis with 4 compliance frameworks
- Nonfunctional analysis (testing, config, performance, health)
- Structurizr C4 modeling skill
- TOGAF ADM Phases A-D (Vision through Technology)
- Core development workflows

### Planned (Low Priority)

- TOGAF Phase E: Opportunities and Solutions
- TOGAF Phase F: Migration Planning
- TOGAF Phase G: Implementation Governance
- TOGAF Phase H: Architecture Change Management

See [ROADMAP-TRACKER.md](specs/ai/ROADMAP-TRACKER.md) for details.

---

## Documentation

| Resource | Description |
|----------|-------------|
| [Skills Index](.aiagent/skills/_index.md) | Full skill listing and activation guide |
| [TOGAF Index](.aiagent/skills/optional/togaf/_index.md) | ADM phases and when to use each |
| [Analysis Outputs](.aiagent/skills/optional/analysis-outputs/_index.md) | Available export formats |
| [Architecture Guide](docs/ai/arch-analysis-guide.md) | How to analyze unfamiliar codebases |

---

## License

MIT
