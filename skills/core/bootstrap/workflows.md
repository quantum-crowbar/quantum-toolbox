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

## Update

**Check analysis staleness across all dimensions — no pulling, no file modifications.**

### Triggers

- `/update`
- `"Check for updates"`
- `"Is my analysis stale?"`
- `"What's changed since last analysis?"`

### Overview

`/update` is check-only mode. It reads the current manifest state, compares against live repo HEAD SHAs, checks toolkit version, checks code graph freshness, and surfaces all staleness dimensions in one report. It never pulls, modifies files, or triggers re-analysis.

---

### Phase C1: Read Manifest

```
Read specs/analysis-manifest.json
If not found:
  Report: "No analysis manifest found — run arch-analysis or Set up analysis
           tracking to create one."
  Stop here.

Extract:
  - lastAnalysis.date
  - lastAnalysis.repositories  (repo → commit SHA map)
  - toolboxVersion
  - artifacts.code-graph (if present)
```

---

### Phase C2: Check Staleness Dimensions

#### C2.1 — Source repo SHAs

For each repo in `lastAnalysis.repositories`:
```
1. Check if code/{repo} exists
2. If yes: git -C code/{repo} rev-parse --short HEAD
3. Compare with recorded commit SHA
4. Count commits ahead: git -C code/{repo} rev-list {old}..HEAD --count
```

Output per repo:
```
  api-service        ✓ Up-to-date  (a1b2c3d)
  worker-service     ⚠ Stale       (5 commits ahead: a1b2c3d → x7y8z9w)
  frontend           ⚠ Not cloned  (analyzed: j1k2l3m)
```

#### C2.2 — Toolkit version

```
Read .quantum-toolbox/skills/manifest.yaml → current version
Compare with toolboxVersion in manifest

If different:
  "⚠ Toolkit updated: {manifest version} → {current version}
   New views or skills may be available. Run /upgrade to see what changed."
```

#### C2.3 — Code graph staleness

```
If artifacts.code-graph is absent from manifest:
  → Note: "Code graph not yet extracted — run the code-graph skill to generate."
  → Skip remaining C2.3 checks.

Read:
  artifacts.code-graph.generatedDate
  artifacts.code-graph.sourceRepos

For each repo in sourceRepos:
  - Check lastAnalysis.repositories[repo].commit (the SHA at last analysis run)
  - Get current HEAD SHA from code/{repo}
  - If any repo's HEAD postdates generatedDate → that repo is a staleness source

If any stale repos found:
  Surface:
  "⚠ Code graph stale — generated {generatedDate}, repos updated since:
       - {repo}  ({branch}, {N} commits ahead)
   Re-run extraction? (Y / skip)"

  If Y: invoke code-graph skill Phase 0.0 → full extraction + Phase 4C + 4D
  If skip: note as acknowledged-stale in the report, continue

If no stale repos:
  "✓ Code graph current  (generated {generatedDate})"
```

---

### Phase C3: Present Staleness Report

```
─────────────────────────────────────────────────────────────
  Staleness Report  —  {today's date}
─────────────────────────────────────────────────────────────

  Last analysis:  {lastAnalysis.date}
  Toolkit:        {manifest toolboxVersion} {same / → new version}

  Source repos
    {repo}   ✓ / ⚠ ...
    ...

  Code graph
    ✓ / ⚠ ...

─────────────────────────────────────────────────────────────
  {If all current:}
  Everything is up-to-date. No action needed.

  {If stale:}
  To update:
    Stale source analysis  → run arch-analysis (or coding-profile) on changed repos
    Code graph stale       → run code-graph skill
    Toolkit upgraded       → run /upgrade
─────────────────────────────────────────────────────────────
```

---

### Notes for Agents

- `/update` never modifies files — it is always read-only
- If user asks to fix what's stale: hand off to the appropriate skill or `/upgrade`
- Missing `code/` repos: note them but do not clone without user confirmation
- If manifest is unreadable: note "manifest unreadable — run `Set up analysis tracking` to reset"

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

Step 4 — AGENTS.md structural gaps
  Read the repo's AGENTS.md
  Check for the presence of a section titled:
    "Post-Work Hook (mandatory after any skill that commits artefacts)"
  If absent:
    → Flag as: "AGENTS.md missing Post-Work Hook section (added in this toolkit version)"
  If present:
    → No action needed

Step 5 — New code-graph reports
  Check specs/analysis-manifest.json for artifacts.code-graph (code graph was run before)
  If present:
    Check whether docs/architecture-docs/reports/sqlite-cookbook.md exists
    If absent:
      → Flag as: "sqlite-cookbook.md not yet generated (added in this toolkit version)"
    If present:
      → No action needed
  If artifacts.code-graph is absent:
    → Skip (code graph has not been run in this repo)
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
  AGENTS.md
    ✔ Post-Work Hook section present
    — OR —
    ⚠ Post-Work Hook section missing — added in this toolkit version
      Action 1 will insert it.
  Code graph
    ✓ Current  (generated {generatedDate})
    — OR —
    ⚠ Stale — generated {generatedDate}, repos updated since:
         - {repo}  ({branch}, {N} commits ahead)

─────────────────────────────────────────────────────────
  Actions:
    1  Enable new skills in AGENTS.md
    2  Generate new views + missing reports (no re-scan needed — uses existing model/SQLite)
    3  Regenerate updated-template outputs (re-scan required if templates changed analysis phases)
    4  Re-run code graph extraction
    A  Do all of the above in sequence
    Q  Nothing to do right now

