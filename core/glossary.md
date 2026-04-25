# Glossary

> **Audience:** AI Agents

Standard terminology and definitions for AI agents working with enterprise architecture, software design, and technical documentation.

## Architecture & Design Terms

| Term | Definition |
|------|------------|
| **ADR** | Architecture Decision Record - document capturing important architectural decisions |
| **API** | Application Programming Interface - contract for communication between systems |
| **Bounded Context** | Strategic DDD pattern defining boundaries where a domain model applies |
| **C4 Model** | Context, Containers, Components, Code - hierarchical architecture diagram framework |
| **CRUD** | Create, Read, Update, Delete - basic data operations |
| **DRY** | Don't Repeat Yourself - principle of reducing code duplication |
| **Event Sourcing** | Pattern storing state changes as sequence of events |
| **Fitness Function** | Automated check that validates architectural characteristics |
| **Hexagonal Architecture** | Pattern isolating core logic from external concerns (Ports & Adapters) |
| **Microservices** | Architectural style structuring application as collection of loosely coupled services |
| **MVP** | Minimum Viable Product - version with just enough features to satisfy early customers |
| **NFR** | Non-Functional Requirement - quality attribute (performance, security, scalability) |
| **RFC** | Request for Comments - document proposing changes for discussion |
| **SOLID** | Single responsibility, Open-closed, Liskov substitution, Interface segregation, Dependency inversion |
| **TDD** | Test-Driven Development - write tests before implementation |
| **BDD** | Behavior-Driven Development - specification through examples in natural language |

> **Domain-specific glossaries** (loaded on skill invocation, not at session start):
> - TOGAF & Enterprise Architecture → [skills/optional/togaf/glossary.md](../skills/optional/togaf/glossary.md)
> - Security & Compliance → [skills/optional/security-analysis/glossary.md](../skills/optional/security-analysis/glossary.md)

## DevOps & Infrastructure

| Term | Definition |
|------|------------|
| **CI/CD** | Continuous Integration / Continuous Deployment - automated build and release |
| **Container** | Lightweight, standalone executable package including code and dependencies |
| **IaC** | Infrastructure as Code - managing infrastructure through code |
| **Kubernetes (K8s)** | Container orchestration platform for automating deployment and scaling |
| **Observability** | Ability to understand system internal state from external outputs |
| **SLA** | Service Level Agreement - commitment defining expected service level |
| **SLI** | Service Level Indicator - specific metric measuring service level |
| **SLO** | Service Level Objective - target value for SLI |
| **SRE** | Site Reliability Engineering - applying software engineering to operations |

## Code Conventions

| Convention | Meaning | Common In |
|------------|---------|-----------|
| `snake_case` | Lowercase with underscores | Python, Ruby, SQL |
| `camelCase` | First word lowercase, rest capitalized | JavaScript, Java (methods) |
| `PascalCase` | All words capitalized | Classes, Types, Components |
| `SCREAMING_SNAKE_CASE` | Uppercase with underscores | Constants, Environment Variables |
| `kebab-case` | Lowercase with hyphens | URLs, CSS classes, file names |

## File Naming Patterns

| Pattern | Usage |
|---------|-------|
| `*.config.*` | Configuration files |
| `*.test.*` | Test files |
| `*.spec.*` | Specification/test files |
| `README.md` | Documentation entry point |
| `CHANGELOG.md` | Version history and changes |
| `index.*` | Module entry points |
| `.env` | Environment variables |
| `Dockerfile` | Container build instructions |

## Git Terminology

| Term | Definition |
|------|------------|
| **HEAD** | Current commit reference |
| **upstream** | The original repository that was forked |
| **origin** | Default name for the remote repository |
| **rebase** | Re-apply commits on top of another base |
| **cherry-pick** | Apply specific commits from another branch |
| **squash** | Combine multiple commits into one |
| **PR** | Pull Request (GitHub) |
| **MR** | Merge Request (GitLab equivalent of PR) |

---

## Toolkit Naming

The toolkit accepts the following names and aliases. When a user refers to the toolkit by any of these, treat it as a reference to quantum-toolbox:

| Alias | Notes |
|-------|-------|
| `quantum-toolbox` | Canonical name — use this in outputs, commit messages, docs |
| `the toolbox` | Natural language form — common in conversation |
| `toolbox` | Short form — common in conversation |
| `qt` | Abbreviation |
| `q-t` | Hyphenated abbreviation |

When writing outputs or documentation, always use the canonical name `quantum-toolbox`. Aliases are for input recognition only.
