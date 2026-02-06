# PDF Report Generation Workflow

Step-by-step procedures for converting markdown reports to PDF.

---

## Phase 1: Report Selection

### Step 1: Identify Source Reports

**What**: Determine which markdown reports to convert to PDF.

**Process**:
1. List available report directories:
   ```
   - architecture-docs/
   - security-analysis/
   - core-architecture/
   - fitness-functions/
   - Custom reports
   ```

2. Ask user:
   ```
   Which reports would you like to convert to PDF?
   
   Options:
   a) All architecture analysis reports (architecture-docs/)
   b) All TOGAF deliverables (core-architecture/)
   c) Security analysis reports
   d) Fitness function reports
   e) Specific files (you specify)
   f) Custom selection (I'll list files)
   ```

3. For custom selection, provide file list:
   ```
   Available reports:
   □ architecture-docs/01-tech-stack.md
   □ architecture-docs/02-components.md
   □ architecture-docs/03-integration.md
   ...
   □ core-architecture/baseline/overview.md
   □ core-architecture/target/overview.md
   □ core-architecture/gap-analysis/summary.md
   
   Check items to include.
   ```

### Step 2: Determine Output Options

**What**: Configure PDF generation settings.

**Ask**:
```yaml
Output options:
1. Single combined PDF or individual PDFs?
   [ ] Combined (all reports in one file)
   [ ] Individual (one PDF per report)
   [ ] Both

2. Include cover page?
   [ ] Yes (with project name, date, author)
   [ ] No

3. Include table of contents?
   [ ] Yes (multi-level TOC)
   [ ] No

4. Page numbering?
   [ ] Yes
   [ ] No

5. Output directory?
   Default: analysis/pdf/
   Custom: _________
```

---

## Phase 2: Diagram Preparation

### Step 3: Identify Diagrams

**What**: Find all diagrams in selected reports that need conversion.

**Process**:
1. Scan markdown files for:
   - Mermaid code blocks (```mermaid)
   - Excalidraw references (.excalidraw)
   - PlantUML blocks (```plantuml)
   - ASCII diagrams
   - Image references (![](path))

2. List findings:
   ```
   Diagrams found:
   - 01-tech-stack.md: 2 Mermaid diagrams
   - 02-components.md: 1 Excalidraw, 3 Mermaid
   - 03-integration.md: 1 ASCII diagram
   
   Total: 7 diagrams
   ```

### Step 4: Export Diagrams

**What**: Convert diagrams to embeddable formats (PNG/SVG).

**For Mermaid**:
```bash
# Extract each mermaid block to temp file
cat > temp-diagram-1.mmd << 'EOF'
graph TD
    A --> B
EOF

# Convert to PNG
mmdc -i temp-diagram-1.mmd -o diagrams/temp-diagram-1.png -b transparent

# Update markdown reference
```

**For Excalidraw**:
```bash
# Manual export from VS Code or
# Use custom script to convert .excalidraw JSON to PNG
excalidraw-export diagram.excalidraw -o diagrams/diagram.png
```

**For PlantUML**:
```bash
# Convert PlantUML to PNG
plantuml -tpng temp-diagram.puml
mv temp-diagram.png diagrams/
```

**For ASCII**:
- Keep as-is in monospace font

**Result**:
```
diagrams/
├── tech-stack-overview.png
├── component-architecture.png
├── integration-flow.png
└── ...
```

### Step 5: Update Markdown References

**What**: Replace dynamic diagram references with static image paths.

**Before**:
```markdown
```mermaid
graph TD
    A --> B
```
```

**After**:
```markdown
![Component Architecture](diagrams/component-architecture.png)
```

---

## Phase 3: PDF Generation

### Step 6: Configure Pandoc

**What**: Set up Pandoc options for PDF generation.

**Create config file** (`pdf-config.yml`):
```yaml
# Pandoc PDF configuration
from: markdown+smart
to: pdf
pdf-engine: pdflatex

# Metadata
variables:
  documentclass: report
  geometry:
    - margin=2.5cm
  fontsize: 11pt
  mainfont: Liberation Serif
  monofont: Liberation Mono
  linestretch: 1.2

# Features
toc: true
toc-depth: 3
number-sections: true
highlight-style: tango

# Header/Footer
header-includes: |
  \usepackage{fancyhdr}
  \pagestyle{fancy}
  \fancyhead[L]{Architecture Analysis}
  \fancyhead[R]{\today}
  \fancyfoot[C]{\thepage}
```

### Step 7: Generate PDFs

**What**: Run Pandoc to create PDF documents.

**For individual PDFs**:
```bash
# Generate each report separately
for file in selected_reports/*.md; do
    basename=$(basename "$file" .md)
    pandoc "$file" \
        --defaults=pdf-config.yml \
        --metadata title="$(extract_title "$file")" \
        -o "analysis/pdf/${basename}.pdf"
done
```

**For combined PDF**:
```bash
# Concatenate markdown files with page breaks
cat selected_reports/*.md | \
    sed 's/^---$/\\newpage/g' > combined-temp.md

# Generate single PDF
pandoc combined-temp.md \
    --defaults=pdf-config.yml \
    --metadata title="Complete Architecture Analysis" \
    -o "analysis/pdf/combined-analysis.pdf"

# Cleanup
rm combined-temp.md
```

