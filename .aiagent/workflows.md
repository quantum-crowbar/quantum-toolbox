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

## Feature Development

1. **Pre-work**: Run Pre-Work Checklist (above)
2. Read context.md for current project state
3. Create a feature branch: `git checkout -b feature/<name>`
4. Create todo list for implementation tasks
5. **Execute**: Run Autonomous Development Loop for each todo
6. Ensure all tests pass
7. Update context.md if significant changes made
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
10. Update context.md with post-mortem notes

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

**When to update context.md:**

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

## Deployment

<!-- Document deployment process -->

## Testing

<!-- Document testing procedures -->

## Documentation Updates

<!-- When and how to update documentation -->
