# Update Logs Templates

> **Audience:** AI Agents

---

## Template: Code Analysis (arch-analysis / security-analysis incremental)

```markdown
# Update: <topic> — <initiative or project name>

**Date**: YYYY-MM-DD  
**Changed by**: <name or "AI Agent">  
**Topic**: `<repo1>` + `<repo2>` — <initiative>  
**Trigger**: <what caused this session — new URLs, new spec, user request>  
**Method**: quantum-toolbox `arch-analysis` + `security-analysis` incremental update

---

## Files Changed

| File | Change |
|------|--------|
| `path/to/file.md` | <one-line description of change> |

---

## Key Findings — Architecture

- <finding 1>
- <finding 2>
- <finding 3>

## New Security Findings

| ID | Severity | Finding | Code Location |
|----|----------|---------|---------------|
| SEC-NNN | High/Medium/Low | <description> | `path/to/file.ts:methodName()` |

---

## Repos Examined at HEAD

| Repo | Commit / Version | Key files read |
|------|------------------|--------------------|
| `repo-name` | HEAD (shallow clone) v1.0.0 | `src/file1.ts`, `src/file2.ts` |

---

## Open Items

| Item | Status |
|---|---|
| <deferred task> | <why deferred> |
```

---

## Template: Atlassian Fetch (Jira + Confluence)

```markdown
# Update: <date> — Atlassian Jira/Confluence Fetch for <initiative>

**Date**: YYYY-MM-DD  
**Branch**: <branch-name>  
**Trigger**: <what triggered the fetch — first ever, incremental, user request>  
**Changed by**: <name or "AI Agent">

---

## What Was Fetched

### Jira Tickets (<N> total via `https://<jira-host>/rest/api/2/issue/`)

| Ticket | Summary | Status |
|---|---|---|
| TICKET-NNN | <summary> | <status> |

### Confluence Pages (<N> total via `https://<confluence-host>/rest/api/content/`)

| Page ID | Title | Version | Last Updated |
|---|---|---|---|
| XXXXXXXXX | <title> | vN | YYYY-MM-DD |

---

## Key Findings

- <finding 1 — e.g. team roster confirmed>
- <finding 2 — e.g. ID chain verified per platform>
- <finding 3 — e.g. migration risk confirmed>

---

## Files Created

| File | Content |
|---|---|
| `docs/external/<filename>.md` | <one-line description> |

---

## Files Updated

| File | Changes |
|---|---|
| `path/to/file.md` | <one-line description of changes> |

---

## What Is Still Open

| Item | Ticket | Status |
|---|---|---|
| <deferred item> | <ticket if any> | <status> |

---

## Analysis Staleness Notes

<Note anything that could not be fetched or was inaccessible, e.g. SharePoint content>
```

---

## Template: Combined (Code + Atlassian)

Use the Code Analysis template as the base, and add a **Atlassian Sources** section:

```markdown
## Atlassian Sources

### Jira Tickets Fetched (<N>)
| Ticket | Summary | Status | Key finding |
|---|---|---|---|
| TICKET-NNN | <summary> | <status> | <one-line note if relevant> |

### Confluence Pages Fetched (<N>)
| Page ID | Title | Version | Key finding |
|---|---|---|---|
| XXXXXXXXX | <title> | vN | <one-line note if relevant> |
```

---

## Template: Simple (multi-file doc update, no analysis)

```markdown
# Update: <date> — <short description>

**Date**: YYYY-MM-DD  
**Changed by**: <name or "AI Agent">  
**Topic**: <topic>  
**Trigger**: <trigger>

---

## Files Changed

| File | Change |
|------|--------|
| `path/to/file.md` | <one-line description> |

---

## Notes

<Any relevant context that is not obvious from the file changes alone>
```

---

## Section Reference

### Header Fields

| Field | Guidance |
|---|---|
| `Date` | ISO 8601 date (`YYYY-MM-DD`) |
| `Changed by` | Full name, or "AI Agent (GitHub Copilot)" if autonomous |
| `Topic` | Repo names or initiative keywords — what this session was about |
| `Trigger` | One sentence: what made this session happen |
| `Method` | Skill(s) used, or "manual investigation", or "Atlassian REST API" |
| `Branch` | Git branch — include for Atlassian-fetch logs; optional for code analysis |

### Files Changed Table

- One row per file
- Use repo-relative paths (not absolute)
- Keep description to one line — don't re-explain the full diff
- If > 15 files changed, group by category (e.g. "All architecture-docs analysis files")

### Key Findings

- Bullet list, 3–10 items
- Each finding is a standalone fact — not vague ("updated X") but specific ("Root cause of PROJ-134 is `chargeId = externalId ?? internalId ?? ""` in `PaymentMapper.ts:toExternalCharge()`")
- Include code locations where relevant (`file.ts:methodName()`)
- If a prior hypothesis was confirmed or disproved, say so explicitly

### Repos Examined

- Always include for code-analysis sessions
- Include commit SHA if available (even partial), or `HEAD (shallow clone)`
- List the specific files that were read — avoids the temptation to re-read the same files in the next session

### Open Items

- Be specific: "PROJ-135 Android investigation not started" not "some stuff left to do"
- Link Jira ticket IDs where applicable
- This section is the handoff contract to the next session
