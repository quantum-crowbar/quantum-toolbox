# PDF Report Templates

Templates and configuration files for PDF generation.

---

## Pandoc Configuration Template

Save as `pdf-config.yml`:

```yaml
# PDF Generation Configuration
# Usage: pandoc report.md --defaults=pdf-config.yml -o output.pdf

from: markdown+smart
to: pdf
pdf-engine: pdflatex

# Document metadata
variables:
  documentclass: report
  classoption: 
    - oneside
    - openany
  geometry:
    - top=2.5cm
    - bottom=2.5cm
    - left=3cm
    - right=3cm
  fontsize: 11pt
  mainfont: Liberation Serif
  sansfont: Liberation Sans
  monofont: Liberation Mono
  linestretch: 1.2
  urlcolor: blue
  linkcolor: black

# Table of contents
toc: true
toc-depth: 3
number-sections: true

# Code highlighting
highlight-style: tango
listings: false

# Headers and footers
header-includes: |
  \usepackage{fancyhdr}
  \usepackage{lastpage}
  \pagestyle{fancy}
  \fancyhead[L]{\leftmark}
  \fancyhead[R]{\thepage}
  \fancyfoot[C]{Architecture Analysis Report}
  \fancyfoot[R]{\today}
  
  % Better tables
  \usepackage{longtable}
  \usepackage{booktabs}
  
  % Better code blocks
  \usepackage{fvextra}
  \DefineVerbatimEnvironment{Highlighting}{Verbatim}{
    breaklines,
    breakanywhere,
    commandchars=\\\{\}
  }
```

---

## Cover Page Template

Save as `cover-page.md`:

```markdown
---
title: |
  ![](logo.png){width=2in}  
  
  Architecture Analysis Report
subtitle: [Project Name]
author: 
  - Architecture Team
  - [Your Organization]
date: \today
---

\newpage

# Document Information

| Field | Value |
|-------|-------|
| **Document Title** | Architecture Analysis Report |
| **Project** | [Project Name] |
| **Version** | 1.0 |
| **Date** | \today |
| **Status** | Draft / Final |
| **Classification** | Internal / Confidential |

## Revision History

| Version | Date | Author | Changes |
|---------|------|--------|---------|
| 1.0 | 2026-02-06 | Architecture Team | Initial release |

## Distribution List

| Name | Role | Organization |
|------|------|--------------|
| [Name] | CTO | [Org] |
| [Name] | Lead Architect | [Org] |
| [Name] | Engineering Manager | [Org] |

\newpage

# Executive Summary

[Brief overview of the analysis - 1-2 paragraphs]

## Key Findings

- **Finding 1**: [Summary]
- **Finding 2**: [Summary]
- **Finding 3**: [Summary]

## Recommendations

1. **Recommendation 1**: [Brief description]
2. **Recommendation 2**: [Brief description]
3. **Recommendation 3**: [Brief description]

\newpage
```

---

## Report Section Template

For individual analysis reports:

```markdown
---
title: [Section Title]
subtitle: Architecture Analysis
---

# [Section Title]

## Overview

[Brief introduction to this section]

## Analysis Approach

[Methodology used for this analysis]

## Findings

### Finding 1: [Title]

**Category**: [Technology / Architecture / Process]  
**Severity**: [High / Medium / Low]  
**Status**: [Active / Resolved / Monitoring]

**Description**:
[Detailed description of the finding]

**Impact**:
- Impact area 1
- Impact area 2

**Evidence**:
```language
[Code sample or configuration]
```

**Diagram**:
![Finding Diagram](diagrams/finding-1.png)

**Recommendation**:
[Specific action to address this finding]

---

### Finding 2: [Title]

[Same structure as above]

## Summary

### Positive Aspects

- Aspect 1
- Aspect 2

### Areas for Improvement

- Area 1
- Area 2

## Next Steps

1. Step 1
2. Step 2
3. Step 3
```

---

## Combined Report Template

For merging multiple reports:

