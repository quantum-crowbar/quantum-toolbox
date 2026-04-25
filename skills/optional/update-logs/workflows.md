# Update Logs Workflows

> **Audience:** AI Agents

---

## Entry Point

When user says `"Create update log"`, `"Write update log"`, or any skill that requires an update log as output (arch-analysis, security-analysis, Confluence/Jira fetch):

```
1. Determine the trigger (what work was done)
2. Collect: date, author, changed files, findings, sources
3. Determine slug and filename
4. Write the log using the template
5. Commit the log as part of the same commit as the work it documents
```

---

## Phase 1: Collect Metadata

### 1.1 — Determine Source

What triggered this log?

| Trigger | Source field value |
|---|---|
| arch-analysis / security-analysis run | `quantum-toolbox \`arch-analysis\` + \`security-analysis\` incremental update` |
| Atlassian REST API fetch | `Atlassian REST API (Jira + Confluence) — first fetch` or `incremental fetch` |
| Manual code investigation | `Manual source code review — [repo list]` |
| Combined (code + Jira) | Describe both |

### 1.2 — List Changed Files

For each file changed by the agent this session:
- Absolute path is NOT needed — repo-relative path only
- State the nature of the change concisely (1 line per file)
- Do NOT list unchanged files

### 1.3 — Extract Key Findings

The 3–10 most important things discovered or confirmed this session:
- Architecture discoveries (new component roles, data flows, dependencies)
- Security findings (new SEC-NNN entries)
- Data quality issues (wrong data, missing identifiers, silent failures)
- Risks identified (migration risks, deprecated deps, stale API versions)
- Confirmations of prior hypotheses from Jira/Confluence evidence

### 1.4 — Record Sources

For each source read this session:

| Source type | Record |
|---|---|
| Source repo (cloned) | Repo name + branch + commit SHA (or `HEAD shallow clone`) + key files read |
| Confluence page | Page title + page ID + version + last-updated date |
| Jira ticket | Ticket ID + summary + status + assignee |
| API spec | Spec URL + version + date accessed |
| Existing local doc | File path (no extra detail needed) |

### 1.5 — Identify Open Items

Anything deferred, blocked, or out of scope for this session:
- Tickets that need new Jira issues
- Investigation results that need follow-up (e.g. PROJ-135 not yet started)
- Data gaps (e.g. SharePoint content not accessible via Confluence API)
- Code not yet cloned

---

## Phase 2: Write the Log

Load [templates.md](templates.md) and fill the appropriate template.

### 2.1 — Choose Template Variant

| Work type | Template |
|---|---|
| Source code analysis (arch/security) | `code-analysis` template |
| External data fetch (Jira/Confluence) | `atlassian-fetch` template |
| Combined (code + Jira/Confluence) | `combined` template |
| Simple multi-file update | `simple` template |

### 2.2 — Fill in All Required Sections

Required sections are non-negotiable. Conditional sections are only included when relevant:
- **New Security Findings**: only if new SEC-NNN findings were created this session
- **New Architecture Findings**: only if new structural insights were discovered
- **Open Items**: only if there are unresolved tasks or deferred items
- **Repos Examined**: always for code analysis; omit for pure doc updates

### 2.3 — File Naming

```
docs/update-logs/YYYY-MM-DD-<topic>-<scope>.md
```

Use today's date. If a log for today already exists with the same scope, append `-2` or use a more specific topic slug.

---

## Phase 3: Integrate into Commit

The update log MUST be committed in the same commit as the work it documents.

### 3.1 — Commit Message Convention

```
<type>(<scope>): <short summary>

<body referencing key changes>

See docs/update-logs/YYYY-MM-DD-<slug>.md
```

**Example:**
```
docs: incremental analysis — payments-api + orders-svc (Q1 Performance)

- Add payments-api to technology manifest, interface spec, arch diagrams
- Add security findings SEC-001–004
- Root cause of PROJ-1234 identified and documented

See docs/update-logs/2026-04-13-payments-api-orders-svc-q1-perf.md
```

### 3.2 — Reference from Index Docs

If `docs/architecture-docs/index.md` or `docs/security-docs/index.md` exist, update their "last updated" date / scope note to reference this session.

---

## Phase 4: Session Start — Read Prior Logs

At the start of any incremental analysis session:

```
1. ls docs/update-logs/
2. Read the most recent 1–3 logs relevant to the current topic
3. Extract: what was the last method, what sources, what was left open
4. Plan: what is this session adding on top of prior work
```

This prevents duplicate work and ensures the agent picks up exactly where the prior session left off.

---

## Re-Run Behaviour

When user says `"Update the analysis"` or `"Fetch latest Jira/Confluence"`:
- Check existing logs for the topic to understand prior scope
- Create a NEW log (do not edit prior logs — they are immutable history)
- In the new log, reference what was updated since the prior log
- Explicitly note which prior findings were confirmed, updated, or superseded
