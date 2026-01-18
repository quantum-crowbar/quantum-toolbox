# Instructions

Static guidelines and rules for AI agents working on this project.

## Coding Rules

<!-- Add your coding standards here -->

- Follow existing code style and conventions
- Write clear, self-documenting code
- Keep functions small and focused
- Use meaningful variable and function names
- Prefer composition over inheritance
- DRY (Don't Repeat Yourself) - but avoid premature abstraction

### Error Handling

- Always handle errors explicitly, never silently swallow exceptions
- Provide meaningful error messages
- Log errors with sufficient context for debugging
- Use appropriate error types/codes for different failure modes

### Testing Requirements

- Write tests for all new functionality
- Maintain or improve existing test coverage
- Follow naming convention: `test_<function_name>_<scenario>`
- Include unit tests, integration tests where appropriate
- Test edge cases and error conditions

### Code Review Checklist

- [ ] Code follows project style guidelines
- [ ] Tests are included and passing
- [ ] No security vulnerabilities introduced
- [ ] No hardcoded secrets or credentials
- [ ] Error handling is appropriate
- [ ] Documentation updated if needed

### Dependency Management

- Minimize new dependencies - prefer built-in solutions
- Vet dependencies for security and maintenance status
- Pin dependency versions
- Document why each dependency is needed

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
- `git pull` - Fetch and merge changes from remote
- `git fetch` - Fetch changes without merging
- `git checkout <branch>` - Switch branches
- `git checkout -b <branch>` - Create and switch to new branch
- `git branch` - List or manage branches
- `git merge <branch>` - Merge branches
- `git stash` - Temporarily store changes
- `git stash pop` - Restore stashed changes
- `git rebase <branch>` - Rebase current branch (interactive rebase requires confirmation)

#### Directory Operations
- `mkdir -p <path>` - Create directories (including parents)
- `ls`, `pwd`, `find` (read-only operations)
- `cd <path>` - Change directory

#### File Operations (Read-only)
- `cat <file>` - Display file contents
- `head <file>` - Display first lines of file
- `tail <file>` - Display last lines of file
- `less <file>`, `more <file>` - Page through file
- `wc <file>` - Count lines, words, characters
- `diff <file1> <file2>` - Compare files

#### Package Management (JavaScript/Node)
- `npm install` - Install dependencies
- `npm run build` - Build project
- `npm test` - Run tests
- `npm run <script>` - Run package scripts
- `yarn install`, `yarn build`, `yarn test`
- `pnpm install`, `pnpm build`, `pnpm test`

#### Package Management (Python)
- `pip install -r requirements.txt` - Install dependencies
- `pip install <package>` - Install package
- `python -m pytest` - Run tests
- `python <script>` - Run Python scripts

#### Package Management (Other Languages)
- `cargo build`, `cargo test`, `cargo run` - Rust
- `go build`, `go test`, `go run` - Go
- `bundle install`, `rake test` - Ruby
- `mvn install`, `mvn test` - Java/Maven
- `gradle build`, `gradle test` - Java/Gradle

#### System Information
- `which <command>` - Locate command
- `echo $VAR` - Print environment variable
- `env` - List environment variables
- `uname -a` - System information

### Restricted Operations

**Require user confirmation before executing:**

#### Destructive File Operations
- `rm <file>` - Delete files (always confirm)
- `rm -r <dir>` - Delete directories recursively (always confirm)
- `rm -rf <path>` - Force delete (DANGEROUS - always confirm)
- `mv <src> <dst>` - Move/rename files (confirm if overwriting)
- `cp -r <src> <dst>` - Copy directories (confirm if overwriting)

#### Git History Modification
- `git push --force` - Force push (DANGEROUS - can lose commits)
- `git push --force-with-lease` - Safer force push (still confirm)
- `git reset --hard` - Discard all changes (DANGEROUS)
- `git clean -fd` - Remove untracked files (confirm)
- `git rebase -i` - Interactive rebase (modifies history)

#### Database Operations
- Any direct database queries (SELECT may be safe, but confirm)
- Database migrations
- Data deletion or modification

#### Production/Deployment
- Deployment commands
- Production environment access
- Infrastructure changes

#### System Modifications
- Installing system packages (`apt`, `brew`, etc.)
- Modifying system configuration
- Service management (`systemctl`, `service`)

### Prohibited Operations

**Never execute without explicit user override:**

- `sudo rm -rf /` or similar destructive system commands
- Commands that expose secrets or credentials
- Commands that access production data without authorization
- Cryptocurrency mining or resource-intensive background processes
- Network attacks or unauthorized access attempts

## Security Guidelines

- Never commit secrets or credentials
- Validate all user inputs
- Follow OWASP security best practices
- Use parameterized queries for database operations
- Sanitize data before rendering in UI
- Use HTTPS for all external communications
- Implement proper authentication and authorization
- Keep dependencies updated for security patches

## File Structure Rules

<!-- Define conventions for file organization -->