```markdown
---
title: Complete Architecture Analysis
author: Architecture Team
date: \today
abstract: |
  This document presents a comprehensive analysis of [Project Name]'s
  architecture, including technology stack, component design, integration
  patterns, data flows, dependencies, infrastructure, and recommendations.
---

\newpage

# Introduction

## Purpose

This analysis provides a comprehensive assessment of the current architecture
to identify strengths, weaknesses, and opportunities for improvement.

## Scope

The analysis covers:

- Technology stack and frameworks
- Component architecture
- Integration patterns
- Data flows
- Dependency management
- Infrastructure design
- Operational considerations

## Methodology

[Description of analysis approach]

\newpage

# Part 1: Technology Stack

\input{01-tech-stack-content.md}

\newpage

# Part 2: Component Architecture

\input{02-components-content.md}

\newpage

# Part 3: Integration Patterns

\input{03-integration-content.md}

\newpage

# Part 4: Data Flows

\input{04-data-flow-content.md}

\newpage

# Part 5: Dependencies

\input{05-dependencies-content.md}

\newpage

# Part 6: Infrastructure

\input{06-infrastructure-content.md}

\newpage

# Part 7: Recommendations

\input{07-recommendations-content.md}

\newpage

# Appendices

## Appendix A: Glossary

| Term | Definition |
|------|------------|
| API | Application Programming Interface |
| CQRS | Command Query Responsibility Segregation |
| DTO | Data Transfer Object |

## Appendix B: References

1. Architecture Decision Records (ADRs)
2. Technical Specifications
3. Design Documents

## Appendix C: Diagrams Index

[List of all diagrams with page references]
```

---

## LaTeX Style Template

For custom styling, save as `custom-style.tex`:

```latex
% Custom LaTeX styling for reports

% Colors
\usepackage{xcolor}
\definecolor{primary}{RGB}{44,62,80}
\definecolor{accent}{RGB}{52,152,219}
\definecolor{warning}{RGB}{230,126,34}
\definecolor{success}{RGB}{39,174,96}

% Custom title formatting
\usepackage{titlesec}
\titleformat{\chapter}[display]
  {\normalfont\huge\bfseries\color{primary}}
  {\chaptertitlename\ \thechapter}{20pt}{\Huge}
\titleformat{\section}
  {\normalfont\Large\bfseries\color{primary}}
  {\thesection}{1em}{}
\titleformat{\subsection}
  {\normalfont\large\bfseries\color{accent}}
  {\thesubsection}{1em}{}

% Custom boxes for callouts
\usepackage{tcolorbox}
\tcbuselibrary{skins,breakable}

\newtcolorbox{infobox}{
  colback=accent!5!white,
  colframe=accent!75!black,
  title=Information,
  breakable
}

\newtcolorbox{warningbox}{
  colback=warning!5!white,
  colframe=warning!75!black,
  title=Warning,
  breakable
}

\newtcolorbox{successbox}{
  colback=success!5!white,
  colframe=success!75!black,
  title=Success,
  breakable
}

% Better code listings
\usepackage{listings}
\lstset{
  basicstyle=\ttfamily\small,
  breaklines=true,
  frame=single,
  backgroundcolor=\color{gray!10}
}
```

---

## Metadata Template

Save as `metadata.json`:

```json
{
  "$schema": "https://schema.org/Report",
  "report": {
    "title": "Architecture Analysis Report",
    "subtitle": "[Project Name]",
    "version": "1.0",
    "status": "draft",
    "classification": "internal",
    "generated_at": "2026-02-06T10:30:00Z",
    "generated_by": {
      "tool": "pdf-report",
      "version": "1.0",
      "agent": "AI Architecture Assistant"
    },
    "project": {
      "name": "[Project Name]",
      "organization": "[Organization]",
      "repository": "https://github.com/org/project"
    },
    "authors": [
      {
        "name": "Architecture Team",
        "role": "Lead Architect",
        "email": "architect@example.com"
      }
    ],
    "reviewers": [
      {
        "name": "[Reviewer]",
        "role": "CTO",
        "reviewed_at": "2026-02-06"
      }
    ],
    "content": {
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
      "diagrams": 15,
      "pages": 100,
      "word_count": 25000
    },
    "output": {
      "combined_pdf": "analysis/pdf/architecture-analysis.pdf",
      "individual_pdfs": "analysis/pdf/*.pdf",
      "file_size_mb": 5.2
    },
    "configuration": {
      "tool": "pandoc",
      "engine": "pdflatex",
      "template": "report",
      "features": {
        "cover_page": true,
        "table_of_contents": true,
        "page_numbers": true,
        "syntax_highlighting": true
      }
    }
  }
}
```

