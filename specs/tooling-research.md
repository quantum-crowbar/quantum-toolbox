# Tooling Research

Research findings for new roadmap features: diagram export, presentation generation, and Excalidraw support.

---

## 1. Diagram Export Tooling

### Mermaid CLI

**Package:** `@mermaid-js/mermaid-cli`  
**Install:** `npm install -g @mermaid-js/mermaid-cli`  
**Stars:** 4.1k | **Weekly Downloads:** ~100k

**Usage:**
```bash
# Basic SVG export
mmdc -i diagram.mmd -o output.svg

# PNG with dark theme
mmdc -i diagram.mmd -o output.png -t dark -b transparent

# Batch convert (markdown with mermaid blocks)
mmdc -i readme.template.md -o readme.md

# With config file
mmdc -i diagram.mmd -o output.svg -c mermaid.config.json
```

**Output Formats:** SVG, PNG, PDF

**Requirements:**
- Node.js v18+
- Puppeteer (bundled, uses Chrome/Chromium)

**Docker Support:**
```bash
docker pull minlag/mermaid-cli
docker run --rm -v /path/to/diagrams:/data minlag/mermaid-cli -i diagram.mmd
```

**Verdict:** ✅ **Recommended** - Mature, well-maintained, official Mermaid CLI

---

### PlantUML CLI

**Package:** PlantUML JAR  
**Install:** `brew install plantuml` or download JAR  
**Website:** https://plantuml.com

**Usage:**
```bash
# Basic PNG export
plantuml diagram.puml

# SVG output
plantuml -tsvg diagram.puml

# Batch convert directory
plantuml -o output/ *.puml

# Pipe from stdin
cat diagram.puml | plantuml -pipe > output.png
```

**Output Formats:** PNG, SVG, EPS, PDF, ASCII art

**Requirements:**
- Java Runtime (JRE 8+)
- Graphviz (for certain diagram types)

**Verdict:** ✅ **Recommended** - Industry standard for UML diagrams

---

### Excalidraw Export

**Package:** `@excalidraw/excalidraw` (React component)  
**Install:** `npm install @excalidraw/excalidraw`  
**Stars:** 116k | **Weekly Downloads:** ~110k

**Export Capabilities (built-in):**
- PNG, SVG, clipboard
- Export from browser/webapp
- JSON format (`.excalidraw` files)

**CLI/Automation Options:**

1. **excalidraw-cli** (Community)
   ```bash
   npx excalidraw-cli export input.excalidraw -o output.png
   ```
   Note: Limited maintenance, may need alternatives

2. **Puppeteer-based automation**
   ```javascript
   // Custom script using Puppeteer + Excalidraw
   // Load .excalidraw file, render, screenshot
   ```

3. **VS Code Extension** (`pomdtr.excalidraw-editor`)
   - Edit .excalidraw files in VS Code
   - Manual export to SVG/PNG from UI

**Recommended Approach:**
- Store diagrams as `.excalidraw` JSON files (version-controlled)
- Export to SVG/PNG on demand using:
  - Manual: VS Code extension
  - Automated: Custom Node.js script with Puppeteer
  - CI: Pre-commit hook or GitHub Action

**Verdict:** ⚠️ **Partial support** - No official CLI; requires custom scripting for automation

---

## 2. Presentation Generation Tooling

### Marp CLI (Markdown to Slides)

**Package:** `@marp-team/marp-cli`  
**Install:** `npm install -g @marp-team/marp-cli`  
**Stars:** 3.1k | **Weekly Downloads:** ~14k

**Usage:**
```bash
# Markdown to HTML slides
marp slides.md -o slides.html

# Markdown to PDF
marp slides.md --pdf -o slides.pdf

# Markdown to PowerPoint (PPTX)
marp slides.md --pptx -o slides.pptx

# Watch mode with preview
marp -w -p slides.md

# Server mode
marp -s ./slides/
```

**Output Formats:** HTML, PDF, PPTX, PNG/JPEG images

**Markdown Syntax:**
```markdown
---
marp: true
theme: default
paginate: true
---

# Slide 1 Title

Content for first slide

---

# Slide 2 Title

- Bullet points
- With formatting

<!-- Speaker notes go here -->
```

**Features:**
- Presenter notes support
- Multiple themes (default, gaia, uncover)
- Custom CSS themes
- Image embedding
- Code syntax highlighting
- Slide transitions (HTML output)
- Editable PPTX (experimental with LibreOffice)

**Requirements:**
- Node.js v18+
- Chrome/Edge/Firefox (for PDF/PPTX/image export)

**Docker Support:**
```bash
docker pull marpteam/marp-cli
docker run --rm -v $(pwd):/data marpteam/marp-cli slides.md --pptx
```

