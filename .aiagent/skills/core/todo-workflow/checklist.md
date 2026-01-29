# Todo Workflow Checklists

Quick reference checklists for workflow operations.

---

## Pre-Work Checklist

### Branch Check
- [ ] Check current branch: `git branch --show-current`
- [ ] If on main/master: create feature branch or confirm continue
- [ ] Branch name follows convention (feature/, bugfix/, etc.)

### Test Suite Check
- [ ] Identify test command (npm test, pytest, etc.)
- [ ] Run full test suite
- [ ] Record baseline: all passing or note failures
- [ ] If failures: decide to fix, continue with baseline, or skip

### Working Directory Check
- [ ] Run `git status`
- [ ] If dirty: stash, commit, or continue with warning
- [ ] Ensure no untracked sensitive files

---

## Todo Item Creation Checklist

### For Each Item
- [ ] Clear, actionable description
- [ ] Correct type assigned (code/docs/config)
- [ ] Dependencies identified
- [ ] Critical flag if security/auth related
- [ ] Batch group if related to others

### Overall List
- [ ] Items are in logical order
- [ ] Dependencies form valid DAG (no cycles)
- [ ] Scope is appropriate (not too large)
- [ ] All items are necessary

---

## Code Change Checklist

### Before Writing Code
- [ ] Understand the requirement
- [ ] Identify files to create/modify
- [ ] Know what tests to write

### While Writing Code
- [ ] Follow existing patterns
- [ ] Keep changes focused to this item
- [ ] Add necessary imports
- [ ] Handle errors appropriately

### After Writing Code
- [ ] Run linter
- [ ] Run type checker
- [ ] Write/update tests
- [ ] Run full test suite
- [ ] All tests pass

---

## Test Writing Checklist

### Coverage
- [ ] Happy path tested
- [ ] Error cases tested
- [ ] Edge cases tested
- [ ] Boundary conditions tested

### Quality
- [ ] Tests are independent
- [ ] Tests are deterministic
- [ ] Test names describe behavior
- [ ] Assertions are specific

### Integration
- [ ] Tests run with existing suite
- [ ] No test pollution
- [ ] Reasonable execution time

---

## Commit Checklist

### Before Staging
- [ ] Only files for this item
- [ ] No unrelated changes
- [ ] No debug code left
- [ ] No sensitive data

### Commit Message
- [ ] Follows format: `<type>(<scope>): <description>`
- [ ] Type is correct (feat/fix/docs/refactor/test/chore)
- [ ] Scope identifies affected area
- [ ] Description is clear and concise
- [ ] Imperative mood ("add" not "added")

### After Commit
- [ ] Verify commit with `git log -1`
- [ ] Verify files with `git show --stat`

---

## Review Checkpoint Checklist

### Information to Present
- [ ] Item number and description
- [ ] Files changed (create/modify/delete)
- [ ] Summary of changes
- [ ] Test status
- [ ] Proposed commit message

### For Critical Items
- [ ] Explain why critical
- [ ] Risk assessment
- [ ] Rollback plan
- [ ] Extra test coverage noted

### Handling Response
- [ ] `continue` → proceed
- [ ] `skip` → skip item, move on
- [ ] `abort` → stop gracefully
- [ ] `redo` → discard and retry
- [ ] feedback → incorporate and redo

---

## Validation Checklist

### Code Validation
- [ ] Linter passes (no errors)
- [ ] Type checker passes (no errors)
- [ ] All tests pass
- [ ] No new test failures vs baseline
- [ ] Code review criteria met

### Documentation Validation
- [ ] Required sections present
- [ ] Headings properly nested
- [ ] Internal links work
- [ ] No placeholder text left
- [ ] Formatting consistent

### Configuration Validation
- [ ] Syntax is valid
- [ ] Schema validates (if defined)
- [ ] No sensitive values exposed
- [ ] Functionality verified (if testable)

---

## Error Handling Checklist

### On Test Failure
- [ ] Read error message carefully
- [ ] Identify failing test(s)
- [ ] Determine if code bug or test bug
- [ ] Fix and retry (up to 3 times)
- [ ] If stuck: stop, notify, document

### On Validation Failure
- [ ] Identify what failed
- [ ] Understand why
- [ ] Fix root cause (not symptoms)
- [ ] Retry validation

### On Unrecoverable Error
- [ ] Stop workflow
- [ ] Document error details
- [ ] Preserve completed work
- [ ] Present options to user
- [ ] Log for future reference

---

## Rollback Checklist

### Per-Item Rollback
- [ ] Identify files changed
- [ ] Discard uncommitted changes
- [ ] Remove created files
- [ ] Document what failed
- [ ] Decide: retry, skip, or stop

### Full Workflow Rollback
- [ ] List all session commits
- [ ] Confirm with user
- [ ] Use `git revert` (preserves history)
- [ ] Or reset if confirmed
- [ ] Document rollback reason

---

## Completion Checklist

### Before Declaring Complete
- [ ] All items marked completed
- [ ] All tests passing
- [ ] All changes committed
- [ ] No uncommitted changes
- [ ] Branch is clean

### Summary Report
- [ ] Item count (completed/total)
- [ ] Commit count
- [ ] Test count (new tests added)
- [ ] Files changed count
- [ ] Any skipped items noted

### Next Steps
- [ ] Push if requested
- [ ] Create PR if applicable
- [ ] Notify stakeholders if needed
- [ ] Update project documentation

---

## Dry Run Checklist

### Before Dry Run
- [ ] Understand the task
- [ ] Have a clear objective
- [ ] Know what to look for

### During Dry Run
- [ ] Verify item breakdown
- [ ] Check file creation plan
- [ ] Check modification plan
- [ ] Verify commit plan
- [ ] Note any concerns

### After Dry Run
- [ ] Review summary
- [ ] Adjust if needed
- [ ] Decide: run for real or modify

---

## Mode Selection Guide

| Situation | Recommended Mode |
|-----------|------------------|
| Well-defined task, trusted spec | Autonomous |
| Learning the workflow | Review all |
| Sensitive code (auth, payments) | Review critical |
| Complex refactoring | Review code |
| Documentation updates | Autonomous |
| First time with codebase | Review all |
| Quick fixes | Autonomous |
| Large feature | Review code + dry run first |

---

## Quick Command Reference

| Action | Command |
|--------|---------|
| Start autonomous | `Use todo workflow` |
| Start with code review | `Use todo workflow, review code` |
| Start dry run | `Use todo workflow --dry-run` |
| Create branch | `Use todo workflow --branch feature/x` |
| Push at end | `Use todo workflow --push-end` |
| Continue after review | `continue` |
| Skip current item | `continue, skip item N` |
| Abort workflow | `continue, abort` |
| Retry last item | `redo last item` |
