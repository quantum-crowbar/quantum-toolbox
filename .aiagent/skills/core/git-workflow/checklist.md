# Git Workflow Checklist

Quick reference checklists for common Git operations.

---

## Before Starting Work

- [ ] On correct branch? (`git branch`)
- [ ] Branch up to date? (`git pull` or `git fetch && git rebase`)
- [ ] Working directory clean? (`git status`)
- [ ] Tests passing on current state?

---

## Before Committing

- [ ] Only relevant files staged? (`git diff --staged`)
- [ ] No secrets/credentials included?
- [ ] No debug code or console.logs?
- [ ] No large binary files?
- [ ] Commit message follows convention?
- [ ] Tests pass locally?

---

## Commit Message Checklist

- [ ] Type prefix used? (feat, fix, docs, etc.)
- [ ] Scope in parentheses? (optional but helpful)
- [ ] Subject line under 50 characters?
- [ ] Subject uses imperative mood? ("add" not "added")
- [ ] Body explains "why" not "what"? (if needed)
- [ ] Issue/ticket referenced? (if applicable)

---

## Before Pushing

- [ ] All commits have meaningful messages?
- [ ] No WIP commits in history?
- [ ] Branch rebased on latest main?
- [ ] All tests passing?
- [ ] No merge conflicts with target branch?

---

## Before Creating PR

- [ ] Branch name follows convention?
- [ ] All commits are atomic and focused?
- [ ] PR title is descriptive?
- [ ] PR description explains changes?
- [ ] Linked to relevant issues?
- [ ] Assigned reviewers?
- [ ] Labels applied?
- [ ] CI checks passing?

---

## Merge Checklist

- [ ] All review comments addressed?
- [ ] CI/CD pipeline green?
- [ ] No merge conflicts?
- [ ] Squash commits if needed?
- [ ] Delete branch after merge?

---

## Hotfix Checklist

- [ ] Created from main/production?
- [ ] Minimal changes only?
- [ ] Regression test added?
- [ ] All tests passing?
- [ ] Expedited review obtained?
- [ ] Backported to develop (if applicable)?
- [ ] Post-mortem documented?

---

## Code Review (Git Perspective)

- [ ] Commits are logical and atomic?
- [ ] No unrelated changes bundled?
- [ ] History is clean (no fixup commits)?
- [ ] Branch is up to date with target?
- [ ] No accidental file changes?

---

## Release Checklist

- [ ] All features merged to release branch?
- [ ] Version numbers updated?
- [ ] Changelog updated?
- [ ] Release notes prepared?
- [ ] Tag created with proper name?
- [ ] Tag pushed to remote?
- [ ] Release branch merged to main?
- [ ] Changes merged back to develop?
- [ ] Release branch deleted?

---

## Emergency Recovery

### Lost Commits?
```bash
git reflog  # Find the SHA
git checkout -b recovery <sha>
```

### Accidentally Committed to Wrong Branch?
```bash
git log -1  # Note SHA
git reset --hard HEAD~1
git checkout correct-branch
git cherry-pick <sha>
```

### Pushed Sensitive Data?
1. Remove from history (BFG Repo-Cleaner or git filter-branch)
2. Force push (coordinate with team!)
3. Rotate any exposed credentials
4. Consider repo secrets compromised

### Merge Gone Wrong?
```bash
git reset --hard ORIG_HEAD  # Undo the merge
# Or find pre-merge commit in reflog
```
