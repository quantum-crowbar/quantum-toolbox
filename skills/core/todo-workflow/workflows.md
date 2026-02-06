# Todo Workflow Procedures

Detailed step-by-step procedures for the todo-driven development workflow.

---

## Main Workflow

### Invocation Parser

```
PARSE user command for:
  1. Mode: autonomous (default) | semi-autonomous
  2. Review type: all | code | tests | items:N,M | critical
  3. Options:
     - dry_run: boolean
     - push: per-item | end | none (default)
     - branch: string | null
     - batch: boolean
     - skip_tests: boolean

STORE configuration for workflow session
```

---

## Pre-Work Checks

**Run these before any autonomous/semi-autonomous work:**

### Step 1: Branch Check

```
1. RUN: git branch --show-current
2. IF branch is 'main' OR 'master':
   a. NOTIFY user:
      "⚠️ You are on [branch] branch.

       Options:
       a) Create feature branch (recommended)
       b) Continue on [branch]
       c) Specify different branch"

   b. WAIT for user response

   c. IF create branch:
      - ASK for branch name (or suggest based on task)
      - RUN: git checkout -b <branch-name>

   d. IF continue on main:
      - LOG warning
      - PROCEED with caution flag

3. IF branch is not main/master:
   - LOG: "Working on branch: [branch]"
   - PROCEED
```

### Step 2: Test Suite Check

```
1. DETECT test runner:
   - Check for: package.json (npm test), pytest.ini, Cargo.toml, etc.
   - If no test runner found: SKIP with note

2. RUN test suite:
   - npm test | pytest | cargo test | etc.

3. CAPTURE results:
   - Total tests
   - Passing tests
   - Failing tests (with names)

4. IF any tests fail:
   a. NOTIFY user:
      "⚠️ [N] tests failing before starting work:
       - test_name_1
       - test_name_2

       Options:
       a) Fix failing tests first
       b) Continue (baseline: N failures)
       c) Skip test check"

   b. WAIT for user response

   c. IF fix first: STOP workflow, user fixes
   d. IF continue: RECORD baseline failures
   e. IF skip: LOG warning, proceed without test validation

5. IF all tests pass:
   - LOG: "✓ All [N] tests passing"
   - RECORD baseline: 0 failures
   - PROCEED
```

### Step 3: Working Directory Check

```
1. RUN: git status --porcelain

2. IF output is not empty (dirty):
   a. PARSE changed files
   b. NOTIFY user:
      "⚠️ Uncommitted changes detected:
       - [file1] (modified)
       - [file2] (untracked)

       Options:
       a) Stash changes
       b) Commit changes first
       c) Continue with dirty state"

   c. WAIT for user response

   d. IF stash:
      - RUN: git stash push -m "Pre-workflow stash"
      - LOG: "Changes stashed"
   e. IF commit first: STOP workflow, user commits
   f. IF continue dirty: LOG warning, proceed

3. IF clean:
   - LOG: "✓ Working directory clean"
   - PROCEED
```

---

## Todo List Creation

```
1. ANALYZE task requirements
2. BREAK DOWN into discrete items
3. FOR EACH item:
   a. Assign unique index
   b. Set status: pending
   c. Identify type: code | docs | config | other
   d. Check for dependencies
   e. Check for critical flag
   f. Check for batch group

4. PRESENT todo list to user:
   "Todo List:
    1. [ ] Item description
    2. [ ] Item description (depends: 1)
    3. [ ] Item description [critical]
    4. [ ] Item description [batch: feature-x]"

5. IF dry_run mode:
   - PROCEED to dry run simulation
   - SKIP actual execution

6. IF not dry_run:
   - PROCEED to main loop
```

---

## Main Execution Loop

