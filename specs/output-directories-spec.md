# Output Directories Specification

Defines default output directories for skill-generated content.

---

## Overview

When skills generate files (analysis reports, presentations, diagrams, etc.), they output to standardized directories in the user's project. This creates a predictable structure and keeps generated content organized.

---

## Default Directories

| Output Type | Default Directory | Purpose |
|-------------|-------------------|---------|
| **Analysis** | `analysis/` | All architecture, security, and code analysis outputs |
| **Presentations** | `presentations/` | Generated slide decks (PPTX, PDF, HTML, Marp Markdown) |

---

## Analysis Directory Structure

```
analysis/
├── index.md                    # Executive summary and navigation
├── core-architecture/          # Canonical architecture docs (if using core-architecture adapter)
│   ├── baseline/
│   ├── target/
│   ├── gap-analysis/
│   ├── risk-analysis/
│   └── evolution-plan/
├── architecture-docs/          # Detailed analysis reports (if using architecture-docs adapter)
│   └── analysis/
│       ├── 01-technology-manifest.md
│       ├── 02-interface-specification.md
│       └── ...
├── security/                   # Security analysis outputs
│   └── compliance/             # Compliance framework reports
├── nonfunctional/              # Code quality and health reports
└── diagrams/                   # Generated diagrams (Excalidraw, exported images)
    ├── system-context.excalidraw
    ├── component-diagram.excalidraw
    └── exports/
        ├── system-context.png
        └── component-diagram.png
```

---

## Presentations Directory Structure

```
presentations/
├── {topic}/
│   ├── slides.md               # Marp markdown source
│   ├── diagrams/               # Presentation-specific diagrams
│   │   └── architecture.excalidraw
│   └── exports/                # Generated output files
│       ├── slides.pptx
│       ├── slides.pdf
│       └── slides.html
└── assets/                     # Shared presentation assets
    ├── logos/
    └── themes/
```

---

## User Confirmation Workflow

Before generating output, skills MUST:

1. **Display default directory**:
   ```
   Analysis output will be saved to: analysis/
   ```

2. **Ask for confirmation or alternative**:
   ```
   Is this correct, or would you prefer a different location?
   ```

3. **Accept user input** for custom directory name

4. **Create directory** if it doesn't exist

---

## Implementation Guidelines

### For Skills

Skills that generate output files should:

1. Check for existing output directory preference (if stored)
2. Propose default directory based on output type
3. Confirm with user before creating files
4. Use consistent subdirectory structure

### Example Confirmation Prompt

```markdown
I'll save the analysis output to `analysis/` in your project root.

This will create:
- analysis/index.md (summary)
- analysis/core-architecture/ (detailed docs)

Is this location correct, or would you like to use a different directory?
```

### Handling Existing Content

When output directory already exists:

1. **Inform user** of existing content
2. **Offer options**:
   - Overwrite (replace existing files)
   - Merge (add/update, keep existing)
   - New directory (create timestamped or alternate name)
3. **Default to merge** for incremental updates

---

## Skill-Specific Outputs

### codebase-analysis / arch-analysis

- Default: `analysis/architecture-docs/`
- Generates: 7 markdown reports + index

### core-architecture adapter

- Default: `analysis/core-architecture/`
- Generates: Canonical docs (baseline, target, gaps, risks, evolution)

### security-analysis

- Default: `analysis/security/`
- Subdirectory for compliance: `analysis/security/compliance/`

### nonfunctional-analysis

- Default: `analysis/nonfunctional/`
- Generates: Testing, config, performance, health reports

### presentation

- Default: `presentations/{topic}/`
- Generates: Marp markdown + exports (PPTX, PDF, HTML)

### structurizr adapter

- Default: `analysis/diagrams/` or `architecture/`
- Generates: `workspace.dsl`

---

## Rationale

### Why `analysis/` as root?

- Single location for all analysis outputs
- Easy to add to `.gitignore` if desired
- Separates generated content from source code
- Consistent across all analysis skills

### Why `presentations/` separate?

- Different lifecycle than analysis (may be shared externally)
- Often includes binary files (PPTX, images)
- Topic-based organization matches presentation workflow

### Why confirm with user?

- Project conventions vary
- Some projects may have existing `docs/` or `architecture/` directories
- User may want different names (e.g., `arch-docs/`, `slides/`)
- Prevents accidental overwrites

---

## Integration with .gitignore

Projects may want to ignore certain generated files:

```gitignore
# Ignore presentation exports (keep sources)
presentations/**/exports/
*.pptx
*.pdf

# Or ignore all analysis output
analysis/
```

Skills should NOT automatically modify `.gitignore`.
