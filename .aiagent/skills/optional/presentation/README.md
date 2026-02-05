# Presentation Generation Skill

Generate professional architecture presentations from Markdown using Marp CLI.

---

## AI Agent Instructions

**CRITICAL:** When asked to create a presentation, you MUST deliver the final exported file (PPTX/PDF), not just the markdown source.

### End-to-End Workflow

1. **Install dependencies** (if needed): `npm install -g @marp-team/marp-cli`
2. **Create markdown** presentation with Marp front matter
3. **Export to PPTX** (default) or PDF/HTML if requested
4. **Report file path** to user

```bash
# Always run after creating markdown
marp {slides.md} --pptx -o {slides.pptx}
```

**Default format:** PPTX (most portable for sharing)

---

## Overview

This skill enables generation of slide decks (PPTX, PDF, HTML) from Markdown source files. It follows a docs-as-code approach where presentations are version-controlled, reviewable, and automatically exportable.

## Why Markdown Presentations?

| Benefit | Description |
|---------|-------------|
| **Version Control** | Track changes with git, enable PR reviews |
| **Consistency** | Themes ensure uniform styling across decks |
| **Automation** | CI/CD can auto-generate exports |
| **Focus on Content** | Markdown syntax keeps focus on message, not formatting |
| **Reusability** | Templates and snippets can be shared across presentations |

## Tool: Marp CLI

**Package:** `@marp-team/marp-cli`
**Install:** `npm install -g @marp-team/marp-cli`

### Core Commands

```bash
# Markdown to HTML slides
marp slides.md -o slides.html

# Markdown to PDF
marp slides.md --pdf -o slides.pdf

# Markdown to PowerPoint
marp slides.md --pptx -o slides.pptx

# Watch mode with live preview
marp -w -p slides.md

# Server mode (directory)
marp -s ./presentations/

# With custom theme
marp slides.md --theme ./themes/architecture.css -o slides.pptx
```

### Output Formats

| Format | Extension | Use Case |
|--------|-----------|----------|
| HTML | `.html` | Web viewing, self-contained |
| PDF | `.pdf` | Printing, distribution |
| PPTX | `.pptx` | Editing, corporate templates |
| PNG/JPEG | `.png`/`.jpg` | Individual slide images |

## Marp Markdown Syntax

### Slide Separation

Slides are separated by `---` (horizontal rule):

```markdown
---
marp: true
theme: default
paginate: true
---

# First Slide

Content here

---

# Second Slide

More content
```

### Front Matter

```yaml
---
marp: true                    # Required: enable Marp
theme: default                # Theme: default, gaia, uncover, or custom
paginate: true                # Show page numbers
header: "Company Name"        # Header on all slides
footer: "Confidential"        # Footer on all slides
backgroundColor: white        # Background color
backgroundImage: url(bg.png)  # Background image
class: lead                   # Default class for slides
---
```

### Directives

#### Global Directives (Front Matter)
Apply to all slides:
```yaml
---
marp: true
theme: gaia
class: lead
paginate: true
---
```

#### Local Directives (Per Slide)
Apply to current slide only:
```markdown
---

<!-- _class: lead -->
<!-- _backgroundColor: #234 -->
<!-- _color: white -->

# Dark Slide

This slide has custom styling
```

### Built-in Themes

| Theme | Description |
|-------|-------------|
| `default` | Clean, minimal design |
| `gaia` | Bold, colorful slides |
| `uncover` | Modern, gradient backgrounds |

### Special Classes

```markdown
<!-- _class: lead -->      <!-- Centered, large text -->
<!-- _class: invert -->    <!-- Dark background, light text -->
```

### Images

```markdown
# Standard image
![](image.png)

# Sized image
![width:500px](image.png)
![height:300px](image.png)
![w:500 h:300](image.png)

# Positioned image
![bg](background.png)           <!-- Full background -->
![bg left](sidebar.png)         <!-- Left 50% -->
![bg right:30%](sidebar.png)    <!-- Right 30% -->
![bg fit](diagram.png)          <!-- Fit to slide -->
![bg contain](logo.png)         <!-- Contain within slide -->
```

### Multiple Background Images

```markdown
![bg left:33%](image1.png)
![bg](image2.png)
![bg](image3.png)
```

### Speaker Notes

```markdown
# Slide Title

Visible content

<!--
Speaker notes go here.
Not visible in presentation.
Visible in presenter view.
-->
```

### Code Blocks

```markdown
# Code Example

​```python
def hello():
    print("Hello, World!")
​```
```

Syntax highlighting is automatic based on language.

### Math Equations (KaTeX)

```markdown
# Math Support

Inline: $E = mc^2$

Block:
$$
\frac{n!}{k!(n-k)!} = \binom{n}{k}
$$
```

## Architecture Presentation Patterns

### The Architecture Decision Deck

Standard structure for presenting architecture decisions:

1. **Title** - Decision name, date, audience
2. **Context** - Business driver, current state
3. **Problem** - What needs solving
4. **Options** - Alternatives considered (2-4)
5. **Comparison** - Decision matrix
6. **Recommendation** - Selected option with rationale
7. **Impact** - What changes, who's affected
8. **Next Steps** - Actions, timeline
9. **Q&A** - Discussion

