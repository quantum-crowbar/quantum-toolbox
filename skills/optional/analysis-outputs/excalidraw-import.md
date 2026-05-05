# Excalidraw Import — Analyse & Convert

Parse an existing `.excalidraw` file into a Mermaid diagram and optionally
feed the extracted component model into the `arch-analysis` skill.

---

## Triggers

```
"Analyse this excalidraw file"
"Import excalidraw diagram"
"Convert excalidraw to Mermaid"
"Use this excalidraw as architecture input"
"Parse my excalidraw diagram"
```

User must provide the `.excalidraw` file path or paste the JSON directly.

---

## Phase 1: Parse Elements

Read the `elements[]` array from the `.excalidraw` JSON.

### 1.1 Extract shapes

Collect all non-deleted shape elements:

```
For each element in elements where isDeleted = false:
  If type IN [rectangle, ellipse, diamond, diamond]:
    → candidate node
  If type = arrow:
    → candidate edge
  If type = text AND containerId is null:
    → free-floating label (may annotate a group/boundary)
  If type = text AND containerId is not null:
    → label belonging to containerId shape
```

### 1.2 Resolve labels

For each shape node, find its display name:
1. Look for a `text` element where `containerId = shape.id` → use `text.text`
2. If none, check if any free-floating text is visually near the shape (skip — too fragile; note as "unlabelled")
3. Sanitise: strip newlines, trim whitespace

### 1.3 Identify groups and boundaries

Excalidraw uses `frameId` or visual nesting (no explicit group type at schema level).

```
If element.frameId is set → element belongs to that frame/boundary
Read frame element label → boundary name (e.g. "Payment Service", "External")
```

---

## Phase 2: Map to Component Roles

Use the color palette from `excalidraw-output.md` as the primary heuristic.
When color is ambiguous or missing, use shape type as a secondary signal.

### Color → role mapping

| backgroundColor | Role | arch-analysis type |
|-----------------|------|--------------------|
| `#a5d8ff` (blue) | Internal service / component | `service` |
| `#ffc9c9` (red) | External system | `external` |
| `#b2f2bb` (green) | Database / data store | `datastore` |
| `#ffd8a8` (orange) | User / actor | `actor` |
| `#e9ecef` (gray) | Container boundary / grouping | `boundary` |
| `#ffec99` (yellow) | Decision / process step | `process` |
| `transparent` / none | Unknown — ask user | — |

### Shape → role fallback (when backgroundColor is unset or non-standard)

| Shape type | Default role assumption |
|------------|------------------------|
| `rectangle` | `service` |
| `ellipse` | `actor` |
| `diamond` | `process` |

### Arrows → relationships

| Arrow fields | Relationship |
|-------------|-------------|
| `startBinding.elementId` → `endBinding.elementId` | `from` calls/uses `to` |
| `label` text on arrow (if present) | relationship label |
| `startArrowhead: null`, `endArrowhead: arrow` | directed (from → to) |
| both arrowheads set | bidirectional |

---

## Phase 3: Disambiguation Dialogue

Before generating output, surface any unknowns and confirm the mapping.

```
─────────────────────────────────────────────────────────────
  Excalidraw Import — Confirm component mapping
─────────────────────────────────────────────────────────────

  Identified {N} components, {M} relationships.

  Mapping (confirm or correct):

  Shape                  | Colour     | Mapped as
  ───────────────────────────────────────────────
  {label}                | {colour}   | {role}
  {label}                | none       | ⚠ unknown — type to correct
  ...

  Unlabelled shapes: {list of shape IDs with no resolved label}
    → These will be skipped unless you name them now.

  Boundaries / groups:
    {frame label} contains: {list of member labels}

  Correct anything above, or type "ok" to proceed.
─────────────────────────────────────────────────────────────
```

Apply any corrections the user makes before proceeding to Phase 4.

---

## Phase 4: Generate Mermaid

### 4.1 Choose diagram type

| Condition | Output type |
|-----------|-------------|
| Has `actor` nodes | `C4Context` |
| No actors, all services + boundaries | `C4Container` |
| Has `boundary` groups | `C4Container` |
| Flat (no boundaries, no actors) | `flowchart LR` |

### 4.2 Emit diagram

#### flowchart LR (default for flat diagrams)

```
flowchart LR
  {for each service node}
    {id}["{label}"]
  {for each datastore node}
    {id}[("{label}")]
  {for each external node}
    {id}("{label}")
  {for each actor node}
    {id}(("{label}"))
  {for each relationship}
    {from_id} -->|"{rel_label}"| {to_id}
    {from_id} --> {to_id}    ← if no label
```

#### C4Context (when actors present)

```
C4Context
  title {inferred title or "System Context"}
  {for each actor}
    Person({id}, "{label}")
  {for each external}
    System_Ext({id}, "{label}")
  {for each service (inside boundary or standalone)}
    System({id}, "{label}")
  {for each relationship}
    Rel({from_id}, {to_id}, "{rel_label}")
```

#### C4Container (when boundaries present)

```
C4Container
  title {boundary name}
  {for each boundary}
    Boundary({id}, "{label}") {
      {for each service in boundary}
        Container({id}, "{label}")
    }
  {for each external}
    System_Ext({id}, "{label}")
  {for each relationship}
    Rel({from_id}, {to_id}, "{rel_label}")
```

### 4.3 Write output file

Write to `{docs-directory}/diagrams/{source-filename}-mermaid.md` containing:

````markdown
# {source filename} — Mermaid Conversion

> Converted from `{source-filename}.excalidraw` on {date}

```mermaid
{diagram}
```

## Component inventory

| Name | Type | Connections |
|------|------|-------------|
{table rows from parsed model}
````

---

## Phase 5: Optional — Feed into arch-analysis

After Phase 4, offer:

```
  Mermaid diagram written to {output path}.

  Use this as a starting point for arch-analysis?
  This will pre-populate the component list in View 01
  (Technology Manifest) and the interface layer in View 02
  (Interface Specification) — saving the initial discovery phase.

  Y   Pre-populate and open arch-analysis scope dialogue
  N   Done — Mermaid file only
```

If **Y**:

1. Build a partial `architecture_model` from the parsed data:
   ```yaml
   architecture_model:
     components:
       {for each service/datastore node}
         - name: {label}
           type: {role}
           source: excalidraw-import
     interfaces:
       external_systems:
         {for each external node}
           - name: {label}
             source: excalidraw-import
     actors:
       {for each actor node}
         - name: {label}
           source: excalidraw-import
   ```
2. Pass this model into `arch-analysis` as pre-populated context
3. `arch-analysis` proceeds from Phase 2 (skip discovery — components already known)
4. Agent notes in View 01: "Component list pre-populated from excalidraw import — verify against source code"

If **N**: done. No further action.

---

## Limitations and Notes

- **Color conventions are opt-in** — files not created with the `excalidraw-output.md` palette will need manual correction in the Phase 3 dialogue
- **Freehand / sketch elements** (`freedraw` type) are ignored — they carry no structural meaning
- **Images embedded in `.excalidraw`** files are ignored
- **Nested groups** (where one frame contains another) are flattened to a single boundary level
- **Arrow labels** that span multiple lines are collapsed to a single space-joined string
- This does not modify the original `.excalidraw` file