**With cover page**:
```bash
# Create cover page markdown
cat > cover.md << 'EOF'
---
title: Architecture Analysis Report
author: [Project Name]
date: \today
---

\newpage
EOF

# Prepend to content
cat cover.md combined-temp.md > with-cover.md

# Generate PDF
pandoc with-cover.md \
    --defaults=pdf-config.yml \
    -o "analysis/pdf/report-with-cover.pdf"
```

---

## Phase 4: Post-Processing

### Step 8: Optimize PDFs

**What**: Compress and optimize generated PDFs.

**Using Ghostscript**:
```bash
# Compress PDF (reduce file size)
gs -sDEVICE=pdfwrite \
   -dCompatibilityLevel=1.4 \
   -dPDFSETTINGS=/ebook \
   -dNOPAUSE -dQUIET -dBATCH \
   -sOutputFile=optimized.pdf \
   input.pdf

# Replace original
mv optimized.pdf input.pdf
```

### Step 9: Validate Output

**What**: Check PDF quality and completeness.

**Validation checklist**:
```
□ All pages rendered correctly
□ Diagrams are legible
□ Tables formatted properly
□ No broken links or missing images
□ Table of contents is accurate
□ Page numbers are correct
□ Metadata is set (title, author, date)
□ File size is reasonable
```

**Quality checks**:
```bash
# Check PDF info
pdfinfo analysis/pdf/report.pdf

# Verify page count
pdftk analysis/pdf/report.pdf dump_data | grep NumberOfPages

# Extract text to verify content
pdftotext analysis/pdf/report.pdf - | head -50
```

---

## Phase 5: Delivery

### Step 10: Package and Deliver

**What**: Prepare PDFs for distribution.

**Create delivery package**:
```
analysis/pdf/
├── README.txt                     # Index of files
├── architecture-analysis.pdf      # Combined report
├── 01-tech-stack.pdf             # Individual reports
├── 02-components.pdf
├── 03-integration.pdf
├── 04-data-flow.pdf
├── 05-dependencies.pdf
├── 06-infrastructure.pdf
├── 07-recommendations.pdf
└── metadata.json                  # Generation metadata
```

**Create README**:
```
Architecture Analysis Reports
Generated: 2026-02-06
Tool: PDF Report Generator v1.0

Contents:
- architecture-analysis.pdf: Complete combined report (100 pages)
- Individual reports (7 files): Detailed analysis by area

For questions or updates, regenerate using:
"Export analysis to PDF"
```

**Metadata file** (`metadata.json`):
```json
{
  "generated_at": "2026-02-06T10:30:00Z",
  "tool": "pdf-report v1.0",
  "source_directory": "architecture-docs/",
  "reports_included": [
    "01-tech-stack.md",
    "02-components.md",
    "03-integration.md",
    "04-data-flow.md",
    "05-dependencies.md",
    "06-infrastructure.md",
    "07-recommendations.md"
  ],
  "total_pages": 100,
  "diagrams_converted": 15,
  "configuration": {
    "combined": true,
    "cover_page": true,
    "toc": true,
    "page_numbers": true
  }
}
```

---

## Alternative Tools

### Using wkhtmltopdf (HTML-based)

```bash
# Convert markdown to HTML first
pandoc report.md -o temp.html

# Convert HTML to PDF
wkhtmltopdf \
    --page-size A4 \
    --margin-top 20mm \
    --margin-bottom 20mm \
    --margin-left 25mm \
    --margin-right 25mm \
    --enable-local-file-access \
    temp.html output.pdf
```

### Using Marp CLI (for slide-style reports)

```bash
# Only use for slide-based reports
marp report.md --pdf -o output.pdf
```

### Using markdown-pdf (Node.js)

```bash
# Install
npm install -g markdown-pdf

# Convert
markdown-pdf report.md -o output.pdf
```

---

## Troubleshooting

### Issue: Diagrams not rendering

**Solution**:
1. Ensure diagrams exported to PNG/SVG
2. Check image paths are relative
3. Verify images are accessible from markdown location

### Issue: Tables breaking across pages

**Solution**:
```latex
% Add to pdf-config.yml header-includes
\usepackage{longtable}
```

### Issue: Code blocks too wide

**Solution**:
```yaml
# In pdf-config.yml
variables:
  geometry:
    - margin=1.5cm  # Reduce margins
```

### Issue: Large file size

**Solution**:
1. Compress images before embedding
2. Use Ghostscript optimization (Step 8)
3. Reduce image DPI to 150-300

---

## Best Practices

1. **Test with sample** - Generate one report first to verify settings
2. **Version PDFs** - Include date in filename: `report-2026-02-06.pdf`
3. **Archive sources** - Keep markdown + diagrams alongside PDFs
4. **Document generation** - Save command used in metadata
5. **Review before distribution** - Always check output quality
6. **Automate when stable** - Script repetitive conversions

---

## Next Steps

After generating PDFs:

1. **Review** - Check formatting, completeness
2. **Archive** - Store in documentation repository
3. **Distribute** - Send to stakeholders
4. **Update tracking** - Note PDF delivery in project log
5. **Schedule refresh** - Plan for report updates
