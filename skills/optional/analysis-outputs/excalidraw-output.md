# Excalidraw Output Format

Guide for generating Excalidraw diagrams as analysis output.

---

## Overview

When `diagram_format` is set to `excalidraw`, generate `.excalidraw` JSON files instead of inline diagram code (Mermaid/PlantUML/ASCII).

**Benefits**:
- Hand-drawn aesthetic appeals to stakeholders
- Visual editing in VS Code with Excalidraw extension
- Collaboration via excalidraw.com
- Export to PNG/SVG for presentations

---

## File Structure

```
{docs-directory}/
└── {output-folder}/
    ├── index.md
    ├── diagrams/                    # Excalidraw source files
    │   ├── system-context.excalidraw
    │   ├── component-diagram.excalidraw
    │   ├── data-flow.excalidraw
    │   └── deployment.excalidraw
    └── analysis/
        └── *.md                     # Reference diagrams as images
```

---

## Markdown Reference

In markdown files, reference Excalidraw diagrams as images:

```markdown
## System Context

![System Context Diagram](./diagrams/system-context.excalidraw.png)

> Edit source: [system-context.excalidraw](./diagrams/system-context.excalidraw)
```

**Note**: The `.excalidraw.png` extension is a convention - VS Code Excalidraw extension auto-generates PNG previews.

---

## Excalidraw JSON Structure

Basic template for generating Excalidraw files:

```json
{
  "type": "excalidraw",
  "version": 2,
  "source": "https://excalidraw.com",
  "elements": [],
  "appState": {
    "gridSize": null,
    "viewBackgroundColor": "#ffffff"
  },
  "files": {}
}
```

---

## Element Types

### Rectangle (Component/Service)

```json
{
  "id": "component-1",
  "type": "rectangle",
  "x": 100,
  "y": 100,
  "width": 200,
  "height": 100,
  "strokeColor": "#1e1e1e",
  "backgroundColor": "#a5d8ff",
  "fillStyle": "solid",
  "strokeWidth": 2,
  "roughness": 1,
  "opacity": 100,
  "angle": 0,
  "seed": 12345,
  "version": 1,
  "versionNonce": 1,
  "isDeleted": false,
  "boundElements": [
    {"id": "text-1", "type": "text"}
  ],
  "link": null,
  "locked": false
}
```

### Text (Label)

```json
{
  "id": "text-1",
  "type": "text",
  "x": 150,
  "y": 140,
  "width": 100,
  "height": 25,
  "text": "API Gateway",
  "fontSize": 20,
  "fontFamily": 1,
  "textAlign": "center",
  "verticalAlign": "middle",
  "strokeColor": "#1e1e1e",
  "backgroundColor": "transparent",
  "containerId": "component-1",
  "originalText": "API Gateway"
}
```

### Arrow (Connection)

```json
{
  "id": "arrow-1",
  "type": "arrow",
  "x": 300,
  "y": 150,
  "width": 100,
  "height": 0,
  "strokeColor": "#1e1e1e",
  "backgroundColor": "transparent",
  "fillStyle": "solid",
  "strokeWidth": 2,
  "roughness": 1,
  "points": [[0, 0], [100, 0]],
  "startBinding": {
    "elementId": "component-1",
    "focus": 0,
    "gap": 1
  },
  "endBinding": {
    "elementId": "component-2",
    "focus": 0,
    "gap": 1
  },
  "startArrowhead": null,
  "endArrowhead": "arrow"
}
```

### Ellipse (Actor/Database)

```json
{
  "id": "actor-1",
  "type": "ellipse",
  "x": 50,
  "y": 50,
  "width": 80,
  "height": 80,
  "strokeColor": "#1e1e1e",
  "backgroundColor": "#b2f2bb",
  "fillStyle": "solid",
  "strokeWidth": 2,
  "roughness": 1
}
```

### Diamond (Decision)

```json
{
  "id": "decision-1",
  "type": "diamond",
  "x": 200,
  "y": 200,
  "width": 100,
  "height": 100,
  "strokeColor": "#1e1e1e",
  "backgroundColor": "#ffec99",
  "fillStyle": "solid"
}
```

---

## Color Palette

Recommended colors for architecture diagrams:

