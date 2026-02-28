# Skill: release-notes — Workflows

## Workflow 1: Generate release notes from a release session

### Inputs
- Session spec (`session-type: release`) and crew outputs
- Version number and release type (patch / minor / major / hotfix)
- List of changes with risk levels from the spec

### Steps

1. **Classify changes by type**
   - Breaking changes → top of developer section; require migration guide
   - New features → new features section
   - Bug fixes → bug fixes section
   - Performance improvements → improvements section
   - Security fixes → security section; include CVE if known
   - Infrastructure / config changes → operations section

2. **Write end-user section**
   - Translate technical changes into user outcomes
   - Group by user-visible feature area, not by engineering component
   - Omit anything invisible to users (refactors, dependency updates, config changes)

3. **Write developer / API consumer section**
   - Lead with breaking changes (explicit: "none" if none)
   - Include migration steps for every breaking change
   - List deprecated features with planned removal version
   - Include API contract changes: new endpoints, changed fields, removed fields

4. **Write operations section**
   - Infrastructure changes and required manual steps
   - New environment variables or config keys
   - Rollback procedure (from the session's rollback plan)
   - Post-release monitoring: what to watch and for how long

5. **Compile full changelog entry**
   Using the format from README.md

### Outputs
- `workspace/releases/vX.Y.Z-release-notes.md` — all three audience formats
- Changelog entry for `CHANGELOG.md`

---

## Workflow 2: Validate release notes completeness

Before finalising, check:

- [ ] Version number and date correct
- [ ] Breaking changes section present (even if "none")
- [ ] Every breaking change has a migration guide
- [ ] Deprecated features listed with removal version
- [ ] Operations section includes rollback procedure
- [ ] User-facing section uses plain language (no jargon)
- [ ] Security fixes reference CVE if known
