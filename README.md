# AI Agent Setup

Configuration and skills for AI coding agents.

## Overview

This repository provides a structured approach to configuring AI coding assistants with reusable skills, workflows, and conventions. Designed to be used as a submodule or template for projects that leverage AI-assisted development.

## Structure

```
.
├── .aiagent/              # Agent configuration (machine-readable)
│   ├── AGENTS.md          # Main agent instructions
│   ├── core/              # Core instructions and workflows
│   ├── skills/            # Modular skill definitions
│   └── templates/         # Commit, PR, and context templates
├── docs/ai/               # Human-readable documentation
└── specs/ai/              # Technical specifications & roadmaps
```

## Quick Start

### As a Submodule

Add to your project:

```bash
git submodule add <repo-url> .aiagent-config
```

Then symlink or copy what you need:

```bash
ln -s .aiagent-config/.aiagent .aiagent
```

### Standalone

Clone and customize for your needs:

```bash
git clone <repo-url>
cd agents-setup
# Edit .aiagent/AGENTS.md for your project
```

## Documentation

| Resource | Description |
|----------|-------------|
| [docs/ai/](docs/ai/) | Human-readable guides and explanations |
| [specs/ai/](specs/ai/) | Technical specifications and roadmaps |
| [.aiagent/skills/](.aiagent/skills/_index.md) | Skill index and details |

### Guides

| Guide | Description |
|-------|-------------|
| [Architectural Analysis](docs/ai/arch-analysis-guide.md) | Analyze unfamiliar codebases systematically |

### Specifications

| Spec | Description |
|------|-------------|
| [Workflow System](specs/ai/workflow-system-spec.md) | Workflow structure, patterns, extension guidelines |

### Roadmaps

| Roadmap | Description |
|---------|-------------|
| [Arch-Analysis Skills](specs/ai/arch-analysis-skills-roadmap.md) | Expand with dependency, data flow, error analysis |
| [TOGAF Skill Family](specs/ai/togaf-skill-family-roadmap.md) | Enterprise architecture framework (layered approach) |

## Available Skills

### Core Skills (Always Active)

| Skill | Description |
|-------|-------------|
| **git-workflow** | Commit conventions, branching, PR workflow |
| **todo-workflow** | Task tracking and autonomous development |

### Optional Skills (Current)

| Skill | Description | Guide |
|-------|-------------|-------|
| **arch-analysis** | Analyze unknown codebases | [guide](docs/ai/arch-analysis-guide.md) |
| **software-design** | Design principles and patterns | - |
| **tech-stack-decisions** | Technology evaluation frameworks | - |
| **code-conventions** | Style guides and standards | - |

### Planned Skills

| Skill | Description | Roadmap |
|-------|-------------|---------|
| **security-analysis** | Security surface, auth/authz, PII handling | [roadmap](specs/ai/arch-analysis-skills-roadmap.md) |
| **nonfunctional-analysis** | Test coverage, config audit, performance, code health | [roadmap](specs/ai/arch-analysis-skills-roadmap.md) |
| **togaf/** (family) | TOGAF ADM phases as modular skills | [roadmap](specs/ai/togaf-skill-family-roadmap.md) |

## TOGAF Skill Family

Enterprise architecture support using a layered approach:

| Layer | Description |
|-------|-------------|
| **Core Concepts** | Architecture domains, stakeholder thinking, baseline/target, gap analysis |
| **ADM Phase Skills** | Invokable skills for each ADM phase (A-H) |
| **Modeling Tools** | Mermaid, Structurizr (C4), ArchiMate, D2 |

Key features:
- Gap analysis → Roadmap candidates
- Prioritization criteria (business value, risk, dependencies, complexity)
- Risk analysis with non-technical risk prompts
- Architecture modeling tool selection by context

See [TOGAF Roadmap](specs/ai/togaf-skill-family-roadmap.md) for full details.

## Key Concepts

### Skills

Modular knowledge units that can be enabled/disabled. Each skill contains:
- README (overview and concepts)
- Workflows (step-by-step procedures)
- Checklist (quick reference)
- Templates (reusable formats)
- Examples (concrete demonstrations)

### Invokable Skills

Some skills can be explicitly activated during a session:

| Skill | Invocation |
|-------|------------|
| `todo-workflow` | "Use todo workflow" |
| `arch-analysis` | "Analyze the architecture" |
| `togaf/*` (planned) | "Apply TOGAF", "Create Architecture Vision" |

### Workflow System

Workflows follow a consistent structure:
- **Phases** with clear goals
- **Steps** with checklists
- **Outputs** defined per phase
- **Checkpoints** for review modes

See [Workflow System Spec](specs/ai/workflow-system-spec.md) for details.

## License

MIT