```
WHILE items remain:

  1. SELECT next item:
     - Skip items with unmet dependencies
     - Skip already completed items
     - Pick first pending item

  2. CHECK dependencies:
     IF has dependencies AND dependency not completed:
       - SKIP item
       - LOG: "Skipping [item]: waiting for dependency [dep]"
       - CONTINUE to next item

  3. MARK item as in_progress
     - Only one item in_progress at a time

  4. EXECUTE item:
     - SEE: Item Execution Procedure

  5. VALIDATE changes:
     - SEE: Validation Procedure

  6. IF validation fails:
     - Attempt fix (max 3 times)
     - IF still failing:
       - STOP or skip based on mode
       - NOTIFY user

  7. IF validation passes:
     a. IF batch mode AND item in batch group:
        - STAGE files
        - DEFER commit until batch complete
     b. ELSE:
        - STAGE files
        - COMMIT with message
        - IF push per-item: git push

  8. CHECK for review checkpoint:
     IF should_stop_for_review(item, config):
       - PRESENT review checkpoint
       - WAIT for user response
       - HANDLE response (continue | skip | abort | redo)

  9. MARK item as completed

  10. CONTINUE to next item

ON LOOP EXIT:
  - IF batch commits pending: COMMIT batched changes
  - IF push_end: git push
  - PRESENT summary
```

---

## Item Execution Procedure

### For Code Changes

```
1. IMPLEMENT the change:
   - Create/modify source files
   - Follow existing code patterns
   - Add inline documentation if needed

2. WRITE tests:
   a. Identify what needs testing:
      - New functions/methods
      - Modified behavior
      - Edge cases

   b. Create test file if needed

   c. Write test cases:
      - Happy path
      - Error cases
      - Edge cases

   d. Ensure tests are specific to this item

3. RUN linter (if configured):
   - Fix any linting errors
   - Re-run until clean

4. RUN type checker (if configured):
   - Fix any type errors
   - Re-run until clean

5. RUN full test suite:
   - All existing tests must pass
   - New tests must pass
   - IF failures: attempt fix, retry up to 3 times
```

### For Documentation Changes

```
1. CREATE/MODIFY documentation:
   - Follow existing structure
   - Use consistent formatting
   - Include all required sections

2. VALIDATE structure:
   - Check headings hierarchy
   - Check required sections present

3. VALIDATE links:
   - Check internal links resolve
   - Check external links if feasible

4. CHECK completeness:
   - No TODO placeholders left
   - No empty sections
```

### For Configuration Changes

```
1. MODIFY configuration:
   - Update config file(s)
   - Maintain valid syntax

2. VALIDATE syntax:
   - JSON: parse test
   - YAML: parse test
   - TOML: parse test
   - etc.

3. VALIDATE schema (if defined):
   - Check against schema
   - Fix any violations

4. TEST functionality:
   - If config affects runtime, verify it works
   - Run relevant tests
```

---

## Validation Procedure

```
1. DETERMINE item type (code | docs | config | other)

2. RUN type-specific validation:

   FOR code:
     - [ ] Linter passes (if configured)
     - [ ] Type checker passes (if configured)
     - [ ] All tests pass
     - [ ] No new test failures vs baseline

   FOR docs:
     - [ ] Structure matches expected format
     - [ ] All internal links resolve
     - [ ] Required sections present

   FOR config:
     - [ ] Syntax is valid
     - [ ] Schema validates (if defined)
     - [ ] Functionality works (if testable)

   FOR other:
     - [ ] File exists
     - [ ] Basic sanity checks pass

3. IF validation fails:
   - LOG failure details
   - ATTEMPT fix
   - RETRY validation (max 3 attempts)

4. IF validation passes:
   - LOG success
   - PROCEED to commit

5. IF validation fails after 3 attempts:
   - LOG detailed failure
   - NOTIFY user with options:
     a) Manual intervention
     b) Skip item
     c) Abort workflow
```

---

## Commit Procedure

### Single Item Commit

```
1. STAGE specific files:
   - git add <file1> <file2> ...
   - Only files related to this item
   - Never use `git add .` or `git add -A`

2. GENERATE commit message:
   - Type: feat | fix | docs | refactor | test | chore
   - Scope: component or area affected
   - Description: concise summary

   Format: <type>(<scope>): <description>

3. COMMIT:
   - git commit -m "<message>"
   - Include co-author if applicable

4. LOG commit:
   - Record commit hash
   - Record files included
   - Record timestamp

5. IF push per-item:
   - git push
   - LOG push result
```

