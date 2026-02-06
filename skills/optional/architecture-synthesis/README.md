# Architecture Synthesis Skill

Synthesize unified architecture models from visual diagrams, specifications, and code samples.

---

## Purpose

This skill provides a **middle-out** approach to architecture documentation:

| Approach | Input | Skill |
|----------|-------|-------|
| **Bottom-up** | Code → Architecture | `codebase-analysis` |
| **Top-down** | Requirements → Architecture | TOGAF Phase A (`vision`) |
| **Middle-out** | Diagrams + Specs → Architecture | `architecture-synthesis` |

Use this when you have existing architecture diagrams and component descriptions that need to be formalized into a structured architecture model.

---

## When to Use

Invoke this skill when:

- You have architecture diagrams (Excalidraw, Draw.io, Mermaid, etc.) that need formalization
- You have component specifications in markdown or documents
- You want to create a baseline architecture from existing documentation
- You need to feed existing designs into TOGAF analysis
- You're onboarding to a project with diagrams but no formal architecture docs

**Trigger phrases**:
```
"Synthesize architecture from these diagrams..."
"Create architecture model from this documentation..."
"Parse my Excalidraw diagram into architecture..."
"Build baseline architecture from specs..."
"Convert these diagrams to Structurizr..."
```

---

## How This Skill Works

This is an **interactive resource collection** skill. When invoked:

1. **Requirements Checklist** - Agent provides a checklist of what's needed
2. **Resource Collection** - User provides diagrams, specs, and optional code
3. **Parsing & Extraction** - Agent parses visual and textual inputs
4. **Clarification Loop** - Agent asks follow-up questions for ambiguities
5. **Model Synthesis** - Agent builds unified architecture model
6. **Output Generation** - Agent produces Structurizr DSL, Mermaid, or documentation

### Resource Types

| Resource | Required | Purpose |
|----------|----------|---------|
| Visual Architecture | Yes | System/component diagrams |
| Component Specifications | Recommended | Descriptions, responsibilities, interfaces |
| Code Samples | Optional | Validate tech stack, enrich details |
| Business Context | Optional | Goals, stakeholders, constraints |

---

## Supported Input Formats

### Visual Diagrams

| Format | Extension | Tool | Parse Method |
|--------|-----------|------|--------------|
| **Excalidraw** | `.excalidraw` | excalidraw.com, VS Code | JSON parsing |
| **Mermaid** | `.mmd`, `.md` | Text editors | Text parsing |
| **Draw.io** | `.drawio` | diagrams.net | XML parsing |
| **ArchiMate** | `.archimate` | Archi tool | XML parsing |

### Specifications

| Format | Description |
|--------|-------------|
| **Markdown** | Component specs with headers and bullet points |
| **Tables** | Component inventory with columns |
| **Free text** | Natural language descriptions |

### Code (Optional)

| Purpose | Examples |
|---------|----------|
| Tech stack validation | `package.json`, `go.mod`, `requirements.txt` |
| Configuration | `docker-compose.yml`, Kubernetes manifests |
| Key modules | Entry points, service definitions |

---

## Deliverables

| Artifact | Format | Description |
|----------|--------|-------------|
| **Unified Architecture Model** | Internal | Parsed and validated model |
| **Structurizr Workspace** | `.dsl` | C4 model for visualization |
| **Architecture Baseline** | Markdown | Documentation for `core-architecture/baseline/` |
| **TOGAF Phase A Input** | Markdown | Vision document starter if continuing to full TOGAF |

---

## Workflow Summary

```
┌─────────────────────────────────────────────────────────────────┐
│                    Architecture Synthesis                        │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  Phase 1: Requirements    → Provide checklist of needed inputs  │
│              ↓                                                   │
│  Phase 2: Visual Parse    → Extract from Excalidraw/Draw.io/etc │
│              ↓                                                   │
│  Phase 3: Spec Parse      → Extract from markdown descriptions  │
│              ↓                                                   │
│  Phase 4: Code Analysis   → Link code samples to components     │
│              ↓                                                   │
│  Phase 5: Clarification   → Ask questions for gaps/ambiguities  │
│              ↓                                                   │
│  Phase 6: Synthesis       → Build unified architecture model    │
│              ↓                                                   │
│  Phase 7: Output          → Generate DSL, docs, TOGAF input     │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

---

## Integration with Other Skills

| Skill | Integration |
|-------|-------------|
| `codebase-analysis` | Alternative input: use when you have code but no diagrams |
| `structurizr` | Output: generates Structurizr DSL workspace |
| `togaf/vision` | Feeds into: provides baseline for Phase A |
| `togaf/*` | Enables full TOGAF cycle from synthesized baseline |
| Core `architecture-thinking` | Automatically applies domain/stakeholder concepts |

### Typical Flows

```
[Have diagrams?] → architecture-synthesis → core-architecture/baseline
                                         → structurizr workspace
                                         → TOGAF Phase A (optional)

[Have code only?] → codebase-analysis → architecture-synthesis (enrich)
                                      → core-architecture/baseline

[Starting fresh?] → TOGAF Phase A → vision first
```

---

## Parsing Approach

The skill uses **structural parsing** for each format:

### Excalidraw
- Parse JSON elements array
- Extract rectangles/shapes as components
- Extract arrows/lines as relationships
- Extract text labels for names
- Use grouping for boundaries/containers

### Mermaid
- Parse flowchart/C4 diagram syntax
- Extract nodes as components
- Extract edges as relationships
- Parse subgraphs as boundaries

### Draw.io
- Parse XML mxCell elements
- Extract shapes with labels
- Extract connectors between shapes
- Use swimlanes/containers for boundaries

### ArchiMate
- Parse XML element definitions
- Map to ArchiMate layer (Business/Application/Technology)
- Extract relationships with types
- Preserve viewpoint structure

See [parsers.md](parsers.md) for detailed parsing logic.

---

## Prerequisites

Before starting:

- [ ] At least one visual diagram available
- [ ] Access to source files (not just images/screenshots)
- [ ] Basic understanding of what the system does
- [ ] (Optional) Component descriptions or specs
- [ ] (Optional) Code repository access

---

## Quick Start

**Provide diagrams and specs:**
```
I have an architecture diagram in Excalidraw and some component
descriptions. Let's synthesize this into a formal architecture model.

[Attach .excalidraw file or paste JSON]
[Provide component descriptions]
```

**Or request the checklist:**
```
I want to create an architecture model from my existing documentation.
What do you need from me?
```

---

## References

- [Workflows](workflows.md) - Detailed 7-phase workflow
- [Templates](templates.md) - Input templates and conventions
- [Parsers](parsers.md) - Format parsing logic
- [Examples](examples.md) - End-to-end synthesis examples
- [Checklist](checklist.md) - Quick reference
- [Structurizr Skill](../structurizr/README.md) - C4 modeling output
- [TOGAF Vision](../togaf/vision/README.md) - Continue to full TOGAF
