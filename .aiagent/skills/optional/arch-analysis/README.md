# Architectural Analysis Skill

Systematic methodology for analyzing and documenting unknown codebases.

## Purpose

This skill enables comprehensive architectural analysis of unfamiliar codebases, producing accurate documentation with verifiable findings.

## Core Principles

### Documentation-First Verification

Every finding MUST be cross-referenced with existing documentation:

1. **Check existing docs** - Does documentation describe what we're finding?
2. **Verify accuracy** - Does the codebase match the documentation?
3. **Flag discrepancies** - Note where docs are missing, outdated, or incorrect

### Analysis Outputs

| Output | Description |
|--------|-------------|
| Technology Inventory | All languages, frameworks, libraries, tools |
| Interface Specification | All APIs, contracts, boundaries |
| Architecture Diagram | High-level system overview (Mermaid) |
| Sequence Diagrams | Integration and orchestration flows |
| Documentation Audit | Accuracy assessment of existing docs |

## Invocation

This is an invokable skill. Activate with:

> "Analyze the architecture of this codebase"

Or more specific variants:
- "Map all the technologies used in this project"
- "Find and document all interfaces"
- "Create architecture diagrams for this system"

## Analysis Philosophy

### Depth-First Exploration

Don't skim - understand deeply before moving on:
- Read entry points thoroughly
- Trace execution paths
- Understand data flow before documenting

### Evidence-Based Documentation

Every claim must be traceable:
- Cite specific files and line numbers
- Include code snippets as evidence
- Link findings to source locations

### Assume Nothing

- Don't trust file names alone
- Don't assume standard conventions are followed
- Verify everything against actual code

## Key Concepts

### Technology Stack

Categories to identify:
- **Languages**: Primary and secondary languages used
- **Frameworks**: Application frameworks (web, CLI, etc.)
- **Libraries**: Dependencies and their purposes
- **Build Tools**: Compilation, bundling, task runners
- **Infrastructure**: Databases, caches, queues, cloud services
- **DevOps**: CI/CD, containerization, deployment

### Interfaces

Types to discover:
- **External APIs**: REST, GraphQL, gRPC endpoints
- **Internal APIs**: Service-to-service communication
- **Event Interfaces**: Message queues, event buses
- **File Interfaces**: Import/export formats
- **User Interfaces**: CLI, GUI, web interfaces
- **Plugin/Extension**: Extensibility points

### Integration Patterns

Common patterns to identify:
- Request/Response (synchronous)
- Publish/Subscribe (asynchronous)
- Event Sourcing
- CQRS
- Saga/Orchestration
- Choreography

## Success Criteria

A complete analysis includes:

- [ ] All technologies identified with versions where possible
- [ ] All interfaces documented with contracts
- [ ] High-level architecture diagram (Mermaid)
- [ ] Sequence diagrams for key integrations
- [ ] Documentation accuracy assessment
- [ ] Discrepancy report (if applicable)
