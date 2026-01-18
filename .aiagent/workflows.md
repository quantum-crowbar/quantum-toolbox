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
REPEAT until all todo items are complete:
  1. Pick next todo item, mark as in_progress
  2. Implement the change
  3. Write/update tests for the change
  4. Run test suite
     - If tests fail: fix issues and re-run
     - If tests pass: continue
  5. Verify implementation meets requirements
  6. Mark todo item as completed
  7. Commit the code with descriptive message
  8. Return to step 1
```

**Exit conditions:**
- All todo items are marked as completed
- All tests are passing
- Code is committed

---

## Feature Development

1. **Pre-work**: Run Pre-Work Checklist (above)
2. Read context.md for current project state
3. Create a feature branch
4. Create todo list for implementation tasks
5. **Execute**: Run Autonomous Development Loop for each todo
6. Ensure all tests pass
7. Create pull request

## Bug Fixing

1. **Pre-work**: Run Pre-Work Checklist (above)
2. Reproduce the issue
3. Identify root cause
4. Create todo list for fix tasks
5. **Execute**: Run Autonomous Development Loop
6. Add regression test
7. Verify fix resolves issue
8. Commit with reference to bug/issue

## Code Review

1. Check for coding standard compliance
2. Review security implications
3. Verify test coverage
4. Check for performance issues

## Deployment

<!-- Document deployment process -->

## Testing

<!-- Document testing procedures -->

## Documentation Updates

<!-- When and how to update documentation -->
