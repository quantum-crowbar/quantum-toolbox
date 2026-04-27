# Bootstrap Workflows

> **Audience:** AI Agents

---

## Entry Point

Triggers: `/start` | `"Bootstrap this repo"` | `"Get started"` | `"Introduce yourself"` | `"Set up the toolkit"` | first message where no context is established

Also triggers when user refers to the toolkit by any alias: `"toolbox"`, `"the toolbox"`, `"qt"`, `"q-t"` — see Toolkit Naming in `core/glossary.md`.

### Mode Detection (run first — before anything else)

```
Check for .quantum-toolbox/ directory AND AGENTS.md in project root

IF both exist:
  → MODE A: Session Start (toolkit already bootstrapped)
  → Skip metarepo setup entirely
  → Run Phase 1 → Phase 2 → done

IF either is missing:
  → MODE B: First-Time Bootstrap
  → Run Phase 1 → Phase 2 → Phase 3 → Phase 4B (guided setup)
```

**Mode A** is the common case — the user just opened a session in a workspace that already has the toolkit. Greet, orient, report status, get to work.

**Mode B** is first-time setup — the user just installed the toolkit or is starting from scratch.

---

## Phase 1: Read the Environment

> Runs in both Mode A and Mode B.

### 1.1 — Toolkit version

```
Read .quantum-toolbox/skills/manifest.yaml
Extract: version field (top of file)
If not found: version = "unknown"
```

### 1.2 — Project configuration

```
Read AGENTS.md (project root or .quantum-toolbox/AGENTS.md)
Extract:
  - Domain name (from Domain Overview section)
  - Enabled skills (checked [ x ] items in Enabled Skills section)
If AGENTS.md not found: domain = "not configured", enabled skills = defaults only
```

### 1.3 — Analysis state

```
Check for specs/analysis-manifest.json
If found:
  - Read lastAnalysis.date
  - Read toolboxVersion from manifest
  - Compare against current toolkit version (from 1.1)
  - For each repo in lastAnalysis.repositories: note if commit tracking exists
  - Summarise: "Analysis run on {date}, {N} repos tracked, toolkit {same/changed}"
If not found:
  - Status = "no analysis run yet"
```

### 1.4 — Last session

```
Check for docs/update-logs/ directory
If found: list files, read most recent filename (no file content needed)
  - Extract date from filename (YYYY-MM-DD prefix)
  - Status = "last agent session: {date}"
If not found:
  - Status = "no prior sessions"
```

---

## Phase 2: Introduce

> Runs in both Mode A and Mode B. Output is the same — only Phase 3 differs.

Present the status block followed by the skills and commands snapshot. One screen, scannable:

```
─────────────────────────────────────────────────
  quantum-toolbox {version} — ready

  Domain:        {domain name, or "not configured"}
  Analysis:      {date + "up to date" / "stale: {N} repos behind" / "not run yet"}
  Last session:  {date, or "none found"}

  Commands
    /start    Re-orient this session
    /help     Full help + enabled skills detail
    /skills   Interactive skill explorer
    /update   Check qt version, views, code & doc staleness
    /upgrade  Upgrade to latest toolkit + re-run affected analysis

  Skills — active
    git-workflow      Commits, branches, PRs
    todo-workflow     Autonomous task-based dev  → "Use todo workflow"
    bootstrap         Session setup + metarepo    → /start

  Skills — enabled for this project        (from AGENTS.md [ x ])
    {skill}   {one-liner}   → "{invocation}"
    {skill}   ...
    (none enabled yet — run /skills to explore)   ← show if no [ x ] items

  Skills — available (not loaded)
    {skill}   {one-liner}
    ...
─────────────────────────────────────────────────
```

If toolkit version differs from manifest's `toolboxVersion`:
```
  ⚠ Toolkit updated since last analysis — new views may be available.
    Run /upgrade to see what changed and regenerate affected outputs.
```

