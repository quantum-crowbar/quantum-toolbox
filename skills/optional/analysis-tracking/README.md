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
      "updateLog": "docs/update-logs/2026-03-03-initial-full-scan.md",
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
3. **Create first update log** in `docs/update-logs/` (see Step 3 below)
4. Commit manifest + update log to your documentation/metarepo

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

When stale repos are reported, read the most recent `updateLog` from `updateHistory` in the manifest to understand the current documentation state before deciding what to regenerate.

### 3. Decide What to Regenerate

Based on staleness report:
- **Minor changes** (bug fixes, small features): Usually OK to skip
- **Significant changes** (new patterns, major refactors): Re-run analysis
- **Specific repos**: Regenerate only affected analysis files

### 4. Create Update Log

**Before committing any changes**, create an update log at:

```
{docs-directory}/update-logs/YYYY-MM-DD-<topic-slug>.md
```

Template:

```markdown
# Update: <short human-readable title>

**Date**: YYYY-MM-DD
**Changed by**: <name or agent>
**Topic**: <tech stack / initiative slug>
**Trigger**: <why this ran — staleness detected, new repos cloned, new context, etc.>
**Method**: quantum-toolbox `arch-analysis` | `security-analysis` | `coding-profile`

---

## Files Changed

| File | Change |
|------|--------|
| `docs/architecture-docs/...` | ... |

---

## Key Findings

- ...

---

## Repos Examined at HEAD

| Repo | Key files read |
|------|---------------|
| `repo-name` | `file1`, `file2` |
```

**Naming rules**:
- `YYYY-MM-DD` = date of this analysis pass
- `<topic-slug>` = kebab-case key repos or initiative: `initial-full-scan`, `hero-search-gw`, `events-gw-ml51`
- One file per session; each incremental pass gets its own file

### 5. Update Manifest

After creating the update log and regenerating analysis:

```bash
bash scripts/update-analysis-manifest.sh
```

Interactive script asks:
- Which artifacts did you regenerate?
- Detects current commit SHAs automatically
- Updates manifest with new versions
- Adds entry to update history

The `updateHistory` entry must include a `updateLog` field pointing to the file created in Step 4:

```json
{
  "date": "YYYY-MM-DD",
  "action": "Incremental update — <topic>",
  "artifacts": ["architecture-docs"],
  "repos": ["repo-a", "repo-b"],
  "updateLog": "docs/update-logs/YYYY-MM-DD-<topic-slug>.md",
  "note": "<one-line summary of what changed>"
}
```

This links the machine-readable commit state to the human-readable account of what changed and why.

### 6. Commit Everything Together

```bash
git add specs/analysis-manifest.json docs/update-logs/ docs/architecture-docs/ .ai-coding-skills/
git commit -m "docs: update analysis — <topic> (YYYY-MM-DD)"
git push
```

---

## Templates Provided

### 1. `analysis-manifest.json`
JSON manifest structure with:
- Repository commit tracking
- Artifact-to-commit mapping
- Update history log (each entry links to an update log file via `updateLog` field)

### 2. `check-analysis-status.sh`
Bash script that:
- Reads manifest to get last analyzed commits
- Compares with current HEAD in cloned repos
- Reports staleness (X commits behind)
- Handles missing repos gracefully
- Prints path to most recent update log for context

### 3. `update-analysis-manifest.sh`
Interactive bash script that:
- Detects current commit SHAs in cloned repos
- Asks which artifacts were regenerated
- Asks for update log path and note
- Updates manifest with new versions
- Adds entry to update history (including `updateLog` reference)

---

## Integration with Other Skills

Works alongside:

| Skill | Integration |
|-------|-------------|
| `arch-analysis` | Track which commits were analyzed for architecture docs; Phase 9 writes update log + calls manifest update |
| `security-analysis` | Track which commits were analyzed for security docs; Phase 8 writes update log + calls manifest update |
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
3. **Create an update log on every analysis pass** — Before committing, write `docs/update-logs/YYYY-MM-DD-<topic>.md`; link it in the manifest `updateHistory[].updateLog` field
4. **Document update decisions** — Use `note` field in update history + update log trigger field
5. **Incremental updates** — Don't always regenerate everything
6. **Automate checks** — Run staleness check in CI for visibility

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
│   ├── update-logs/                   # Human-readable record of every analysis pass
│   │   ├── 2026-03-03-initial-full-scan.md
│   │   └── 2026-04-13-events-gw-ml51.md
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
