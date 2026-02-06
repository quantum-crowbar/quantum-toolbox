# Codebase Analysis Checklist

Quick reference for analysis completion.

---

## Setup (Phase 0)

- [ ] Output adapters selected
- [ ] Diagram format preference set
- [ ] Analysis model initialized

---

## Phase 1: Reconnaissance

### Project Metadata
- [ ] Project name identified
- [ ] Repository URL captured
- [ ] Current commit recorded
- [ ] Description extracted

### Documentation Inventory
- [ ] README files found
- [ ] docs/ directories scanned
- [ ] ADRs identified
- [ ] API docs located
- [ ] AI agent files excluded

### Project Structure
- [ ] Entry points identified
- [ ] Source directories mapped
- [ ] Test locations found
- [ ] Config files catalogued

**Model**: `meta`, `reconnaissance`, `architecture.structure` populated

---

## Phase 2: Technology Stack

### Languages
- [ ] All languages identified
- [ ] Versions extracted
- [ ] Primary language marked
- [ ] Evidence recorded

### Frameworks
- [ ] Web frameworks identified
- [ ] Frontend frameworks found
- [ ] Testing frameworks catalogued
- [ ] ORM/database frameworks listed

### Libraries
- [ ] Dependencies categorized
- [ ] Purpose documented
- [ ] Versions recorded

### Infrastructure
- [ ] Databases identified
- [ ] Caches found
- [ ] Message queues listed
- [ ] External services noted

### Build Tools
- [ ] Package manager identified
- [ ] Build scripts documented
- [ ] CI/CD config found

**Model**: `technologies` populated

---

## Phase 3: Interface Discovery

### APIs
- [ ] REST endpoints mapped
- [ ] GraphQL endpoints found
- [ ] Auth requirements noted
- [ ] Request/response schemas captured
- [ ] Handlers linked with evidence

### Events
- [ ] Published events listed
- [ ] Consumed events listed
- [ ] Event schemas documented
- [ ] Publishers/consumers mapped

### Integrations
- [ ] External APIs identified
- [ ] SDK usage documented
- [ ] Auth methods noted
- [ ] Direction (in/out) marked

### CLI
- [ ] CLI entry points found
- [ ] Commands documented
- [ ] Arguments mapped

**Model**: `interfaces` populated

---

## Phase 4: Architecture Synthesis

### Components
- [ ] All logical components identified
- [ ] Component types classified
- [ ] Responsibilities documented
- [ ] Dependencies mapped
- [ ] Exposed interfaces listed

### Layers
- [ ] Architectural layers identified
- [ ] Layer boundaries documented
- [ ] Components assigned to layers

### Patterns
- [ ] Design patterns recognized
- [ ] Usage locations noted
- [ ] Evidence recorded

**Model**: `architecture` populated

---

## Phase 5: Data Flow

### Entities
- [ ] All data models found
- [ ] Fields documented
- [ ] Relationships mapped
- [ ] Storage locations identified

### Flows
- [ ] Key data paths traced
- [ ] Entry points documented
- [ ] Transformations identified
- [ ] Storage destinations mapped

### Lifecycle
- [ ] CRUD operations documented
- [ ] Retention policies noted
- [ ] Deletion approaches identified

**Model**: `data` populated

---

## Phase 6: Dependency Health

### Inventory
- [ ] All packages listed
- [ ] Versions recorded
- [ ] Categories assigned

### Version Currency
- [ ] Current vs latest compared
- [ ] Major gaps flagged
- [ ] Breaking changes noted

### Security
- [ ] Vulnerabilities scanned
- [ ] CVEs identified
- [ ] Severity rated

### Maintenance
- [ ] Last publish dates checked
- [ ] Deprecations flagged
- [ ] Unmaintained packages identified

### Licenses
- [ ] Licenses catalogued
- [ ] Restrictions noted
- [ ] Conflicts identified

### Summary
- [ ] Health metrics calculated
- [ ] Risk levels assigned
- [ ] Actions prioritized

**Model**: `dependencies` populated

---

## Phase 7: Error Handling

### Patterns
- [ ] Error handling patterns identified
- [ ] Coverage assessed
- [ ] Locations documented

### Propagation
- [ ] Error flow traced
- [ ] Wrapper patterns noted
- [ ] Client-facing errors mapped

### Gaps
- [ ] Unhandled scenarios found
- [ ] Risk levels assigned
- [ ] Recommendations made

### Logging
- [ ] Logging framework identified
- [ ] Log levels documented
- [ ] Destinations noted

**Model**: `error_handling` populated

---

## Finalization

### Quality Assessment
- [ ] Documentation coverage rated
- [ ] Test coverage assessed
- [ ] Type safety evaluated
- [ ] Code organization rated

### Recommendations
- [ ] Critical issues listed
- [ ] High-priority items identified
- [ ] Improvements documented

### Model Validation
- [ ] `meta.project_name` populated
- [ ] `meta.analysis_date` set
- [ ] All evidence references valid
- [ ] Cross-references consistent

---

## Adapter Handoff

- [ ] Analysis model complete
- [ ] Selected adapters notified
- [ ] Output generation started

---

## Quick Reference: Model Sections by Phase

| Phase | Model Sections |
|-------|----------------|
| 0 | `meta.preferences` |
| 1 | `meta`, `reconnaissance`, `architecture.structure` |
| 2 | `technologies` |
| 3 | `interfaces` |
| 4 | `architecture` |
| 5 | `data` |
| 6 | `dependencies` |
| 7 | `error_handling` |
| Final | `quality`, `recommendations` |

---

## Evidence Requirements

Every model element should include:

- [ ] File path reference (`file.ts:42`)
- [ ] Verification status (observed in code)
- [ ] Cross-reference to docs (if exists)

Without evidence, findings are unverifiable.
