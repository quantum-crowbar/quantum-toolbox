# Roadmap Analysis Workflows

> **Audience:** AI Agents

Step-by-step procedures for each of the 7 analysis modes.

---

## Entry Point: Mode Selection

```
1. READ roadmaps/master-roadmap.md (if exists) for context
   IF not found: ask user to provide or describe the roadmap

2. PRESENT mode menu:
   "What would you like to do with the roadmap?

    1. Expand — Detailed step-by-step plan for an initiative
    2. Research — Identify research questions and create research briefs
    3. Complexity — Score and assess overall roadmap complexity
    4. Spikes — Identify unknowns that need proof-of-concept experiments
    5. Estimation — Detailed effort breakdown by initiative
    6. PDF Export — Package for stakeholder delivery
    7. Team Planning — Team composition, roles, cost estimates

    Or describe what you need."

3. PARSE selection and ROUTE to appropriate mode workflow
```

---

## Mode 1: Expand

**Trigger:** `"Expand initiative [N]"` / `"Detail [initiative name]"`

```
1. IF expanding specific initiative:
   READ: roadmaps/initiatives/initiative-NNN-<name>.md

   IF expanding all:
   ASK: "Expanding all initiatives will be thorough but lengthy.
         Confirm? (yes / list the ones you want)"

2. FOR EACH initiative to expand:

   a. READ the initiative file thoroughly
   b. READ related ADRs from roadmaps/decisions/
   c. READ relevant skills if enabled:
      - software-design skill → patterns to apply
      - tech-stack-decisions skill → technology evaluation

   d. PRODUCE detailed implementation plan:
      - Prerequisites (what must be true before starting)
      - Detailed steps grouped by week or sprint
        - Each step includes: action, tooling/commands, verification
      - Integration checkpoints (where to validate with other teams)
      - Testing approach per step
      - Rollback triggers and procedures

   e. FLAG for research/spike if any step has high uncertainty:
      "⚠️ Step 3 assumes Kong can handle 50K req/s. Recommend Spike 001
       before committing to this approach."

3. WRITE: roadmaps/analysis/plans/plan-NNN-<name>.md
4. UPDATE: roadmaps/analysis/expanded-roadmap.md (append section)
5. OFFER: "Would you like me to identify research needs or spikes for this initiative?"
```

---

## Mode 2: Research

**Trigger:** `"Identify research needs"` / `"Create research plan for [initiative]"`

```
1. READ all initiative files (or specified initiative)
2. IDENTIFY research questions:
   - Technology unknowns (performance, compatibility, licensing)
   - Approach unknowns (is this pattern appropriate here?)
   - Integration unknowns (how will X connect to Y?)
   - Scale unknowns (will this work at our volume?)

3. FOR EACH research question:

   a. Assess: Can this be answered by reasoning alone?
      IF yes: answer it inline, no research doc needed
      IF no: create research brief

   b. CREATE research brief:
      - Research question (precise and answerable)
      - Scope (what is in/out)
      - Methodology (how to find the answer)
      - Resources required (who, what tools, what environment)
      - Timeline (days)
      - Decision impact (what changes depending on the answer)
      - Success criteria (what does "answered" look like)
      - Related initiative and tickets

4. WRITE: roadmaps/analysis/research/research-NNN-<topic>.md
5. OFFER: "Some of these research questions may need spikes. Run Mode 4?"
```

---

## Mode 3: Complexity Assessment

**Trigger:** `"Analyze roadmap complexity"` / `"Complexity report"`

```
1. READ all initiative files and roadmap-tracker.md

2. FOR EACH initiative, score:

   Technical Complexity (1–10):
   - Novel technology? (+2 if team hasn't used it before)
   - Integration points? (+1 per 3 systems)
   - Data migration? (+2 if zero-downtime required)
   - Distributed system concerns? (+1)
   - Performance requirements? (+1 if near the edge of what's known)

   Organisational Complexity (1–10):
   - Team skill gaps? (+2 if significant training required)
   - Cross-team coordination? (+1 per additional team)
   - Stakeholder impact? (+1 per 50 affected users)
   - Dependency on external teams? (+2)

   Risk Score (1–10):
   - Sum of (impact × probability) for all risks in this initiative
   - Normalise to 1–10

   Confidence (10–90%):
   - Start at 80%
   - −10% per high-uncertainty assumption
   - −5% per XL ticket
   - −5% per external dependency

3. IDENTIFY:
   - Critical path (longest dependency chain)
   - Bottlenecks (initiatives blocking ≥3 others)
   - Lowest-confidence initiatives (these need spikes)

4. WRITE:
   roadmaps/analysis/complexity-analysis.md
   roadmaps/analysis/metrics/complexity-metrics.json

5. OFFER: "The lowest-confidence initiatives are [N.N, N.N]. Run spike identification?"
```

---

## Mode 4: Spike Identification

**Trigger:** `"Identify spikes"` / `"What needs a proof of concept?"`

