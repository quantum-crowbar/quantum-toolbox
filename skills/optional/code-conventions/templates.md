# Code Conventions Templates

Reusable templates for documenting and configuring code conventions.

---

## Project Style Guide Template

```markdown
# {Project Name} Code Style Guide

## Overview

This document outlines the coding conventions for {Project Name}. All contributors
should follow these guidelines to maintain consistency across the codebase.

**Base Style Guide**: {Link to Airbnb/Google/PEP8/etc.}

**Last Updated**: {Date}

---

## Quick Setup

### Required Tools

```bash
# Install development dependencies
{npm install / pip install -r requirements-dev.txt / etc.}
```

### Editor Configuration

1. Install extensions: {list extensions}
2. Import settings: {link to settings file}
3. Enable format on save

---

## Naming Conventions

| Element | Convention | Example |
|---------|------------|---------|
| Variables | {camelCase/snake_case} | `{example}` |
| Constants | {UPPER_SNAKE_CASE} | `{example}` |
| Functions | {camelCase/snake_case} | `{example}` |
| Classes | {PascalCase} | `{example}` |
| Files | {kebab-case/snake_case} | `{example}` |
| Components | {PascalCase} | `{example}` |

### Naming Rules

1. {Rule 1}
2. {Rule 2}
3. {Rule 3}

---

## File Organization

### Directory Structure

```
src/
├── {folder}/          # {Description}
├── {folder}/          # {Description}
└── {folder}/          # {Description}
```

### File Structure

Each file should follow this order:

1. {Section 1 - e.g., Imports}
2. {Section 2 - e.g., Types}
3. {Section 3 - e.g., Constants}
4. {Section 4 - e.g., Main export}
5. {Section 5 - e.g., Helpers}

---

## Code Style

### Formatting

- Indentation: {2 spaces / 4 spaces / tabs}
- Line length: {80 / 100 / 120} characters
- Quotes: {single / double}
- Semicolons: {yes / no}
- Trailing commas: {yes / no}

### Comments

- Use `//` for {when}
- Use `/* */` for {when}
- Use `/** */` for {when}

### Error Handling

{Describe error handling conventions}

---

## Exceptions to Base Style Guide

| Rule | Base Guide Says | We Do | Reason |
|------|-----------------|-------|--------|
| {rule} | {base} | {ours} | {why} |

---

## Tools and Configuration

### Linter

Configuration file: `{.eslintrc.js / .pylintrc / etc.}`

```
{Include key configuration}
```

### Formatter

Configuration file: `{.prettierrc / pyproject.toml / etc.}`

```
{Include key configuration}
```

### Pre-commit Hooks

{Describe what runs on commit}

---

## Common Mistakes

| Mistake | Correct Approach |
|---------|-----------------|
| {mistake} | {correction} |

---

## Questions?

Contact {team/person} or open an issue in {repository}.
```

---

## EditorConfig Template

```ini
# .editorconfig
# https://editorconfig.org

root = true

# Default for all files
[*]
indent_style = space
indent_size = 2
end_of_line = lf
charset = utf-8
trim_trailing_whitespace = true
insert_final_newline = true

# Markdown - preserve trailing whitespace for line breaks
[*.md]
trim_trailing_whitespace = false

# Python - PEP 8 recommends 4 spaces
[*.py]
indent_size = 4

# Makefiles require tabs
[Makefile]
indent_style = tab

# YAML
[*.{yml,yaml}]
indent_size = 2

# JSON
[*.json]
indent_size = 2