| Element Type | Background | Stroke |
|--------------|------------|--------|
| External System | `#ffc9c9` (red) | `#1e1e1e` |
| Internal Service | `#a5d8ff` (blue) | `#1e1e1e` |
| Database | `#b2f2bb` (green) | `#1e1e1e` |
| User/Actor | `#ffd8a8` (orange) | `#1e1e1e` |
| Container/Boundary | `#e9ecef` (gray) | `#868e96` |
| Decision | `#ffec99` (yellow) | `#1e1e1e` |

---

## Diagram Templates

### System Context

```json
{
  "type": "excalidraw",
  "version": 2,
  "source": "architecture-analysis",
  "elements": [
    {
      "id": "user",
      "type": "ellipse",
      "x": 50, "y": 200,
      "width": 80, "height": 80,
      "backgroundColor": "#ffd8a8",
      "boundElements": [{"id": "user-label", "type": "text"}]
    },
    {
      "id": "user-label",
      "type": "text",
      "x": 70, "y": 230,
      "text": "User",
      "containerId": "user"
    },
    {
      "id": "system",
      "type": "rectangle",
      "x": 250, "y": 175,
      "width": 200, "height": 130,
      "backgroundColor": "#a5d8ff",
      "boundElements": [{"id": "system-label", "type": "text"}]
    },
    {
      "id": "system-label",
      "type": "text",
      "x": 300, "y": 230,
      "text": "{System Name}",
      "containerId": "system"
    },
    {
      "id": "external",
      "type": "rectangle",
      "x": 550, "y": 175,
      "width": 150, "height": 130,
      "backgroundColor": "#ffc9c9",
      "boundElements": [{"id": "external-label", "type": "text"}]
    },
    {
      "id": "external-label",
      "type": "text",
      "x": 575, "y": 230,
      "text": "External\nSystem",
      "containerId": "external"
    },
    {
      "id": "arrow-user-system",
      "type": "arrow",
      "x": 130, "y": 240,
      "width": 120, "height": 0,
      "points": [[0, 0], [120, 0]],
      "startBinding": {"elementId": "user"},
      "endBinding": {"elementId": "system"},
      "endArrowhead": "arrow"
    },
    {
      "id": "arrow-system-external",
      "type": "arrow",
      "x": 450, "y": 240,
      "width": 100, "height": 0,
      "points": [[0, 0], [100, 0]],
      "startBinding": {"elementId": "system"},
      "endBinding": {"elementId": "external"},
      "endArrowhead": "arrow"
    }
  ],
  "appState": {
    "viewBackgroundColor": "#ffffff"
  }
}
```

### Component Diagram

Grid layout with connections:
- Position components in a grid (x: 100, 400, 700; y: 100, 300, 500)
- Use consistent 200x100 rectangles
- Connect with arrows using `startBinding` and `endBinding`

### Data Flow Diagram

Left-to-right flow:
- Input sources on left (x: 50)
- Processing in middle (x: 250-450)
- Storage/output on right (x: 650)
- Arrows showing data direction

---

## Generation Workflow

1. **Create elements array** based on architecture model
2. **Position elements** using grid layout
3. **Generate unique IDs** for each element
4. **Create bindings** between text and containers
5. **Add arrows** with start/end bindings
6. **Write JSON** to `.excalidraw` file
7. **Reference in markdown** as image

---

## VS Code Extension

Install: `pomdtr.excalidraw-editor`

Features:
- Edit `.excalidraw` files visually
- Auto-generate PNG previews
- Export to SVG/PNG
- Real-time collaboration (via excalidraw.com)

---

## Export for Presentations

For presentations requiring static images:

```bash
# Manual: Open in VS Code, export as PNG/SVG

# Automated: Use puppeteer script (advanced)
# See: https://github.com/excalidraw/excalidraw/discussions/3892
```

---

## Best Practices

1. **Consistent sizing**: Use 200x100 for components, 80x80 for actors
2. **Grid alignment**: Position at multiples of 50 for clean layouts
3. **Readable labels**: Keep text concise, use line breaks for multi-line
4. **Color coding**: Use consistent colors per element type
5. **White background**: Ensure good contrast for exports
6. **Seed values**: Use consistent seeds for reproducible hand-drawn style
