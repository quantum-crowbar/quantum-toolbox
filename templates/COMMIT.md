# Commit Message Template

## Format

```
<type>(<scope>): <subject>

<body>

<footer>
```

## Types

- **feat**: New feature
- **fix**: Bug fix
- **docs**: Documentation only changes
- **style**: Code style changes (formatting, semicolons, etc.)
- **refactor**: Code change that neither fixes a bug nor adds a feature
- **perf**: Performance improvement
- **test**: Adding or updating tests
- **chore**: Maintenance tasks (build, dependencies, etc.)
- **hotfix**: Urgent production fix

## Scope (optional)

The scope indicates the area of the codebase affected:
- api, auth, ui, db, config, etc.

## Subject

- Use imperative mood: "add" not "added" or "adds"
- Don't capitalize first letter
- No period at the end
- Max 50 characters

## Body (optional)

- Explain the "what" and "why", not the "how"
- Wrap at 72 characters
- Separate from subject with blank line

## Footer (optional)

- Reference issues: `Fixes #123`, `Closes #456`
- Note breaking changes: `BREAKING CHANGE: description`

## Examples

### Simple commit
```
feat(auth): add password reset functionality
```

### Commit with body
```
fix(api): handle null response from external service

The external payment API occasionally returns null instead of
an error object. This caused unhandled exceptions in production.

Fixes #789
```

### Breaking change
```
refactor(db): migrate from MongoDB to PostgreSQL

BREAKING CHANGE: Database connection configuration has changed.
Update DATABASE_URL environment variable format.

Closes #234
```

### Hotfix
```
[HOTFIX] fix(payment): correct decimal precision in totals

Production orders showing incorrect totals due to floating
point precision errors.

Fixes #999
```
