# Development Workflows

> **Audience:** AI Agents

Step-by-step processes for common development tasks.

---

## Mental Model Loading

The toolkit's architectural thinking is layered:

1. **Default**: Read `core/architecture-thinking.md` (always, at session start)
2. **Override**: Read project root `architecture-thinking.local.md` (if it exists)
   - Sections with matching headings **replace** the default
   - New sections are **added**
   - Sections listed under `## Skip` are **ignored** from the default

This allows projects to customize how the agent thinks about architecture without forking the toolkit. See [templates/architecture-thinking.override.template.md](../templates/architecture-thinking.override.template.md) for the override template.

---

## Pre-Work Checklist

**Run this before starting any development task:**

1. Check if git is initialized
   - If not initialized, run `git init`
   - Add remote origin if needed
2. Run `git status` to check workspace state
   - If there are uncommitted changes, inform the user
   - Ask user if they want to stash, commit, or continue with dirty workspace
3. Run test suite to verify current state
   - If tests fail, inform user before proceeding
   - Document which tests are failing

---

## Autonomous Development Loop

**Use this loop when implementing features or fixes:**

```
REPEAT until all todo items are complete (max 10 retries per item):
  1. Pick next todo item, mark as in_progress
  2. Implement the change
  3. Write/update tests for the change
  4. Run test suite
     - If tests fail: fix issues and re-run (increment retry counter)
     - If retry limit reached: stop, inform user, document blockers
     - If tests pass: reset retry counter, continue
  5. Verify implementation meets requirements
  6. Mark todo item as completed
  7. Commit the code with descriptive message
  8. Return to step 1
```

**Exit conditions:**
- All todo items are marked as completed
- All tests are passing
- Code is committed

**Failure conditions (stop and inform user):**
- Retry limit reached on any item
- Unresolvable dependency or blocker encountered
- Tests require infrastructure not available

**Rollback procedure:**
- If implementation fails mid-way, use `git stash` to save work
- Document what was attempted and why it failed
- Reset to last known good state if needed

---

## Todo-Driven Development

**An invokable workflow for autonomous and semi-autonomous development.**

Invoke with: `"Use todo workflow"` | `"Use todo workflow, review code"` | `"Use todo workflow --dry-run"`

Full documentation: [skills/core/todo-workflow/](../skills/core/todo-workflow/)

---

## Feature Development

1. **Pre-work**: Run Pre-Work Checklist (above)
2. Read project context for current project state
3. Create a feature branch: `git checkout -b feature/<name>`
4. Create todo list for implementation tasks
5. **Execute**: Run Autonomous Development Loop for each todo
6. Ensure all tests pass
7. Update project context if significant changes made
8. Create pull request using PR template

## Bug Fixing

1. **Pre-work**: Run Pre-Work Checklist (above)
2. Reproduce the issue
3. Identify root cause
4. Create todo list for fix tasks
5. **Execute**: Run Autonomous Development Loop
6. Add regression test
7. Verify fix resolves issue
8. Commit with reference to bug/issue

## Hotfix (Urgent Production Fix)

**Use for critical production issues that need immediate resolution:**

1. **Pre-work**: Run Pre-Work Checklist
2. Create hotfix branch from main/production: `git checkout -b hotfix/<issue>`
3. Identify and document the issue
4. Implement minimal fix (avoid scope creep)
5. Write regression test
6. Run full test suite
7. Commit with `[HOTFIX]` prefix in message
8. Create PR for expedited review
9. After merge, backport to development branch if needed
10. Update project context with post-mortem notes

## Refactoring

**Use when improving code structure without changing functionality:**

1. **Pre-work**: Run Pre-Work Checklist
2. Document current behavior with tests (if not already covered)
3. Create refactoring branch: `git checkout -b refactor/<area>`
4. Create todo list for refactoring steps
5. **Execute**: Run Autonomous Development Loop
   - **Critical**: Tests must pass after each step
   - No functionality changes allowed
6. Verify all existing tests still pass
7. Update documentation if APIs changed
8. Create pull request

## Code Review

1. Check for coding standard compliance
2. Review security implications
3. Verify test coverage
4. Check for performance issues
5. Ensure no scope creep beyond PR description
6. Verify documentation is updated

## Context Update

**When to update project context:**

1. After completing a significant feature
2. When architectural decisions are made
3. When new dependencies are added
4. When known issues are discovered or resolved
5. When environment setup changes

