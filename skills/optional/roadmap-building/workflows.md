# Roadmap Building Workflows

> **Audience:** AI Agents

Step-by-step procedures for generating implementation roadmaps.

---

## Main Workflow

```
PARSE invocation for:
  - Input source: Option A (arch outputs) | Option B (TOGAF) | Option C (standalone)
  - Scope: full | phase-only | epics-only | tracker-only
  - Output options: with-pdf | with-adrs | epics-and-tickets (default: all)
```

---

## Phase 1: Input Analysis (5–10 min)

```
1. DETECT input source:

   IF core-architecture/gap-analysis/consolidated-gaps.md exists:
     → Option A: read gap analysis + target architecture files
     → Also read architecture-synthesis/ if present

   ELIF togaf/phase-e/opportunities-solutions.md exists:
     → Option B: read Phase E outputs + any Phase F drafts

   ELSE:
     → Option C: prompt user:
       "I don't see existing architecture outputs. Please describe:
        1. Current state (what exists today)
        2. Target state (what you're building toward)
        3. Key constraints (budget, timeline, team, technology)"

2. EXTRACT from inputs:
   - Identified gaps and opportunities
   - Technical requirements (functional + non-functional)
   - Existing technology decisions
   - Stated constraints

3. VALIDATE:
   - Are gaps concrete enough to scope initiatives?
   - Are there non-functional requirements (performance, security, availability)?
   - Are there explicit technology constraints?
   - IF any critical info missing: ASK user before proceeding

4. SUMMARISE findings to user (1 paragraph) before continuing
```

---

## Phase 2: Initiative Identification (10–15 min)

```
1. GROUP gaps into logical initiatives:
   - Each initiative = coherent unit of delivery (one team, one outcome)
   - Avoid: initiatives that span too many concerns (split them)
   - Avoid: initiatives so small they're just tasks (merge them)

2. FOR EACH initiative:
   a. Define: name, objective (1 sentence), success criteria
   b. Identify: primary team/domain
   c. Rough complexity: Low | Medium | High | Very High
   d. Rough duration: weeks

3. IDENTIFY dependencies between initiatives:
   - Which must complete before another can start?
   - Which can run in parallel?

4. PRESENT initiative list to user for confirmation:
   "I've identified N initiatives. Here's the breakdown:
    [table: ID | Name | Team | Complexity | Rough Duration | Depends On]

    Does this look right? Any initiatives to add, split, or merge?"

5. WAIT for user confirmation or adjustments before Phase 3
```

---

## Phase 3: Technical Planning (15–25 min)

```
FOR EACH initiative:

1. DEFINE technical approach:
   - Implementation strategy (e.g. Strangler Fig, Big Bang, Parallel Run)
   - Key technology choices
   - Design patterns to apply (reference software-design skill if enabled)
   - Integration approach with existing systems

2. CREATE Architecture Decision Record for each significant decision:
   - Technology selection (framework, database, messaging)
   - Architectural pattern (microservices, event-driven, etc.)
   - Data migration strategy
   - Deployment approach

   FORMAT: See ADR template in templates.md
   SAVE TO: roadmaps/decisions/adr-NNN-<topic>.md

3. DOCUMENT integration strategies:
   - API contracts between services
   - Event schemas if event-driven
   - Data synchronization approach during migration
```

---

## Phase 4: Sequencing & Dependencies (10–15 min)

```
1. BUILD dependency graph:
   - List all initiative → initiative dependencies
   - Identify transitive dependencies
   - Generate Mermaid diagram

2. FIND critical path:
   - Longest dependency chain (determines minimum project duration)
   - Identify bottlenecks (initiatives many others depend on)

3. DEFINE phase boundaries:
   - Group independent/parallel initiatives into phases
   - Phase boundary = coherent milestone (not just time box)
   - Each phase must have success + exit criteria

4. OPTIMISE:
   - Can any initiatives be parallelised to shorten critical path?
   - Are any phases overloaded? Rebalance if needed.
   - Is business value delivered incrementally? Earlier is better.

5. WRITE:
   - roadmaps/dependencies/dependency-graph.mmd
   - roadmaps/dependencies/critical-path.md
   - roadmaps/phases/phase-N-<name>.md for each phase
```

---

## Phase 5: Risk Assessment (10–15 min)

