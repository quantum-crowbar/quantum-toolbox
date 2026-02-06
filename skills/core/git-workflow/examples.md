# Git Workflow Examples

Real-world examples of Git operations and commit messages.

---

## Commit Message Examples

### Feature Addition

```
feat(auth): add OAuth2 login with Google

Implement Google OAuth2 authentication flow:
- Add OAuth2 client configuration
- Create login callback handler
- Store tokens securely in session
- Add logout functionality

Closes #123
```

### Bug Fix

```
fix(cart): prevent duplicate items when adding quickly

Race condition allowed duplicate cart entries when users
clicked "Add to Cart" multiple times rapidly.

Added debounce and server-side idempotency check.

Fixes #456
```

### Refactoring

```
refactor(api): extract validation into middleware

Move request validation from individual route handlers
into reusable middleware functions.

No functional changes - all existing tests pass.
```

### Documentation

```
docs(readme): add deployment instructions

Add step-by-step guide for deploying to AWS:
- EC2 instance setup
- Environment configuration
- Database migration
- SSL certificate setup
```

### Hotfix

```
hotfix: fix SQL injection in search endpoint

CRITICAL: Search endpoint was vulnerable to SQL injection.
Added parameterized queries and input sanitization.

Affected versions: 1.2.0 - 1.2.3
```

---

## Branch Naming Examples

### Good Branch Names

```
feature/user-authentication
feature/add-shopping-cart
feature/implement-search-api

bugfix/fix-login-redirect
bugfix/cart-total-calculation
bugfix/timezone-display-issue

hotfix/security-patch-xss
hotfix/database-connection-leak

refactor/simplify-auth-flow
refactor/extract-common-utils

docs/api-documentation
docs/contributing-guide

chore/upgrade-dependencies
chore/configure-ci-pipeline
```

### Poor Branch Names (Avoid)

```
fix                     # Too vague
john-changes            # Not descriptive
temp                    # Meaningless
test123                 # Not descriptive
wip                     # What is being worked on?
feature/stuff           # What stuff?
```

---

## Conflict Resolution Example

### Scenario

You're working on `feature/add-validation` and main has been updated.

### Before Rebase

```
main:    A---B---C---D
              \
feature:       E---F---G  (your commits)
```

### Rebase Process

```bash
$ git fetch origin
$ git rebase origin/main

# Conflict in src/utils/validate.ts
Auto-merging src/utils/validate.ts
CONFLICT (content): Merge conflict in src/utils/validate.ts
error: could not apply E... add email validation

# View the conflict
$ cat src/utils/validate.ts
```

### Conflict Markers

```typescript
<<<<<<< HEAD
export function validateEmail(email: string): boolean {
  return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
}
=======
export function validateEmail(email: string): ValidationResult {
  const isValid = email.includes('@');
  return { isValid, errors: isValid ? [] : ['Invalid email'] };
}
>>>>>>> E... add email validation
```

### Resolution

Combine both changes thoughtfully:

```typescript
export function validateEmail(email: string): ValidationResult {
  const isValid = /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
  return { isValid, errors: isValid ? [] : ['Invalid email format'] };
}
```

### Complete the Rebase

```bash
$ git add src/utils/validate.ts
$ git rebase --continue

# If more conflicts, repeat until done
# Final result:
```

### After Rebase

```
main:    A---B---C---D
                      \
feature:               E'---F'---G'  (rebased commits)
```

---

## Stash Usage Example

### Scenario

You're mid-feature but need to quickly fix a bug on main.

```bash
# Save current work
$ git stash push -m "WIP: user profile form validation"
Saved working directory and index state On feature/user-profile: WIP: user profile form validation

# Switch to main and create hotfix
$ git checkout main
$ git pull
$ git checkout -b hotfix/login-error

# ... make fix ...
$ git commit -m "hotfix: fix null pointer in login handler"
$ git push -u origin hotfix/login-error

# Return to feature work
$ git checkout feature/user-profile
$ git stash pop
On branch feature/user-profile
Changes not staged for commit:
  modified:   src/components/UserProfile.tsx

Dropped refs/stash@{0}
```

---

## Cherry-Pick Example

### Scenario

A commit on develop needs to go to main immediately.

```bash
# Find the commit SHA
$ git log develop --oneline
a1b2c3d fix(security): patch XSS vulnerability  # This one
e4f5g6h feat: add new dashboard
i7j8k9l refactor: clean up utils

# Cherry-pick to main
$ git checkout main
$ git cherry-pick a1b2c3d

# If conflicts, resolve them, then:
$ git add .
$ git cherry-pick --continue

# Push the fix
$ git push origin main
```

---

## Interactive Rebase Example

### Scenario

Clean up commits before PR (squash, reword, reorder).

```bash
# Last 4 commits on feature branch
$ git log --oneline -4
d4d4d4d WIP: more fixes
c3c3c3c fix typo
b2b2b2b Add user validation
a1a1a1a Initial user form

# Start interactive rebase
$ git rebase -i HEAD~4
```

### Editor Opens

```
pick a1a1a1a Initial user form
pick b2b2b2b Add user validation
pick c3c3c3c fix typo
pick d4d4d4d WIP: more fixes

# Commands:
# p, pick = use commit
# r, reword = use commit, but edit message
# s, squash = meld into previous commit
# f, fixup = like squash but discard message
# d, drop = remove commit
```

### Edit to Squash and Clean

```
pick a1a1a1a Initial user form
squash b2b2b2b Add user validation
fixup c3c3c3c fix typo
fixup d4d4d4d WIP: more fixes
```

### Result

Single clean commit:
```
feat(users): add user form with validation

- Create UserForm component
- Add email and password validation
- Implement error display
```
