# AI Agent Setup

> **Version:** 2.0.0
> A reusable submodule providing standardized instructions, workflows, and skills for AI coding agents.

## Quick Start

### Adding to Your Project

```bash
# Add as a git submodule
git submodule add <this-repo-url> .aiagent

# Initialize if cloning a project that already has this submodule
git submodule update --init --recursive
```

### Setting Up Your Project

1. Copy the templates to your project root:
   ```bash
   cp .aiagent/templates/AGENTS.template.md ./AGENTS.md
   cp .aiagent/templates/CONTEXT.template.md ./CONTEXT.md
   ```

2. Customize `AGENTS.md` with your project-specific guidelines

3. Fill in `CONTEXT.md` with your project's current state

4. Enable optional skills by checking them in your `AGENTS.md`

---

## Structure

```
.aiagent/
├── AGENTS.md              # This file - submodule entry point
├── core/                  # Always-loaded base documentation
│   ├── instructions.md    # Coding rules, bash safety guidelines
│   ├── workflows.md       # Development processes
│   └── glossary.md        # Standard terminology
├── skills/                # Tiered skill packages
│   ├── _index.md          # Skill manifest and activation guide
│   ├── core/              # Always-on skills
│   │   └── git-workflow/
│   └── optional/          # Opt-in skills
│       ├── software-design/
│       ├── tech-stack-decisions/
│       └── code-conventions/
└── templates/             # Project customization templates
    ├── AGENTS.template.md
    ├── CONTEXT.template.md
    ├── COMMIT.md
    └── PULL_REQUEST.md
```

---

## Core Documentation

These files are always loaded and provide the foundation:

| Document | Purpose |
|----------|---------|
| [core/instructions.md](core/instructions.md) | Coding rules, allowed bash operations, security guidelines |
| [core/workflows.md](core/workflows.md) | Development processes (feature dev, bug fixes, refactoring) |
| [core/glossary.md](core/glossary.md) | Standard terminology and conventions |

---

## Skills System

Skills are specialized knowledge packages that provide guidelines, workflows, examples, and checklists for specific domains.

### Core Skills (Always Active)

These skills are always loaded:

| Skill | Description |
|-------|-------------|
| [git-workflow](skills/core/git-workflow/) | Git best practices, branching strategies, commit hygiene |

### Optional Skills (Opt-In)

Enable these in your project's `AGENTS.md`:

| Skill | Description |
|-------|-------------|
| [software-design](skills/optional/software-design/) | Design principles, patterns, architectural decisions |
| [tech-stack-decisions](skills/optional/tech-stack-decisions/) | Technology evaluation, decision frameworks, ADRs |
| [code-conventions](skills/optional/code-conventions/) | Style guides, naming conventions, structure standards |

See [skills/_index.md](skills/_index.md) for the full skill index and activation instructions.

---

## Templates

### Project Setup Templates

| Template | Purpose |
|----------|---------|
| [AGENTS.template.md](templates/AGENTS.template.md) | Template for project-level AGENTS.md |
| [CONTEXT.template.md](templates/CONTEXT.template.md) | Template for project-level CONTEXT.md |

### Development Templates

| Template | Purpose |
|----------|---------|
| [COMMIT.md](templates/COMMIT.md) | Conventional commit message format |
| [PULL_REQUEST.md](templates/PULL_REQUEST.md) | Pull request template with checklist |

---

## Reading Order for AI Agents

When starting work on a project using this submodule:

1. **Project root `AGENTS.md`** - Project-specific guidelines and enabled skills
2. **Project root `CONTEXT.md`** - Current project state and setup
3. **[core/instructions.md](core/instructions.md)** - Base coding rules and safety guidelines
4. **[core/workflows.md](core/workflows.md)** - For the specific task you're performing
5. **Enabled skills** - Any optional skills activated in the project's AGENTS.md

---

## Updating the Submodule

To get the latest version:

```bash
cd .aiagent
git pull origin main
cd ..
git add .aiagent
git commit -m "chore: update .aiagent submodule"
```

---

## Contributing

To add new skills or improve existing documentation:

1. Fork this repository
2. Create a feature branch
3. Follow the skill structure in `skills/optional/`
4. Submit a pull request

### Skill Structure

Each skill should contain:

```
skills/optional/skill-name/
├── README.md        # Guidelines and principles
├── workflows.md     # Step-by-step procedures
├── examples.md      # Concrete examples and case studies
├── templates.md     # Reusable templates (if applicable)
└── checklist.md     # Quick reference checklist
```