**What to update:**
- Current State section with progress
- Key Components if new modules added
- Known Issues if bugs discovered
- Dependencies if new ones added
- Tech Stack if tools/frameworks change

---

## Help

**Context-aware help — what this workspace can do right now.**

### Triggers

- `/help`
- `"Help"`
- `"What can I do here?"`
- `"Show me what's available"`
- `"/help all"` — extended version including disabled skills

### Workflow

```
1. Read AGENTS.md (project root)
   - Identify enabled skills [ x ]
   - Identify domain + team context

2. Read .quantum-toolbox/skills/manifest.yaml
   - Get version
   - Get all core skills (always active)

3. Build context-aware output:

   ─────────────────────────────────────────────────
     quantum-toolbox {version}  |  {domain}

     Commands
       /start    Bootstrap or re-orient this session
       /help     This screen
       /skills   Interactive skill explorer
       /update   Check qt version, analysis views, code & doc staleness

     Active Skills (always available)
       git-workflow:   Commits, branches, PRs
       todo-workflow:  Autonomous task-based dev  → "Use todo workflow"
       bootstrap:      Session setup + metarepo    → /start

     Enabled for this project
       {skill}:   {one-line description}    → "{invocation}"
       {skill}:   ...

     Workflows
       {from AGENTS.md Key Workflows section — one per line}

     Analysis Status
       {from analysis-manifest.json if present:
        Last run: {date} | {N} repos | toolkit {version} | {up to date / stale}}
   ─────────────────────────────────────────────────

   Run /skills to explore all available skills in detail.

4. For "/help all":
   After the above, append:

   ─────────────────────────────────────────────────
     Available but not enabled
     (add [ x ] to AGENTS.md to enable)

       {skill}: {one-liner}
       ...
   ─────────────────────────────────────────────────
```

### Notes for Agents

- `/help` is intentionally compact — one screen, no scrolling
- It reads only what's enabled in AGENTS.md, not the full catalog
- Invocation phrases are shown only for enabled skills
- `/help all` is the escape hatch for users who want to see everything

---

## Skill Discovery

**An invokable workflow for interactive skill exploration.**

### Triggers

- `/skills`
- `"What skills do you have?"`
- `"List your capabilities"`
- `"What can you do?"`
- `"Show me your skills"`

### Workflow

```
PHASE 1 — Build the full skill inventory

1. READ skills/manifest.yaml
   - Collect ALL skills: tier (core / optional), name, description, status
   - Note which are always active (core) vs require activation (optional)

2. READ AGENTS.md (if present in project root)
   - Check which optional skills are explicitly enabled [ x ] in project AGENTS.md
   - Mark those as "active in this project"
   - All others are "available but not active"

3. PRESENT the menu:

   ---
   ## Skills

   ### Active Skills (always loaded)
   | Skill | What it does |
   |-------|--------------|
   | git-workflow | ... |
   | todo-workflow | ... |
   | bootstrap | ... |

   ### Enabled for this project
   | Skill | What it does | Invoke with |
   |-------|--------------|-------------|
   | arch-analysis | ... | "Analyze the architecture" |
   | ... | | |

   ### Available (not enabled)
   | Skill | What it does |
   |-------|--------------|
   | structurizr | ... |
   | togaf | ... |
   | ... | |

   ---
   **Options:**
   A) Show a full description table for all skills
   B) Pick a skill from the list to learn about it
   Q) Quit skill exploration

   What would you like? (A / B / Q or skill name)
   ---


PHASE 2A — If user chooses "A" (full table)

4. Read every active + enabled skill's README.md (first 20 lines each)
5. Present a single wide table:

   | Skill | Category | What it does | When to use | Invoke with |
   |-------|----------|--------------|-------------|-------------|
   | arch-analysis | Analysis | ... | When you need full architecture docs | "Analyze the architecture" |
   | ... | | | | |

6. After table, offer:
   "Want details on any specific skill? Tell me the name."
   → If user names a skill: jump to PHASE 2B
   → Otherwise: end flow


PHASE 2B — If user picks a specific skill (name or letter choice)

4. READ that skill's README.md in full
5. Present structured explanation:

   ---
   ## {Skill Name}

   **What it does:** {one-liner}
   **Category:** {Analysis / Modeling / Output / Workflow / Tracking}

   **When to use:**
   - {use case 1}
   - {use case 2}

   **What it produces:**
   - {output 1}
   - {output 2}

   **How to invoke:**
   - "{invocation phrase 1}"
   - "{invocation phrase 2}"

   **Prerequisites:** {none / or list}
   ---

6. Ask:
   "What would you like to do?
    U) Use this skill now
    M) Return to skill menu
    Q) Quit skill exploration"

   → U: Invoke the skill immediately (follow its README trigger)
   → M: Return to PHASE 1 step 3 (re-show the menu)
   → Q: End flow cleanly
```

