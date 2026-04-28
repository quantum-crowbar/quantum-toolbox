# Bootstrap: First-Time Setup

> **Audience:** AI Agents
> **When to load:** Mode B only — when `.quantum-toolbox/` or `AGENTS.md` is missing.

Contains the 8-step guided metarepo setup workflow. Not needed for Mode A (established projects).

---

## Phase 4B: Metarepo Setup

If user chooses B (guided setup):

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

  AGENTS.md must include these sections (all present in the template):
    - Quick Start reading order
    - Project-Specific Guidelines (code style, architecture, testing)
    - Enabled Skills list (checkboxes for optional skills)
    - Post-Work Hook (mandatory after any skill that commits artefacts)
      → placed between the AI Skills / Enabled Skills section and the staleness section
      → must specify: which fields to update in CONTEXT.md, AGENTS.md, and README.md
         per operation type; the update log idempotency rule; and the commit command
    - When to Update This File

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
