# Architectural Analysis Checklist

Quick reference for systematic codebase analysis.

---

## Phase 0: Setup

### Documentation Location
- [ ] Documentation directory confirmed with user
- [ ] `architecture-docs/` directory created
- [ ] `architecture-docs/index.md` initialized
- [ ] `architecture-docs/analysis/` directory created

### Preferences
- [ ] Diagram format selected (Mermaid/ASCII/PlantUML)
- [ ] Format preference recorded for consistent use

### Pre-Analysis
- [ ] Access to full codebase confirmed
- [ ] Known constraints documented (time, scope)
- [ ] Stakeholder questions collected (if any)

---

## Phase 1: Reconnaissance

### Documentation Discovery
- [ ] Root README.md found and read
- [ ] `/docs` or `/documentation` directory checked
- [ ] ADRs (Architecture Decision Records) located
- [ ] API documentation found (OpenAPI/Swagger)
- [ ] Inline doc comments assessed
- [ ] Wiki/external docs identified

### AI/Agent Files Excluded
- [ ] `.aiagent/`, `.aider/`, `.cursor/` directories skipped
- [ ] `AGENTS.md`, `CLAUDE.md`, `.cursorrules` ignored
- [ ] Other AI config files excluded from doc analysis

### Structure Mapping
- [ ] Top-level directories catalogued
- [ ] Entry points identified
- [ ] Configuration files located
- [ ] Build scripts found
- [ ] Monorepo vs single-project determined

---

## Phase 2: Technology Inventory

### Languages
- [ ] Primary language(s) identified
- [ ] Version requirements noted
- [ ] Build/compile toolchain documented

### Dependencies
For each package manifest:
- [ ] All dependencies listed
- [ ] Purpose of major dependencies understood
- [ ] Version constraints noted
- [ ] Dev vs production dependencies separated

### Infrastructure
- [ ] Databases identified (type, connection method)
- [ ] Caches identified
- [ ] Message queues identified
- [ ] External services identified
- [ ] Cloud provider specifics noted

### Documentation Verification
- [ ] Technologies cross-referenced with docs
- [ ] Undocumented technologies flagged
- [ ] Outdated version info flagged

---

## Phase 3: Interface Discovery

### External APIs
- [ ] All routes/endpoints catalogued
- [ ] HTTP methods documented
- [ ] Request formats specified
- [ ] Response formats specified
- [ ] Authentication requirements noted
- [ ] Error responses documented

### Internal Interfaces
- [ ] Service boundaries identified
- [ ] Inter-service communication mapped
- [ ] Shared libraries/modules noted

### Event/Async Interfaces
- [ ] Message queues mapped
- [ ] Event publishers identified
- [ ] Event consumers identified
- [ ] Message schemas documented

### Data Interfaces
- [ ] Database schemas documented
- [ ] Data models mapped
- [ ] Import/export formats identified

### Documentation Verification
- [ ] API docs match implementation
- [ ] Undocumented endpoints flagged
- [ ] Schema mismatches flagged

---

## Phase 4: Diagram Creation

### Architecture Diagram
- [ ] All major components shown
- [ ] Dependencies indicated with arrows
- [ ] External systems included
- [ ] Data stores represented
- [ ] Diagram uses Mermaid syntax
- [ ] Legend provided if needed

### Sequence Diagrams
- [ ] Key user flows diagrammed
- [ ] Integration flows diagrammed
- [ ] Orchestration patterns shown
- [ ] Error paths included (if significant)
- [ ] Diagrams use Mermaid syntax

---

## Phase 5: Documentation Audit

### Coverage Check
| Area | Has Docs | Accurate |
|------|----------|----------|
| Technologies | [ ] | [ ] |
| Architecture | [ ] | [ ] |
| API Reference | [ ] | [ ] |
| Setup Guide | [ ] | [ ] |
| Development Guide | [ ] | [ ] |