### Notes for Agents

- Always show the three-tier split (active / enabled / available) — this helps users understand what they already have vs. what they can enable
- "Available but not enabled" skills can still be loaded on request — direct invocation bypasses the enabled check
- When reading skill READMEs for the full table (Phase 2A), use the first 2-3 paragraphs only to keep the table concise
- The menu loop (M → back to menu) can repeat as many times as the user wants

---

## Bootstrap

**An invokable workflow for introducing the toolkit to a new user or project.**

Full documentation: [skills/core/bootstrap/](../skills/core/bootstrap/)

### Triggers

- `/start`
- `"Bootstrap this repo"`
- `"Set up the toolkit"`
- `"Introduce yourself"`
- `"Get started"`
- First message that mentions "quantum-toolbox" or asks what the agent can do

### Summary Workflow

```
FIRST — detect mode:
  IF .quantum-toolbox/ AND AGENTS.md both exist:
    MODE A: session start (toolkit already set up)
    → read env → print status block → "Ready. What would you like to work on?"
    → DO NOT offer metarepo setup

  ELSE:
    MODE B: first-time bootstrap
    → read env → print status block → present two paths (below)

--- MODE A ---
1. Read AGENTS.md + toolkit files
2. Report: toolkit version, domain, analysis status, last session
3. "Ready. What would you like to work on?"
   (Offer /help and /skills as starting points)

--- MODE B ---
1. Read AGENTS.md + toolkit core files (instructions.md, architecture-thinking.md)
2. Introduce self: name the toolkit, version, what it is
3. Check for analysis-manifest.json — if found, report staleness summary
4. Present two paths:

   PATH A — DIY (run skills yourself)
   "I can help you run analysis skills directly on any repo.
    Tell me what you'd like to analyze and I'll guide you through it.
    Run /skills to explore what's available."

   PATH B — Metarepo template
   "For ongoing AI-native work across multiple repos, I recommend
    setting up a metarepo. This gives you a persistent workspace
    with analysis outputs, coding profiles, and update logs — all
    version-controlled. Want me to walk you through the setup?"

5. Wait for user choice
```

---

## Update

**Check all update dimensions, report status, let the user drive what happens next.**

### Triggers

- `/update`
- `"Check for updates"`
- `"What needs updating?"`
- `"Is everything up to date?"`
- `"Update status"`

### Overview

`/update` is a read-first, act-second command. It never changes anything automatically. It checks four dimensions, builds a status report, then asks the user which updates to run.

If a quantum-toolbox version update is available and the user picks it — `/update` runs again automatically after the upgrade to get a fresh, post-upgrade status picture.

---

### Phase 1: Check All Dimensions

Run all four checks in parallel. Each check produces a status: `✓ up to date` | `⚠ update available` | `✗ missing`.

#### 1.1 — quantum-toolbox version

```
Read .quantum-toolbox/skills/manifest.yaml → get version field
Check .quantum-toolbox/ git state:
  git -C .quantum-toolbox fetch --dry-run 2>&1 (or check remote tracking)
  Compare local HEAD vs origin/main HEAD

Status:
  ✓  Local matches remote HEAD
  ⚠  Remote has N commits ahead — new skills/views may be available
  ✗  .quantum-toolbox/ not found or not a git repo
```

#### 1.2 — Analysis outputs completeness

```
Read specs/analysis-manifest.json (if exists)
  → Get artifacts[] and their views[]
Read .quantum-toolbox/skills/optional/analysis-outputs/architecture-docs/README.md
  → Get the full list of views the current toolkit version supports

Cross-reference: which views are in the toolkit but absent from the manifest?

Also check: are expected output files actually present on disk?
  For each artifact.files[] entry: does the file exist?

Status per artifact:
  ✓  All toolkit views present and files exist
  ⚠  N views missing (list them): toolkit has [08-sre, 09-code-graph] but manifest only has [01-07]
  ✗  analysis-manifest.json not found — analysis not set up yet
  ✗  N output files listed in manifest are missing from disk
```

