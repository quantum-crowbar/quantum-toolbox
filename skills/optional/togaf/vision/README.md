# Architecture Vision Skill (TOGAF Phase A)

Defines the scope, stakeholders, and high-level vision for an architecture initiative.

---

## Purpose

Phase A establishes:
- **Scope**: What's in and out of the initiative
- **Stakeholders**: Who's affected and what they care about
- **Vision**: High-level target state and business value
- **Approval**: Authorization to proceed with architecture work

This is typically the **first phase** when starting new architecture work.

---

## When to Use

Invoke this skill when:

- Starting a new system or capability initiative
- Beginning a modernization or transformation project
- Needing stakeholder alignment before detailed work
- Requiring formal approval to proceed with architecture

**Trigger phrases**:
```
"Create an Architecture Vision for..."
"Start TOGAF Phase A for..."
"Define scope and stakeholders for..."
"We need architecture approval for..."
```

---

## How This Skill Works

This is a **template-first** skill. When invoked:

### Option 1: Self-Service
1. Templates are provided to you
2. You fill them in independently
3. Return completed templates for review/refinement

### Option 2: Guided Interview
1. Templates are provided as reference
2. We walk through each section together via prompts
3. I help structure and document your answers

Both approaches produce the same deliverables.

---

## Deliverables

| Artifact | Purpose |
|----------|---------|
| **Architecture Vision Document** | Core deliverable defining scope, goals, and vision |
| **Stakeholder Map** | Identifies stakeholders and their concerns |
| **Statement of Architecture Work** | Formal request/approval document |

---

## Prerequisites

Before starting Phase A:

- [ ] Business driver or initiative exists (why are we doing this?)
- [ ] Executive sponsor identified (who's accountable?)
- [ ] Initial scope ideas (rough boundaries)

If these aren't clear, we can explore them during the guided interview.

---

## Integration with Other Skills

| Skill | Integration |
|-------|-------------|
| `arch-analysis` | Use first to understand baseline if system exists |
| Core `architecture-thinking` | Automatically applies (domains, stakeholders, principles) |
| Phase B-D skills | Follow after vision approval |

### Typical Flow

```
[Existing System?] → arch-analysis → vision → Phase B/C/D
[New System?] → vision → Phase B/C/D
```

---

## Outputs Feed Into

- **Phase B** (Business Architecture): Business capabilities, processes
- **Phase C** (Information Systems): Data and application design
- **Phase D** (Technology): Infrastructure and platforms
- **Phase E/F** (Planning): Roadmap and migration

---

## Quick Start

**For self-service**:
1. See [templates.md](templates.md) for all templates
2. Fill in the Architecture Vision Document template
3. Complete the Stakeholder Map
4. Return for review

**For guided interview**:
1. Say "Let's walk through the Architecture Vision"
2. Answer the prompts as we go
3. Review the completed documents together

---

## References

- [TOGAF Overview](../_index.md) - ADM cycle context
- [Architecture Thinking](../../../../core/architecture-thinking.md) - Core concepts
- [Templates](templates.md) - All Phase A templates
- [Examples](examples.md) - Sample completed documents
- [Checklist](checklist.md) - Quick reference
