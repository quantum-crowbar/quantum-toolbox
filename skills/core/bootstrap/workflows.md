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

Dependency validation:
  For each enabled skill, read its dependencies[] from .quantum-toolbox/skills/manifest.yaml.
  For each dependency listed:
    If the dependency skill is NOT also in the enabled list:
      Add to dependency_warnings[]:
        {
          skill: "<skill-name>",
          missing_dep: "<dependency-name>",
          fix_options: [
            "A) Enable <dependency> in AGENTS.md (check its [ x ] box)",
            "B) Run <skill> in standalone mode (may produce lower-fidelity output)",
            "C) Ignore — understood, proceeding anyway"
          ]
        }
  (Do not stop or block. Warnings surface in Phase 2 status block.)
```

### 1.3 — Analysis state

```
Check for specs/analysis-manifest.json
If found:
  Schema validation:
    Read .quantum-toolbox/specs/analysis-manifest-schema.json
    Validate manifest against the schema.
    If validation fails (missing required fields, wrong types):
      Set manifest_valid = false
      Note specific violations (e.g. "missing toolboxVersion", "artifact entry lacks lastAnalyzedDate")
      Surface in Phase 2 status block:
        "⚠ analysis-manifest.json failed schema validation: {violations}
         Risk: /update and /upgrade may behave unpredictably.
         Fix: run arch-analysis to regenerate a valid manifest."
      Continue — do not stop.
    If validation passes: set manifest_valid = true

  - Read lastAnalysis.date
  - Read toolboxVersion from manifest
  - Compare against current toolkit version (from 1.1)
  - For each repo in lastAnalysis.repositories: note if commit tracking exists
  - Summarise: "Analysis run on {date}, {N} repos tracked, toolkit {same/changed}"
  - Code-graph status:
      Read artifacts.code-graph (if present):
        generatedDate, sourceRepos
        For each sourceRepo: compare generatedDate vs current HEAD date
        If all current: code-graph status = "✓ current ({generatedDate})"
        If any repo newer than generatedDate: code-graph status = "⚠ stale ({N} repos)"
      Cross-reference with Phase 1.2 enabled skills:
        If code-graph skill is [x] but artifacts.code-graph absent:
          code-graph status = "not run"
        If code-graph skill is not enabled:
          code-graph status = "not enabled"
If not found:
  - Status = "no analysis run yet"
  - code-graph status = "not run" (or "not enabled" if code-graph skill not in 1.2 list)
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
  Code graph:    {✓ current (date) / ⚠ stale (N repos) / "not run" / "not enabled"}
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

If code-graph skill is enabled in AGENTS.md but code-graph status is "not run":
```
  ⚡ code-graph enabled — SQLite extraction not yet run.
     Phase 0.5 will offer it when you next run arch-analysis.
     Until then, graph-dependent views (View 09) are unavailable.
```

If dependency_warnings[] is not empty (from Phase 1.2):
```
  ⚠ Skill dependency issues detected:
    {for each warning}
    {skill} requires {missing_dep} — not enabled in AGENTS.md
      Fix options:
        A) Enable {missing_dep} in AGENTS.md (check its [ x ] box)
        B) Run {skill} in standalone mode (lower-fidelity output)
        C) Ignore — proceeding anyway
```

**Notes for agents on building this block:**
- Read `skills/manifest.yaml` to build the full skills list (tier + description)
- Read AGENTS.md `## Enabled Skills` to mark `[ x ]` items as "enabled for this project"
- Core skills (tier: core) always go in "active"
- Keep one-liners to 6 words max — this is the summary view, not the detail view
- Derive Code graph status from Phase 1.3 and format as:
  `✓ current ({date})` / `⚠ stale ({N} repos)` / `not run` / `not enabled`
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

**Refresh the KB: re-analyse changed source repos, regenerate stale docs and views, update the manifest and context files.**

`/update` looks at both your source code and your documentation together. When repos have changed since the last analysis run it re-runs enabled skills on those repos, regenerates the affected architecture-docs views, and writes everything back to the manifest and context files. It also checks the toolkit version — if the toolkit has been upgraded it flags that `/upgrade` should be run in addition.

