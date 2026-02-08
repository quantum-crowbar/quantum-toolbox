# Instructions

> **Audience:** AI Agents

Static guidelines and rules for AI agents working on projects.

## Coding Rules

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

## Security Guidelines

- Never commit secrets or credentials
- Validate all user inputs
- Follow OWASP security best practices
- Use parameterized queries for database operations
- Sanitize data before rendering in UI
- Use HTTPS for all external communications
- Implement proper authentication and authorization
- Keep dependencies updated for security patches