```
FOR EACH initiative:

1. IDENTIFY risks:
   - Technical: new technology, integration complexity, data migration
   - Organisational: team skill gaps, dependencies on other teams
   - External: third-party APIs, vendor timelines, regulatory

2. FOR EACH risk:
   - Assign: Impact (High/Medium/Low) × Probability (High/Medium/Low)
   - Define: mitigation (what to do now)
   - Define: contingency (fallback if mitigation fails)
   - Assign: owner role

3. FLAG high-impact × high-probability risks to user explicitly

4. WRITE:
   - roadmaps/risks/risk-register.md
   - Cross-reference risks in relevant initiative files
```

---

## Phase 6: Epic & Ticket Breakdown (20–30 min)

```
FOR EACH initiative:

1. DECOMPOSE into epics:
   - 1 initiative = 1–4 epics (more → split the initiative)
   - Each epic: 1 owning team, completable in 1–6 weeks
   - Name epics after their deliverable, not their activity
     Good: "API Gateway operational in production"
     Bad:  "Set up API Gateway"

2. FOR EACH epic:
   a. Write: objective, acceptance criteria (checkboxes)
   b. Assign: owning team, complexity (High/Medium/Low), estimated duration
   c. Calculate: story point total from tickets

3. FOR EACH epic, DECOMPOSE into tickets:
   - Each ticket: 1 person, completable in 1 day–2 weeks
   - If XL: split into smaller tickets
   - Assign size: XS | S | M | L | XL (see README for scale)
   - Assign: team, owner role, estimate in days
   - Write: description (what and why), acceptance criteria, technical notes
   - Note: dependencies on other tickets
   - Note: cross-team DRI if multiple teams involved

4. GENERATE roadmap-tracker.md:
   - One row per initiative
   - Columns: Initiative | Phase | Status | Team | Priority
   - All start as ⚪ Planned
   - Include summary metrics at bottom

5. WRITE:
   - roadmaps/epics/epic-NNN-<name>.md for each epic
   - roadmaps/roadmap-tracker.md
```

---

## Phase 7: Documentation (15–20 min)

```
1. WRITE master-roadmap.md (executive overview):
   - Strategic context (1 page)
   - Phase summary table
   - Key decisions (ADR list)
   - Top risks
   - Total effort and timeline summary

2. WRITE detailed-roadmap.md:
   - Full initiative list with all detail
   - Dependency graph (embed or link)
   - Full risk register summary

3. WRITE roadmap-metadata.json:
   {
     "generated": "YYYY-MM-DD",
     "source": "option-a | option-b | option-c",
     "phases": N,
     "initiatives": N,
     "total_story_points": N,
     "estimated_duration_weeks": N,
     "teams": ["Platform", "Backend", ...],
     "adrs": N,
     "risks": { "high": N, "medium": N, "low": N }
   }

4. OFFER next steps:
   "Roadmap complete. Would you like to:
    - Expand specific initiatives in detail? → roadmap-analysis skill
    - Run complexity analysis? → roadmap-analysis skill
    - Plan team composition and estimates? → roadmap-analysis skill
    - Export to PDF? → roadmap-analysis skill
    - Export to TOGAF Phase F format?"
```

---

## TOGAF Phase Integration Workflows

### Phase E → Preliminary Roadmap

```
User: invokes TOGAF Phase E (Opportunities & Solutions)

After Phase E completes:
  Agent OFFERS: "Build preliminary roadmap from Phase E outputs?"

  IF yes:
    1. Read: togaf/phase-e/opportunities-solutions.md
    2. Extract: solution building blocks, gap list
    3. Run Phases 1–4 of this workflow (skip detailed technical planning)
    4. Output: high-level master-roadmap.md, no epics yet
    5. Save: togaf/phase-e/roadmap-summary.md (pointer to roadmaps/)
```

### Phase F → Full Roadmap

```
User: invokes TOGAF Phase F (Migration Planning)

Agent:
  1. Read Phase E outputs + gap analysis
  2. Run full roadmap-building workflow (all 7 phases)
  3. Generate Phase F deliverables:
     ├── togaf/phase-f/implementation-plan.md  ← TOGAF standard deliverable
     └── roadmaps/                             ← detailed roadmap (linked)
  4. OFFER: "Export to PDF? Run complexity analysis? Expand specific initiatives?"
```

### Phase G → Progress Tracking

```
User: "Update roadmap status" or Phase G governance review

Agent:
  1. Read: roadmaps/roadmap-tracker.md
  2. Ask user for current status of each initiative
  3. Update tracker statuses
  4. Identify: any new blockers or risks?
  5. Update: roadmaps/risks/risk-register.md if needed
  6. OFFER: "Run roadmap-analysis for detailed progress report?"
```
