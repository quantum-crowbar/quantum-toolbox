# PDF Report Generation

Convert markdown analysis reports to professional PDF documents.

---

## Purpose

This output adapter converts markdown-based analysis reports into formatted PDF documents suitable for distribution to stakeholders, archival, or formal documentation requirements.

---

## When to Use

Use this adapter when you need to:

- Deliver analysis reports in PDF format for stakeholders
- Archive documentation in a portable format
- Create formal documentation packages
- Generate reports for compliance or audit purposes
- Produce printable analysis summaries

**Trigger phrases**:
```
"Generate PDF reports"
"Export analysis to PDF"
"Create PDF documentation"
"Convert reports to PDF"
```

---

## How It Works

### Input

Accepts any markdown-based analysis reports:

| Report Type | Source | Example Files |
|-------------|--------|---------------|
| Architecture Analysis | `architecture-docs/` | `01-tech-stack.md`, `02-components.md`, etc. |
| Security Analysis | `security-analysis/` | Security reports, compliance checklists |
| TOGAF Deliverables | `core-architecture/` | Baseline, target, gap analysis |
| Fitness Functions | `fitness-functions/` | Baseline, measurement reports |
| Custom Reports | Any markdown | User-specified files |

### Output

Generates professional PDF documents with:

- **Formatted content** - Proper headings, lists, tables
- **Embedded diagrams** - Mermaid, ASCII, images
- **Table of contents** - For multi-section reports
- **Page numbers** - Header/footer formatting
- **Cover page** - Optional title page
- **Metadata** - Title, author, date

---

## Supported Features

### Document Elements

| Element | Support | Notes |
|---------|---------|-------|
| Headings | ✅ | H1-H6 with proper hierarchy |
| Paragraphs | ✅ | Body text with formatting |
| Lists | ✅ | Ordered, unordered, nested |
| Tables | ✅ | With column alignment |
| Code blocks | ✅ | Syntax highlighting optional |
| Images | ✅ | Embedded inline |
| Links | ✅ | As footnotes or inline |
| Blockquotes | ✅ | Indented styling |

### Diagram Rendering

| Format | Support | Method |
|--------|---------|--------|
| Mermaid | ✅ | Convert to PNG/SVG, embed |
| ASCII | ✅ | Monospace rendering |
| PlantUML | ✅ | Convert to PNG, embed |
| Excalidraw | ✅ | Export to PNG, embed |
| Images | ✅ | Direct embedding |

---

## Configuration Options

### PDF Generation Tools

| Tool | Priority | Pros | Cons |
|------|----------|------|------|
| **Pandoc** | Recommended | Feature-rich, widely used | Requires LaTeX for advanced features |
| **wkhtmltopdf** | Alternative | HTML-based, easy styling | Deprecated, limited updates |
| **Marp CLI** | Alternative | Great for slides | Not ideal for reports |
| **Markdown-pdf** | Alternative | Simple, Node.js | Limited features |

**Recommended**: Pandoc with custom LaTeX template

### Output Formats

| Format | Extension | Use Case |
|--------|-----------|----------|
| PDF | `.pdf` | Standard distribution |
| PDF/A | `.pdf` | Archival (ISO 19005) |

### Styling Options

```yaml
# pdf-config.yml
styling:
  template: professional  # professional, technical, minimal
  font: 
    body: "Liberation Serif"
    heading: "Liberation Sans"
    code: "Liberation Mono"
  colors:
    primary: "#2C3E50"
    accent: "#3498DB"
  margins:
    top: 2.5cm
    bottom: 2.5cm
    left: 3cm
    right: 3cm
  page_numbers: true
  table_of_contents: true
  cover_page: true
```

---

## Typical Workflow

### 1. Generate Analysis Reports

```
User: "Analyze the architecture"
→ Generates architecture-docs/ with 7 reports
```

### 2. Convert to PDF

```
User: "Export analysis to PDF"

Agent prompts:
- Which reports to include? (select from list)
- Single PDF or separate files?
- Include cover page? (yes/no)
- Output directory? (default: analysis/pdf/)
```

### 3. Receive PDFs

```
Output:
analysis/pdf/
├── architecture-analysis.pdf      # Combined report
├── 01-tech-stack.pdf             # Individual reports
├── 02-components.pdf
└── ...
```

---

## Deliverables

| File | Description |
|------|-------------|
| `[report-name].pdf` | Individual report as PDF |
| `combined-analysis.pdf` | All reports merged (optional) |
| `cover-page.pdf` | Standalone cover (optional) |

---

## Installation Requirements

### Pandoc (Recommended)

```bash
# Ubuntu/Debian
sudo apt-get install pandoc texlive-latex-base texlive-fonts-recommended

# macOS
brew install pandoc basictex

# Verify
pandoc --version
```

### Alternative: wkhtmltopdf

```bash
# Ubuntu/Debian
sudo apt-get install wkhtmltopdf

# macOS
brew install wkhtmltopdf

# Verify
wkhtmltopdf --version
```

---

## Integration with Other Skills

| Skill | Integration |
|-------|-------------|
| **arch-analysis** | Export 7 architecture reports to PDF |
| **security-analysis** | Export security reports + compliance checklists |
| **fitness-functions** | Export fitness measurement reports |
| **core-architecture** | Export TOGAF deliverables (baseline, target, gaps) |
| **architecture-synthesis** | Export synthesized baseline architecture |
| **presentation** | Complement to slide generation (reports vs slides) |

---

## Example Use Cases

### Use Case 1: Executive Report Package

```
Input: TOGAF core-architecture/ outputs
Process: Combine baseline + target + gaps + risks
Output: executive-architecture-report.pdf (50 pages)
```

### Use Case 2: Compliance Documentation

```
Input: Security analysis + OWASP ASVS checklist
Process: Merge security reports + compliance matrix
Output: security-compliance-report.pdf (30 pages)
```

### Use Case 3: Architecture Review

```
Input: All architecture-docs/ reports
Process: Individual PDFs + combined report
Output: 7 individual PDFs + combined.pdf (100 pages)
```

---

## Best Practices

1. **Keep markdown clean** - Avoid HTML unless necessary
2. **Use relative image paths** - Ensure diagrams are accessible
3. **Export diagrams first** - Convert Mermaid/Excalidraw to PNG before PDF generation
4. **Test output** - Review PDF before distribution
5. **Version control** - Tag PDFs with date/version
6. **Optimize file size** - Compress images, use appropriate DPI

---

## Limitations

| Limitation | Workaround |
|------------|------------|
| Interactive elements | Convert to static content |
| Animations | Use static snapshots |
| External links | Include as footnotes |
| Large images | Compress to reduce file size |
| Complex tables | May require manual adjustment |

---

## Next Steps

After generating PDFs:

1. **Review output** - Check formatting, page breaks
2. **Distribute** - Email, upload to documentation portal
3. **Archive** - Store in version control or DMS
4. **Update** - Regenerate when reports change

---

## Related Skills

- **presentation** - For slide-based deliverables (PPTX, PDF slides)
- **architecture-docs** - Source for architecture reports
- **core-architecture** - Source for TOGAF deliverables
- **security-analysis** - Source for security reports
- **fitness-functions** - Source for fitness measurement reports
