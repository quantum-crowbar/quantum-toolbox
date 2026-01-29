# Git Workflow Skill

Best practices for version control using Git.

## Principles

### 1. Commit Early, Commit Often

- Make small, focused commits
- Each commit should represent a single logical change
- Easier to review, revert, and understand history

### 2. Write Meaningful Commit Messages

- Use conventional commit format (see [templates/COMMIT.md](../../../templates/COMMIT.md))
- First line: concise summary (50 chars or less)
- Body: explain "why" not "what"
- Reference issues/tickets when applicable

### 3. Keep Main Branch Stable

- Main/master should always be deployable
- Use feature branches for development
- Merge only after review and tests pass

### 4. Branch Naming Conventions

```
feature/   - New features (feature/add-user-auth)
bugfix/    - Bug fixes (bugfix/fix-login-error)
hotfix/    - Urgent production fixes (hotfix/security-patch)
refactor/  - Code improvements (refactor/simplify-api)
docs/      - Documentation only (docs/update-readme)
test/      - Test additions/fixes (test/add-auth-tests)
chore/     - Maintenance tasks (chore/update-deps)
```

### 5. Rebase vs Merge

**Use rebase for:**
- Updating feature branch with main
- Cleaning up local commits before PR
- Linear history preference

**Use merge for:**
- Integrating feature branches to main
- Preserving branch history
- Collaborative branches

### 6. Never Force Push to Shared Branches

- Force pushing can destroy others' work
- Use `--force-with-lease` if absolutely necessary
- Never force push to main/master/develop

## Git Safety Rules

### Safe Operations

These operations are always safe:
- `git status`, `git log`, `git diff`
- `git add`, `git commit`
- `git checkout <branch>`, `git checkout -b <branch>`
- `git push` (non-force)
- `git pull`, `git fetch`
- `git stash`, `git stash pop`

### Dangerous Operations (Require Confirmation)

- `git push --force` - Can overwrite remote history
- `git reset --hard` - Discards uncommitted changes
- `git clean -fd` - Removes untracked files permanently
- `git rebase -i` - Rewrites history

### Forbidden Operations

- Force pushing to protected branches
- Deleting remote branches without team consensus
- Rewriting history on shared branches

## Conflict Resolution

1. **Pull latest changes** before starting work
2. **Communicate** if working on same files as others
3. **Resolve conflicts carefully** - understand both changes
4. **Test after resolution** - merges can introduce bugs
5. **Commit resolution separately** if complex
