# Git Workflow Procedures

Step-by-step procedures for common Git operations.

---

## Starting New Work

### Create Feature Branch

```bash
# Ensure you're on main and up to date
git checkout main
git pull origin main

# Create and switch to feature branch
git checkout -b feature/<descriptive-name>
```

### Before Each Coding Session

```bash
# Check current state
git status
git branch

# If on a feature branch, update from main
git fetch origin
git rebase origin/main
```

---

## During Development

### Staging Changes

```bash
# Stage specific files (preferred)
git add path/to/file.ts path/to/another.ts

# Stage all changes in a directory
git add src/components/

# Review what will be committed
git diff --staged
```

### Making Commits

```bash
# Commit with message
git commit -m "feat(auth): add login form validation"

# Commit with longer message (opens editor)
git commit

# Amend last commit (only if not pushed)
git commit --amend
```

### Saving Work in Progress

```bash
# Stash current changes
git stash push -m "WIP: description of work"

# List stashes
git stash list

# Apply most recent stash
git stash pop

# Apply specific stash
git stash apply stash@{2}
```

---

## Syncing with Remote

### Push Changes

```bash
# Push feature branch (first time)
git push -u origin feature/<name>

# Push subsequent changes
git push
```

### Update from Main

```bash
# Fetch latest
git fetch origin

# Rebase onto main (keeps history clean)
git rebase origin/main

# If conflicts occur:
# 1. Resolve conflicts in files
# 2. Stage resolved files: git add <file>
# 3. Continue rebase: git rebase --continue
# 4. Or abort: git rebase --abort
```

---

## Pull Request Workflow

### Prepare for PR

```bash
# Ensure branch is up to date with main
git fetch origin
git rebase origin/main

# Run tests locally
npm test  # or your test command

# Push final changes
git push
```

### After PR Approval

```bash
# Squash and merge (via GitHub UI) is preferred
# Or merge locally:
git checkout main
git pull origin main
git merge --no-ff feature/<name>
git push origin main

# Delete feature branch
git branch -d feature/<name>
git push origin --delete feature/<name>
```

---

## Handling Issues

### Undo Last Commit (Not Pushed)

```bash
# Keep changes staged
git reset --soft HEAD~1

# Keep changes unstaged
git reset HEAD~1

# Discard changes completely (DANGEROUS)
git reset --hard HEAD~1
```

### Undo Changes to a File

```bash
# Discard unstaged changes
git checkout -- path/to/file.ts

# Unstage a file (keep changes)
git reset HEAD path/to/file.ts
```

### Recover Deleted Branch

```bash
# Find the commit SHA
git reflog

# Recreate branch at that commit
git checkout -b recovered-branch <sha>
```

### Fix Commit on Wrong Branch

```bash
# If not pushed yet:
# 1. Note the commit SHA
git log --oneline -1

# 2. Remove from current branch
git reset --hard HEAD~1

# 3. Switch to correct branch and cherry-pick
git checkout correct-branch
git cherry-pick <sha>
```

---

## Hotfix Workflow

```bash
# Create hotfix from main
git checkout main
git pull origin main
git checkout -b hotfix/<issue-description>

# Make fix, test, commit
git add .
git commit -m "hotfix: fix critical issue X"

# Push for review
git push -u origin hotfix/<issue-description>

# After merge, sync develop branch if exists
git checkout develop
git pull origin main
git push origin develop
```

---

## Release Workflow

```bash
# Create release branch
git checkout main
git pull origin main
git checkout -b release/v1.2.0

# Update version numbers, changelog
# ... make version changes ...
git add .
git commit -m "chore: bump version to 1.2.0"

# Merge to main and tag
git checkout main
git merge --no-ff release/v1.2.0
git tag -a v1.2.0 -m "Release version 1.2.0"
git push origin main --tags

# Merge back to develop if exists
git checkout develop
git merge main
git push origin develop

# Delete release branch
git branch -d release/v1.2.0
```
