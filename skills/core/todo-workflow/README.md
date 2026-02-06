# Todo Workflow Skill

An invokable, configurable workflow for autonomous and semi-autonomous development with built-in checkpoints, validation, testing, and git integration.

## Quick Start

```
"Use todo workflow"                           # Full autonomous
"Use todo workflow, review code changes"      # Stop for code reviews
"Use todo workflow --dry-run"                 # Preview without executing
"Continue"                                    # Resume after review
```

---

## Principles

### 1. Atomic Commits
Each todo item results in one commit. This enables:
- Easy rollback of individual changes
- Clear git history
- Bisectable history for debugging

### 2. Test-Driven Validation
For code changes:
- Write tests based on specification
- Run full test suite after each item
- No commit until tests pass

### 3. Explicit Checkpoints
User controls when to pause:
- Review all changes
- Review only code changes
- Review specific items
- Full autonomous execution

### 4. Safe by Default
Pre-work checks prevent common issues:
- Warn if on main branch
- Warn if tests already failing
- Warn if working directory dirty

---

## Invocation

### Basic Modes

| Command | Behavior |
|---------|----------|
| `Use todo workflow` | Full autonomous execution |
| `Use todo workflow, review all` | Stop after every item |
| `Use todo workflow, review code` | Stop only for code changes |
| `Use todo workflow, review tests` | Stop after writing tests |
| `Use todo workflow, review items 2,4,5` | Stop after specific items |

### Options

| Option | Description |
|--------|-------------|
| `--dry-run` | Preview workflow without making changes |
| `--push` | Push after each commit |
| `--push-end` | Push only at workflow end |
| `--branch <name>` | Create/use specific branch |
| `--batch` | Group related items into single commits |
| `--no-tests` | Skip test requirement (use sparingly) |

### Examples

```
"Use todo workflow --dry-run"
"Use todo workflow, review code --push-end --branch feature/auth"
"Use todo workflow --batch, review critical items"
```

---

## Workflow Modes

### Autonomous Mode (Default)

Executes all items without stopping unless:
- Tests fail after 3 retries
- Unrecoverable error occurs
- Blocker encountered

Best for: Well-defined tasks, trusted specifications, experienced users.

### Semi-Autonomous Mode

Stops at specified checkpoints for user review.

**Review Types:**

| Type | When Stops |
|------|------------|
| `review all` | After every item |
| `review code` | After items with code changes |
| `review tests` | After writing tests, before commit |
| `review items N,M` | After specific item numbers |
| `review critical` | After items marked `[critical]` |

Best for: Learning, sensitive code areas, complex changes.

### Dry Run Mode

Simulates the workflow without making changes:
- Shows what files would be created/modified
- Shows what tests would be run
- Shows what commits would be made
- No actual file writes or git operations

Best for: Previewing scope, validating understanding, demos.

---

## Pre-Work Checks

Before starting any autonomous work, these checks run:

### 1. Branch Check

```
IF on main/master:
  → STOP and notify
  → Options: create branch, continue anyway, specify branch
```

### 2. Test Suite Check

```
IF tests fail:
  → STOP and notify (list failing tests)
  → Options: fix first, continue with baseline, skip check
```

### 3. Working Directory Check

```
IF uncommitted changes:
  → STOP and notify (list changed files)
  → Options: stash, commit first, continue dirty
```

---

## Item Features

### Dependencies

Mark items that depend on others:

```
Todo:
1. [ ] Create user model
2. [ ] Create user service (depends: 1)
3. [ ] Create user API (depends: 2)
```

Workflow enforces order and won't start item 2 until item 1 completes.

### Priority / Critical

Mark items requiring review:

```
Todo:
1. [ ] Add validation utils
2. [ ] Update auth logic [critical]
3. [ ] Add tests
```

With `review critical`, stops after item 2.

### Batching

Group related items into single commits:

```
Todo [batch: user-feature]:
1. [ ] Create user model
2. [ ] Create user service
3. [ ] Create user tests

→ Single commit: "feat(users): add user model, service, and tests"
```

---

## Validation

### For Code Changes

1. **Tests Required**
   - Write unit tests for new functions
   - Update tests for modified functions
   - Run full test suite

2. **Linting**
   - Run project linter if configured
   - Fix any errors before commit

3. **Type Checking**
   - Run type checker if configured
   - No type errors allowed

### For Documentation

1. **Structure** - Matches expected format
2. **Links** - Internal links resolve
3. **Completeness** - Required sections present

### For Configuration

1. **Syntax** - Valid format (JSON, YAML, etc.)
2. **Schema** - Matches expected schema if defined
3. **Functionality** - Test that config works

---

## Error Handling

| Scenario | Action |
|----------|--------|
| Tests fail (attempt 1-2) | Fix and retry |
| Tests fail (attempt 3) | STOP, notify, wait for instruction |
| File creation fails | STOP, notify, wait for instruction |
| Git operation fails | STOP, notify with error |
| Dependency not met | Skip item, continue or stop based on mode |
| Blocker encountered | Document, move to next or stop |

### Rollback

If an item fails mid-way:
1. Discard uncommitted changes for that item
2. Document what failed and why
3. Either: retry, skip, or stop workflow

Per-item rollback preserves completed work.

---

## Git Operations

### Allowed (Automatic)

| Operation | When Used |
|-----------|-----------|
| `git status` | Pre-work, validation |
| `git branch` | Branch check |
| `git checkout -b` | Create feature branch |
| `git add <files>` | Stage specific files |
| `git commit -m` | After each item |
| `git stash` / `git stash pop` | Pre-work if dirty |
| `git diff` | Review changes |
| `git log` | Summary |
| `git push` | When requested |

### Requires Explicit Permission

| Operation | Risk |
|-----------|------|
| `git push --force` | Destroys remote history |
| `git reset --hard` | Destroys local changes |
| `git rebase` | Rewrites history |
| Commit to main/master | Bypasses PR process |

---

## State Management

### Persisted Between Stops

- Current item index
- Completed items list
- Failed items with reasons
- Review mode settings
- Branch name
- Commits made

### Resume Command

After review checkpoint:

```
"Continue"                    # Proceed with next item
"Continue, skip item 3"       # Skip specific item
"Continue, abort"             # Stop workflow gracefully
"Redo last item"              # Retry the last item
```

---

## Exit Conditions

### Success
- All items completed
- All tests passing
- All changes committed
- Optional: pushed to remote

### Partial Success
- Some items completed
- Blockers documented for remaining
- Completed work is committed

### Failure
- Critical error encountered
- User aborts with `abort`
- Unrecoverable state reached

### Dry Run Complete
- Preview shown
- No changes made
- Ready for actual run

---

## Best Practices

### Do

- Use feature branches for multi-item work
- Mark security-sensitive items as `[critical]`
- Use `--dry-run` first for unfamiliar tasks
- Keep items small and focused
- Write clear item descriptions

### Don't

- Use `--no-tests` for production code
- Skip pre-work checks habitually
- Batch unrelated changes
- Ignore failing tests
- Work on main without good reason
