# Instructions

Static guidelines and rules for AI agents working on this project.

## Coding Rules

<!-- Add your coding standards here -->

- Follow existing code style and conventions
- Write clear, self-documenting code
- Keep functions small and focused
- Use meaningful variable and function names

## Allowed Bash Scripts

<!-- Define allowed bash operations -->

### Safe Operations

#### Git Operations
- `git init` - Initialize a new repository
- `git status` - Check working tree status
- `git diff` - Show changes
- `git log` - View commit history
- `git add` - Stage files for commit
- `git commit` - Commit staged changes
- `git push` - Push commits to remote
- `git push -u origin <branch>` - Push and set upstream tracking
- `git remote add origin <url>` - Add remote repository

#### Directory Operations
- `mkdir -p <path>` - Create directories (including parents)
- `ls`, `pwd`, `find` (read-only operations)

#### Package Management
- `npm install`, `npm run build`, `npm test`

### Restricted Operations
<!-- List operations that require confirmation or are prohibited -->

## Security Guidelines

- Never commit secrets or credentials
- Validate all user inputs
- Follow OWASP security best practices

## File Structure Rules

<!-- Define conventions for file organization -->