### Discrepancy Tracking
- [ ] All discrepancies logged
- [ ] Impact level assigned to each
- [ ] Recommendations provided

---

## Phase 6: Dependency Health Check

### Package Inventory
- [ ] All package manifests located (package.json, requirements.txt, go.mod, etc.)
- [ ] Direct dependencies catalogued
- [ ] Transitive dependencies identified
- [ ] Dependencies categorized (runtime, dev, peer/optional)
- [ ] Purpose of each major dependency documented

### Version Currency
- [ ] Current versions recorded
- [ ] Latest available versions checked
- [ ] Major version gaps identified
- [ ] Breaking changes noted for outdated packages
- [ ] Update priority assigned

### Vulnerability Scan
- [ ] Known CVEs checked for each dependency
- [ ] Severity levels recorded (Critical/High/Medium/Low)
- [ ] Fixed versions identified
- [ ] Exploitability context assessed
- [ ] Remediation paths documented

### Maintenance Status
- [ ] Last publish date checked
- [ ] Maintainer activity assessed
- [ ] Open issues count noted
- [ ] Deprecation notices identified
- [ ] Alternatives identified for unmaintained packages

### License Compliance
- [ ] All licenses in dependency tree identified
- [ ] License types categorized (Permissive/Copyleft/Other)
- [ ] Restrictive licenses flagged (GPL, AGPL)
- [ ] Commercial use restrictions noted
- [ ] License conflicts checked

### Risk Summary
- [ ] Vulnerability count summarized
- [ ] Outdated package count summarized
- [ ] Unmaintained package count summarized
- [ ] License concern count summarized
- [ ] Risk matrix completed
- [ ] Priority actions listed

---

## Phase 7: Data Flow Mapping

### Input Sources
- [ ] API endpoints catalogued with data formats
- [ ] File import sources identified
- [ ] Event consumers mapped
- [ ] External integrations documented
- [ ] Scheduled jobs/batch processes listed

### Data Transformations
- [ ] Parsing/deserialization points identified
- [ ] Validation stages documented
- [ ] Normalization/enrichment steps mapped
- [ ] Model mapping locations noted
- [ ] Transformation pipeline visualized

### Storage Mapping
- [ ] All storage systems identified
- [ ] Entity-to-storage mapping complete
- [ ] Data relationships documented
- [ ] Caching strategy understood
- [ ] Search indexes mapped

### Data Lifecycle
- [ ] Creation triggers documented
- [ ] Read/query patterns identified
- [ ] Update mechanisms mapped
- [ ] Archival processes documented
- [ ] Deletion/anonymization paths traced
- [ ] Retention policies noted

### Data Flow Diagram
- [ ] Diagram covers all major flows
- [ ] Input sources shown
- [ ] Processing stages included
- [ ] Storage systems represented
- [ ] Output channels documented

---

## Phase 8: Error Handling Analysis

### Error Sources
- [ ] Validation error points identified
- [ ] Business logic error sources mapped
- [ ] Infrastructure error sources catalogued
- [ ] External service failure points noted
- [ ] Runtime error patterns documented

### Error Propagation
- [ ] Layer-by-layer propagation mapped
- [ ] Error wrapping patterns identified
- [ ] Error translation to HTTP codes documented
- [ ] Error aggregation patterns noted

### Error Response Formats
- [ ] API error format documented
- [ ] Error code registry exists/created
- [ ] Client-friendly messages verified
- [ ] Debug info appropriately hidden

### Observability
- [ ] Logging coverage assessed
- [ ] Log levels appropriately used
- [ ] Error tracking tool integrated
- [ ] Alerting rules defined
- [ ] Error metrics captured

### Recovery Mechanisms
- [ ] Retry patterns documented
- [ ] Circuit breakers identified
- [ ] Fallback strategies mapped
- [ ] Dead letter queues documented
- [ ] Compensating transactions noted

### Gap Analysis
- [ ] Unhandled scenarios identified
- [ ] Missing coverage documented
- [ ] Recommendations prioritized

