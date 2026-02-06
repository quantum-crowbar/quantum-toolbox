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

### One-Prompt Setup

Copy and paste this prompt to your AI assistant:

> Add the AI architect toolbox by adding a git submodule from `https://github.com/rastko-vukasinovic/agents-setup.git` into `.ai-toolkit`. Once downloaded, read through the toolkit to learn its capabilities. When done, tell me "what skills do you have?"

This will:
1. Add the toolbox as a submodule
2. Train your agent on all available skills
3. Trigger the skill discovery workflow
4. Present capabilities organized by category
5. Offer to elaborate on any skill

### Anytime Refresh

Ask your agent:

> "What skills do you have?"

This re-reads the toolkit and presents all capabilities with invokable commands. Useful after toolkit updates or when you want a reminder of what's available.

### Recommended Models

| Model | Best For | When to Use |
|-------|----------|-------------|
| **Claude Haiku** | Fast, simple tasks | Quick edits, simple questions, code formatting |
| **Claude Sonnet** | Balanced performance | Most coding tasks, analysis, debugging |
| **Claude Opus** | Complex reasoning | Architecture design, large refactors, multi-file changes |

---

## Skills Index

The toolkit provides **27+ specialized skills** organized into 4 categories. For complete documentation, see [Skills Documentation](docs/skills/README.md).

### Quick Reference

| Category | Count | Skills |
|----------|-------|--------|
| **Analysis** | 6 | codebase-analysis, arch-analysis, security-analysis, nonfunctional-analysis, architecture-synthesis, fitness-functions |
| **Architecture** | 11 | structurizr, TOGAF ADM (Preliminary + Phases A-H) |
| **Workflow** | 2 | git-workflow (core), todo-workflow |
| **Output** | 8 | core-architecture, architecture-docs, coding-context, product-spec, structurizr, archimate, presentation, pdf-report |

### Common Invocations

```
"Analyze the architecture"              → arch-analysis
"Analyze security with OWASP"          → security-analysis
"Apply TOGAF Business Architecture"    → togaf/business-architecture
"Create C4 model"                      → structurizr
"Export to PDF"                        → pdf-report
"Generate presentation"                → presentation
```

**Full documentation**: [docs/skills/README.md](docs/skills/README.md) (27 skills with detailed guides, workflows, templates, and examples)

---

## What's Included

### Analysis Skills

| Skill | Description |
|-------|-------------|
| **codebase-analysis** | Base analysis engine with structured output model |
| **arch-analysis** | Architecture documentation (8-phase workflow) |
| **security-analysis** | Security posture + compliance frameworks (OWASP, NIST, CIS, ISO, NIS 2) |
| **nonfunctional-analysis** | Testing, config, performance, code health |
| **architecture-synthesis** | Middle-out from diagrams + specs (Excalidraw, Mermaid, Draw.io) |
| **fitness-functions** | Evolutionary architecture fitness measurement and validation |

### Architecture & Modeling

| Skill | Description |
|-------|-------------|
| **structurizr** | C4 architecture modeling with Structurizr DSL |
| **togaf/preliminary** | Preliminary: Architecture capability setup |
| **togaf/vision** | Phase A: Architecture Vision |
| **togaf/business-architecture** | Phase B: Capabilities, value streams, processes |
| **togaf/information-systems** | Phase C: Data and application architecture |
| **togaf/technology-architecture** | Phase D: Infrastructure and platforms |
| **togaf/opportunities-solutions** | Phase E: Opportunities and Solutions |
| **togaf/migration-planning** | Phase F: Migration Planning |
| **togaf/implementation-governance** | Phase G: Implementation Governance |
| **togaf/change-management** | Phase H: Change Management |

### Development Workflows

| Skill | Description |
|-------|-------------|
| **git-workflow** | Commit conventions, branching, PR workflow |
| **todo-workflow** | Task tracking and autonomous development |
| **software-design** | Design principles, patterns, decisions |
| **tech-stack-decisions** | Technology evaluation frameworks, ADRs |
| **code-conventions** | Style guides and standards |

### Output Adapters

Analysis can be exported in multiple formats:

| Adapter | Output |
|---------|--------|
| **core-architecture** | Canonical source of truth (baseline, target, gaps, risks) |
| **architecture-docs** | Detailed analysis documentation (7 reports) |
| **coding-context** | AGENTS.md and CONTEXT.md for AI context |
| **product-spec** | Product documentation (features, flows, data model) |
| **structurizr** | C4 model in Structurizr DSL |
| **archimate** | ArchiMate enterprise architecture format |
| **presentation** | Marp CLI slide generation (PPTX, PDF, HTML) |
| **pdf-report** | Professional PDF reports from markdown |

---

## Default Output Directories

When skills generate output files, they use these defaults (confirm with user):

| Output Type | Default Directory | Content |
|-------------|-------------------|---------|
| Analysis | `analysis/` | Architecture, security, and code analysis reports |
| Presentations | `presentations/` | Generated slide decks (PPTX, PDF, HTML) |

---

## Invokable Commands

Trigger specific workflows during your session:

| Command | What It Does |
|---------|--------------|
| "What skills do you have?" | List all capabilities and offer to elaborate |
| "Analyze the architecture" | Run full 8-phase codebase analysis |
| "Analyze security" | Security assessment with compliance reports |
| "Analyze code quality" | Testing, config, performance, health check |
| "Synthesize architecture from diagrams" | Parse visual diagrams into architecture model |
| "Define fitness functions" | Evolutionary architecture fitness assessment |
| "Create C4 model" | Generate Structurizr architecture diagrams |
| "Apply TOGAF" | Enterprise architecture using ADM phases |
| "Generate core architecture docs" | Canonical documentation structure |
| "Use todo workflow" | Autonomous task-based development |
| "Generate presentation" | Create slide decks from Markdown |

---

## Repository Structure

```
.
├── AGENTS.md              # Main agent instructions
├── AI_TOOLKIT_CONTEXT.md  # Full context for AI assistants
├── core/                  # Core concepts and workflows
│   ├── instructions.md    # Coding rules, safety
│   ├── workflows.md       # Development processes
│   └── architecture-thinking.md  # TOGAF foundations
├── skills/                # Modular skill packages
│   ├── core/              # Always-active skills
│   └── optional/          # Opt-in skills
├── templates/             # Commit, PR templates
├── docs/                  # Human-readable guides
└── specs/                 # Specifications & roadmaps
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

All planned items are complete. See [ROADMAP-TRACKER.md](specs/ROADMAP-TRACKER.md) for full history.

---

## Documentation

| Resource | Description |
|----------|-------------|
| [Skills Index](skills/_index.md) | Full skill listing and activation guide |
| [TOGAF Index](skills/optional/togaf/_index.md) | ADM phases and when to use each |
| [Analysis Outputs](skills/optional/analysis-outputs/_index.md) | Available export formats |
| [Architecture Guide](docs/arch-analysis-guide.md) | How to analyze unfamiliar codebases |

---

## License

MIT