### Batch Commit

```
1. COLLECT all items in batch group

2. VERIFY all items in batch are completed

3. STAGE all files from batch:
   - git add <all-batch-files>

4. GENERATE batch commit message:
   - Include all changes in description
   - Or use batch group name

   Format: <type>(<scope>): <batch-description>

5. COMMIT:
   - git commit -m "<message>"

6. LOG batch commit
```

---

## Review Checkpoint Procedure

```
1. DETERMINE if checkpoint needed:

   IF review_mode == 'all':
     RETURN true

   IF review_mode == 'code' AND item.type == 'code':
     RETURN true

   IF review_mode == 'tests' AND item.type == 'code':
     RETURN true (after writing tests)

   IF review_mode == 'items' AND item.index IN review_items:
     RETURN true

   IF review_mode == 'critical' AND item.has_critical_flag:
     RETURN true

   RETURN false

2. IF checkpoint needed:
   a. PRESENT checkpoint summary:
      "## Review Checkpoint: Item [N] - [Description]

       ### Changes Made
       - [file1]: [description]
       - [file2]: [description]

       ### Tests
       - [X] Tests written/updated
       - [X] All tests passing ([N] total)

       ### Files to Commit
       - path/to/file1
       - path/to/file2

       ### Proposed Commit
       `<type>(<scope>): <description>`

       ---
       Reply: continue | skip | abort | redo"

   b. WAIT for user response

   c. HANDLE response:
      - 'continue': PROCEED with commit and next item
      - 'skip': SKIP this item, mark as skipped, next item
      - 'abort': STOP workflow gracefully
      - 'redo': DISCARD changes, re-execute item
      - custom feedback: INCORPORATE and redo
```

---

## Dry Run Procedure

```
1. LOG: "[DRY RUN MODE - No changes will be made]"

2. RUN pre-work checks (read-only):
   - Report what would be checked
   - Don't actually stop for issues

3. PRESENT todo list:
   - Show all items that would be created

4. FOR EACH item:
   a. LOG: "Item [N]: [Description]"

   b. SIMULATE execution:
      - "→ Would create: [file]"
      - "→ Would modify: [file]"
      - "→ Would run: [test command]"

   c. SIMULATE commit:
      - "→ Would commit: '<message>'"

5. PRESENT summary:
   - Total items
   - Files that would be created
   - Files that would be modified
   - Commits that would be made

6. LOG: "[END DRY RUN - No files were changed]"

7. ASK: "Run workflow for real? (yes/no)"
```

---

## Rollback Procedure

### Per-Item Rollback

```
IF item fails mid-execution:

1. IDENTIFY changes made so far:
   - Files created
   - Files modified
   - Tests added

2. DISCARD uncommitted changes:
   - git checkout -- <modified-files>
   - rm <created-files>

3. LOG rollback:
   - What was discarded
   - Why rollback occurred

4. PRESERVE completed work:
   - Previous commits remain
   - Only current item affected

5. DECIDE next action:
   - Retry item
   - Skip item
   - Stop workflow
```

### Full Workflow Rollback

```
IF user requests full abort:

1. LIST all commits made in this session

2. ASK user:
   "Abort options:
    a) Keep all commits (just stop here)
    b) Revert last N commits
    c) Revert all session commits"

3. IF revert requested:
   - git revert <commits> --no-commit
   - git commit -m "revert: abort workflow session"

4. LOG abort details
```

---

## Resume Procedure

```
WHEN user says "continue" after checkpoint:

1. LOAD saved state:
   - Current item index
   - Completed items
   - Configuration
   - Branch name

2. VALIDATE state:
   - Branch still exists
   - No external changes to completed items
   - Tests still passing

3. IF state valid:
   - PROCEED from where stopped

4. IF state invalid:
   - NOTIFY user of issue
   - Options: restart | manual fix | abort
```
