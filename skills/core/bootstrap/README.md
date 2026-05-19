# Bootstrap Skill

> **Audience:** AI Agents
> **Tier:** Core (always active)

Introduce the quantum-toolbox to a user, orient the agent to the current project state, and guide the user toward their first productive action — either running skills directly or setting up a metarepo for ongoing AI-native work.

---

## Purpose

When an agent is dropped into a project with the toolkit installed, the user often doesn't know:
- What the toolkit can do
- What state the project is in (has analysis been run? Is it stale?)
- Where to start

Bootstrap closes that gap. It reads the environment, introduces itself, reports status, and offers two clear paths forward.

---

## When to Use

- `/start` — explicit user request
- `"Bootstrap this repo"` / `"Get started"` / `"Introduce yourself"`
- First message in a session where no context has been established yet
- After adding the toolkit as a submodule to a new project
- Any time a user asks "what can you do?" or "where do I begin?"

---

## What Bootstrap Does

Bootstrap detects which mode it's in before doing anything else:

| Condition | Mode | Behaviour |
|-----------|------|-----------|
| `.quantum-toolbox/` + `AGENTS.md` both exist | **Session Start** | Read env → status block → "Ready. What would you like to work on?" |
| Either missing | **First-Time Bootstrap** | Read env → status block → offer two paths (DIY or metarepo setup) |

### Mode A — Session Start (already bootstrapped)

The common case. User opens a session in a workspace that already has the toolkit set up.

1. Read `AGENTS.md` (project root) — understand what skills are enabled, what domain this is
2. Read `.quantum-toolbox/skills/manifest.yaml` — get toolkit version
3. Check for `specs/analysis-manifest.json` — is analysis already set up? Is it stale?
4. Check for `docs/update-logs/` — when was the last agent session?

### Phase 2 — Introduce

Greet the user with a concise status block (same in both modes):

```
quantum-toolbox v{version} — ready

Domain:      {from AGENTS.md, or "not configured"}
Analysis:    {timestamp + staleness summary, or "not run yet"}
Last session: {most recent update-log date, or "none found"}
```

### Phase 2b — Session Ready (Mode A only)

```
Ready. What would you like to work on?

  /skills   Explore available skills
  /help     See enabled skills and commands
  Or just tell me what you'd like to do.
```

Stop here. Do not offer metarepo setup — it's already done.

### Phase 3 — Offer two paths (Mode B only)

```
How would you like to work?

A) Explore skills and run them directly
   → I'll walk you through what's available and you can run analysis
      on any repo, file, or spec right here.

B) Set up a metarepo for ongoing AI-native work
   → For teams working across multiple repos over time, a metarepo
      gives you version-controlled analysis outputs, coding profiles,
      update logs, and a persistent AI workspace. I'll walk you through
      the setup step by step.

Type A, B, or describe what you'd like to do.
```

### Phase 4 — Execute chosen path

**Path A — Direct skill use:**
```
→ Trigger Skill Discovery (/skills)
→ User explores and picks a skill
→ Run the skill on the user's chosen target
```

**Path B — Metarepo setup:**
```
→ Follow the metarepo setup workflow in workflows.md
→ Guided step-by-step: git init, submodule, sources/urls.md, analysis, CONTEXT.md
```

---

## Integration

| Command | What it triggers |
|---------|-----------------|
| `/start` | Full bootstrap (Phases 1–3) |
| `/help` | Context-aware help (see Help workflow in core/workflows.md) |
| `/skills` | Skill discovery menu (resumes from Phase 3, Path A after choice) |

Bootstrap is the entry point. `/help` and `/skills` are always available as standalone commands after bootstrap has run.
