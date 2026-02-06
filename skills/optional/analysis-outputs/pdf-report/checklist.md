# PDF Report Generation Checklist

Quick reference for generating professional PDF reports from markdown.

---

## Pre-Generation Checklist

### 1. Environment Setup

- [ ] Pandoc installed (`pandoc --version`)
- [ ] LaTeX distribution installed (texlive or miktex)
- [ ] Required packages available (`tlmgr list --installed`)
- [ ] Diagram tools installed (mmdc, plantuml, etc.)
- [ ] Working directory configured

### 2. Source Preparation

- [ ] Markdown files validated (no syntax errors)
- [ ] Frontmatter metadata present (title, author, date)
- [ ] Headings follow consistent hierarchy (H1 → H2 → H3)
- [ ] Code blocks have language identifiers
- [ ] Tables formatted correctly
- [ ] All file paths are relative
- [ ] Sensitive data masked/removed

### 3. Diagram Preparation

- [ ] All diagrams identified and listed
- [ ] Mermaid diagrams syntax validated
- [ ] PlantUML diagrams syntax validated
- [ ] Diagram export completed
- [ ] PNG files generated (300 DPI)
- [ ] Markdown references updated
- [ ] Image files accessible

---

## Generation Checklist

### 4. Configuration

- [ ] PDF config file created (`pdf-config.yml`)
- [ ] Document class selected (report/article/book)
- [ ] Page geometry configured (margins, size)
- [ ] Font settings defined
- [ ] TOC enabled and depth set
- [ ] Syntax highlighting theme selected
- [ ] Headers/footers configured

### 5. Individual PDFs

For each report file:

- [ ] Source file path verified
- [ ] Output filename determined
- [ ] Title metadata set
- [ ] Pandoc command prepared
- [ ] PDF generated successfully
- [ ] No errors in log
- [ ] Output file validated
- [ ] File size reasonable (<5 MB per file)

### 6. Combined PDF

- [ ] Report order determined
- [ ] Cover page prepared (if needed)
- [ ] TOC page breaks configured
- [ ] Section separation added
- [ ] Files concatenated correctly
- [ ] Combined PDF generated
- [ ] Page numbering verified
- [ ] TOC links working
- [ ] Cross-references valid

---

## Post-Generation Checklist

### 7. Quality Validation

- [ ] PDF opens without errors
- [ ] All pages render correctly
- [ ] Images display properly
- [ ] Tables formatted correctly
- [ ] Code blocks readable
- [ ] Syntax highlighting applied
- [ ] TOC entries correct
- [ ] Page numbers sequential
- [ ] Headers/footers present
- [ ] No broken links
- [ ] No missing images
- [ ] No truncated content

### 8. Content Review

- [ ] Title page complete
- [ ] Metadata accurate
- [ ] All sections present
- [ ] Diagrams readable
- [ ] Text formatting consistent
- [ ] No layout issues
- [ ] No orphaned headings
- [ ] Appendices included

### 9. Technical Validation

- [ ] File size acceptable (<10 MB)
- [ ] PDF version appropriate (1.7 or 2.0)
- [ ] Embedded fonts verified
- [ ] Color profile correct
- [ ] Resolution adequate (300 DPI)
- [ ] Searchable text enabled
- [ ] Bookmarks present
- [ ] Metadata embedded

---

## Post-Processing Checklist

### 10. Optimization

- [ ] Large images optimized
- [ ] Unnecessary metadata removed
- [ ] PDF linearized (for web viewing)
- [ ] File compressed (if needed)
- [ ] Backup of original created
- [ ] Final size verified

### 11. Delivery Preparation

- [ ] Output directory created
- [ ] Files organized by type
- [ ] README file created
- [ ] Metadata file generated
- [ ] Archive package prepared (.zip)
- [ ] Version number assigned
- [ ] Distribution list prepared

---

## Quick Command Reference

### Basic Generation

```bash
# Single PDF
pandoc input.md --defaults=pdf-config.yml -o output.pdf

# With metadata
pandoc input.md \
  --metadata title="Report Title" \
  --metadata author="Author Name" \
  --defaults=pdf-config.yml \
  -o output.pdf

# Combined PDF
cat report1.md report2.md report3.md | \
pandoc --defaults=pdf-config.yml -o combined.pdf
```

### Diagram Export

```bash
# Mermaid
mmdc -i diagram.mmd -o diagram.png -w 1920 -H 1080 -b transparent

# PlantUML
plantuml -tpng -o ./output diagram.puml
```

### PDF Operations

