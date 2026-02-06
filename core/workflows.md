# Development Workflows

Step-by-step processes for common development tasks.

---

## Pre-Work Checklist

**Run this before starting any development task:**

1. Check if git is initialized
   - If not initialized, run `git init`
   - Add remote origin if needed
2. Run `git status` to check workspace state
   - If there are uncommitted changes, inform the user
   - Ask user if they want to stash, commit, or continue with dirty workspace
3. Run test suite to verify current state
   - If tests fail, inform user before proceeding
   - Document which tests are failing

---

## Autonomous Development Loop

**Use this loop when implementing features or fixes:**

```
REPEAT until all todo items are complete (max 10 retries per item):
  1. Pick next todo item, mark as in_progress
  2. Implement the change
  3. Write/update tests for the change
  4. Run test suite
     - If tests fail: fix issues and re-run (increment retry counter)
     - If retry limit reached: stop, inform user, document blockers
     - If tests pass: reset retry counter, continue
  5. Verify implementation meets requirements
  6. Mark todo item as completed
  7. Commit the code with descriptive message
  8. Return to step 1
```

**Exit conditions:**
- All todo items are marked as completed
- All tests are passing
- Code is committed

**Failure conditions (stop and inform user):**
- Retry limit reached on any item
- Unresolvable dependency or blocker encountered
- Tests require infrastructure not available

**Rollback procedure:**
- If implementation fails mid-way, use `git stash` to save work
- Document what was attempted and why it failed
- Reset to last known good state if needed

---

## Todo-Driven Development

**An invokable workflow for autonomous and semi-autonomous development.**

> **Full Documentation**: See [skills/core/todo-workflow/](../skills/core/todo-workflow/) for complete details.

### Quick Start

```
"Use todo workflow"                      # Full autonomous
"Use todo workflow, review code"         # Stop for code reviews
"Use todo workflow --dry-run"            # Preview without executing
"Continue"                               # Resume after checkpoint
```

### Core Loop

```
FOR EACH todo item:
  1. Mark as in_progress
  2. Implement the change
  3. Validate (tests, linter, structure)
  4. Commit with descriptive message
  5. Mark as completed
```

### Pre-Work Checks

Before starting autonomous work:
1. **Branch check** - Warn if on main/master
2. **Test check** - Run tests, warn if failing
3. **Working directory** - Warn if uncommitted changes

### Review Modes

| Mode | Stops For |
|------|-----------|
| `review all` | Every item |
| `review code` | Code changes only |
| `review tests` | After writing tests |
| `review items 2,4` | Specific items |
| `review critical` | Items marked `[critical]` |

### Options

| Option | Effect |
|--------|--------|
| `--dry-run` | Preview without making changes |
| `--push` | Push after each commit |
| `--push-end` | Push only at end |
| `--branch <name>` | Create/use feature branch |
| `--batch` | Group related items into single commits |

### Item Features

```
[ ] Basic item
[ ] Code item [code]
[ ] Depends on item 1 (depends: 1)
[ ] Security sensitive [critical]
[ ] Part of group [batch: feature-x]
```

### Commit Message Pattern

```
<type>(<scope>): <description>

Types: feat | fix | docs | refactor | test | chore
```

---

## Feature Development

1. **Pre-work**: Run Pre-Work Checklist (above)
2. Read project context for current project state
3. Create a feature branch: `git checkout -b feature/<name>`
4. Create todo list for implementation tasks
5. **Execute**: Run Autonomous Development Loop for each todo
6. Ensure all tests pass
7. Update project context if significant changes made
8. Create pull request using PR template

## Bug Fixing

1. **Pre-work**: Run Pre-Work Checklist (above)
2. Reproduce the issue
3. Identify root cause
4. Create todo list for fix tasks
5. **Execute**: Run Autonomous Development Loop
6. Add regression test
7. Verify fix resolves issue
8. Commit with reference to bug/issue

## Hotfix (Urgent Production Fix)

**Use for critical production issues that need immediate resolution:**

1. **Pre-work**: Run Pre-Work Checklist
2. Create hotfix branch from main/production: `git checkout -b hotfix/<issue>`
3. Identify and document the issue
4. Implement minimal fix (avoid scope creep)
5. Write regression test
6. Run full test suite
7. Commit with `[HOTFIX]` prefix in message
8. Create PR for expedited review
9. After merge, backport to development branch if needed
10. Update project context with post-mortem notes