### Triggers

- `/update`
- `"Update my analysis"`
- `"Refresh my docs"`
- `"Re-run analysis"`
- `"What's changed since last analysis?"`

---

### Phase C1: Read Manifest

```
Read specs/analysis-manifest.json
If not found:
  Report: "No analysis manifest found. Run arch-analysis first to create one."
  Stop.

Extract:
  - lastAnalysis.date
  - lastAnalysis.repositories  (repo → commit SHA map)
  - artifacts                  (which skills have been run, which views exist)
  - toolboxVersion
  - artifacts.code-graph (if present)
```

---

### Phase C2: Detect Staleness

#### C2.1 — Source repo SHAs

For each repo in `lastAnalysis.repositories`:
```
1. Check if code/{repo} exists locally
2. If yes: git -C code/{repo} rev-parse --short HEAD
3. Compare with recorded SHA
4. Count: git -C code/{repo} rev-list {old}..HEAD --count
5. Identify enabled skills that last ran against this repo
   (check artifacts.{skill}.sourceRepos / lastAnalyzedCommit)
```

Output per repo:
```
  api-service     ✓ Up-to-date  (a1b2c3d)
  worker-service  ⚠ Stale       (5 commits ahead: a1b2c3d → x7y8z9w)
                    Skills to re-run: arch-analysis, coding-profile
  frontend        ⚠ Not cloned  (analyzed: j1k2l3m — clone to update)
```

#### C2.2 — Documentation / view coverage gaps

```
Read artifacts.architecture-docs.views[] from manifest
Compare against view list for the currently enabled skills
→ List any views that should exist but are missing
   (e.g. a skill was enabled after last analysis)
```

#### C2.3 — Code graph staleness

```
If artifacts.code-graph absent: skip.

Read artifacts.code-graph.generatedDate + sourceRepos
For each sourceRepo: compare generatedDate vs current HEAD date
If any repo has commits newer than generatedDate:
  → Flag: code graph stale, list affected repos + commit count
```

#### C2.4 — Toolkit version check

```
Read .quantum-toolbox/skills/manifest.yaml → current toolkit version
Compare with toolboxVersion in manifest

If different:
  → Flag: "⚠ Toolkit upgraded: {old} → {new}. Run /upgrade after /update
     to apply new skills, views, and config changes."
  (Do not stop — /update still proceeds with source + doc refresh)
```

---

### Phase C3: Present Staleness Report + Confirm

```
─────────────────────────────────────────────────────────────
  Update Report  —  {today's date}
─────────────────────────────────────────────────────────────
  Last analysis:  {lastAnalysis.date}
  Toolkit:        {toolboxVersion}  {✓ same / ⚠ upgraded → run /upgrade too}

  Source repos
    {repo}   ✓ Up-to-date / ⚠ Stale ({N} commits)  Skills: {list}
    ...

  Documentation
    Views present:  {N of M}
    Missing views:  {list or "(none)"}

  Code graph
    ✓ Current / ⚠ Stale ({repos})

─────────────────────────────────────────────────────────────
  {If all current:}
  Everything is up-to-date. No action needed.

  {If stale:}
  Ready to re-run: {skill list} on {repo list}
  Missing views will be generated from the updated analysis.

  Proceed? (Y / select repos / N)
─────────────────────────────────────────────────────────────
```

---

### Phase C4: Re-Run Analysis on Stale Repos

For each stale repo the user confirmed:
```
1. Re-run each enabled skill that previously covered this repo:
     arch-analysis     → re-run full analysis against code/{repo}
     security-analysis → re-run against code/{repo}
     coding-profile    → re-run against code/{repo}
   (Use existing clones in code/ — do not re-clone unless missing)

2. For any missing views identified in C2.2:
     Generate missing view using relevant skill workflow
     Save to docs/architecture-docs/analysis/{view-id}-{name}.md

3. If code graph is stale and user confirms:
     Invoke code-graph skill Phase 0.0 (scope pre-filled from manifest)
     On completion: Phase 4C + 4D (manifest update + commit)

4. If code graph was updated (step 3) AND reports/sqlite-cookbook.md exists:
     Re-run code-graph Phase 4B.5 (cookbook generation) to regenerate the cookbook
     with updated stats from the refreshed SQLite file.
     Write updated reports/sqlite-cookbook.md
     Include in the same commit as step 3, or add to the manifest update commit.
```