What would you like to do? (1 / 2 / 3 / 4 / A / Q)
─────────────────────────────────────────────────────────
```

If nothing changed:
```
─────────────────────────────────────────────────────────
  quantum-toolbox upgrade  —  {old version} → {new version}
─────────────────────────────────────────────────────────
  No new skills, views, or template changes affect your workspace.
  AGENTS.md Post-Work Hook section is present.
  sqlite-cookbook.md is present.
  Code graph is current.
  Your analysis outputs are current for this version.
─────────────────────────────────────────────────────────
```

---

### Phase U4: Execute User's Choice

#### Action 1 — Enable new skills + insert missing AGENTS.md sections

```
Part A — New skills
  Show the user which new skill lines to check [ x ] in AGENTS.md
  Do NOT auto-edit the Enabled Skills checkboxes — this is a user decision
  Offer: "Here are the new skills. Add [ x ] to any you want enabled,
          then re-run /start."

Part B — Post-Work Hook section (if missing from U2 Step 4)
  Read AGENTS.md
  If "Post-Work Hook (mandatory after any skill that commits artefacts)"
  section is absent:
    Ask: "Your AGENTS.md is missing the Post-Work Hook section introduced
          in this toolkit version. Insert it now? [Y / skip]"
    If Y:
      Insert the full Post-Work Hook block from
      .quantum-toolbox/templates/AGENTS.template.md into AGENTS.md,
      placed immediately before the '## When to Update This File' section
      (or before the Staleness section if that heading is what's present).
      git add AGENTS.md
      git commit -m "chore: add Post-Work Hook section to AGENTS.md (qt upgrade)"
    If skip:
      Note as acknowledged-missing; agent will still reference it by name
      if a skill tries to invoke it
```

#### Action 2 — Generate new views + missing reports

```
Part A — New analysis views
→ Trigger: "Update analysis views" (analysis-tracking skill, step 3b)
→ For each new view in the diff:
   1. Read existing analysis model / architecture docs to reconstruct context
   2. Generate the new view using the appropriate skill workflow
   3. Save to docs/architecture-docs/analysis/{view-id}-{name}.md
→ Update specs/analysis-manifest.json:
   - Add new view to views[] array for architecture-docs artifact
   - Update toolboxVersion to new version
→ Create update log entry in docs/update-logs/ (update-logs skill)

Part B — sqlite-cookbook.md (if flagged missing in U2 Step 5)
  Precondition: artifacts.code-graph exists in manifest AND SQLite backend was used
    (check artifacts.code-graph.files for a .sqlite entry)
  If both are true:
    Ask: "sqlite-cookbook.md was added in this version. Generate it now
          from your existing SQLite file? No re-extraction needed. [Y / skip]"
    If Y:
      1. Read artifacts.code-graph stats from specs/analysis-manifest.json
         (generatedDate, stats.totalNodes, stats.resolvedEdges, sourceRepos, files)
      2. Derive {repo_count} from len(sourceRepos), {sqlite_path} from files[0]
      3. Load .quantum-toolbox/skills/optional/code-graph/sqlite-cookbook.template.md
      4. Substitute all template variables
      5. Write to docs/architecture-docs/reports/sqlite-cookbook.md
      6. git add docs/architecture-docs/reports/sqlite-cookbook.md
      7. git commit -m "docs(code-graph): add sqlite-cookbook.md (qt upgrade)"
    If skip:
      Note as acknowledged-missing, continue
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

#### Action 4 — Re-run code graph extraction

```
→ If code graph is stale (identified in Phase U3):
   Invoke code-graph skill Phase 0.0 with repos pre-populated from
   artifacts.code-graph.sourceRepos — user can confirm or adjust scope.
   On completion: Phase 4C updates manifest, Phase 4D commits.
→ If code graph was never run:
   Offer: "Run code-graph extraction now? This is optional."
   If yes: invoke code-graph skill Phase 0.0 from scratch.
```

#### Action A — All in sequence

```
Run: 2 → 3 → 4 → show 1 (skill enabling is always manual)
Action 2 first (no re-scan, fast), then 3 (re-scan per artifact), then 4 (code graph).
After completion, prompt user to review and enable new skills (step 1).
```

---

### Notes for Agents

- `/upgrade` always pulls first (Phase U1) — it is not a dry-run command
- If the user just wants to see what changed without pulling: they should use `/update` instead (check-only mode)
- Action 2 (new views) never requires re-cloning repos — it reconstructs context from existing docs
- Action 3 (template regeneration) may require re-cloning if the analysis model is stale
- Action 4 (code graph) uses Phase 0.0 scope dialogue — do not skip it
- Always create an update log entry (update-logs skill) after any action that modifies outputs
- Toolkit aliases (`qt`, `q-t`, `toolbox`, `the toolbox`) all trigger this workflow
- After any `/upgrade` action that commits artefacts: run the Post-Work Hook defined in the repo's AGENTS.md (update CONTEXT.md update log + AGENTS.md skills list + staleness line)

---

## Error Handling

| Situation | Response |
|-----------|----------|
| `.quantum-toolbox/` not found | "I can't find the quantum-toolbox submodule. Make sure it's added: `git submodule add https://github.com/quantum-crowbar/quantum-toolbox.git .quantum-toolbox`" |
| AGENTS.md missing at project root | Proceed with defaults; note: "No AGENTS.md found — using toolkit defaults. Run bootstrap to create one." |
| `git` not available | Skip git steps; note the gap without failing |
| analysis-manifest.json malformed | Skip staleness check; note "manifest unreadable — run `Set up analysis tracking` to reset" |
