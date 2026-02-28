# UX Design

Guidelines for user experience design — research, interaction design, design systems, and accessibility.

## Core Principles

- **User goals over features** — design for what users are trying to accomplish, not what stakeholders want to ship
- **Evidence over opinions** — decisions backed by research, data, or testing; not HiPPO (highest paid person's opinion)
- **Accessible by default** — WCAG compliance is not a feature; it is a baseline
- **Design systems over one-offs** — reusable components with documented constraints reduce design drift and implementation cost
- **Show, don't spec** — wireframes and prototypes communicate intent more accurately than paragraphs of requirements

## Design Process

```
Discover → Define → Ideate → Prototype → Test → Iterate
```

| Phase | Activities | Outputs |
|-------|-----------|---------|
| **Discover** | User interviews, contextual inquiry, analytics review, competitive analysis | Research synthesis, user personas, journey maps |
| **Define** | Problem framing, Jobs-to-be-Done, success metrics | Problem statement, HMW questions, design brief |
| **Ideate** | Sketching, design studios, card sorting, tree testing | Concept sketches, prioritised feature ideas |
| **Prototype** | Wireframes, interactive prototypes, clickable flows | Low/mid/high-fidelity prototypes |
| **Test** | Usability testing, A/B testing, first-click testing | Test report, validated assumptions, open issues |
| **Iterate** | Address findings, refine, re-test if major changes | Revised designs, updated component library |

## User Research Methods

### Qualitative (Why + How)

| Method | When to use | Session length |
|--------|------------|----------------|
| **Semi-structured interview** | Explore mental models, motivations, pain points | 45–60 min |
| **Contextual inquiry** | Observe users in their actual environment | 60–90 min |
| **Think-aloud usability test** | Evaluate a design with real users | 30–45 min |
| **Diary study** | Understand longitudinal behaviour | 1–2 weeks |

Interview rules:
- 5+ participants reveals most usability issues (Nielsen's law)
- Ask about past behaviour, not hypothetical future behaviour ("Tell me about the last time you..." not "Would you ever...")
- Silence is productive — don't rush to fill it
- Note verbatim quotes; avoid paraphrasing in raw notes

### Quantitative (What + How many)

- **Analytics** — task completion, drop-off, time-on-task, error rates
- **Surveys** — CSAT, NPS, SUS (System Usability Scale), task-specific satisfaction
- **A/B testing** — compare two variants with statistical significance
- **Heatmaps + session recording** — Hotjar, FullStory, Clarity

## Personas and Journey Maps

### Persona format

```
Name: Alex, 34, Product Manager
Goal: Get a clear view of sprint progress without attending every standup
Pain: Needs to check three different tools to get a single status view
Behaviour: Checks dashboards first thing every morning; heavy Slack user
Quote: "I just want one place to see what's actually happening"
```

Persona rules:
- Based on research, not assumptions
- 2–4 personas covers most product surfaces
- Each persona has one primary goal and one core pain
- Avoid demographic stereotyping — focus on behaviour and goals

### Journey map sections

```
Stage → [Discover] → [Evaluate] → [Onboard] → [Use] → [Renew]
Actions: What the user does at each stage
Thoughts: What they're thinking
Emotions: Satisfaction / Frustration / Confusion (line graph)
Pain points: Where friction occurs
Opportunities: Where design can improve the experience
```

## Wireframing Conventions

### Fidelity levels

| Level | When | Detail |
|-------|------|--------|
| **Lo-fi sketch** | Ideation; exploring multiple concepts fast | Boxes and labels; no colour; hand-drawn or rough digital |
| **Mid-fi wireframe** | Internal review; early stakeholder alignment | Grayscale; real copy; component placeholders |
| **Hi-fi mockup** | Dev handoff; usability testing | Pixel-accurate; final copy; colour; branded |

### Annotation conventions

```
[A] — interaction note (what happens on click/tap)
[B] — content note (where data comes from; character limits)
[C] — state note (empty state, loading, error)
[D] — edge case (what happens if list has 0 items / 100+ items)
```

### Component states to always design

- **Default** — normal state
- **Hover / Focus** — pointer or keyboard focus (desktop)
- **Active / Pressed** — while interaction is happening
- **Loading** — async operation in progress
- **Empty** — no data yet
- **Error** — validation failure or system error
- **Disabled** — unavailable action

## Design Systems

### Component documentation structure

```
ComponentName/
  README.md          — purpose, when to use, when not to use
  props.md           — prop types, defaults, constraints
  variants.md        — all visual variants with examples
  accessibility.md   — ARIA roles, keyboard interaction, screen reader notes
  examples/          — usage examples (do/don't pairs)
```

### Design tokens

```json
{
  "color": {
    "brand": { "primary": "#0066CC", "secondary": "#00AA55" },
    "feedback": { "error": "#CC0000", "warning": "#FF8800", "success": "#00AA55" },
    "neutral": { "0": "#FFFFFF", "100": "#F5F5F5", "900": "#111111" }
  },
  "spacing": { "1": "4px", "2": "8px", "3": "12px", "4": "16px", "6": "24px", "8": "32px" },
  "typography": {
    "body": { "size": "16px", "lineHeight": "1.5", "weight": "400" },
    "heading1": { "size": "32px", "lineHeight": "1.2", "weight": "700" }
  }
}
```

Token naming: `category.variant.property` — enables theming and avoids hardcoded values in components.

## Accessibility (WCAG 2.2)

### Level AA requirements (minimum for most products)

| Criterion | Requirement |
|-----------|-------------|
| **Colour contrast** | Text: 4.5:1; Large text (18pt+ or 14pt bold): 3:1; UI components: 3:1 |
| **Keyboard navigation** | All interactive elements reachable and operable via keyboard |
| **Focus visible** | Keyboard focus indicator clearly visible |
| **Text resize** | No loss of content or function at 200% zoom |
| **Alternative text** | All meaningful images have descriptive alt text |
| **Form labels** | All inputs have associated, visible labels |
| **Error identification** | Errors described in text (not colour alone) |
| **Touch targets** | Minimum 24×24px; 44×44px recommended for primary actions |

### Screen reader testing

- macOS + Safari: VoiceOver (`Cmd + F5`)
- Windows + Chrome: NVDA (free)
- iOS: VoiceOver (Settings → Accessibility)
- Android: TalkBack (Settings → Accessibility)

Test the critical user flow with a screen reader before shipping. If you cannot complete the flow, it fails.

## Engineering Handoff

### What handoff must include

```
[ ] Final hi-fi designs for all states (default, loading, error, empty, edge cases)
[ ] Component annotations (ARIA roles, keyboard behaviour, screen reader text)
[ ] Interaction specs (transitions, timing, what triggers what)
[ ] Copy with character limits and truncation rules
[ ] Responsive breakpoints and layout behaviour
[ ] Token values (colour, spacing, typography) — not hex codes
[ ] Assets exported at correct densities (1x, 2x, 3x for native; SVG for web)
[ ] Open design questions documented
```

Clear handoff reduces back-and-forth and prevents "that's not what the design says" conversations.
