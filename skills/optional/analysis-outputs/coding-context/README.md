# Coding Context Adapter

Transforms codebase analysis into AI agent coding context.

---

## Purpose

Generate context files that help AI agents understand and work with the codebase:

- **AGENTS.md**: Instructions for AI agents working on this codebase
- **CONTEXT.md**: Project context, patterns, and conventions

---

## Output

```
{project-root}/
├── AGENTS.md        # AI agent instructions
└── CONTEXT.md       # Project context
```

Or in specified location:
```
{docs-directory}/
├── AGENTS.md
└── CONTEXT.md
```

---

## Required Model Sections

| Section | Required | Used For |
|---------|----------|----------|
| `meta` | Yes | Project identification |
| `technologies` | Yes | Tech stack context |
| `architecture` | Yes | Code organization |
| `interfaces` | Optional | API patterns |
| `data` | Optional | Data model patterns |
| `quality` | Optional | Code quality notes |

---

## Output Structure

### AGENTS.md

```markdown
# AI Agent Instructions: {Project Name}

## Project Overview
{From meta.description}

## Technology Stack
{From technologies - what's used and why}

## Code Organization
{From architecture.structure and architecture.layers}

## Key Patterns
{From architecture.patterns - how things are done here}

## Coding Conventions
{Inferred from code analysis}
- Naming: {camelCase, snake_case, etc.}
- File structure: {patterns observed}
- Error handling: {standard approach}
- Testing: {patterns and locations}

## Important Files
{Key entry points, configs, frequently modified}

## Build & Run
{From technologies.build_tools}

## When Making Changes
- {Pattern to follow}
- {Files to update together}
- {Tests to run}

## What to Avoid
{Anti-patterns or deprecated approaches}
```

### CONTEXT.md

```markdown
# Project Context: {Project Name}

## What This Project Does
{From meta.description, interfaces overview}

## Architecture
{From architecture.components and architecture.layers}

### Components
{Component list with responsibilities}

### Dependencies Between Components
{Component dependency graph}

## Data Model
{From data.entities - key entities and relationships}

## External Integrations
{From interfaces.integrations}

## API Surface
{From interfaces.apis - key endpoints}

## Development Setup
{From technologies.build_tools}

## Common Tasks
- Adding a new endpoint: {pattern}
- Adding a new entity: {pattern}
- Running tests: {command}
```

---

## Model to Output Mapping

### Project Overview

| Model Path | AGENTS.md Section |
|------------|-------------------|
| `meta.project_name` | Title |
| `meta.description` | Overview |
| `meta.repository` | Links |

### Technology Context

| Model Path | Output |
|------------|--------|
| `technologies.languages[]` | Primary language, version |
| `technologies.frameworks[]` | Framework context |
| `technologies.build_tools[]` | Build commands |

### Code Organization

| Model Path | Output |
|------------|--------|
| `architecture.structure.entry_points` | Main files |
| `architecture.structure.config_locations` | Config files |
| `architecture.layers[]` | Layer description |
| `architecture.patterns[]` | Patterns to follow |

### Conventions (Inferred)

Analyze code to infer:
- Naming conventions (from identifier patterns)
- File naming (from directory structure)
- Import patterns (from import statements)
- Error handling style (from error_handling patterns)
- Test naming and location

---

## Invocation

```
"Generate coding context"
"Create AGENTS.md"
"Generate AI context files"
"Create context for AI coding"
```

Or as part of multi-output:
```
"Analyze this codebase"
  ☑ Coding context (AGENTS.md)
```

---

## Configuration

### Output Location

```
Where should I create the context files?

1. Project root (./AGENTS.md, ./CONTEXT.md)
2. Documentation directory ({docs}/AGENTS.md, {docs}/CONTEXT.md)
```

Default: Project root

### Detail Level

```
What level of detail?

1. Minimal - Key patterns only
2. Standard - Patterns + conventions
3. Comprehensive - Full context with examples
```

Default: Standard

---

## Use Cases

### New AI Agent Onboarding

When AI starts working on codebase:
1. Reads AGENTS.md for instructions
2. Reads CONTEXT.md for understanding
3. Has immediate context for effective assistance

### Documentation for AI Tools

Works with:
- Claude Code (via AGENTS.md)
- GitHub Copilot (via CONTEXT.md)
- Cursor (via context files)
- Other AI coding assistants

### Human Onboarding

Context files also help human developers:
- Quick project overview
- Pattern reference
- Where things are located

---

## See Also

- [Templates](templates.md) - Output templates
- [codebase-analysis](../../codebase-analysis/) - Analysis engine
- [analysis-outputs](../_index.md) - Adapter family
