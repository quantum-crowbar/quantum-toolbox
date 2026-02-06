# Architectural Analysis Skills Roadmap

Development plan for expanding architectural analysis capabilities into specialized skills.

---

## Overview

Three specialized skills for comprehensive codebase analysis:

| Skill | Focus | Status |
|-------|-------|--------|
| `arch-analysis` | Structure, tech, interfaces, data flow | Exists - needs expansion |
| `security-analysis` | Security posture and vulnerabilities | Planned |
| `nonfunctional-analysis` | Quality attributes and health | Planned |

---

## Phase 1: Enhance arch-analysis

Expand current skill with deeper analysis capabilities.

### TODO

- [ ] **Dependency Health Check**
  - [ ] Add workflow phase for dependency analysis
  - [ ] Template for dependency manifest
  - [ ] Checklist for outdated/vulnerable packages
  - [ ] Integration with package manager files (package.json, requirements.txt, go.mod, etc.)
  - [ ] Version comparison against latest releases
  - [ ] Abandoned package detection (last publish date, maintainer activity)
  - [ ] License compliance inventory

- [ ] **Data Flow Mapping**
  - [ ] Add workflow phase for data flow tracing
  - [ ] Template for data flow diagrams (Mermaid)
  - [ ] Trace data from input sources to storage
  - [ ] Identify transformation points
  - [ ] Map database schemas and relationships
  - [ ] Document data retention patterns
  - [ ] Identify data deletion/anonymization paths

- [ ] **Error Handling Analysis**
  - [ ] Add workflow phase for error analysis
  - [ ] Template for error handling inventory
  - [ ] Map error propagation patterns
  - [ ] Identify logging and monitoring integration
  - [ ] Document retry mechanisms and dead letter handling
  - [ ] Assess graceful degradation patterns
  - [ ] Find unhandled error scenarios

### Acceptance Criteria

- [ ] All three new phases integrated into workflow
- [ ] Templates added for each output type
- [ ] Checklist updated with new items
- [ ] Examples added demonstrating each analysis
- [ ] Human guide updated in docs/ai

---

## Phase 2: Create security-analysis Skill

New skill focused on security posture assessment.

### TODO

- [ ] **Skill Structure**
  - [ ] Create `skills/optional/security-analysis/` directory
  - [ ] README.md - overview, principles, invocation
  - [ ] workflows.md - security analysis phases
  - [ ] checklist.md - security review checklist
  - [ ] templates.md - security report templates
  - [ ] examples.md - sample outputs

- [ ] **Security Surface Analysis**
  - [ ] Identify all entry points (APIs, CLI, events)
  - [ ] Map exposed endpoints and their protections
  - [ ] Document network boundaries
  - [ ] Find hardcoded secrets and credentials
  - [ ] Identify sensitive configuration exposure
  - [ ] Assess input validation patterns

- [ ] **Authentication & Authorization Analysis**
  - [ ] Identify auth mechanisms (JWT, OAuth, sessions, API keys)
  - [ ] Map authentication flows (sequence diagrams)
  - [ ] Document authorization model (RBAC, ABAC, ACL)
  - [ ] Find privilege escalation risks
  - [ ] Assess session management
  - [ ] Check for auth bypass patterns
  - [ ] Document credential storage approach

- [ ] **PII Data Handling**
  - [ ] Identify PII fields in data models
  - [ ] Trace PII through system (data flow)
  - [ ] Document encryption at rest and in transit
  - [ ] Assess logging for PII leakage
  - [ ] Check GDPR/CCPA compliance patterns
  - [ ] Document data access controls
  - [ ] Identify data export/deletion capabilities

### Acceptance Criteria

- [ ] Complete skill with all 5 standard files
- [ ] Skill registered in _index.md
- [ ] Human guide created in docs/security-analysis-guide.md
- [ ] Cross-references with arch-analysis documented
- [ ] Invocation patterns documented

---

## Phase 3: Create nonfunctional-analysis Skill

New skill focused on quality attributes and code health.

### TODO

- [ ] **Skill Structure**
  - [ ] Create `skills/optional/nonfunctional-analysis/` directory
  - [ ] README.md - overview, principles, invocation
  - [ ] workflows.md - analysis phases
  - [ ] checklist.md - quality review checklist
  - [ ] templates.md - report templates
  - [ ] examples.md - sample outputs

- [ ] **Testing Coverage Analysis**
  - [ ] Identify test frameworks and patterns
  - [ ] Map tested vs untested code paths
  - [ ] Categorize test types (unit, integration, e2e)
  - [ ] Document mock/stub patterns
  - [ ] Identify critical paths without coverage
  - [ ] Assess test quality (assertions, edge cases)
  - [ ] Find flaky test patterns

- [ ] **Configuration Audit**
  - [ ] Inventory all configuration sources
  - [ ] Document environment variables and purposes
  - [ ] Map feature flags and their states
  - [ ] Identify config file formats and locations
  - [ ] Assess configuration validation
  - [ ] Document secrets management approach
  - [ ] Check for environment-specific configs

- [ ] **Performance Hotspots**
  - [ ] Identify N+1 query patterns
  - [ ] Find missing database indexes (from query patterns)
  - [ ] Detect large payload transfers
  - [ ] Find synchronous operations that could be async
  - [ ] Identify resource-intensive operations
  - [ ] Map caching opportunities
  - [ ] Document existing optimization patterns

- [ ] **Code Health Indicators**
  - [ ] Identify high cyclomatic complexity areas
  - [ ] Find large files/functions needing refactoring
  - [ ] Detect dead code and unused exports
  - [ ] Map circular dependencies
  - [ ] Assess naming consistency
  - [ ] Find code duplication patterns
  - [ ] Document technical debt hotspots

### Acceptance Criteria

- [ ] Complete skill with all 5 standard files
- [ ] Skill registered in _index.md
- [ ] Human guide created in docs/nonfunctional-analysis-guide.md
- [ ] Cross-references with other analysis skills documented
- [ ] Invocation patterns documented

---

## Integration Tasks

After all phases complete:

- [ ] **Cross-Skill Workflow**
  - [ ] Document how to run full analysis (all three skills)
  - [ ] Create combined report template
  - [ ] Add skill dependencies to _index.md

- [ ] **Documentation**
  - [ ] Update root README with all analysis skills
  - [ ] Create comparison guide (when to use which)
  - [ ] Add troubleshooting section

---

## Notes

### Skill Relationship

```
arch-analysis (structural)
    ├── What technologies?
    ├── What interfaces?
    ├── How does data flow?
    └── What are the dependencies?

security-analysis (security)
    ├── What's exposed?
    ├── How is access controlled?
    └── Where is sensitive data?

nonfunctional-analysis (quality)
    ├── Is it tested?
    ├── Is it configurable?
    ├── Is it performant?
    └── Is it maintainable?
```

### Invocation Examples

```
"Analyze the architecture"           → arch-analysis
"Review security posture"            → security-analysis
"Assess code health"                 → nonfunctional-analysis
"Full codebase analysis"             → all three in sequence
```
