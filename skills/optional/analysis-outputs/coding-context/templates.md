# Coding Context Templates

Templates for generating AI agent context files from analysis model.

---

## AGENTS.md Template

```markdown
# AI Agent Instructions: {meta.project_name}

## Project Overview

{meta.description}

- **Repository**: {meta.repository}
- **Primary Language**: {technologies.languages[primary=true].name} {version}
- **Framework**: {technologies.frameworks[0].name}

---

## Technology Stack

### Languages

| Language | Version | Use |
|----------|---------|-----|
{for lang in technologies.languages}
| {lang.name} | {lang.version} | {lang.primary ? "Primary" : "Supporting"} |
{/for}

### Key Dependencies

{for fw in technologies.frameworks}
- **{fw.name}** ({fw.version}): {fw.purpose}
{/for}

---

## Code Organization

### Directory Structure

```
{project}/
├── {architecture.structure.entry_points[0]}    # Main entry
├── {source_dir}/                               # Source code
│   {for layer in architecture.layers}
│   ├── {layer.name}/                          # {layer.description}
│   {/for}
├── {architecture.structure.test_locations[0]}/ # Tests
└── {architecture.structure.config_locations[0]} # Config
```

### Layers

{for layer in architecture.layers}
**{layer.name}**: {layer.description}
- Components: {layer.components.join(", ")}
- Boundaries: {layer.boundaries}

{/for}

---

## Key Patterns

Follow these patterns when making changes:

{for pattern in architecture.patterns}
### {pattern.name}

Used in: {pattern.where_used.join(", ")}

```{language}
// Example from codebase
{pattern.example_code}
```

{/for}

---

## Coding Conventions

### Naming

- **Files**: {inferred.file_naming} (e.g., `user-service.ts`, `UserService.ts`)
- **Classes**: {inferred.class_naming} (e.g., `UserService`, `user_service`)
- **Functions**: {inferred.function_naming} (e.g., `getUserById`, `get_user_by_id`)
- **Variables**: {inferred.variable_naming}

### Imports

{inferred.import_pattern}

### Error Handling

```{language}
// Standard error handling pattern
{error_handling.patterns[0].example}
```

### Testing

- Location: `{architecture.structure.test_locations[0]}`
- Framework: {technologies.frameworks[purpose=testing].name}
- Naming: {inferred.test_naming}

---

## Important Files

| File | Purpose | When to Modify |
|------|---------|----------------|
{for entry in architecture.structure.entry_points}
| `{entry}` | Main entry point | Rarely |
{/for}
{for config in architecture.structure.config_locations}
| `{config}` | Configuration | When adding settings |
{/for}

---

## Build & Run

### Prerequisites

{technologies.prerequisites}

### Commands

| Task | Command |
|------|---------|
{for script in technologies.build_tools.scripts}
| {script.name} | `{script.command}` |
{/for}

---

## When Making Changes

### Adding a New Endpoint

1. Create handler in `{api_handler_location}`
2. Add route in `{route_file}`
3. Add tests in `{test_location}`
4. Update API docs if exists

### Adding a New Entity

1. Create model in `{model_location}`
2. Create repository in `{repo_location}`
3. Add migrations if needed
4. Add tests

### Modifying Existing Code

1. Find all usages before changing
2. Update tests first (TDD)
3. Follow existing patterns in that file
4. Run full test suite

---

## What to Avoid

{for antipattern in recommendations.antipatterns}
- **Don't**: {antipattern.description}
  - **Instead**: {antipattern.alternative}
{/for}

---

## Related Documentation

{for doc in reconnaissance.documentation}
- [{doc.location}]({doc.location}) - {doc.type}
{/for}
```

---

## CONTEXT.md Template

