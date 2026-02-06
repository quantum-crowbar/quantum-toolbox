# Todo Workflow Templates

Reusable templates for todo items, checkpoints, and reports.

---

## Todo Item Templates

### Basic Item

```markdown
[ ] <description>
```

### Item with Type

```markdown
[ ] <description> [code|docs|config]
```

### Item with Dependency

```markdown
[ ] <description> (depends: <item-number>)
[ ] <description> (depends: <item-number>, <item-number>)
```

### Item with Critical Flag

```markdown
[ ] <description> [critical]
```

### Item with Batch Group

```markdown
[ ] <description> [batch: <group-name>]
```

### Combined

```markdown
[ ] <description> [code] [critical] (depends: 1) [batch: auth]
```

---

## Todo List Templates

### Simple Task

```markdown
## Todo List

1. [ ] <item 1>
2. [ ] <item 2>
3. [ ] <item 3>
```

### Feature Development

```markdown
## Todo List: <Feature Name>

### Setup
1. [ ] Create feature branch
2. [ ] Set up directory structure

### Implementation
3. [ ] Create data models [code]
4. [ ] Create service layer [code] (depends: 3)
5. [ ] Create API endpoints [code] (depends: 4)
6. [ ] Create UI components [code] (depends: 5)

### Testing
7. [ ] Write unit tests [code]
8. [ ] Write integration tests [code]

### Documentation
9. [ ] Update API docs [docs]
10. [ ] Update README [docs]
```

### Bug Fix

```markdown
## Todo List: Fix <Bug Description>

### Investigation
1. [ ] Reproduce the issue
2. [ ] Identify root cause

### Fix
3. [ ] Implement fix [code] [critical]
4. [ ] Add regression test [code] (depends: 3)

### Verification
5. [ ] Verify fix in development
6. [ ] Update related documentation [docs]
```

### Refactoring

```markdown
## Todo List: Refactor <Component>

### Preparation
1. [ ] Ensure test coverage exists
2. [ ] Document current behavior

### Refactoring [batch: refactor]
3. [ ] Extract interface [code]
4. [ ] Update implementation [code] (depends: 3)
5. [ ] Update consumers [code] (depends: 4)

### Cleanup
6. [ ] Remove deprecated code [code]
7. [ ] Update documentation [docs]
```

### Migration

```markdown
## Todo List: Migrate <From> to <To>

### Preparation
1. [ ] Create migration plan
2. [ ] Set up new infrastructure [config]
3. [ ] Create rollback procedure

### Migration [critical]
4. [ ] Migrate data [code] [critical]
5. [ ] Update application code [code] (depends: 4)
6. [ ] Verify migration [code] (depends: 5)

### Cleanup
7. [ ] Remove old infrastructure [config]
8. [ ] Update documentation [docs]
```

---

## Review Checkpoint Templates

### Standard Checkpoint

```markdown
## Review Checkpoint: Item <N> - <Description>

### Changes Made
- <file1>: <description of change>
- <file2>: <description of change>

### Tests
- [X] Tests written/updated
- [X] All tests passing (<N> total)

### Files to Commit
- path/to/file1
- path/to/file2

### Proposed Commit
`<type>(<scope>): <description>`

---
Reply: continue | skip | abort | redo
```

### Critical Item Checkpoint

```markdown
## ⚠️ Review Checkpoint: CRITICAL Item <N>

### <Item Description>

**Why Critical:** <explanation of why this needs review>

### Changes Made
- <file1>: <description of change>
- <file2>: <description of change>

### Risk Assessment
| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| <risk1> | Low/Med/High | Low/Med/High | <mitigation> |

### Rollback Plan
<how to undo these changes if needed>

### Tests
- [X] Tests written/updated
- [X] All tests passing (<N> total)
- [X] Edge cases covered
- [X] Error cases covered

### Proposed Commit
`<type>(<scope>): <description>`

---
⚠️ This is a critical change. Please review carefully.
Reply: continue | skip | abort | redo
```

### Batch Completion Checkpoint

```markdown
## Review Checkpoint: Batch "<batch-name>" Complete

### Items in Batch
1. ✓ <item 1>
2. ✓ <item 2>
3. ✓ <item 3>

### All Changes
| File | Change Type | Description |
|------|-------------|-------------|
| <file1> | created | <description> |
| <file2> | modified | <description> |
| <file3> | created | <description> |

### Tests
- [X] All batch items tested
- [X] All tests passing (<N> total)

### Proposed Batch Commit
`<type>(<scope>): <batch description>`

---
Reply: continue | split (commit separately) | abort
```