---

## Output Verification

### Technology Manifest
- [ ] All languages listed with versions
- [ ] All frameworks listed
- [ ] All libraries categorized
- [ ] All infrastructure dependencies listed
- [ ] Evidence/file references included

### Interface Specification
- [ ] All external APIs documented
- [ ] All internal interfaces documented
- [ ] All event interfaces documented
- [ ] Contracts include request/response formats

### Diagrams
- [ ] Architecture diagram is readable
- [ ] Sequence diagrams are accurate
- [ ] Mermaid syntax validates
- [ ] Diagrams render correctly

### Documentation Audit
- [ ] Coverage assessment complete
- [ ] Discrepancies listed
- [ ] Recommendations provided

### Dependency Health Report
- [ ] Package inventory complete
- [ ] Version currency assessed
- [ ] Vulnerabilities documented
- [ ] Maintenance status evaluated
- [ ] License compliance checked
- [ ] Risk matrix populated
- [ ] Recommended actions listed

### Data Flow Map
- [ ] All input sources documented
- [ ] Transformation pipeline mapped
- [ ] Storage systems inventoried
- [ ] Data lifecycle documented
- [ ] Flow diagram created
- [ ] Entity matrix complete

### Error Handling Analysis Report
- [ ] Error sources inventoried
- [ ] Propagation patterns documented
- [ ] Response formats specified
- [ ] Observability coverage assessed
- [ ] Recovery mechanisms mapped
- [ ] Gaps identified and prioritized

---

## Quick Analysis Checklist

When time is limited:

- [ ] README reviewed (5 min)
- [ ] Package manifests scanned (10 min)
- [ ] Entry point traced (15 min)
- [ ] Main routes/endpoints listed (10 min)
- [ ] Basic architecture diagram created (10 min)

---

## Verification Questions

Ask these to validate findings:

### Technology
- "What evidence confirms this technology is used?"
- "Is this in the docs? Accurately?"

### Interfaces
- "Where is this endpoint defined?"
- "What calls this interface?"
- "What does the contract look like?"

### Architecture
- "What is the request path from entry to data?"
- "How do these components communicate?"
- "What happens on failure?"

### Documentation
- "Does the code match what docs say?"
- "What's missing from the docs?"
- "What's outdated in the docs?"

---

## Red Flags

Watch for these issues:

### Documentation & Code
- [ ] Documentation that doesn't match code
- [ ] Undocumented external dependencies
- [ ] Hidden API endpoints
- [ ] Inconsistent naming conventions
- [ ] Circular dependencies
- [ ] Dead code paths
- [ ] Hardcoded configuration
- [ ] Missing error handling

### Dependency Health
- [ ] Dependencies with known critical/high CVEs
- [ ] Packages with major version gaps (2+ major versions behind)
- [ ] Unmaintained packages (no updates in 12+ months)
- [ ] Deprecated packages still in use
- [ ] Packages with GPL/AGPL licenses in proprietary projects
- [ ] Duplicate packages at different versions in tree
- [ ] Excessive transitive dependencies from single package
- [ ] Packages with no license specified
- [ ] Pinned versions preventing security updates

### Data Flow
- [ ] Unvalidated data entering the system
- [ ] PII data logged or exposed
- [ ] Missing data retention policies
- [ ] No anonymization for GDPR compliance
- [ ] Data stored without encryption requirements
- [ ] Orphaned data with no deletion path
- [ ] Unclear data ownership between services
- [ ] Missing audit trails for sensitive data

### Error Handling
- [ ] Exceptions swallowed silently
- [ ] Stack traces exposed to clients
- [ ] Missing retry logic for external calls
- [ ] No circuit breakers for failing dependencies
- [ ] Errors not logged or tracked
- [ ] No alerting for critical failures
- [ ] Dead letter queues not monitored
- [ ] Inconsistent error response formats
- [ ] Missing fallback behavior for degraded mode