```markdown
# Project Context: {meta.project_name}

## What This Project Does

{meta.description}

### Key Capabilities

{for component in architecture.components where component.type == 'service'}
- **{component.name}**: {component.responsibilities[0]}
{/for}

---

## Architecture

### System Overview

```mermaid
graph TB
{Generate high-level component diagram}
```

### Components

{for component in architecture.components}
#### {component.name}

- **Type**: {component.type}
- **Location**: `{component.location}`
- **Responsibilities**:
{for resp in component.responsibilities}
  - {resp}
{/for}
- **Dependencies**: {component.dependencies.join(", ") || "None"}

{/for}

### Layer Boundaries

| Layer | Components | Boundary Rules |
|-------|------------|----------------|
{for layer in architecture.layers}
| {layer.name} | {layer.components.join(", ")} | {layer.boundaries} |
{/for}

---

## Data Model

### Entities

{for entity in data.entities}
#### {entity.name}

Location: `{entity.location}`

| Field | Type |
|-------|------|
{for field in entity.fields}
| {field.name} | {field.type} |
{/for}

Relationships:
{for rel in entity.relationships}
- → {rel.target} ({rel.type})
{/for}

{/for}

### Data Flow

```mermaid
flowchart LR
{Generate from data.flows}
```

---

## External Integrations

| Service | Direction | Purpose |
|---------|-----------|---------|
{for integration in interfaces.integrations}
| {integration.name} | {integration.direction} | {integration.purpose} |
{/for}

---

## API Surface

### Key Endpoints

| Method | Path | Purpose |
|--------|------|---------|
{for api in interfaces.apis limit 10}
| {api.method} | {api.path} | {api.description} |
{/for}

Full API documentation: {api_docs_location}

---

## Development Setup

### Requirements

{for lang in technologies.languages}
- {lang.name} {lang.version}
{/for}
{for infra in technologies.infrastructure}
- {infra.name} ({infra.type})
{/for}

### Quick Start

```bash
# Install dependencies
{technologies.build_tools.scripts.install.command}

# Run development server
{technologies.build_tools.scripts.dev.command}

# Run tests
{technologies.build_tools.scripts.test.command}
```

### Configuration

| Variable | Purpose | Default |
|----------|---------|---------|
{for config in key_configs}
| {config.name} | {config.purpose} | {config.default} |
{/for}

---

## Common Tasks

### Adding a Feature

1. Start from `{recommended_start_location}`
2. Follow {pattern_to_follow} pattern
3. Tests go in `{test_location}`
4. Run `{test_command}` before committing

### Debugging

- Logs: {error_handling.logging.destinations.join(", ")}
- Log levels: {error_handling.logging.levels.join(", ")}
- Common issues: {common_issues_location}

### Deployment

- Environment: {deployment_environment}
- Process: {deployment_process}
- Rollback: {rollback_process}

---

## Quality Notes

- **Documentation**: {quality.documentation_coverage}
- **Test Coverage**: {quality.test_coverage}
- **Type Safety**: {quality.type_safety}
- **Code Organization**: {quality.code_organization}

---

## Known Issues / Tech Debt

{for item in recommendations.improvements}
- {item.finding} - {item.recommendation}
{/for}
```

---

## Convention Inference Rules

### File Naming

Analyze existing files to detect:
- `kebab-case.ts` → kebab-case
- `PascalCase.ts` → PascalCase
- `snake_case.py` → snake_case
- `camelCase.js` → camelCase

### Class Naming

From class declarations:
- `class UserService` → PascalCase
- `class user_service` → snake_case

### Function Naming

From function definitions:
- `function getUserById` → camelCase
- `def get_user_by_id` → snake_case

### Import Patterns

Detect common patterns:
```javascript
// Absolute imports
import { Service } from '@/services/service';

// Relative imports
import { Service } from '../services/service';

// Barrel imports
import { Service } from './services';
```

### Test Naming

From test files:
- `user.test.ts` → {name}.test.{ext}
- `test_user.py` → test_{name}.py
- `UserSpec.scala` → {Name}Spec.{ext}
