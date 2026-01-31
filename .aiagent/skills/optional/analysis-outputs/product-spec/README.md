# Product Specification Adapter

Transforms codebase analysis into product documentation.

---

## Purpose

Extract product-level documentation from code analysis:

- **Features**: What the product does (from APIs and components)
- **User Flows**: How users interact (from routes and handlers)
- **Data Model**: What data is managed (from entities)
- **Integrations**: External connections (from integrations)

Useful for:
- Product managers understanding technical capabilities
- Technical writers creating user documentation
- Stakeholders reviewing functionality
- New team members onboarding

---

## Output Structure

```
{docs-directory}/product-spec/
├── index.md              # Overview and navigation
├── features.md           # Feature inventory
├── user-flows.md         # User journey documentation
├── data-model.md         # Entity descriptions (user-friendly)
└── integrations.md       # External service connections
```

---

## Required Model Sections

| Section | Required | Used For |
|---------|----------|----------|
| `meta` | Yes | Product identification |
| `interfaces.apis` | Yes | Features, user flows |
| `architecture.components` | Yes | Feature grouping |
| `data.entities` | Optional | Data model |
| `interfaces.integrations` | Optional | Integration docs |
| `interfaces.events` | Optional | Async features |

---

## Model to Output Mapping

### Features (features.md)

Derived from APIs and components:

| Model Path | Output |
|------------|--------|
| `interfaces.apis[]` | Feature list by endpoint group |
| `architecture.components[type=service]` | Feature categories |
| `interfaces.events[]` | Async/background features |

**Grouping Logic**:
- Group APIs by path prefix (`/api/users/*` → User Management)
- Map to components that handle them
- Extract descriptions from handler analysis

### User Flows (user-flows.md)

Derived from route sequences:

| Model Path | Output |
|------------|--------|
| `interfaces.apis[]` | Flow steps |
| Route dependencies | Flow sequence |
| Auth requirements | Access control notes |

**Flow Extraction**:
- Identify CRUD patterns → standard flows
- Find multi-step operations → complex flows
- Map auth requirements → user types

### Data Model (data-model.md)

User-friendly entity documentation:

| Model Path | Output |
|------------|--------|
| `data.entities[]` | Entity descriptions |
| `data.entities[].fields[]` | Field explanations |
| `data.entities[].relationships[]` | Relationship diagram |
| `data.lifecycle[]` | Data lifecycle notes |

**Translation**:
- Technical field names → user-friendly labels
- Constraints → business rules
- Relationships → "belongs to", "has many"

### Integrations (integrations.md)

External service documentation:

| Model Path | Output |
|------------|--------|
| `interfaces.integrations[]` | Service list |
| Integration direction | Data flow description |
| Auth type | Security notes |

---

## Invocation

```
"Generate product specification"
"Extract product docs from code"
"Create feature documentation"
"Document what this product does"
```

Or as part of multi-output:
```
"Analyze this codebase"
  ☑ Product specification
```

---

## Configuration

### Output Directory

```
Where should I create the product specification?
Default: ./docs
```

Creates `product-spec/` inside specified directory.

### Detail Level

```
What level of detail?

1. Overview - High-level features only
2. Standard - Features with basic flows
3. Detailed - Full flows with data model
```

Default: Standard

### Audience

```
Who is the primary audience?

1. Technical - Include implementation details
2. Product - Focus on capabilities
3. Executive - High-level summary only
```

Default: Product

---

## Output Characteristics

### Language

- User-friendly terminology (not code names)
- Business value focus
- Action-oriented descriptions

### Structure

- Scannable with clear headings
- Tables for quick reference
- Diagrams for relationships

### Examples

Features output:
```markdown
## User Management

Manage user accounts and profiles.

| Feature | Description | Access |
|---------|-------------|--------|
| Registration | Create new user account | Public |
| Login | Authenticate existing user | Public |
| Profile Update | Modify user information | Authenticated |
| Password Reset | Reset forgotten password | Public |
```

User flow output:
```markdown
## New User Registration

**Actor**: Visitor
**Goal**: Create an account

### Steps

1. Navigate to registration page
2. Enter email and password
3. Verify email address
4. Complete profile setup

### Outcomes

- **Success**: User account created, redirected to dashboard
- **Failure**: Error message displayed, form preserved
```

---

## Limitations

This adapter extracts what the code **does**, not:
- Business requirements (why it was built)
- Future roadmap (what's planned)
- User research (who uses it)

For complete product documentation, supplement with:
- Product requirements documents
- User research findings
- Stakeholder interviews

---

## See Also

- [Templates](templates.md) - Output templates
- [codebase-analysis](../../codebase-analysis/) - Analysis engine
- [analysis-outputs](../_index.md) - Adapter family
