# Development Context

Current project context and state information for AI agents.

## Project Overview

Universal AI coding agent setup boilerplate. Provides standardized instructions, workflows, and templates for AI agents working on software projects.

**Goals:**
- Consistent agent behavior across projects
- Clear guidelines for safe and restricted operations
- Reusable workflows for common development tasks
- Templates for standardized commits and PRs

## Tech Stack

- Markdown documentation
- Git for version control
- GitHub for repository hosting

## Current State

**Version:** 1.0.0

**Implemented:**
- Core documentation structure (AGENTS.md, instructions.md, context.md, workflows.md)
- Comprehensive bash command guidelines (safe, restricted, prohibited)
- Development workflows (Feature, Bug Fix, Hotfix, Refactoring)
- Autonomous Development Loop with retry limits and rollback
- Pre-work checklist for workspace validation
- PR and commit message templates
- Glossary with terminology and conventions

**In Progress:**
- None

## Key Components

| File | Purpose |
|------|---------|
| `AGENTS.md` | Entry point, links to all docs, usage instructions |
| `instructions.md` | Coding rules, bash commands, security guidelines |
| `workflows.md` | Step-by-step processes for development tasks |
| `context.md` | Project state (this file) |
| `glossary.md` | Terminology and code conventions |
| `templates/PULL_REQUEST.md` | PR template with checklist |
| `templates/COMMIT.md` | Commit message format guide |

## Known Issues

None currently.

## Dependencies

None - this is a documentation-only project.

## Environment Setup

### Local Development Setup

1. Clone the repository: `git clone git@github.com:rastko-vukasinovic/agents-setup.git`
2. Copy `.aiagent/` directory to your project root
3. Customize files for your project's specific needs
