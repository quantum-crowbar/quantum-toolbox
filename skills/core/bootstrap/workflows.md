# Bootstrap Workflows

> **Audience:** AI Agents

---

## Entry Point

Triggers: `/start` | `"Bootstrap this repo"` | `"Get started"` | `"Introduce yourself"` | `"Set up the toolkit"` | first message where no context is established

---

## Phase 1: Read the Environment

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

Present a compact status block. Do NOT use lengthy prose — one screen, scannable:

```
─────────────────────────────────────────────────
  quantum-toolbox {version} — ready

  Domain:        {domain name, or "not configured"}
  Skills loaded: {N enabled + all core skills}
  Analysis:      {date + "up to date" / "stale: {N} repos behind" / "not run yet"}
  Last session:  {date, or "none found"}
─────────────────────────────────────────────────
```

If toolkit version differs from manifest's `toolboxVersion`:
```
  ⚠ Toolkit updated: new views may be available.
    Run "Check analysis staleness" to see what can be regenerated.
```

---

## Phase 3: Offer Two Paths

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

If user chooses B:

```
STEP 1 — Init repo
  "Do you have a git repo ready, or should I help you initialise one?"
  → If yes: confirm remote URL
  → If no: run git init + set origin

STEP 2 — Add toolkit submodule
  "I'll add quantum-toolbox as a submodule at .quantum-toolbox/"
  git submodule add https://github.com/quantum-crowbar/quantum-toolbox.git .quantum-toolbox

STEP 3 — Create AGENTS.md
  Copy .quantum-toolbox/templates/AGENTS.template.md → ./AGENTS.md
  Ask user: "What is this project's domain? (e.g. Checkout Platform, Auth Services)"
  Insert domain name into AGENTS.md Domain Overview section

STEP 4 — Create CONTEXT.md
  Copy .quantum-toolbox/templates/CONTEXT.template.md → ./CONTEXT.md
  Pre-fill: domain name, date, version 0.1.0

STEP 5 — Create sources/urls.md
  Create sources/ directory
  Ask user: "Do you have source repository URLs to add now, or add them later?"
  → If now: collect URLs, write to sources/urls.md using template format
  → If later: create empty scaffold with instructions

STEP 6 — Gitignore
  Add code/ to .gitignore (cloned repos should not be committed)
  Add *.sqlite to .gitignore (code-graph SQLite files)

STEP 7 — Initial commit
  git add .
  git commit -m "chore: bootstrap metarepo with quantum-toolbox"

STEP 8 — Offer next action
  "Your metarepo is ready. What would you like to do next?

   A) Add source repos to sources/urls.md and run full analysis now
   B) Explore skills first (/skills)
   C) Leave it here — you can run analysis later"
```

---

## Error Handling

| Situation | Response |
|-----------|----------|
| `.quantum-toolbox/` not found | "I can't find the quantum-toolbox submodule. Make sure it's added: `git submodule add https://github.com/quantum-crowbar/quantum-toolbox.git .quantum-toolbox`" |
| AGENTS.md missing at project root | Proceed with defaults; note: "No AGENTS.md found — using toolkit defaults. Run bootstrap to create one." |
| `git` not available | Skip git steps; note the gap without failing |
| analysis-manifest.json malformed | Skip staleness check; note "manifest unreadable — run `Set up analysis tracking` to reset" |