### The Architecture Vision Deck

For presenting high-level architecture:

1. **Title** - System/initiative name
2. **Business Context** - Why we're doing this
3. **Current State** - Baseline architecture (C4 Context)
4. **Pain Points** - Problems with current state
5. **Target State** - Future architecture (C4 Context)
6. **Key Changes** - What's different
7. **Benefits** - Expected outcomes
8. **Risks** - What could go wrong
9. **Roadmap** - High-level timeline
10. **Ask** - What you need from audience

### The Technical Deep Dive Deck

For technical audiences:

1. **Title** - Component/system name
2. **Context** - Where this fits (C4 Context)
3. **Containers** - C4 Container diagram
4. **Key Components** - C4 Component diagram
5. **Data Flow** - How data moves
6. **Sequence** - Key interactions
7. **Code** - Representative examples
8. **Performance** - Metrics, benchmarks
9. **Trade-offs** - Design decisions
10. **Questions** - Discussion

### The Migration Briefing Deck

For migration planning communication:

1. **Title** - Migration name, phase
2. **Recap** - Current state, why migrating
3. **Scope** - What's included/excluded
4. **Approach** - Strategy (big bang, phased, strangler)
5. **Timeline** - Gantt or milestone view
6. **Risks** - Mitigation strategies
7. **Dependencies** - Critical blockers
8. **Support Model** - During migration
9. **Rollback** - If things go wrong
10. **Success Criteria** - How we'll know we're done

## Embedding Diagrams

### From Mermaid

1. Export diagram to PNG/SVG:
   ```bash
   mmdc -i diagram.mmd -o diagram.png
   ```

2. Include in Marp:
   ```markdown
   # Architecture Overview

   ![bg right:60% contain](./diagrams/context.png)

   Key components:
   - Service A
   - Service B
   - Database
   ```

### From Excalidraw

1. Export from Excalidraw to PNG/SVG
2. Include in Marp same as above

### From Structurizr

1. Export diagrams from Structurizr
2. Include in Marp same as above

## File Organization

```
presentations/
├── architecture-vision/
│   ├── slides.md              # Main presentation
│   ├── diagrams/              # Exported diagrams
│   │   ├── context.png
│   │   └── container.png
│   └── exports/               # Generated files
│       ├── slides.pptx
│       └── slides.pdf
├── adr-001-api-gateway/
│   ├── slides.md
│   └── exports/
├── themes/                    # Shared themes
│   └── architecture.css
└── templates/                 # Slide templates
    ├── vision-deck.md
    └── adr-deck.md
```

## Integration with Toolkit

### After Architecture Analysis

Generate presentations from analysis outputs:

```markdown
# Use cases
- Present architecture vision to stakeholders
- Brief teams on migration plan
- Document ADR decisions
- Technical deep dives for new team members
```

### Workflow

1. **Analyze** - Run architecture analysis
2. **Export diagrams** - Generate PNG/SVG from Mermaid/Structurizr
3. **Write slides** - Create Markdown presentation
4. **Review** - Preview with `marp -p`
5. **Export** - Generate PPTX/PDF
6. **Present** - Deliver to stakeholders

## Requirements

### Installation

```bash
# Required
npm install -g @marp-team/marp-cli

# For PDF/PPTX export (uses Chromium)
# Puppeteer is bundled with marp-cli

# Optional: For diagram export
npm install -g @mermaid-js/mermaid-cli
```

### VS Code Integration

Install **Marp for VS Code** (`marp-team.marp-vscode`) for:
- Live preview
- Export from editor
- Syntax highlighting

## Key Principles

1. **Content First** - Write content before worrying about styling
2. **One Message Per Slide** - Don't overload slides
3. **Visual Hierarchy** - Use headings, bullets, images consistently
4. **Diagrams Over Text** - Show architecture visually
5. **Version Control** - Track presentations in git
6. **Reuse Templates** - Don't start from scratch each time
7. **Export Early** - Test PPTX export early to catch issues

## Common Pitfalls

| Pitfall | Solution |
|---------|----------|
| Too much text per slide | Limit to 6 bullets max |
| Small diagrams | Use `bg` directive for full-slide images |
| Inconsistent styling | Use themes, not inline styles |
| Missing speaker notes | Add notes for complex slides |
| Large file size | Compress images before embedding |
| PPTX edit issues | Accept that PPTX is for delivery, not editing |

## Related Skills

- [Structurizr](../structurizr/) - C4 diagram generation
- [Architecture Synthesis](../architecture-synthesis/) - Parsing visual diagrams
- [TOGAF Vision](../togaf/vision/) - Architecture vision content

## References

- [Marp CLI Documentation](https://github.com/marp-team/marp-cli)
- [Marp Core Syntax](https://marpit.marp.app/)
- [Marp for VS Code](https://marketplace.visualstudio.com/items?itemName=marp-team.marp-vscode)