```bash
# Compress
gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook \
   -dNOPAUSE -dQUIET -dBATCH -sOutputFile=output-compressed.pdf input.pdf

# Merge
pdftk report1.pdf report2.pdf cat output combined.pdf

# Add bookmarks
pdftk input.pdf update_info metadata.txt output output.pdf
```

### Validation

```bash
# Check PDF
pdfinfo output.pdf

# Extract metadata
exiftool output.pdf

# Validate structure
qpdf --check output.pdf
```

---

## Troubleshooting Checklist

### Issues Found?

#### PDF Generation Fails

- [ ] Check Pandoc version (2.19+)
- [ ] Verify LaTeX installation
- [ ] Check missing packages
- [ ] Review error log
- [ ] Test with minimal example
- [ ] Verify input file syntax

#### Images Not Rendering

- [ ] Check image paths (relative)
- [ ] Verify image format (PNG/JPG)
- [ ] Test image accessibility
- [ ] Check file permissions
- [ ] Validate image dimensions
- [ ] Review markdown syntax

#### Formatting Issues

- [ ] Verify markdown syntax
- [ ] Check frontmatter YAML
- [ ] Review LaTeX template
- [ ] Test with default template
- [ ] Check special characters
- [ ] Validate table syntax

#### Large File Size

- [ ] Compress images
- [ ] Remove duplicate content
- [ ] Optimize diagrams
- [ ] Use PDF compression
- [ ] Remove embedded fonts (if acceptable)
- [ ] Check for unnecessary metadata

---

## Integration Checklist

### With Other Skills

#### Architecture-Docs

- [ ] Output directory configured
- [ ] Report files accessible
- [ ] Diagram references valid
- [ ] Metadata synchronized

#### Structurizr

- [ ] C4 diagrams exported
- [ ] PNG files available
- [ ] References updated
- [ ] Context preserved

#### TOGAF

- [ ] Phase deliverables identified
- [ ] ADM artifacts included
- [ ] Catalogs exported
- [ ] Matrices rendered

#### Security-Analysis

- [ ] Findings exported
- [ ] Risk matrices included
- [ ] Threat models rendered
- [ ] Recommendations formatted

---

## Final Checklist

### Before Delivery

- [ ] All PDFs generated successfully
- [ ] Quality validation passed
- [ ] Post-processing completed
- [ ] Metadata files created
- [ ] README documentation included
- [ ] Distribution package prepared
- [ ] Backup created
- [ ] Version tagged

### Delivery Package Contents

- [ ] Combined PDF (architecture-analysis.pdf)
- [ ] Individual section PDFs
- [ ] Diagrams directory (PNG exports)
- [ ] README.md (package documentation)
- [ ] metadata.json (generation details)
- [ ] Source markdown files (optional)
- [ ] Configuration files (optional)

---

## Common Patterns

### Executive Report

1. Cover page with logo and title
2. Document information table
3. Executive summary (1-2 pages)
4. Key findings (bullet points)
5. Recommendations (numbered list)
6. Detailed analysis sections
7. Appendices (glossary, references)

### Technical Documentation

1. Title and metadata
2. Table of contents
3. Introduction and scope
4. Technical sections with diagrams
5. Code examples
6. Configuration samples
7. References and links

### Compliance Report

1. Compliance statement
2. Audit information
3. Standards checklist
4. Evidence sections
5. Gap analysis
6. Remediation plan
7. Sign-off page

---

## Time Estimates

| Task | Duration | Notes |
|------|----------|-------|
| Environment setup | 30 min | One-time |
| Source preparation | 15 min | Per report |
| Diagram export | 5-10 min | Per report |
| Individual PDF generation | 2 min | Per file |
| Combined PDF generation | 5 min | All files |
| Quality validation | 10 min | Comprehensive |
| Post-processing | 10 min | Optional |
| Delivery preparation | 15 min | Package creation |

**Total (first time)**: ~2 hours  
**Total (subsequent)**: ~30-45 minutes

---

## Quality Standards

### Minimum Requirements

- [ ] All content readable
- [ ] Images visible
- [ ] TOC functional
- [ ] No broken links
- [ ] Proper page breaks
- [ ] Consistent formatting

### Professional Standards

- [ ] Cover page with branding
- [ ] Document metadata
- [ ] Revision history
- [ ] Headers and footers
- [ ] Page numbering
- [ ] Syntax highlighting
- [ ] Optimized file size
- [ ] PDF/A compliance (for archival)

### Excellence Standards

- [ ] Custom styling
- [ ] Branded templates
- [ ] Interactive TOC
- [ ] Embedded attachments
- [ ] Digital signatures
- [ ] Accessibility features (PDF/UA)
- [ ] Version control metadata
- [ ] Distribution tracking
