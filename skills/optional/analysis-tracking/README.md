# Analysis Tracking Skill

> **Audience:** AI Agents + Developers

Track which code repository commits were analyzed to generate architecture documentation and coding profiles. Enables incremental updates by detecting staleness and recommending what needs regeneration.

---

## Purpose

When maintaining architecture documentation and coding profiles:
- **Problem:** Analysis becomes stale as code evolves, but full regeneration is expensive
- **Solution:** Track analyzed commits, detect staleness, recommend selective updates
- **Benefit:** Know when analysis is out-of-date and what specifically needs refreshing

This skill provides:
1. **Manifest structure** — JSON schema to track analyzed commits and artifacts
2. **Staleness detection** — Script to compare current vs. analyzed commits
3. **Manifest updater** — Helper to update tracking after regenerating analysis

---

## When to Use

- Setting up a metarepo or documentation repository that tracks code analysis
- Maintaining architecture docs generated from `arch-analysis` skill
- Maintaining coding profiles generated from `coding-profile` skill
- Multiple code repos with separate analysis artifacts
- Need to know when analysis is out of sync with code

---

## What Gets Tracked

The manifest tracks:

### 1. Repository Commits
Which commit SHA was analyzed for each source repository:
```json
{
  "lastAnalysis": {
    "date": "2026-03-03",
    "repositories": {
      "api-service": {
        "commit": "a1b2c3d",
        "url": "https://github.com/org/api-service.git",
        "branch": "main"
      }
    }
  }
}
```

### 2. Generated Artifacts
Which artifacts were generated from which commits:
```json
{
  "artifacts": {
    "architecture-docs": {
      "path": "docs/architecture/",
      "sourceCommits": ["a1b2c3d", "e4f5g6h"],
      "files": ["index.md", "api-spec.md"]
    },
    "coding-profiles": {
      "typescript-api.md": {
        "sourceRepo": "api-service",
        "sourceCommit": "a1b2c3d"
      }
    }
  }
}
```

### 3. Update History
Log of analysis updates:
```json
{
  "updateHistory": [
    {
      "date": "2026-03-03",
      "action": "Initial analysis",
      "artifacts": ["architecture-docs", "coding-profiles"],
      "note": "Created from initial codebase scan"
    }
  ]
}
```

---

## Workflow

### 1. Initial Setup

After running `arch-analysis` or `coding-profile` skills:

1. Create `specs/analysis-manifest.json` from template
2. Fill in current commit SHAs and artifact paths
3. Commit manifest to your documentation/metarepo

### 2. Check Staleness

Periodically check if analysis is out-of-date:

```bash
bash scripts/check-analysis-status.sh
```

Output shows which repos have new commits since last analysis:
```
  api-service        ... ✓ Up-to-date (a1b2c3d)
  worker-service     ... ⚠ Stale (5 commits behind: e4f5g6h → x7y8z9w)
  frontend           ... ⚠ Not cloned (analyzed: j1k2l3m)
```

### 3. Decide What to Regenerate

Based on staleness report:
- **Minor changes** (bug fixes, small features): Usually OK to skip
- **Significant changes** (new patterns, major refactors): Re-run analysis
- **Specific repos**: Regenerate only affected coding profiles

### 4. Update Manifest

After regenerating analysis:

```bash
bash scripts/update-analysis-manifest.sh
```

Interactive script asks:
- Which artifacts did you regenerate?
- Detects current commit SHAs automatically
- Updates manifest with new versions
- Adds entry to update history

### 5. Commit Updated Analysis

```bash
git add specs/analysis-manifest.json docs/architecture/ .ai-coding-skills/
git commit -m "docs: update analysis after significant code changes"
git push
```

---

## Templates Provided

### 1. `analysis-manifest.json`
JSON manifest structure with:
- Repository commit tracking
- Artifact-to-commit mapping
- Update history log

### 2. `check-analysis-status.sh`
Bash script that:
- Reads manifest to get last analyzed commits
- Compares with current HEAD in cloned repos
- Reports staleness (X commits behind)
- Handles missing repos gracefully

### 3. `update-analysis-manifest.sh`
Interactive bash script that:
- Detects current commit SHAs in cloned repos
- Asks which artifacts were regenerated
- Updates manifest with new versions
- Adds entry to update history

---

## Integration with Other Skills

Works alongside:

| Skill | Integration |
|-------|-------------|
| `arch-analysis` | Track which commits were analyzed for architecture docs |
| `coding-profile` | Track which commits were used to extract coding conventions |
| `codebase-analysis` | Record base analysis commit provenance |
| `roadmap-building` | Link roadmap to analyzed code state |

---

## Customization

### Adding Custom Artifacts

Extend the manifest to track additional artifacts:

```json
{
  "artifacts": {
    "api-specs": {
      "path": "specs/openapi/",
      "sourceCommits": ["a1b2c3d"],
      "generatedBy": "openapi-generator"
    }
  }
}
```

### Custom Staleness Logic

Modify `check-analysis-status.sh` to:
- Check specific file changes (not just commit count)
- Integrate with CI/CD pipelines
- Send notifications when staleness exceeds threshold

### Multi-Branch Tracking

Track analysis for multiple branches:

```json
{
  "branches": {
    "main": { "lastAnalysis": {...} },
    "develop": { "lastAnalysis": {...} }
  }
}
```

---

## Best Practices

1. **Commit manifest alongside analysis** — Keep tracking in sync with artifacts
2. **Check staleness periodically** — Weekly or monthly review recommended
3. **Document update decisions** — Use `note` field in update history
4. **Incremental updates** — Don't always regenerate everything
5. **Automate checks** — Run staleness check in CI for visibility

---

## Example: Metarepo Setup

Typical directory structure:

```
metarepo/
├── specs/
│   └── analysis-manifest.json         # Tracks analyzed commits
├── scripts/
│   ├── check-analysis-status.sh       # Detect staleness
│   └── update-analysis-manifest.sh    # Update tracking
├── docs/
│   └── architecture-docs/             # Generated from arch-analysis
└── .ai-coding-skills/                 # Generated from coding-profile
    ├── typescript-api.md
    └── python-worker.md
```

README.md shows last analysis date:
```markdown
📊 Last Analysis: 2026-03-03 | Status: Check with `bash scripts/check-analysis-status.sh`
```

---

## Related Skills

- `arch-analysis` — Generate architecture documentation
- `coding-profile` — Extract coding conventions from repos
- `codebase-analysis` — Base analysis engine
- `roadmap-building` — Plan features based on architecture

---

## See Also

- [templates/analysis-manifest.json](templates/analysis-manifest.json) — Manifest structure
- [templates/check-analysis-status.sh](templates/check-analysis-status.sh) — Staleness detection script
- [templates/update-analysis-manifest.sh](templates/update-analysis-manifest.sh) — Manifest updater