**Notes for agents on building this block:**
- Read `skills/manifest.yaml` to build the full skills list (tier + description)
- Read AGENTS.md `## Enabled Skills` to mark `[ x ]` items as "enabled for this project"
- Core skills (tier: core) always go in "active"
- Keep one-liners to 6 words max — this is the summary view, not the detail view
- Run `/help` for the full invocation phrase list and per-skill details

---

## Phase 2b: Session Ready (Mode A only)

After the status block:

```
Run /help for full detail on any skill or command.
What would you like to work on?
```

Do NOT offer metarepo setup — that's already done. Do NOT run Phase 3/4.

---

## Phase 3: Offer Two Paths (Mode B only)

Present the choice clearly. Do not elaborate further until the user picks:

```
How would you like to work?

  A) Explore skills and run them directly
     Analyse a repo, generate docs, assess security — all right here,
     no setup needed. Run /skills to see what's available.

  B) Set up a metarepo for ongoing work
     A persistent, version-controlled AI workspace for your team.
     Analysis outputs, coding profiles, and update logs all tracked in git.
     I'll walk you through setup step by step.

Type A, B, or just describe what you'd like to do.
```

---

## Phase 4A: Direct Skill Use

If user chooses A (or names a skill directly):

```
1. Trigger the Skill Discovery flow (/skills)
   → User explores the skill menu
   → User picks a skill
2. When user selects a skill to run:
   - Ask: "What repo, file, or spec should I analyse?"
   - Run the chosen skill on the provided target
3. At end of skill run: offer next steps
   - "Run another skill?"
   - "Set up analysis tracking to remember this run? (analysis-tracking skill)"
   - "Create an update log for this session? (update-logs skill)"
```

---

## Phase 4B: Metarepo Setup

> **Mode B only.** Full 8-step guided setup workflow is in [first-time-setup.md](first-time-setup.md).
> Load that file now if the user chose "B" (guided metarepo setup).

---

## Upgrade

**Pull latest toolkit, diff what changed, re-run only the analysis that is affected.**

### Triggers

- `/upgrade`
- `"Upgrade the toolkit"`
- `"Update to latest version"`
- `"What's new in the toolkit?"`

### Overview

`/upgrade` is the full post-update flow. It pulls the latest toolkit, computes the diff of what changed (new skills, new views, changed templates), compares that against the user's existing analysis outputs, and re-runs only what is stale or missing as a result. Always report-first, act second.

---

### Phase U1: Pull Latest

```
git -C .quantum-toolbox pull origin main

On success:
  - Re-read .quantum-toolbox/skills/manifest.yaml → new version
  - Note: old version (from analysis-manifest.json toolboxVersion field, or Phase 1 read)

On failure:
  - Report: "Could not pull latest toolkit — check network or submodule config"
  - Stop here, do not proceed
```

---

### Phase U2: Diff What Changed

Compute the upgrade delta — what did this version add that the user doesn't have yet?

```
Step 1 — Skills added
  Compare skills in new manifest.yaml vs old version (use git diff if available,
  or compare manifest skill list vs what was present in user's last analysis run)
  → List: new skills available (name + description)
  → Note: skills the user has [ x ] enabled vs newly available ones

Step 2 — Analysis views added
  Read .quantum-toolbox/skills/optional/analysis-outputs/architecture-docs/README.md
  → Extract full view list supported by new toolkit version
  Read specs/analysis-manifest.json → views[] already generated
  → Diff: which views are in toolkit but not in user's manifest?
  → These are "new views available for re-generation"

Step 3 — Template changes (best-effort)
  Check git log in .quantum-toolbox for changes to skills/optional/*/templates.md
  since the version recorded in analysis-manifest.json toolboxVersion
  → Note any templates used for existing artifacts that have changed
  → These are "outputs that may benefit from regeneration"
```

---

### Phase U3: Build Upgrade Report

Present a structured diff — what changed, what needs action:

