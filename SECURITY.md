# Security Policy

> **Audience:** Humans (security and vulnerability reporting)

## Scope

This toolkit is a collection of markdown documentation, templates, and workflows consumed by AI coding agents. It does not execute code, manage secrets, or handle user data directly.

Security issues in this context include:

- **Skill content that could lead AI agents to produce insecure code** (e.g., templates suggesting hardcoded credentials, workflows skipping input validation)
- **Guidance that contradicts security best practices** (e.g., recommending disabled authentication, suggesting insecure protocols)
- **Sensitive information accidentally committed** (e.g., API keys, internal URLs, personal data in examples)

## Reporting a Vulnerability

If you discover a security issue, please report it responsibly.

**Do NOT open a public GitHub issue for security vulnerabilities.**

Instead, use one of these methods:

1. **GitHub Security Advisories** (preferred): Go to the [Security tab](../../security/advisories) and create a private advisory
2. **Email**: Send details to the repository owner via the email listed on their GitHub profile

### What to Include

- Description of the issue
- Which file(s) are affected
- Potential impact (what could an AI agent do wrong because of this?)
- Suggested fix (if you have one)

### Response Timeline

- **Acknowledgment**: Within 48 hours
- **Assessment**: Within 1 week
- **Fix**: Dependent on severity, but typically within 2 weeks for high-severity issues

## Supported Versions

Only the latest version on the `main` branch is actively maintained. We do not backport fixes to older versions.