---

## Batch Generation Script

Save as `generate-pdfs.sh`:

```bash
#!/bin/bash
# Batch PDF generation script

set -e

# Configuration
SOURCE_DIR="${1:-architecture-docs}"
OUTPUT_DIR="${2:-analysis/pdf}"
CONFIG_FILE="pdf-config.yml"

# Create output directory
mkdir -p "$OUTPUT_DIR"
mkdir -p "$OUTPUT_DIR/diagrams"

echo "=== PDF Report Generation ==="
echo "Source: $SOURCE_DIR"
echo "Output: $OUTPUT_DIR"
echo

# Step 1: Export diagrams
echo "Step 1: Exporting diagrams..."
./export-diagrams.sh "$SOURCE_DIR" "$OUTPUT_DIR/diagrams"

# Step 2: Update markdown references
echo "Step 2: Updating markdown references..."
for file in "$SOURCE_DIR"/*.md; do
    sed -i.bak 's|```mermaid|![Diagram](diagrams/\1.png)|g' "$file"
done

# Step 3: Generate individual PDFs
echo "Step 3: Generating individual PDFs..."
for file in "$SOURCE_DIR"/*.md; do
    basename=$(basename "$file" .md)
    echo "  - $basename.pdf"
    
    pandoc "$file" \
        --defaults="$CONFIG_FILE" \
        --metadata title="$(head -n1 "$file" | sed 's/^# //')" \
        -o "$OUTPUT_DIR/$basename.pdf"
done

# Step 4: Generate combined PDF
echo "Step 4: Generating combined PDF..."
cat "$SOURCE_DIR"/*.md > "$OUTPUT_DIR/combined-temp.md"

pandoc "$OUTPUT_DIR/combined-temp.md" \
    --defaults="$CONFIG_FILE" \
    --metadata title="Complete Architecture Analysis" \
    -o "$OUTPUT_DIR/architecture-analysis.pdf"

rm "$OUTPUT_DIR/combined-temp.md"

# Step 5: Restore markdown files
echo "Step 5: Restoring markdown files..."
for file in "$SOURCE_DIR"/*.md.bak; do
    mv "$file" "${file%.bak}"
done

# Step 6: Generate metadata
echo "Step 6: Generating metadata..."
cat > "$OUTPUT_DIR/metadata.json" << EOF
{
  "generated_at": "$(date -Iseconds)",
  "source_directory": "$SOURCE_DIR",
  "output_directory": "$OUTPUT_DIR",
  "files_generated": $(ls "$OUTPUT_DIR"/*.pdf | wc -l),
  "total_size_mb": $(du -sm "$OUTPUT_DIR" | cut -f1)
}
EOF

echo
echo "=== Generation Complete ==="
echo "Output directory: $OUTPUT_DIR"
echo "Files generated: $(ls "$OUTPUT_DIR"/*.pdf | wc -l)"
echo
ls -lh "$OUTPUT_DIR"/*.pdf
```

---

## README Template

Save as `analysis/pdf/README.md`:

```markdown
# Architecture Analysis Reports (PDF)

This directory contains PDF exports of architecture analysis reports.

## Contents

| File | Pages | Description |
|------|-------|-------------|
| architecture-analysis.pdf | 100 | Complete combined report |
| 01-tech-stack.pdf | 12 | Technology stack analysis |
| 02-components.pdf | 18 | Component architecture |
| 03-integration.pdf | 15 | Integration patterns |
| 04-data-flow.pdf | 14 | Data flow analysis |
| 05-dependencies.pdf | 10 | Dependency analysis |
| 06-infrastructure.pdf | 16 | Infrastructure design |
| 07-recommendations.pdf | 15 | Recommendations |

## Generation Details

- **Generated**: 2026-02-06
- **Tool**: PDF Report Generator v1.0
- **Source**: architecture-docs/
- **Total Size**: 5.2 MB

## Regeneration

To regenerate these PDFs:

```bash
# From repository root
./scripts/generate-pdfs.sh architecture-docs analysis/pdf
```

Or use the AI assistant:
```
"Export analysis to PDF"
```

## Distribution

These reports are intended for:
- Internal architecture review
- Stakeholder communication
- Documentation archive
- Audit purposes

**Classification**: Internal Use Only
```
