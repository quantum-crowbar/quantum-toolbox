# AI Specifications

This directory contains developer specifications for AI-related tooling and processes.

## Purpose

- Define technical specifications for AI agent behaviors
- Provide machine-parseable references for AI agents
- Serve as contract documentation for skills and workflows
- Can be used as a git submodule in other projects

## Specifications

| Spec | Description |
|------|-------------|
| [workflow-system-spec.md](workflow-system-spec.md) | Workflow structure, patterns, and extension guidelines |
| [codebase-analysis-refactor-spec.md](codebase-analysis-refactor-spec.md) | Shared analysis engine + output adapter pattern |
| [security-analysis-skill-spec.md](security-analysis-skill-spec.md) | Security posture + compliance frameworks |
| [structurizr-skills-spec.md](structurizr-skills-spec.md) | C4 authoring + export adapters |
| [roadmap-skills-spec.md](roadmap-skills-spec.md) | **NEW**: Roadmap building and analysis capabilities |
| [output-directories-spec.md](output-directories-spec.md) | Default output directory conventions |
| [tooling-research.md](tooling-research.md) | Diagram export and presentation tooling research |

## Roadmaps

Active development plans:

| Roadmap | Description | Status |
|---------|-------------|--------|
| [arch-analysis-skills-roadmap.md](arch-analysis-skills-roadmap.md) | Architectural analysis skill expansion | Complete |
| [togaf-skill-family-roadmap.md](togaf-skill-family-roadmap.md) | TOGAF framework as layered skill family | Complete |
| [ROADMAP-TRACKER.md](ROADMAP-TRACKER.md) | Overall project roadmap and progress tracker | Active |

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