---

### Phase C5: Update Manifest + Context

```
Update specs/analysis-manifest.json:
  - lastAnalysis.date → today
  - lastAnalysis.repositories.{repo}.commit → new HEAD SHA  (per updated repo)
  - artifacts.architecture-docs.views[] → add any newly generated views
  - artifacts.{skill}.lastAnalyzedCommit → new SHA  (per skill per repo)
  (toolboxVersion is NOT updated here — that is /upgrade's responsibility)

Create update log entry: docs/update-logs/YYYY-MM-DD-update.md
  (update-logs skill)

Run Post-Work Hook:
  - Update CONTEXT.md update log row (today's date + one-line summary)
  - Update AGENTS.md staleness line
  - git add CONTEXT.md AGENTS.md specs/analysis-manifest.json docs/
  - git commit -m "docs: sync KB after /update — {repo list}"
```

---

### Notes for Agents

- Re-use existing clones in `code/` — do not clone unless the repo is missing
- If a repo is not cloned: note it, offer to clone, but do not proceed without confirmation
- If manifest is unreadable: "manifest unreadable — run `Set up analysis tracking` to reset"
- If toolkit is upgraded: run `/update` first to refresh sources, then `/upgrade` to apply new toolkit features
- Always create an update log entry after any successful re-analysis

---

## Upgrade

**Apply a new toolkit version: pull latest, diff what changed, generate new views and reports, insert missing config, re-run analysis where new skills require it.**

`/upgrade` is triggered by a toolkit version change. It looks at both the toolkit delta (new skills, views, hooks, templates) and your current source + documentation state. By the end, your project is fully current with the new toolkit version — new views generated, new config inserted, and any source-stale analysis re-run.

### Triggers

- `/upgrade`
- `"Upgrade the toolkit"`
- `"Update to latest version"`
- `"What's new in the toolkit?"`
- `"Apply new toolkit version"`

---

### Phase U1: Pull Latest Toolkit

```
git -C .quantum-toolbox pull origin main

On success:
  - Re-read .quantum-toolbox/skills/manifest.yaml → new version
  - Note old version from specs/analysis-manifest.json toolboxVersion field

On failure:
  - Report: "Could not pull latest toolkit — check network or submodule config"
  - Stop.
```

---

### Phase U2: Diff Toolkit Delta

What did the new version add that this project doesn't have yet?

```
Step 1 — New skills
  Compare skill list in new manifest.yaml vs old version
  → New skills: name + description
  → Note: which the user has enabled [ x ] vs not

Step 2 — New analysis views
  Read .quantum-toolbox/skills/optional/analysis-outputs/architecture-docs/README.md
  → Full view list supported by new toolkit version
  Read specs/analysis-manifest.json → views[] already generated
  → Diff: views in toolkit but not in manifest → "new views to generate"
  → For each new view: identify which skill produces it + what source data it needs

Step 3 — New report types
  Check for new report files new to this version
  (e.g. sqlite-cookbook.md, cost-impact.md)
  Cross-check docs/architecture-docs/reports/ for presence
  → Missing reports: flag + note whether source data already exists to generate them

Step 4 — Changed templates + skill version upgrades
  git -C .quantum-toolbox log --oneline {old version}..HEAD -- skills/optional/*/templates.md
  → List artifacts generated from changed templates → "may benefit from regeneration"

  For each artifact entry in specs/analysis-manifest.json:
    Read artifacts.{skill}.generatedWithSkillVersion
    Compare against current skill version in new manifest.yaml:
      If generatedWithSkillVersion is absent OR older than current skill version:
        → Flag artifact for regeneration:
          "  {skill} artifact generated with v{old} — current skill is v{new}
             Regeneration recommended to pick up template and workflow changes."
    If generatedWithSkillVersion matches current: skip (no change).

Step 5 — Config gaps
  Read AGENTS.md → check for Post-Work Hook section
  → Missing: flag for insertion
  Read AGENTS.md enabled skills list → compare against new skills available
  → New skills not listed: flag for user to review
  Read AGENTS.md enabled skills list → check if code-graph is [x]
  Read specs/analysis-manifest.json → artifacts.code-graph present?
  If code-graph enabled but artifacts.code-graph absent:
    → Flag: "⚡ code-graph enabled but no SQLite extraction exists —
       arch-analysis Phase 0.5 will offer it on next analysis run"
  If code-graph newly available in this version and not yet listed in AGENTS.md:
    → Flag: "code-graph skill now available — enable in AGENTS.md to unlock
       SQLite-first arch-analysis (90–98% token reduction on medium+ codebases)"

Step 6 — Source staleness (same as /update Phase C2.1–C2.3)
  Run full source repo + code graph staleness check
  → Identifies repos stale since last analysis
  → Especially relevant: new views may require a fresh analysis run if the model is old
```

