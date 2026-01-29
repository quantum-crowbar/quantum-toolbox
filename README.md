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
└── specs/ai/              # Technical specifications
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
| [specs/ai/](specs/ai/) | Technical specifications |
| [.aiagent/skills/](.aiagent/skills/_index.md) | Skill index and details |

## Available Skills

### Core Skills (Always Active)

- **git-workflow** - Commit conventions, branching, PR workflow
- **todo-workflow** - Task tracking and autonomous development

### Optional Skills

- **arch-analysis** - Analyze unknown codebases ([guide](docs/ai/arch-analysis-guide.md))
- **software-design** - Design principles and patterns
- **tech-stack-decisions** - Technology evaluation frameworks
- **code-conventions** - Style guides and standards

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

## License

MIT