## Refactoring

**Use when improving code structure without changing functionality:**

1. **Pre-work**: Run Pre-Work Checklist
2. Document current behavior with tests (if not already covered)
3. Create refactoring branch: `git checkout -b refactor/<area>`
4. Create todo list for refactoring steps
5. **Execute**: Run Autonomous Development Loop
   - **Critical**: Tests must pass after each step
   - No functionality changes allowed
6. Verify all existing tests still pass
7. Update documentation if APIs changed
8. Create pull request

## Code Review

1. Check for coding standard compliance
2. Review security implications
3. Verify test coverage
4. Check for performance issues
5. Ensure no scope creep beyond PR description
6. Verify documentation is updated

## Context Update

**When to update project context:**

1. After completing a significant feature
2. When architectural decisions are made
3. When new dependencies are added
4. When known issues are discovered or resolved
5. When environment setup changes

**What to update:**
- Current State section with progress
- Key Components if new modules added
- Known Issues if bugs discovered
- Dependencies if new ones added
- Tech Stack if tools/frameworks change

---

## Skill Discovery

**An invokable workflow for listing capabilities and offering elaboration.**

### Triggers

- "What skills do you have?"
- "List your capabilities"
- "What can you do?"
- "Show me your skills"
- After toolkit installation or update

### When to Use

1. **Initial onboarding** - After installing the toolkit, introduce capabilities
2. **Refresh** - User wants a reminder of available skills
3. **After update** - Toolkit was updated, show what's new or changed
4. **Exploration** - User is deciding which skill to use

### Workflow

```
1. READ toolkit skill index (skills/_index.md)
2. READ TOGAF index (skills/optional/togaf/_index.md)
3. READ analysis outputs index (skills/optional/analysis-outputs/_index.md)

4. PRESENT skills organized by category:

   **Analysis Skills** (understand codebases)
   - codebase-analysis: Base analysis engine
   - arch-analysis: 8-phase architecture documentation
   - security-analysis: Security + compliance (OWASP, NIST, CIS, ISO, NIS 2)
   - nonfunctional-analysis: Testing, config, performance, health
   - architecture-synthesis: From diagrams to architecture model
   - fitness-functions: Evolutionary architecture fitness

   **Architecture & Modeling** (enterprise patterns)
   - structurizr: C4 modeling with Structurizr DSL
   - TOGAF ADM: Full cycle (Preliminary + Phases A-H)

   **Development Workflows** (coding practices)
   - git-workflow: Commits, branching, PRs
   - todo-workflow: Autonomous task-based development
   - software-design: Patterns and principles
   - tech-stack-decisions: Technology evaluation, ADRs
   - code-conventions: Style guides
   - presentation: Slide generation (PPTX, PDF)

   **Output Formats** (export options)
   - core-architecture, architecture-docs, coding-context
   - product-spec, structurizr, archimate

5. PRESENT invokable commands:
   - "Analyze the architecture"
   - "Analyze security"
   - "Analyze code quality"
   - "Create C4 model"
   - "Apply TOGAF"
   - "Use todo workflow"
   - "Generate presentation"
   - etc.

6. OFFER to elaborate:
   "Would you like me to explain any of these skills in more detail?
    Just name the skill or category you're interested in."

7. IF user requests elaboration:
   - Read the skill's README.md
   - Summarize key concepts and use cases
   - Show example invocations
   - Offer to demonstrate or run the skill
```

### Output Format

```markdown
## What I Can Do

I've learned the AI Architect Toolbox. Here's what I can help you with:

### Analysis Skills
| Skill | What It Does | Try It |
|-------|--------------|--------|
| arch-analysis | Document your codebase architecture | "Analyze the architecture" |
| security-analysis | Security assessment + compliance | "Analyze security" |
| ... | ... | ... |

### Architecture & Modeling
...

### Development Workflows
...

---

**Want details on any skill?** Just ask, and I'll explain what it does and show examples.
```

### Elaboration Response

When user asks for details on a specific skill:

```markdown
## {Skill Name}

**Purpose**: {One-line description}

**When to use**:
- {Use case 1}
- {Use case 2}

**What it produces**:
- {Output 1}
- {Output 2}

**Example commands**:
- "{Example invocation 1}"
- "{Example invocation 2}"

**Want me to run this skill now?**
```
