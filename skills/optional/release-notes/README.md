# Skill: release-notes

Guidelines for producing structured release notes from a crew release session.

## Purpose

Release notes communicate change to three audiences with different needs:
- **End users** — what changed and why it matters to them; no technical jargon
- **Developers / API consumers** — what changed in the contract; migration steps for breaking changes
- **Operations** — what infrastructure changed; rollback considerations

A single release session produces all three formats from the same session outputs.

---

## Principles

### 1. User-first language
Write the end-user section in plain language. "Faster checkout" not "Reduced p99 latency by 40ms".

### 2. Breaking changes are always prominent
Breaking changes appear at the top of the developer section, never buried. If there are none, state it explicitly.

### 3. Migration guides are mandatory for breaking changes
Every breaking change must include a migration path: what to change, how, and by when.

### 4. Semantic versioning signals intent
- **Patch** (0.0.X) — bug fixes, no new features, no breaking changes
- **Minor** (0.X.0) — new features, backward compatible
- **Major** (X.0.0) — breaking changes; migration guide required

### 5. Deprecations are early warnings
Deprecated features appear in release notes for every release until removed.
Include the planned removal version.

---

## Changelog Format

```markdown
## [X.Y.Z] — YYYY-MM-DD

### Breaking Changes
- [BREAKING] Description of change — migration: [what consumers must do]

### New Features
- Description of feature — what it enables for the user

### Improvements
- Description of improvement — measurable impact where possible

### Bug Fixes
- Description of fix — what symptom was resolved

### Deprecations
- [DEPRECATED] Feature name — will be removed in vX.Y.Z; use [alternative] instead

### Security
- Description of security fix — CVE reference if applicable
```

---

## Audience-Specific Formats

### End-user release notes
Written in plain language. Focus on outcomes, not implementation.
Omit deprecations and technical details. Include screenshots or short descriptions of UI changes.

### Developer / API consumer release notes
Include breaking changes prominently. Include migration guides.
List API endpoint changes, schema changes, new authentication requirements.
Reference the full changelog for details.

### Operations release notes
Include infrastructure changes, config changes, environment variable additions.
State rollback procedure and monitoring changes.
List any manual steps required before or after deployment.