---

### Phase U3: Build Upgrade Report + Confirm

```
─────────────────────────────────────────────────────────
  quantum-toolbox upgrade  —  {old version} → {new version}
─────────────────────────────────────────────────────────

  New skills
    {skill}   {description}   [enabled / not enabled]
    (none)

  New views to generate
    {view-id}  {name}   source: existing model / needs re-analysis
    (none)

  New reports to generate
    {report}   source: {existing SQLite / needs re-analysis / n/a}
    (none)

  Templates updated / Skill version upgrades (re-generation recommended)
    {skill}  artifact generated with v{old} — current skill v{new}
    (none)

  Config gaps
    ⚠ Post-Work Hook missing in AGENTS.md   → will insert on confirm
    ✔ Post-Work Hook present
    ⚠ New skills not listed in AGENTS.md    → review after upgrade    ⚡ code-graph enabled, no extraction run → arch-analysis Phase 0.5 will offer it
    ⚡ code-graph available but not enabled  → enable in AGENTS.md for SQLite-first analysis
  Source repos
    {repo}  ✓ Up-to-date / ⚠ Stale ({N} commits)
    ...

  Code graph
    ✓ Current / ⚠ Stale

─────────────────────────────────────────────────────────
  Actions:
    1  Insert missing config (Post-Work Hook, AGENTS.md sections)
    2  Generate new views from existing model (no re-scan)
    3  Generate new reports from existing data (no re-scan)
    4  Re-run analysis on stale repos (re-scan required)
    5  Re-run code graph extraction
    A  Do all of the above in sequence
    Q  Nothing right now

What would you like to do? (1 / 2 / 3 / 4 / 5 / A / Q)
─────────────────────────────────────────────────────────
```

If nothing to do:
```
  No new skills, views, reports, or config changes.
  All source repos are current.
  Your project is fully up-to-date with toolkit {version}.
```

---

### Phase U4: Execute

#### Action 1 — Insert missing config

```
Post-Work Hook (if missing):
  Ask: "Your AGENTS.md is missing the Post-Work Hook section. Insert now? [Y / skip]"
  If Y:
    Insert full Post-Work Hook block from
    .quantum-toolbox/templates/AGENTS.template.md into AGENTS.md
    (before '## When to Update This File' or equivalent heading)
    git add AGENTS.md
    git commit -m "chore: add Post-Work Hook section to AGENTS.md (qt upgrade)"

New skills (always manual):
  List new skill lines the user can add [ x ] to their AGENTS.md
  Do NOT auto-edit Enabled Skills — this is a user decision
  Prompt: "Add [ x ] to any you want enabled, then re-run /start."
```

#### Action 2 — Generate new views from existing model

