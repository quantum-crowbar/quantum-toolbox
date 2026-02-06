# Structurizr Model Checklist

Quick reference for C4 model completeness and quality.

---

## Workspace Setup

- [ ] Workspace has meaningful name
- [ ] Workspace has description
- [ ] `!identifiers hierarchical` for clarity
- [ ] File structure appropriate for size

---

## Level 1: System Context

### Elements

- [ ] Main software system defined
- [ ] All user types (people) identified
- [ ] All external systems identified
- [ ] Each element has a description

### Relationships

- [ ] User-to-system relationships defined
- [ ] System-to-external relationships defined
- [ ] Each relationship has a description
- [ ] Relationship direction is correct

### View

- [ ] System context view exists
- [ ] All elements visible
- [ ] Layout is readable
- [ ] Description provided

---

## Level 2: Container

### Elements

- [ ] All major containers identified
- [ ] Container types are clear (web, api, db, etc.)
- [ ] Technologies specified
- [ ] Appropriate tags applied
- [ ] Each container has description

### Container Types Checklist

| Type | Identified | Named | Tagged |
|------|------------|-------|--------|
| Web Application | | | |
| Mobile App | | | |
| API/Backend | | | |
| Database | | | |
| Cache | | | |
| Message Queue | | | |
| Worker/Jobs | | | |
| File Storage | | | |

### Relationships

- [ ] User-to-container relationships
- [ ] Container-to-container relationships
- [ ] Container-to-external relationships
- [ ] Technologies/protocols specified
- [ ] Descriptions are meaningful

### View

- [ ] Container view exists
- [ ] Shows all containers
- [ ] External systems shown where relevant
- [ ] Layout is readable

---

## Level 3: Component (if applicable)

### Selection

- [ ] Containers needing decomposition identified
- [ ] Level of detail appropriate

### Elements

- [ ] All significant components identified
- [ ] Components grouped by responsibility
- [ ] Technologies specified
- [ ] Each has description

### Component Categories

| Category | Examples | Covered |
|----------|----------|---------|
| Controllers/Handlers | API endpoints | |
| Services | Business logic | |
| Repositories | Data access | |
| Clients | External integrations | |
| Utilities | Cross-cutting | |

### Relationships

- [ ] Component-to-component relationships
- [ ] Component-to-external relationships
- [ ] Data flow is clear

### View

- [ ] Component view(s) exist
- [ ] Each container with components has view
- [ ] Layout is readable

---

## Relationships Quality

### Completeness

- [ ] No orphan elements (unconnected)
- [ ] All interactions represented
- [ ] Bidirectional flows shown (if applicable)

### Clarity

- [ ] Descriptions answer "what does A do to B?"
- [ ] Technology/protocol specified
- [ ] Avoid vague descriptions ("uses", "connects")

### Examples of Good vs Bad

| Bad | Good |
|-----|------|
| `user -> api` | `user -> api "Submits orders via" "HTTPS"` |
| `api -> db "uses"` | `api -> db "Persists order data to" "SQL"` |
| `service -> queue` | `service -> queue "Publishes events to" "AMQP"` |

---

## Views Quality

### Coverage

- [ ] System Context view
- [ ] Container view
- [ ] Component view (for complex containers)
- [ ] Dynamic views (for key flows)
- [ ] Deployment views (if infrastructure matters)

### Layout

- [ ] `autoLayout` or manual positioning
- [ ] Direction appropriate (tb, lr, etc.)
- [ ] No overlapping elements
- [ ] Readable at expected zoom

### Descriptions

- [ ] Each view has description
- [ ] Description explains purpose
- [ ] Target audience clear

---

## Styles Quality

### Element Styles

- [ ] People styled (Person shape)
- [ ] Software systems styled
- [ ] Containers styled
- [ ] Components styled (if used)
- [ ] External systems distinguishable
- [ ] Infrastructure shapes appropriate
  - [ ] Database: Cylinder
  - [ ] Queue: Pipe
  - [ ] Webapp: WebBrowser
  - [ ] Mobile: MobileDevice

### Color Consistency

- [ ] Color scheme consistent
- [ ] External systems different color
- [ ] Color conveys meaning (optional)

### Relationship Styles

- [ ] Async relationships distinguishable (optional)
- [ ] Different protocols styled (optional)

---

## Naming Conventions

### Elements

| Type | Convention | Example |
|------|------------|---------|
| Person | Role name | "Customer", "Admin" |
| System | Product name | "Order System" |
| Container | Type + Purpose | "Web Application", "Order API" |
| Component | Technical name | "OrderController", "PaymentService" |

### Identifiers

| Type | Convention | Example |
|------|------------|---------|
| Person | camelCase | `customer`, `adminUser` |
| System | camelCase | `orderSystem` |
| Container | camelCase | `webApp`, `orderApi` |
| Component | camelCase | `orderController` |

### Consistency Check

- [ ] All names follow convention
- [ ] No mixed conventions
- [ ] Identifiers match names (where sensible)

---

## Tags

### Standard Tags Applied

- [ ] `database` for data stores
- [ ] `queue` for message queues
- [ ] `cache` for caching systems
- [ ] `webapp` for web applications
- [ ] `mobile` for mobile apps
- [ ] `External` for external systems

### Custom Tags (optional)

- [ ] Team ownership tags
- [ ] Criticality tags
- [ ] Security tags

---

## Validation

### Syntax

```bash
structurizr-cli validate -workspace workspace.dsl
```

- [ ] No syntax errors
- [ ] No warnings
- [ ] All references resolve

### Semantic

- [ ] Model matches reality
- [ ] No outdated elements
- [ ] No missing elements
- [ ] Relationships are current

---

## Documentation

### In Workspace

- [ ] Workspace description
- [ ] View descriptions
- [ ] Complex relationships explained

### External

- [ ] README for the workspace
- [ ] How to run locally
- [ ] How to update
- [ ] Link to rendered diagrams

---

## Quick Quality Score

| Criterion | Score (0-2) |
|-----------|-------------|
| All elements have descriptions | |
| All relationships have descriptions | |
| Technologies specified | |
| Views exist for each level | |
| Styles applied consistently | |
| No orphan elements | |
| Naming is consistent | |
| Model matches current state | |
| **Total** | **/16** |

**Rating**:
- 14-16: Excellent
- 11-13: Good
- 8-10: Adequate
- Below 8: Needs improvement

---

## Before Commit Checklist

- [ ] Validate with CLI
- [ ] Preview locally
- [ ] All new elements have descriptions
- [ ] All new relationships have descriptions
- [ ] Views updated if needed
- [ ] Styles cover new elements
