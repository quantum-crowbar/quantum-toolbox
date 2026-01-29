# AI Documentation

This directory contains human-readable documentation for AI-related tooling and processes.

## Purpose

- Provide clear, accessible documentation for AI agent workflows
- Serve as reference for human developers working alongside AI agents
- Can be used as a git submodule in other projects

## Guides

| Guide | Description |
|-------|-------------|
| [Architectural Analysis](arch-analysis-guide.md) | Analyze unfamiliar codebases systematically |

## Structure

Documentation is organized by topic:

| Directory/File | Description |
|---------------|-------------|
| `skills/` | Skill-specific documentation |
| `workflows/` | Workflow guides and procedures |

## Usage as Submodule

To include this in your project:

```bash
git submodule add <repo-url> docs/ai
```

Then reference these docs from your project's main documentation.