```
For each new view identified in U2 Step 2 (source: existing model):
  1. Load existing analysis model / architecture docs to reconstruct context
  2. Run the view generation step from the relevant skill workflow
  3. Write to docs/architecture-docs/analysis/{view-id}-{name}.md
  4. Update specs/analysis-manifest.json → add view to views[] array,
     set generatedWithSkillVersion to current skill version from manifest.yaml
  5. Create update log entry
```

#### Action 2b — Regenerate artifacts where skill version changed (from U2 Step 4)

```
For each artifact flagged due to skill version upgrade:
  Prompt: "Regenerate {skill} output with skill v{new}? (recommended — templates changed)
           Y / skip"
  If Y:
    Re-run the skill's output generation phase (not full re-analysis, just template rendering)
    Update artifacts.{skill}.generatedWithSkillVersion = "{new version}"
    Write updated output files
    git add + git commit -m "docs: regenerate {skill} output with skill v{new}"
```

#### Action 3 — Generate new reports from existing data

```
For each new report where data already exists (e.g. sqlite-cookbook from SQLite file):
  1. Read required stats from manifest / existing files
  2. Load and fill the report template
  3. Write to docs/architecture-docs/reports/{report-name}.md
  4. Update artifacts.{skill}.generatedWithSkillVersion in manifest
  5. git add + git commit -m "docs: add {report-name} (qt upgrade)"
```

#### Action 4 — Re-run analysis on stale repos

```
Same as /update Phase C4 — re-run enabled skills on stale repos,
generate any missing views (including new ones that need fresh source data).
Update manifest sourceCommits per skill per repo.
```

#### Action 5 — Re-run code graph extraction

```
If stale: invoke code-graph skill Phase 0.0
  (scope pre-filled from artifacts.code-graph.sourceRepos)
  On completion: Phase 4C + 4D (manifest + commit)
If never run: offer to run from scratch.
```

#### Action A — All in sequence

```
Run: 1 → 2 → 3 → 4 → 5
(Config first, then no-rescan generation, then rescan, then code graph)
After completion: prompt user to review and enable new skills from Action 1.
```

---

### Phase U5: Update Manifest + Context

```
Update specs/analysis-manifest.json:
  - toolboxVersion → new version
  - artifacts.architecture-docs.views[] → add newly generated views
  - artifacts.{skill}.lastAnalyzedCommit → updated SHAs (if re-analysis ran)
  - lastAnalysis.date → today (if any analysis ran)

Create update log entry: docs/update-logs/YYYY-MM-DD-upgrade.md

Run Post-Work Hook:
  - Update CONTEXT.md update log row
  - Update AGENTS.md staleness line + skills list if changed
  - git add CONTEXT.md AGENTS.md specs/analysis-manifest.json docs/
  - git commit -m "docs: sync KB after /upgrade {old} → {new}"
```

---

### Notes for Agents

- `/upgrade` always pulls first — it is not a dry-run. Use `/update` if you only want to refresh sources without changing toolkit version.
- New views that require fresh source data (Action 4) always run the full skill workflow against existing clones — no re-cloning unless a repo is missing.
- Action 2 (model-based views) never re-scans source code — it reads existing architecture docs to reconstruct context.
- Action 3 (report generation) reads from manifest stats and existing SQLite/YAML — no source scan.
- Always create an update log entry after any action that modifies outputs.
- Toolkit aliases (`qt`, `q-t`, `toolbox`, `the toolbox`) all trigger this workflow.
- After completing upgrade: run the Post-Work Hook (Phase U5) — do not skip it.

---

## Error Handling

| Situation | Response |
|-----------|----------|
| `.quantum-toolbox/` not found | "I can't find the quantum-toolbox submodule. Make sure it's added: `git submodule add https://github.com/quantum-crowbar/quantum-toolbox.git .quantum-toolbox`" |
| AGENTS.md missing at project root | Proceed with defaults; note: "No AGENTS.md found — using toolkit defaults. Run bootstrap to create one." |
| `git` not available | Skip git steps; note the gap without failing |
| analysis-manifest.json malformed | Skip staleness check; note "manifest unreadable — run `Set up analysis tracking` to reset" |
