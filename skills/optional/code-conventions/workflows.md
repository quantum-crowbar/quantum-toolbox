# Code Conventions Workflows

Step-by-step procedures for establishing and maintaining code conventions.

---

## Establishing Conventions for a New Project

### 1. Choose a Base Style Guide

Select an established style guide as your foundation:

| Language | Popular Style Guides |
|----------|---------------------|
| JavaScript/TS | Airbnb, Standard, Google |
| Python | PEP 8, Google, Black |
| Go | Effective Go (standard) |
| Java | Google, Oracle |
| C# | Microsoft, .NET |
| Ruby | Ruby Style Guide, Rubocop |

### 2. Configure Tooling

```bash
# Example: JavaScript/TypeScript project setup

# Install formatter and linter
npm install -D prettier eslint @typescript-eslint/parser @typescript-eslint/eslint-plugin

# Create configuration files
touch .prettierrc .eslintrc.js .editorconfig
```

### 3. Set Up Editor Config

Create `.editorconfig` in project root:

```ini
root = true

[*]
indent_style = space
indent_size = 2
end_of_line = lf
charset = utf-8
trim_trailing_whitespace = true
insert_final_newline = true

[*.md]
trim_trailing_whitespace = false
```

### 4. Configure Pre-commit Hooks

```bash
# Using husky + lint-staged (Node.js)
npm install -D husky lint-staged
npx husky init
```

### 5. Add CI Checks

```yaml
# .github/workflows/lint.yml
name: Lint
on: [push, pull_request]
jobs:
  lint:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
      - run: npm ci
      - run: npm run lint
      - run: npm run format:check
```

### 6. Document Exceptions

Create a CONVENTIONS.md or add to CONTRIBUTING.md:

```markdown
## Code Style

We follow [Airbnb JavaScript Style Guide](link) with these exceptions:
- We use 4-space indentation (configured in Prettier)
- We allow `console.log` in development scripts
```

---

## Adopting Conventions in Existing Project

### 1. Audit Current State

```bash
# Run linter to see current violations
npm run lint -- --format json > lint-report.json

# Count issues by rule
cat lint-report.json | jq '.[] | .messages[] | .ruleId' | sort | uniq -c | sort -rn
```

### 2. Plan Incremental Adoption

**Option A: Big Bang**
- Fix all issues at once
- Single large PR
- Best for small codebases

**Option B: Gradual**
- Fix issues file-by-file
- Enable rules incrementally
- Best for large codebases

**Option C: New Code Only**
- Apply to new/modified files only
- Gradually improves over time
- Least disruptive

### 3. Configure for Gradual Adoption

```javascript
// .eslintrc.js - Start with warnings, upgrade to errors
module.exports = {
  rules: {
    // Phase 1: Warnings (current)
    'no-unused-vars': 'warn',
    'prefer-const': 'warn',

    // Phase 2: Will become errors next sprint
    // 'no-unused-vars': 'error',

    // Disabled: Too many violations, fix later
    // 'max-lines': 'off',
  }
};
```

### 4. Fix Formatting First

Formatting is mechanical and safe:

```bash
# Format entire codebase
npm run format

# Commit separately
git add -A
git commit -m "style: apply consistent formatting"
```

### 5. Address Lint Rules Incrementally

1. Enable one rule at a time
2. Fix violations
3. Commit
4. Move to next rule

---

## Code Review for Conventions

### Reviewer Checklist

**Automated (Should Be Caught by Tools)**
- [ ] Formatting correct?
- [ ] Linting passes?
- [ ] No new warnings?

**Manual Review**
- [ ] Naming is clear and consistent?
- [ ] File organization follows patterns?
- [ ] Comments add value (not noise)?
- [ ] Error handling is appropriate?
- [ ] No magic numbers/strings?

### Giving Feedback

**Good feedback:**
```
Consider renaming `data` to `userProfiles` to make the content clearer.
The variable is used throughout this function and a descriptive name
would improve readability.
```

**Less helpful:**
```
Bad variable name.
```

### When to Make Exceptions

Conventions can be bypassed when:
- External API requires specific format
- Performance-critical code needs different approach
- Legacy integration constraints

Document exceptions with comments:
```javascript
// eslint-disable-next-line camelcase -- API returns snake_case
const { user_id, created_at } = apiResponse;
```

---

## Updating Conventions

### When to Update

- New language features available
- Team pain points emerge
- Industry best practices evolve
- New tools available

### Update Process

1. **Propose change** - Explain what and why
2. **Team discussion** - Get input and consensus
3. **Update tooling** - Change configs
4. **Update documentation** - Reflect new rules
5. **Apply to codebase** - Fix existing violations
6. **Communicate** - Inform team of changes

### Example: Adding a New Rule

```markdown
## Proposal: Enforce explicit return types

### Current State
TypeScript functions don't require explicit return types.

### Proposed Change
Require explicit return types on exported functions.

### Rationale
- Improves documentation
- Catches accidental returns
- Better IDE support

### Configuration
```typescript
// tsconfig.json
{
  "compilerOptions": {
    "noImplicitReturns": true
  }
}

// .eslintrc.js
rules: {
  '@typescript-eslint/explicit-function-return-type': ['error', {
    allowExpressions: true
  }]
}
```

### Migration
~50 functions need updating. Estimate: 2 hours.
```

---

## Onboarding New Team Members

### Documentation to Share

1. Link to style guide
2. Project-specific exceptions
3. Editor setup instructions
4. How to run linters locally

### Recommended Editor Setup

```markdown
## VS Code Setup

### Required Extensions
- ESLint
- Prettier
- EditorConfig

### Recommended Settings
```json
{
  "editor.formatOnSave": true,
  "editor.defaultFormatter": "esbenp.prettier-vscode",
  "editor.codeActionsOnSave": {
    "source.fixAll.eslint": true
  }
}
```
```

### Common New Developer Mistakes

| Issue | Solution |
|-------|----------|
| Formatting conflicts | Run `npm run format` |
| Unknown lint rules | Check `.eslintrc.js` |
| Pre-commit hook fails | Fix issues or `git commit --no-verify` (rare) |
| Different local behavior | Ensure extensions installed |