```
─────────────────────────────────────────────────────────
  quantum-toolbox upgrade  —  {old version} → {new version}
─────────────────────────────────────────────────────────

  New skills available
    {skill}   {one-liner}   (you have it enabled / not enabled)
    ...
    (none) ← if no new skills

  New analysis views
    {view-id}  {view name}  ← can be generated from existing analysis model
    ...
    (none) ← if no new views

  Templates updated (outputs may benefit from regeneration)
    {artifact}  last generated with {old version}  ← re-run recommended
    ...
    (none) ← if no template changes

─────────────────────────────────────────────────────────
  Actions:
    1  Enable new skills in AGENTS.md
    2  Generate new views (no re-scan needed — uses existing model)
    3  Regenerate updated-template outputs (re-scan required if templates changed analysis phases)
    A  Do all of the above in sequence
    Q  Nothing to do right now

What would you like to do? (1 / 2 / 3 / A / Q)
─────────────────────────────────────────────────────────
```

If nothing changed:
```
─────────────────────────────────────────────────────────
  quantum-toolbox upgrade  —  {old version} → {new version}
─────────────────────────────────────────────────────────
  No new skills, views, or template changes affect your workspace.
  Your analysis outputs are current for this version.
─────────────────────────────────────────────────────────
```

---

### Phase U4: Execute User's Choice

#### Action 1 — Enable new skills

```
Open AGENTS.md in editor and show the user which new skill lines to check [ x ]
Do NOT auto-edit AGENTS.md — this is a user decision
Offer: "Here are the new skills. Add [ x ] to any you want enabled, then re-run /start."
```

#### Action 2 — Generate new views

```
→ Trigger: "Update analysis views" (analysis-tracking skill, step 3b)
→ For each new view in the diff:
   1. Read existing analysis model / architecture docs to reconstruct context
   2. Generate the new view using the appropriate skill workflow
   3. Save to docs/architecture-docs/analysis/{view-id}-{name}.md
→ Update specs/analysis-manifest.json:
   - Add new view to views[] array for architecture-docs artifact
   - Update toolboxVersion to new version
→ Create update log entry in docs/update-logs/ (update-logs skill)
```

#### Action 3 — Regenerate updated-template outputs

```
→ For each affected artifact:
   1. Confirm with user: "Re-generate {artifact}? This re-runs the full analysis."
   2. On confirm: run the appropriate skill (arch-analysis, coding-profile, etc.)
      with the existing repos already cloned in code/
   3. Update specs/analysis-manifest.json sourceCommits + toolboxVersion
→ Create update log entry
```

#### Action A — All in sequence

```
Run: 2 → 3 → show 1 (skill enabling is always manual)
Action 2 first (no re-scan, fast), then 3 (may require re-scan per artifact).
After completion, prompt user to review and enable new skills (step 1).
```

---

### Notes for Agents

- `/upgrade` always pulls first (Phase U1) — it is not a dry-run command
- If the user just wants to see what changed without pulling: they should use `/update` instead (check-only mode)
- Action 2 (new views) never requires re-cloning repos — it reconstructs context from existing docs
- Action 3 (template regeneration) may require re-cloning if the analysis model is stale
- Always create an update log entry (update-logs skill) after any action that modifies outputs
- Toolkit aliases (`qt`, `q-t`, `toolbox`, `the toolbox`) all trigger this workflow

---

## Error Handling

| Situation | Response |
|-----------|----------|
| `.quantum-toolbox/` not found | "I can't find the quantum-toolbox submodule. Make sure it's added: `git submodule add https://github.com/quantum-crowbar/quantum-toolbox.git .quantum-toolbox`" |
| AGENTS.md missing at project root | Proceed with defaults; note: "No AGENTS.md found — using toolkit defaults. Run bootstrap to create one." |
| `git` not available | Skip git steps; note the gap without failing |
| analysis-manifest.json malformed | Skip staleness check; note "manifest unreadable — run `Set up analysis tracking` to reset" |