**Verdict:** ✅ **Strongly Recommended** - Best-in-class MD→PPTX solution

---

### python-pptx (Programmatic PPT Generation)

**Package:** `python-pptx`  
**Install:** `pip install python-pptx`  
**Version:** 1.0.0 (stable)

**Usage:**
```python
from pptx import Presentation
from pptx.util import Inches, Pt

# Create presentation
prs = Presentation()

# Add title slide
title_slide_layout = prs.slide_layouts[0]
slide = prs.slides.add_slide(title_slide_layout)
title = slide.shapes.title
subtitle = slide.placeholders[1]
title.text = "Architecture Vision"
subtitle.text = "Q1 2026 Review"

# Add content slide
bullet_slide_layout = prs.slide_layouts[1]
slide = prs.slides.add_slide(bullet_slide_layout)
slide.shapes.title.text = "Key Points"
body = slide.placeholders[1]
tf = body.text_frame
tf.text = "First bullet"
p = tf.add_paragraph()
p.text = "Second bullet"
p.level = 1

# Add image
slide.shapes.add_picture('diagram.png', Inches(1), Inches(2))

# Save
prs.save('presentation.pptx')
```

**Features:**
- Full programmatic control
- Template-based generation
- Add images, charts, tables
- Modify existing presentations
- Round-trip any PPTX

**Use Cases:**
- Dynamic content from database/API
- Batch generation
- Template customization
- Complex layouts

**Verdict:** ✅ **Recommended** - For complex/dynamic presentations

---

### Comparison: Marp vs python-pptx

| Feature | Marp CLI | python-pptx |
|---------|----------|-------------|
| Input | Markdown | Python code |
| Learning curve | Low | Medium |
| Themes | Built-in + CSS | Manual |
| Dynamic content | Limited | Full |
| Template support | CSS themes | PPTX templates |
| Batch processing | Yes | Yes |
| Code highlighting | Yes | Manual |
| Diagrams | Embed images | Embed images |
| Presenter notes | Yes | Yes |
| Best for | Simple/consistent | Complex/dynamic |

**Recommendation:** Use **Marp CLI** for most architecture presentations (markdown-native workflow fits toolkit philosophy). Reserve **python-pptx** for complex dynamic scenarios requiring programmatic control.

---

## 3. Implementation Recommendations

### For This Toolkit

#### Diagram Export Workflow

```yaml
# Proposed export configuration (diagrams.yml)
export:
  mermaid:
    tool: "@mermaid-js/mermaid-cli"
    default_format: svg
    themes: [default, dark, forest]
  
  plantuml:
    tool: "plantuml"
    default_format: svg
    requires: java
  
  excalidraw:
    storage: .excalidraw JSON files
    export: manual via VS Code extension
    ci_export: puppeteer script (future)
```

#### Presentation Workflow

```yaml
# Proposed presentation config (presentation.yml)
generator: marp-cli
themes:
  - default
  - custom/architecture.css
  
templates:
  vision: "templates/vision-deck.md"
  review: "templates/tech-review.md"
  roadmap: "templates/roadmap-deck.md"

export:
  formats: [pptx, pdf, html]
  embed_diagrams: true
```

### Installation Requirements

```bash
# Diagram export tools
npm install -g @mermaid-js/mermaid-cli
brew install plantuml  # or download plantuml.jar

# Presentation generation
npm install -g @marp-team/marp-cli

# Optional: Python for advanced PPTX
pip install python-pptx
```

### VS Code Extensions

| Extension | ID | Purpose |
|-----------|-----|---------|
| Excalidraw Editor | `pomdtr.excalidraw-editor` | Edit .excalidraw files |
| Mermaid Preview | `bierner.markdown-mermaid` | Preview mermaid in MD |
| Marp for VS Code | `marp-team.marp-vscode` | Preview/edit Marp slides |

---

## 4. Priority Implementation

| Priority | Feature | Tool | Effort |
|----------|---------|------|--------|
| P0 | Mermaid → PNG/SVG export | mermaid-cli | Low |
| P0 | MD → PPTX presentations | marp-cli | Low |
| P1 | PlantUML export | plantuml | Low |
| P1 | Marp themes for architecture | custom CSS | Medium |
| P2 | Excalidraw workflow | VS Code manual | Low |
| P3 | Excalidraw CI automation | custom script | High |
| P3 | python-pptx templates | python-pptx | Medium |

---

## References

- Mermaid CLI: https://github.com/mermaid-js/mermaid-cli
- PlantUML: https://plantuml.com
- Excalidraw: https://github.com/excalidraw/excalidraw
- Marp CLI: https://github.com/marp-team/marp-cli
- python-pptx: https://python-pptx.readthedocs.io/
