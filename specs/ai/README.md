# AI Specifications

This directory contains developer specifications for AI-related tooling and processes.

## Purpose

- Define technical specifications for AI agent behaviors
- Provide machine-parseable references for AI agents
- Serve as contract documentation for skills and workflows
- Can be used as a git submodule in other projects

## Roadmaps

Active development plans:

| Roadmap | Description |
|---------|-------------|
| [arch-analysis-skills-roadmap.md](arch-analysis-skills-roadmap.md) | Architectural analysis skill expansion |

## Structure

Specifications are organized by topic:

| Directory/File | Description |
|---------------|-------------|
| `skills/` | Skill specifications and schemas |
| `workflows/` | Workflow specifications |

## Usage as Submodule

To include this in your project:

```bash
git submodule add <repo-url> specs/ai
```

## Specification Format

All specs follow a consistent structure:
- **Overview**: What the spec defines
- **Requirements**: MUST/SHOULD/MAY requirements
- **Schema**: Data structures and formats
- **Examples**: Reference implementations
