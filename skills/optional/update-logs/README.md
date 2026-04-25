# Update Logs Skill

> **Audience:** AI Agents

Produce structured, human-readable update logs whenever an agent makes incremental changes to a repository — analysis docs, Confluence-fetched content, architecture updates, or any multi-file work product. Update logs are the agent's audit trail: they record *what* changed, *why*, *what was read*, and *what is still open*, so the next agent (or human) can continue from a known state.

---

## Purpose

When an agent makes incremental changes across multiple files, it is easy to lose track of:
- Which sources were used (URLs, API fetches, repo HEADs)
- What was changed vs. what was intentionally left unchanged
- What open questions or follow-up tasks remain
- Why specific decisions were made

An update log closes this gap. It acts as:
- **Audit trail** for agentic changes
- **Handoff document** between agent sessions
- **Progress marker** for incremental work (especially multi-session analysis)
- **Blame surface**: if a doc is wrong, the update log shows what source it came from

---

## When to Use

Create an update log when an agent:
- Runs or increments an `arch-analysis`, `security-analysis`, or `coding-profile`
- Fetches external data (Confluence pages, Jira tickets, API specs) and updates docs
- Makes multi-file changes that span architecture, security, or project docs
- Completes a named work item (ML initiative, spike, investigation)

Skip the update log for:
- Single-file typo fixes or cosmetic edits
- Pure config changes with no analysis content
- Work that is fully covered by a PR description with the same detail

---

## Output Location

```
docs/update-logs/YYYY-MM-DD-<slug>.md
```

- One file per session or per named work unit
- Multiple logs on the same date are allowed (add a distinguishing slug)
- Slug should identify the topic, not the method: `payments-api-q1-initiative`, not `arch-analysis-run-3`

---

## Log File Format

See [templates.md](templates.md) for the canonical template.

The log always contains:

| Section | Required | Purpose |
|---|---|---|
| Header (date, author, topic, trigger, method) | Yes | Context for any reader |
| Files Changed table | Yes | Exact diff summary |
| Key Findings | Yes | Most important insights from this session |
| Sources / Repos Examined | Yes | What was read, at what commit/version |
| Open Items | Conditional | If any tasks were deferred or incomplete |
| New Findings (security, architecture) | Conditional | If new issues were identified |

---

## Naming Convention

```
YYYY-MM-DD-<topic>-<scope>.md
```

| Part | Guidance |
|---|---|
| Date | ISO 8601 (`2026-04-13`) |
| Topic | Short slug for the subject (`events-gw`, `atlassian-jira-confluence`, `store-finder-gw`) |
| Scope | Initiative or initiative code (`q1-perf`, `q2-security`, `security`) |

**Examples:**
```
2026-04-13-payments-api-orders-svc-q1-perf.md
2026-04-14-auth-service-user-profile-q1-perf.md
2026-04-14-atlassian-jira-confluence-q1-perf.md
```

---

## Integration with Other Skills

| Skill | Update Log Role |
|---|---|
| `arch-analysis` | Agent creates an update log on every incremental run |
| `security-analysis` | Agent appends new findings to the log; lists new finding IDs |
| `coding-profile` | Agent logs which repos were profiled and at which commit |
| `analysis-tracking` | The manifest tracks *what* was analyzed; the update log records *what changed* in detail |
| `roadmap-analysis` | Agent logs Confluence/Jira fetches and doc changes |

---

## Agent Behaviour

When this skill is active, agents MUST:

1. **Create a log** at the end of any session that modifies analysis docs or fetches external data
2. **Not skip the log** even if the changes seem minor — the log is the record of intent
3. **Reference the log** in commit messages: `"see docs/update-logs/YYYY-MM-DD-*.md"`
4. **Check existing logs** at session start to understand prior agent context before making changes
5. **Link to logs** from `docs/architecture-docs/index.md` or `docs/security-docs/index.md` when those files are updated

---

## Checking Prior Context

Before starting any incremental analysis, the agent SHOULD:

```
1. List files in docs/update-logs/
2. Read the most recent log (or last 2-3 if relevant)
3. Note: what was the last method used, what sources, what was open
4. Avoid re-doing work that is already logged as complete
```
