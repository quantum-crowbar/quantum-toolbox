# Code Conventions Skill

Guidelines for establishing and maintaining consistent code style across projects.

## Why Conventions Matter

- **Readability**: Consistent code is easier to read and understand
- **Maintainability**: Reduces cognitive load when switching between files
- **Collaboration**: Team members can work on any part of codebase
- **Onboarding**: New developers ramp up faster
- **Automation**: Enables linting and formatting tools

## Core Principles

### 1. Consistency Over Preference

- Follow existing project conventions, even if you disagree
- Consistency within a project trumps personal preference
- Change conventions through team discussion, not individual action

### 2. Automate Everything Possible

- Use formatters (Prettier, Black, gofmt)
- Use linters (ESLint, Pylint, golangci-lint)
- Run checks in CI/CD
- Format on save in editors

### 3. Document What Can't Be Automated

- Architectural patterns
- Naming philosophies
- Code organization principles
- Exception handling approaches

### 4. Keep It Simple

- Fewer rules are easier to follow
- Complex conventions get ignored
- Focus on high-impact items

## Convention Categories

### Naming Conventions

| Element | Convention | Example |
|---------|------------|---------|
| Variables | camelCase or snake_case | `userName`, `user_name` |
| Constants | SCREAMING_SNAKE_CASE | `MAX_RETRIES` |
| Functions | camelCase or snake_case | `getUserById`, `get_user_by_id` |
| Classes | PascalCase | `UserService` |
| Interfaces | PascalCase (optionally prefixed) | `IUserService`, `UserService` |
| Files | kebab-case or snake_case | `user-service.ts`, `user_service.py` |
| Directories | kebab-case or snake_case | `user-management/` |

### Naming Best Practices

**Be Descriptive**
```
// Bad
const d = new Date();
const u = getUser();
const temp = calculate();

// Good
const createdAt = new Date();
const currentUser = getUser();
const totalPrice = calculate();
```

**Use Intention-Revealing Names**
```
// Bad
const list1 = users.filter(u => u.a);

// Good
const activeUsers = users.filter(user => user.isActive);
```

**Avoid Abbreviations (Usually)**
```
// Bad
const usrMgr = new UserManager();
const cfg = loadConfig();

// Good
const userManager = new UserManager();
const config = loadConfig();

// Exception: Well-known abbreviations are OK
const httpClient = new HttpClient();  // HTTP is universally known
const apiResponse = fetch(url);       // API is universally known
```

### File Organization

**One Concept Per File**
- One class per file (generally)
- One component per file
- Related utilities can be grouped

**Consistent File Structure**
```
// Typical file structure
1. Imports (external, then internal)
2. Types/Interfaces
3. Constants
4. Main export (class, function, component)
5. Helper functions (private)
```

**Directory Structure Patterns**

Feature-based:
```
src/
├── features/
│   ├── auth/
│   │   ├── components/
│   │   ├── hooks/
│   │   ├── services/
│   │   └── types.ts
│   └── users/
│       ├── components/
│       ├── hooks/
│       ├── services/
│       └── types.ts
```

Layer-based:
```
src/
├── components/
├── services/
├── hooks/
├── utils/
└── types/
```

### Code Formatting

**Indentation**
- Pick one: spaces (2 or 4) or tabs
- Configure in `.editorconfig` and formatter

**Line Length**
- Common limits: 80, 100, or 120 characters
- Configure in formatter

**Braces**
- Same line or new line (be consistent)
- Always use braces, even for single statements

**Whitespace**
- Consistent spacing around operators
- Blank lines between logical sections
- No trailing whitespace

### Comments

**When to Comment**
- Complex algorithms
- Non-obvious business logic
- Workarounds and their reasons
- Public API documentation

**When NOT to Comment**
- Obvious code
- What the code does (it should be self-evident)
- Commented-out code (delete it)

**Comment Styles**
```
// Single line comment for brief notes

/*
 * Multi-line comment for longer explanations
 * that span multiple lines
 */

/**
 * Documentation comment for public APIs
 * @param userId - The user's unique identifier
 * @returns The user object or null if not found
 */
```

### Error Handling

**Be Explicit**
```
// Bad - swallowing errors
try {
  doSomething();
} catch (e) {
  // ignore
}

// Good - handle or propagate
try {
  doSomething();
} catch (error) {
  logger.error('Failed to do something', { error });
  throw new ApplicationError('Operation failed', { cause: error });
}
```

**Use Custom Error Types**
```typescript
class ValidationError extends Error {
  constructor(message: string, public field: string) {
    super(message);
    this.name = 'ValidationError';
  }
}
```

## Language-Specific Notes

### JavaScript/TypeScript
- Use `const` by default, `let` when needed, never `var`
- Prefer arrow functions for callbacks
- Use template literals for string interpolation
- Enable strict mode in TypeScript

### Python
- Follow PEP 8
- Use type hints (Python 3.5+)
- Use f-strings for formatting
- Prefer list comprehensions for simple cases

### Go
- Use `gofmt` (non-negotiable)
- Follow Effective Go guidelines
- Short variable names in small scopes
- Explicit error handling

### Java
- Follow Google Java Style or company standard
- Use meaningful exception types
- Prefer composition over inheritance
- Use Optional for nullable returns