#### 1.3 — Code staleness

```
Read specs/analysis-manifest.json → lastAnalysis.repositories
For each repo: compare analyzed commit vs current HEAD in code/{repo}/
  (same logic as check-analysis-status.sh)

Status:
  ✓  All repos up to date
  ⚠  N repos stale: {repo}: X commits behind (list each)
  ✗  No repos tracked in manifest
  -  code/ not present (repos not cloned — skip silently)
```

#### 1.4 — Documentation staleness

```
Check docs/ directory for externally-fetched content:
  - docs/update-logs/ → read most recent log's date
  - docs/dxp/ or docs/external/ → check file mtimes vs last analysis date
  - If Atlassian MCP is available: could check Confluence page versions
    (optional enhancement, skip if MCP not configured)

Status:
  ✓  Docs current (last fetch aligns with last analysis date)
  ⚠  Docs may be stale (last fetch: {date}, last analysis: {date})
  -  No external docs present (skip)
```

---

### Phase 2: Build Status Report

Present a compact status table — one line per dimension:

```
─────────────────────────────────────────────────────────
  /update status  —  {date}
─────────────────────────────────────────────────────────

  [1] quantum-toolbox   ⚠  v2.6.2 → v3.0.0 available (N commits ahead)
  [2] Analysis outputs  ⚠  Views 08-09 missing (toolkit has them, manifest does not)
  [3] Code staleness    ⚠  2 repos stale: api-service (12 commits), worker-svc (3 commits)
  [4] Docs              ✓  Up to date

─────────────────────────────────────────────────────────
  Actions:
    1  Update quantum-toolbox to latest
    2  Generate missing analysis views (no re-scan needed)
    3  Re-run analysis on stale repos
    4  (nothing to do)
    A  Do all of the above in sequence
    Q  Quit — I'll handle it manually
─────────────────────────────────────────────────────────

What would you like to do? (1 / 2 / 3 / A / Q)
```

If everything is up to date:
```
─────────────────────────────────────────────────────────
  /update status  —  {date}
─────────────────────────────────────────────────────────
  [1] quantum-toolbox   ✓  v3.0.0 (current)
  [2] Analysis outputs  ✓  All views present
  [3] Code staleness    ✓  All repos up to date
  [4] Docs              ✓  Up to date
─────────────────────────────────────────────────────────
  Everything is up to date. Nothing to do.
─────────────────────────────────────────────────────────
```

---

### Phase 3: Execute User's Choice

#### Action 1 — Update quantum-toolbox

```
git -C .quantum-toolbox pull origin main
→ On success: run /update again automatically (full Phase 1-2-3 cycle with new version)
→ The re-run will show the updated version and any new views now available
→ This is the only action that triggers an automatic re-run
```

#### Action 2 — Generate missing analysis views

```
→ Trigger: "Update analysis views" (analysis-tracking skill workflow, step 3b)
→ Agent reads existing analysis docs to reconstruct model
→ Generates only missing views from existing model (no re-cloning of repos)
→ Updates specs/analysis-manifest.json views[] and toolboxVersion
→ Creates update log in docs/update-logs/
```

#### Action 3 — Re-run analysis on stale repos

```
→ For each stale repo listed:
   1. git -C code/{repo} pull (update the clone)
   2. Run arch-analysis (or security-analysis) incremental update on that repo
   3. Update specs/analysis-manifest.json with new commit SHA
→ Creates update log in docs/update-logs/
```

#### Action A — All in sequence

```
Run: 1 → re-run /update → 2 → 3 (in that order)
After Qt update, re-run ensures Action 2 uses the right view list.
```

---

### Notes for Agents

- Never run any action without explicit user confirmation — `/update` is always report-first
- Action 1 (qt update) is the only action that auto-reruns `/update` — this gives a fresh status with the new version loaded
- If code/ directory doesn't exist (repos not cloned), skip check 1.3 silently — note it in the report as `-  Code not cloned locally`
- If analysis-manifest.json doesn't exist, checks 1.2 and 1.3 both show `✗ not set up` — offer "Set up analysis tracking" as a precursor action
- Toolkit aliases (`qt`, `q-t`, `toolbox`, `the toolbox`) all trigger this workflow