```
1. READ complexity analysis if it exists, else read all initiative files
2. IDENTIFY spike candidates:
   - Assumptions about technology performance at scale
   - Untested integration approaches
   - Novel patterns the team hasn't applied before
   - Any ticket sized XL that could be de-risked with a spike

3. FOR EACH spike:

   a. Define the specific assumption being tested
   b. Set time box (max 1 week for most spikes)
   c. Define Go/No-Go success criteria (binary: does it work or not?)
   d. List tasks (short: 3–7 tasks)
   e. State the output: decision + evidence doc
   f. State the decision impact: what changes if No-Go?
   g. Assign team and resources

4. WRITE: roadmaps/analysis/spikes/spike-NNN-<topic>.md
5. ADD spike tickets to relevant epics in roadmaps/epics/ if they exist
6. OFFER: "Should I add these spikes to the roadmap tracker and initiative files?"
```

---

## Mode 5: Estimation

**Trigger:** `"Estimate effort"` / `"Break down effort for [initiative]"`

```
1. READ all initiative files and epics

2. FOR EACH initiative:

   a. BREAK DOWN effort by activity:
      - Design & planning
      - Implementation (by sub-component)
      - Testing (unit, integration, E2E, performance)
      - Documentation & runbooks
      - Review & iteration

   b. FOR EACH activity: assign hours, role, assumptions

   c. CALCULATE:
      Base estimate = sum of activity hours
      Risk buffer = 15–25% depending on initiative complexity
      Total = base + buffer

   d. ASSESS confidence:
      80%+ = well-understood, team has done similar work
      60–80% = some unknowns, recommend 20% buffer
      40–60% = significant unknowns, recommend spike before committing
      <40% = do not estimate until spikes complete

3. ROLL UP to roadmap total:
   Total effort = sum of all initiative totals
   Duration = critical path (not total effort)
   FTEs required = total effort / duration / weeks

4. WRITE: roadmaps/analysis/metrics/effort-estimation.md
```

---

## Mode 6: PDF Export

**Trigger:** `"Export roadmap to PDF"` / `"Create executive package"`

```
1. ASK: "Which package?
         A) Executive (10–15 pages, high-level)
         B) Technical (full detail, 50–100 pages)
         C) Initiative-specific (select one or more)"

2. COLLECT documents based on selection:

   Executive package:
   - master-roadmap.md
   - complexity-analysis.md (summary section only)
   - risk-register.md (high-priority risks only)

   Technical package:
   - All of executive package
   - detailed-roadmap.md
   - All initiative files
   - All ADRs
   - Dependency graphs (as images)
   - Full risk register
   - Research briefs (if exist)

   Initiative-specific:
   - initiative-NNN.md
   - Related epics
   - Related ADRs
   - Related risks

3. PREPARE documents:
   a. Export Mermaid diagrams:
      mmdc -i roadmaps/dependencies/dependency-graph.mmd \
           -o roadmaps/diagrams/dependency-graph.png -w 1920
   b. Replace mermaid blocks with image references in markdown
   c. Add cover page from template (see templates.md)
   d. Add page breaks between major sections

4. GENERATE PDF:
   INVOKE: pdf-report skill
   "Convert roadmap package to PDF"

5. WRITE to: roadmaps/pdf/<type>-YYYY-MM-DD.pdf

6. CONFIRM:
   "✓ PDF generated: roadmaps/pdf/executive-2026-03-04.pdf
    Size: ~2MB, ~12 pages
    Would you like the technical package too?"
```

---

## Mode 7: Team & Financial Planning

**Trigger:** `"Plan team for roadmap"` / `"What team do we need?"` / `"Estimate cost"`

```
1. READ: complexity-analysis.md + effort-estimation.md
   IF not present: run Mode 3 and Mode 5 first

2. DERIVE team composition per phase:
   a. Identify required roles from initiative types:
      - Infrastructure-heavy → DevOps/Platform engineers
      - Service implementation → Backend engineers
      - Data work → Data engineers
      - UI work → Frontend engineers
      - Compliance/security → Security engineer
   b. Map seniority to complexity:
      - Very High complexity → Senior+ required
      - High → Mid-Senior
      - Medium → Mid acceptable with Senior oversight
   c. Calculate allocation per phase (full-time, 75%, 50%)
   d. Identify: which roles are needed for all phases vs one phase?

3. PRODUCE team composition table per phase

4. PRODUCE expertise requirements:
   - Critical (must-have day 1)
   - Important (needed by Phase 2)
   - Nice-to-have (can be grown or contracted)

5. IF financial estimate requested:
   a. ASK: "What region/market are you hiring in?
            A) US (SF/NYC)  B) US (remote)  C) Europe  D) Global hybrid"
   b. Apply blended rate by role and seniority
   c. Calculate: quarterly cost per phase × number of phases
   d. ADD: tooling costs (infra, SaaS, licences)
   e. APPLY: AI augmentation discount (15–25% on implementation effort)
   f. SHOW: low/mid/high estimate with assumptions

6. PRODUCE AI augmentation strategy:
   - Which tasks are high AI leverage? (boilerplate, tests, docs)
   - Which tasks need human judgement? (architecture decisions, security review)
   - Estimated productivity multiplier

7. WRITE:
   roadmaps/team-planning/team-composition.md
   roadmaps/team-planning/expertise-requirements.md
   roadmaps/team-planning/hiring-plan.md           (if hiring needed)
   roadmaps/team-planning/financial-plan.md         (if cost requested)
   roadmaps/team-planning/ai-augmentation-strategy.md
```