---

## Status Report Templates

### Pre-Work Report

```markdown
## Pre-Work Checks

| Check | Status | Details |
|-------|--------|---------|
| Branch | ✓/⚠️ | <branch-name> |
| Tests | ✓/⚠️ | <N>/<N> passing |
| Working Directory | ✓/⚠️ | clean / <N> changes |

<if warnings>
### Warnings

- <warning 1>
- <warning 2>

### Options
a) <option 1>
b) <option 2>
c) <option 3>
</if>
```

### Progress Report

```markdown
## Workflow Progress

### Status: <In Progress | Paused | Complete>

### Items
| # | Status | Description |
|---|--------|-------------|
| 1 | ✓ | <completed item> |
| 2 | ✓ | <completed item> |
| 3 | → | <in progress item> |
| 4 | ○ | <pending item> |
| 5 | ○ | <pending item> |

### Commits Made
- `<hash>` <message>
- `<hash>` <message>

### Tests
- Baseline: <N> passing
- Current: <N> passing (+<N> new)

### Time Elapsed: <duration>
```

### Completion Report

```markdown
## Workflow Complete

### Summary
- **Items**: <completed>/<total> completed
- **Commits**: <N> commits made
- **Tests**: <N> total (<N> new)
- **Branch**: <branch-name>

### Commits
| Hash | Message |
|------|---------|
| <hash> | <message> |
| <hash> | <message> |

### Files Changed
- <N> files created
- <N> files modified
- <N> files deleted

### Test Results
✓ All <N> tests passing

### Next Steps
- [ ] Create pull request
- [ ] Request code review
- [ ] <other action>
```

### Failure Report

```markdown
## Workflow Stopped

### Status: <Failed | Aborted | Blocked>

### Progress
- **Completed**: <N>/<total> items
- **Failed**: Item <N> - <description>
- **Pending**: <N> items

### Error Details
```
<error message or description>
```

### Completed Commits
| Hash | Message |
|------|---------|
| <hash> | <message> |

### Recovery Options
a) Fix issue and resume: `continue todo workflow`
b) Skip failed item: `continue, skip item <N>`
c) Abort and keep progress: commits preserved
d) Full rollback: revert all session commits
```

---

## Dry Run Report Template

```markdown
## Dry Run Report

### [DRY RUN MODE - No changes made]

### Pre-Work Checks (Simulated)
| Check | Would Check | Current Value |
|-------|-------------|---------------|
| Branch | Yes | <branch-name> |
| Tests | Yes | <N>/<N> passing |
| Working Dir | Yes | clean |

### Planned Items
| # | Description | Type | Files |
|---|-------------|------|-------|
| 1 | <description> | code | <N> files |
| 2 | <description> | code | <N> files |
| 3 | <description> | docs | <N> files |

### Simulated Changes
| Action | File | Description |
|--------|------|-------------|
| create | <path> | <description> |
| modify | <path> | <description> |
| create | <path> | <description> |

### Planned Commits
1. `<type>(<scope>): <message>`
2. `<type>(<scope>): <message>`
3. `<type>(<scope>): <message>`

### Summary
- Items: <N>
- Files to create: <N>
- Files to modify: <N>
- Commits planned: <N>

### [END DRY RUN]

Run workflow for real? (yes/no)
```

---

## Invocation Templates

### Quick Reference

```markdown
## Todo Workflow Invocation

### Basic
Use todo workflow

### With Review Mode
Use todo workflow, review all
Use todo workflow, review code
Use todo workflow, review tests
Use todo workflow, review items 2,4,5
Use todo workflow, review critical

### With Options
Use todo workflow --dry-run
Use todo workflow --push
Use todo workflow --push-end
Use todo workflow --branch feature/name
Use todo workflow --batch
Use todo workflow --no-tests

### Combined
Use todo workflow, review code --push-end --branch feature/auth

### Resume
continue
continue, skip item 3
continue, abort
redo last item
```

---

## Configuration Template

```markdown
## Workflow Configuration

### Session Settings
| Setting | Value |
|---------|-------|
| Mode | autonomous / semi-autonomous |
| Review Type | all / code / tests / items / critical |
| Push | per-item / end / none |
| Branch | <branch-name> |
| Batch | enabled / disabled |
| Tests | required / optional |
| Dry Run | yes / no |

### Review Items (if applicable)
- Item <N>
- Item <N>

### Batch Groups (if applicable)
- <group-name>: items <N>, <N>, <N>
```
