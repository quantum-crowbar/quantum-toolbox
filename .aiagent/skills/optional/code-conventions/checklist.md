# Code Conventions Checklist

Quick reference for code style and convention reviews.

---

## Naming Checklist

### Variables
- [ ] Descriptive and intention-revealing?
- [ ] Correct casing (camelCase/snake_case)?
- [ ] Booleans prefixed with is/has/can/should?
- [ ] No abbreviations (except well-known ones)?
- [ ] No single-letter names (except loops)?

### Functions
- [ ] Verb + noun pattern?
- [ ] Describes what it does?
- [ ] Correct casing?
- [ ] Not too generic (process, handle, do)?

### Classes/Types
- [ ] PascalCase?
- [ ] Noun or noun phrase?
- [ ] Describes responsibility?

### Files
- [ ] Matches main export?
- [ ] Consistent casing (kebab-case/snake_case)?
- [ ] Clear purpose from name?

---

## Code Quality Checklist

### Functions
- [ ] Single responsibility?
- [ ] Reasonable length (< 20-30 lines)?
- [ ] Few parameters (< 3-4)?
- [ ] No hidden side effects?
- [ ] Clear return type?

### Error Handling
- [ ] Errors explicitly handled?
- [ ] Meaningful error messages?
- [ ] Appropriate error types?
- [ ] No swallowed exceptions?

### Comments
- [ ] Explains "why" not "what"?
- [ ] No commented-out code?
- [ ] No outdated comments?
- [ ] Public APIs documented?

### General
- [ ] No magic numbers/strings?
- [ ] No code duplication?
- [ ] No dead code?
- [ ] Consistent style?

---

## File Organization Checklist

### Structure
- [ ] Imports at top?
- [ ] External before internal imports?
- [ ] Types/interfaces defined?
- [ ] Constants before logic?
- [ ] Helpers at bottom or separate file?

### Size
- [ ] File not too long (< 200-300 lines)?
- [ ] One main concept per file?
- [ ] Related code grouped?

---

## Pull Request Checklist

### Automated
- [ ] Linter passes?
- [ ] Formatter applied?
- [ ] No new warnings?
- [ ] CI checks green?

### Manual
- [ ] Naming follows conventions?
- [ ] File organization correct?
- [ ] Error handling appropriate?
- [ ] No obvious style issues?
- [ ] Consistent with codebase?

---

## New Project Setup Checklist

### Tooling
- [ ] Linter configured?
- [ ] Formatter configured?
- [ ] EditorConfig created?
- [ ] Pre-commit hooks set up?
- [ ] CI checks configured?

### Documentation
- [ ] Style guide documented?
- [ ] Editor setup instructions?
- [ ] Exceptions documented?
- [ ] Examples provided?

### Team
- [ ] Team aligned on conventions?
- [ ] Onboarding materials ready?
- [ ] Review process includes style?

---

## Quick Reference: Common Issues

| Issue | Solution |
|-------|----------|
| Inconsistent naming | Run linter, follow existing patterns |
| Mixed formatting | Run formatter on entire file |
| Long functions | Extract smaller functions |
| Deep nesting | Early returns, extract functions |
| Magic numbers | Extract to named constants |
| Generic names | Be specific about purpose |
| Missing error handling | Add try/catch, handle all cases |
| Commented code | Delete it (git has history) |

---

## Naming Quick Reference

### Variables
```
✅ activeUsers, totalPrice, isEnabled
❌ data, temp, flag, x
```

### Functions
```
✅ validateEmail, calculateTotal, sendNotification
❌ process, handle, doStuff
```

### Booleans
```
✅ isActive, hasPermission, canEdit, shouldRetry
❌ active, permission, edit
```

### Constants
```
✅ MAX_RETRIES, API_BASE_URL, DEFAULT_TIMEOUT
❌ maxRetries, apiUrl, timeout
```

---

## Import Order Quick Reference

```typescript
// 1. Node.js built-ins
import fs from 'fs';
import path from 'path';

// 2. External packages (alphabetical)
import axios from 'axios';
import lodash from 'lodash';
import React from 'react';

// 3. Internal packages/aliases
import { config } from '@/config';
import { logger } from '@/utils';

// 4. Relative imports (parent first, then sibling)
import { ParentComponent } from '../Parent';
import { SiblingComponent } from './Sibling';
import { types } from './types';
```

---

## Error Handling Quick Reference

```typescript
// ✅ Good
try {
  await riskyOperation();
} catch (error) {
  logger.error('Operation failed', { error, context });
  throw new AppError('Friendly message', { cause: error });
}

// ❌ Bad
try {
  await riskyOperation();
} catch (e) {
  // Silent failure
}
```

---

## When to Break Rules

Conventions can be bypassed when:

- [ ] External API requires different format
- [ ] Performance-critical code needs optimization
- [ ] Legacy integration has constraints
- [ ] Team agrees exception makes sense

Always document exceptions:
```typescript
// eslint-disable-next-line rule-name -- Reason for exception
```