# Go - tabs are standard
[*.go]
indent_style = tab
```

---

## ESLint Configuration Template

```javascript
// .eslintrc.js
module.exports = {
  root: true,

  // Parser
  parser: '@typescript-eslint/parser',
  parserOptions: {
    ecmaVersion: 2022,
    sourceType: 'module',
    project: './tsconfig.json',
  },

  // Plugins
  plugins: [
    '@typescript-eslint',
    'import',
  ],

  // Base configurations
  extends: [
    'eslint:recommended',
    'plugin:@typescript-eslint/recommended',
    'plugin:@typescript-eslint/recommended-requiring-type-checking',
    'plugin:import/recommended',
    'plugin:import/typescript',
  ],

  // Custom rules
  rules: {
    // TypeScript
    '@typescript-eslint/explicit-function-return-type': ['error', {
      allowExpressions: true,
      allowTypedFunctionExpressions: true,
    }],
    '@typescript-eslint/no-unused-vars': ['error', {
      argsIgnorePattern: '^_',
    }],
    '@typescript-eslint/no-explicit-any': 'warn',

    // Imports
    'import/order': ['error', {
      groups: ['builtin', 'external', 'internal', 'parent', 'sibling', 'index'],
      'newlines-between': 'always',
      alphabetize: { order: 'asc' },
    }],
    'import/no-duplicates': 'error',

    // General
    'no-console': ['warn', { allow: ['warn', 'error'] }],
    'eqeqeq': ['error', 'always'],
    'prefer-const': 'error',
    'no-var': 'error',
  },

  // Override for specific files
  overrides: [
    {
      files: ['*.test.ts', '*.spec.ts'],
      rules: {
        '@typescript-eslint/no-explicit-any': 'off',
      },
    },
  ],

  // Ignored patterns
  ignorePatterns: [
    'dist/',
    'node_modules/',
    '*.config.js',
  ],
};
```

---

## Prettier Configuration Template

```json
{
  "$schema": "https://json.schemastore.org/prettierrc",
  "semi": true,
  "singleQuote": true,
  "tabWidth": 2,
  "useTabs": false,
  "trailingComma": "es5",
  "printWidth": 100,
  "bracketSpacing": true,
  "arrowParens": "avoid",
  "endOfLine": "lf",
  "overrides": [
    {
      "files": "*.md",
      "options": {
        "proseWrap": "always"
      }
    }
  ]
}
```

---

## Pre-commit Hook Configuration

```yaml
# .pre-commit-config.yaml
repos:
  - repo: https://github.com/pre-commit/pre-commit-hooks
    rev: v4.5.0
    hooks:
      - id: trailing-whitespace
      - id: end-of-file-fixer
      - id: check-yaml
      - id: check-json
      - id: check-added-large-files

  - repo: https://github.com/pre-commit/mirrors-eslint
    rev: v8.56.0
    hooks:
      - id: eslint
        files: \.[jt]sx?$
        types: [file]
        additional_dependencies:
          - eslint
          - '@typescript-eslint/parser'
          - '@typescript-eslint/eslint-plugin'

  - repo: https://github.com/pre-commit/mirrors-prettier
    rev: v3.1.0
    hooks:
      - id: prettier
        types_or: [javascript, jsx, ts, tsx, json, yaml, markdown]
```

---

## TypeScript Configuration Template (Strict)

```json
{
  "$schema": "https://json.schemastore.org/tsconfig",
  "compilerOptions": {
    // Type Checking - Maximum strictness
    "strict": true,
    "noImplicitAny": true,
    "strictNullChecks": true,
    "strictFunctionTypes": true,
    "strictBindCallApply": true,
    "strictPropertyInitialization": true,
    "noImplicitThis": true,
    "useUnknownInCatchVariables": true,
    "alwaysStrict": true,
    "noUnusedLocals": true,
    "noUnusedParameters": true,
    "exactOptionalPropertyTypes": true,
    "noImplicitReturns": true,
    "noFallthroughCasesInSwitch": true,
    "noUncheckedIndexedAccess": true,
    "noImplicitOverride": true,
    "noPropertyAccessFromIndexSignature": true,

    // Modules
    "module": "ESNext",
    "moduleResolution": "bundler",
    "resolveJsonModule": true,
    "isolatedModules": true,

    // Emit
    "declaration": true,
    "declarationMap": true,
    "sourceMap": true,
    "noEmitOnError": true,

    // JavaScript Support
    "allowJs": true,
    "checkJs": true,

    // Interop
    "esModuleInterop": true,
    "forceConsistentCasingInFileNames": true,

    // Language and Environment
    "target": "ES2022",
    "lib": ["ES2022"]
  },
  "include": ["src/**/*"],
  "exclude": ["node_modules", "dist"]
}
```

---

## VS Code Workspace Settings Template

```json
{
  // Editor
  "editor.formatOnSave": true,
  "editor.defaultFormatter": "esbenp.prettier-vscode",
  "editor.codeActionsOnSave": {
    "source.fixAll.eslint": "explicit",
    "source.organizeImports": "explicit"
  },
  "editor.rulers": [100],

  // Files
  "files.trimTrailingWhitespace": true,
  "files.insertFinalNewline": true,
  "files.trimFinalNewlines": true,

  // TypeScript
  "typescript.preferences.importModuleSpecifier": "relative",
  "typescript.suggest.autoImports": true,

  // ESLint
  "eslint.validate": [
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact"
  ],

  // Prettier
  "[javascript]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[typescript]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[json]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },

  // Exclude from search/watch
  "files.exclude": {
    "node_modules": true,
    "dist": true,
    ".git": true
  }
}
```
