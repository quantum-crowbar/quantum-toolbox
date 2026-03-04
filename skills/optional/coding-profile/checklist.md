# Coding Profile Checklist

> **Audience:** AI Agents
> Quick reference for profile quality before finalising output.

---

## Before Starting

- [ ] Scope confirmed with user (directory path / "this" / specific repo names)
- [ ] Repos discovered and confirmed by user before reading any code
- [ ] Stack assignments confirmed (especially for polyglot repos)

---

## Code Reading Quality

- [ ] At least 5 source files read per repo (not counting config or generated files)
- [ ] At least 2 test files read per repo
- [ ] Entry point file(s) read (`main.*`, `index.*`, `app.*`, `server.*`)
- [ ] Files sampled across module types (controller, service, model, etc.)
- [ ] Only source code read — not README, docs, or generated files

---

## Per-Section Checklist

### Naming Conventions
- [ ] Variables, functions, classes, files, dirs, constants all covered
- [ ] Export pattern documented (named / default / barrel)
- [ ] Exceptions noted (e.g. "test helpers use snake_case")

### Code Patterns
- [ ] Async style identified from actual usage (not just config)
- [ ] Functional vs class-based stance documented
- [ ] DI pattern documented or "none" stated explicitly
- [ ] Common utilities listed (only ones actually used in sampled files)

### Testing Approach
- [ ] Framework identified from config AND from import statements
- [ ] Test file location pattern documented (co-located / separate)
- [ ] At least one concrete mocking example included
- [ ] At least one concrete test structure example included

### Error Handling
- [ ] Primary pattern identified (try/catch / Result / error-first)
- [ ] Custom error classes documented (or "none" stated)
- [ ] Logging on error — library and format documented

### API Design
- [ ] Section skipped if repo is not an API service (skipping is correct)
- [ ] Validation library identified from imports (not just package.json)
- [ ] Error response format shown from actual code (not assumed)

### State & Data Flow
- [ ] DB access pattern identified (ORM / raw SQL / none)
- [ ] Data transformation pattern shown with example

### Observability
- [ ] Logging library identified from imports
- [ ] Actual log call pattern shown as example
- [ ] "none" or "unknown" stated explicitly for metrics/tracing if not found

### Review Standards
- [ ] At least 3 items listed
- [ ] Each item is derived from observed code consistency, not generic advice
- [ ] Items are phrased as checkboxes (what reviewers would check)

---

## Evidence Quality

- [ ] Every standard pattern is supported by ≥3 files from the codebase
- [ ] Patterns seen in fewer than 3 files are noted as exceptions, not standards
- [ ] No invented conventions — only what was observed

---

## Multi-Repo Merging

- [ ] Patterns appear in ≥50% of repos to qualify as "standard"
- [ ] All divergences documented in the Divergences table
- [ ] Addendum file created only when ≥3 divergences exist in a single repo
- [ ] Index file lists all stacks and divergences summary

---

## Output Quality

- [ ] Each stack profile is under 800 tokens
- [ ] Code examples are actual patterns, not pseudocode
- [ ] Language tag on all code blocks
- [ ] Index file accurately reflects all generated profiles
- [ ] Summary reported to user after generation

---

## Before Marking Complete

- [ ] User informed of all profiles generated
- [ ] Key findings (divergences, notable patterns) summarised
- [ ] Next steps offered (load profile / add to AGENTS.md / refresh)
