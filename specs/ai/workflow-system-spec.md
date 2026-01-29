# Workflow System Specification

Technical specification for the agent workflow system.

---

## Overview

Workflows are structured procedures that guide agent behavior through multi-step tasks. This spec defines how workflows are structured, invoked, and extended.

---

## Terminology

| Term | Definition |
|------|------------|
| **Workflow** | A defined sequence of steps to accomplish a goal |
| **Phase** | A logical grouping of related steps within a workflow |
| **Step** | A single action or decision point |
| **Checkpoint** | A pause point where user review may occur |
| **Loop** | A repeating pattern with defined exit conditions |

---

## Workflow Types

### 1. Development Workflows

Procedural workflows for code changes.

| Workflow | Trigger | Output |
|----------|---------|--------|
| Feature Development | New feature request | Committed code + PR |
| Bug Fixing | Bug report | Fix + regression test |
| Hotfix | Critical issue | Minimal fix + backport |
| Refactoring | Code quality task | Restructured code |

### 2. Analysis Workflows

Investigative workflows for understanding systems.

| Workflow | Trigger | Output |
|----------|---------|--------|
| Architectural Analysis | "Analyze architecture" | Diagrams + inventory |
| Security Analysis | "Review security" | Threat assessment |
| Code Review | PR or code submission | Review feedback |

### 3. Meta Workflows

Workflows about workflows.

| Workflow | Trigger | Output |
|----------|---------|--------|
| Pre-Work Checklist | Before any task | Ready/blocked status |
| Context Update | After significant work | Updated context file |

---

## Workflow Structure

### Required Elements

Every workflow MUST have:

```markdown
## {Workflow Name}

**Goal**: {Single sentence describing the outcome}

### Phase N: {Phase Name}

**Goal**: {What this phase achieves}

#### Step N.M: {Step Name}

- [ ] {Action item}
- [ ] {Action item}

**Output**: {What this phase produces}
```

### Optional Elements

Workflows MAY include:

- **Prerequisites**: Conditions that must be true before starting
- **Exit Conditions**: When the workflow is complete
- **Failure Conditions**: When to stop and escalate
- **Rollback Procedure**: How to undo partial work
- **Checkpoints**: Where to pause for review

---

## Invokable Workflows

Some workflows can be explicitly triggered by user commands.

### Invocation Pattern

```
"{Trigger phrase}"
"{Trigger phrase}, {modifier}"
"{Trigger phrase} --{option}"
```

### Registration

Invokable workflows MUST be registered in the skills index:

```markdown
## Invokable Skills

| Skill | Invocation | Description |
|-------|------------|-------------|
| `{skill-name}` | `"{trigger}"` | {description} |
```

### Modifiers

Common modifiers:

| Modifier | Effect |
|----------|--------|
| `review {type}` | Add review checkpoints |
| `--dry-run` | Preview without execution |
| `--push` | Push after commits |
| `--branch {name}` | Use specific branch |

---

## Loop Patterns

### Autonomous Development Loop

The core pattern for iterative work:

```
REPEAT until {exit condition} (max {N} retries per item):
  1. Select next item
  2. Execute action
  3. Validate result
     - If failure: retry or escalate
     - If success: continue
  4. Record completion
  5. Commit if applicable
```

### Continuous Verification Loop

Pattern for analysis workflows:

```
FOR EACH finding:
  1. DISCOVER - Find in code
  2. DOCUMENT - Record with evidence
  3. VERIFY - Check against docs
  4. FLAG - Mark accuracy status
```

---

## Checkpoint System

### Checkpoint Types

| Type | When Used |
|------|-----------|
| `review all` | After every item |
| `review code` | After code changes |
| `review tests` | After test changes |
| `review critical` | For items marked `[critical]` |
| `review items N,M` | For specific item numbers |

### Checkpoint Behavior

At a checkpoint:
1. Agent pauses execution
2. Presents current state to user
3. Waits for user input:
   - `"Continue"` - Resume workflow
   - `"Stop"` - Halt workflow
   - `"{Feedback}"` - Apply feedback, then continue

---

## Error Handling

### Retry Policy

```yaml
max_retries: 10          # Per item
retry_scope: item        # Reset counter per item
escalation: user         # On max retries reached
```

### Failure Response

When a workflow cannot proceed:

1. Stop execution immediately
2. Document current state
3. List blockers encountered
4. Preserve work (stash or commit WIP)
5. Inform user with actionable next steps

---

## Workflow Composition

### Sequential Composition

Workflows can chain:

```
Pre-Work Checklist → Feature Development → Context Update
```

### Parallel Composition

Independent phases can run concurrently (when tooling supports):

```
Technology Scan ─┬─→ Combine Results
Interface Scan  ─┘
```

### Nested Composition

Workflows can invoke sub-workflows:

```
Feature Development
  └─→ Autonomous Development Loop (per todo item)
       └─→ Test Validation Loop (per change)
```

---

## File Organization

### Central Workflows

Location: `.aiagent/core/workflows.md`

Contains:
- Pre-Work Checklist
- Autonomous Development Loop
- Todo-Driven Development
- Feature/Bug/Hotfix/Refactor workflows
- Context Update workflow

### Skill-Specific Workflows

Location: `.aiagent/skills/{type}/{skill-name}/workflows.md`

Contains:
- Workflows specific to that skill
- Must follow same structure as central workflows
- May reference central workflows

---

## Extension Guidelines

### Adding a New Workflow

1. Determine if central or skill-specific
2. Write workflow following required structure
3. Add to appropriate `workflows.md` file
4. If invokable, register in skills index
5. Add examples to `examples.md`
6. Update checklist if applicable

### Modifying Existing Workflows

1. Maintain backward compatibility with triggers
2. Document changes in commit message
3. Update related examples
4. Test with dry-run if supported

---

## Validation Checklist

A well-formed workflow:

- [ ] Has a clear, single-sentence goal
- [ ] Breaks into logical phases
- [ ] Each phase has its own goal
- [ ] Steps are actionable (start with verb)
- [ ] Outputs are defined for each phase
- [ ] Exit conditions are explicit
- [ ] Failure handling is specified
- [ ] Evidence/output format is shown
