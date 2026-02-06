# Structurizr Authoring Skill

Create and maintain C4 architecture models using Structurizr DSL.

---

## Purpose

Enable architecture-as-code using the C4 model and Structurizr:

- **Create** new architecture models from scratch
- **Update** existing workspaces as systems evolve
- **Review** models for completeness and accuracy
- **Document** architecture decisions in diagrams

This skill focuses on **authoring** C4 models directly. For auto-generating models from code analysis, see the [structurizr export adapter](../analysis-outputs/structurizr/).

---

## C4 Model Overview

The C4 model provides four levels of abstraction:

```
Level 1: System Context
    └── Level 2: Container
            └── Level 3: Component
                    └── Level 4: Code (optional)
```

### Level 1: System Context

Shows the system in its environment with users and external systems.

**Elements**: Software System, Person, External System
**Question**: What is the system and who uses it?

### Level 2: Container

Shows high-level technology building blocks.

**Elements**: Container (web app, API, database, etc.)
**Question**: What are the major deployable units?

### Level 3: Component

Shows internal structure of a container.

**Elements**: Component (service, module, controller)
**Question**: How is the container organized internally?

### Level 4: Code (Optional)

Shows implementation details.

**Elements**: Class, Interface
**Question**: How is the component implemented?

---

## Structurizr DSL

### Basic Structure

```dsl
workspace "Name" "Description" {
    model {
        # Define elements
    }

    views {
        # Define diagrams
    }
}
```

### Core Concepts

| Concept | DSL Keyword | Description |
|---------|-------------|-------------|
| Person | `person` | Human user of the system |
| Software System | `softwareSystem` | Top-level system boundary |
| Container | `container` | Deployable unit (app, service, db) |
| Component | `component` | Internal building block |
| Relationship | `->` | Interaction between elements |

### Element Syntax

```dsl
# Person
user = person "User" "Description" "tag1,tag2"

# Software System
system = softwareSystem "Name" "Description" {
    # Containers go here
}

# Container
api = container "API" "Description" "Technology" "tag"

# Component (inside container block)
api {
    controller = component "Controller" "Description" "Technology"
}
```

### Relationship Syntax

```dsl
# Basic relationship
user -> system "Uses"

# With technology
api -> database "Reads/writes" "SQL/TCP"

# Bidirectional (define both)
serviceA -> serviceB "Calls"
serviceB -> serviceA "Responds"
```

---

## When to Use

### Create New Model

```
"Create C4 model for this system"
"Set up Structurizr workspace"
"Model the architecture"
```

### Update Existing

```
"Update the C4 model"
"Add new container to architecture"
"Update relationships in workspace"
```

### Review Model

```
"Review C4 model completeness"
"Check architecture diagrams"
"Validate workspace"
```

---

## Workspace Organization

### Recommended File Structure

```
architecture/
├── workspace.dsl           # Main workspace
├── model/
│   ├── people.dsl         # User definitions
│   ├── systems.dsl        # System definitions
│   └── relationships.dsl  # All relationships
├── views/
│   ├── context.dsl        # Context diagram
│   ├── containers.dsl     # Container diagram
│   └── components.dsl     # Component diagrams
└── styles.dsl             # Visual styling
```

### Single File (Simple)

```
architecture/workspace.dsl    # Everything in one file
```

### Using Includes

```dsl
workspace "System" {
    !include model/people.dsl
    !include model/systems.dsl

    views {
        !include views/context.dsl
        !include views/containers.dsl
    }
}
```

---

## Key Principles

### 1. Start High, Go Deep

Begin with System Context, then Container, then Component.

```
1. Define the system boundary first
2. Identify external actors and systems
3. Break down into containers
4. Detail components only where needed
```

### 2. Describe Relationships

Every relationship should answer: "What does A do to B?"

```dsl
# Bad: Vague
user -> api

# Good: Clear purpose
user -> api "Submits orders via" "HTTPS/JSON"
```

### 3. Use Consistent Naming

| Element | Convention | Example |
|---------|------------|---------|
| Person | Role name | "Customer", "Admin" |
| System | Product name | "Order Service" |
| Container | Type + purpose | "Web Application", "API Gateway" |
| Component | Technical name | "OrderController", "PaymentService" |

### 4. Tag for Filtering

Use tags to filter views:

```dsl
api = container "API" "REST API" "Node.js" "backend,critical"

views {
    container system {
        include element.tag==critical
    }
}
```

---

## View Types

### System Context View

```dsl
systemContext system "Context" {
    include *
    autoLayout
}
```

### Container View

```dsl
container system "Containers" {
    include *
    autoLayout
}
```

### Component View

```dsl
component api "API-Components" {
    include *
    autoLayout
}
```

### Dynamic View (Sequence)

```dsl
dynamic system "UserLogin" "Login flow" {
    user -> webApp "Enters credentials"
    webApp -> api "POST /login"
    api -> database "Validates"
    database -> api "Returns user"
    api -> webApp "JWT token"
}
```

### Deployment View

```dsl
deploymentEnvironment "Production" {
    deploymentNode "AWS" {
        deploymentNode "ECS" {
            containerInstance api
        }
    }
}
```

---

## Styling

### Element Styles

```dsl
styles {
    element "Software System" {
        background #1168bd
        color #ffffff
        shape RoundedBox
    }
    element "Container" {
        background #438dd5
        color #ffffff
    }
    element "Database" {
        shape Cylinder
    }
    element "Person" {
        shape Person
        background #08427b
        color #ffffff
    }
}
```

### Relationship Styles

```dsl
styles {
    relationship "Relationship" {
        thickness 2
        color #707070
        style dashed
    }
    relationship "Async" {
        style dotted
    }
}
```

### Using Tags for Styles

```dsl
# In model
database = container "DB" "PostgreSQL" "PostgreSQL" "database"

# In styles
styles {
    element "database" {
        shape Cylinder
        background #438dd5
    }
}
```

---

## Common Patterns

### Microservices

```dsl
softwareSystem "Platform" {
    gateway = container "API Gateway" "Routes requests" "Kong"
    userService = container "User Service" "User management" "Node.js"
    orderService = container "Order Service" "Order processing" "Go"
    database = container "Database" "Data storage" "PostgreSQL" "database"

    gateway -> userService "Routes to"
    gateway -> orderService "Routes to"
    userService -> database "Reads/writes"
    orderService -> database "Reads/writes"
}
```

### Event-Driven

```dsl
softwareSystem "Platform" {
    producer = container "Producer" "Publishes events" "Node.js"
    broker = container "Message Broker" "Event routing" "Kafka" "queue"
    consumer = container "Consumer" "Processes events" "Python"

    producer -> broker "Publishes to" "Kafka Protocol"
    broker -> consumer "Delivers to" "Kafka Protocol"
}
```

### Frontend + Backend

```dsl
softwareSystem "Application" {
    spa = container "SPA" "User interface" "React" "webapp"
    api = container "API" "Backend services" "Node.js"
    db = container "Database" "Data storage" "PostgreSQL" "database"

    user -> spa "Uses" "HTTPS"
    spa -> api "Calls" "HTTPS/JSON"
    api -> db "Reads/writes" "SQL"
}
```

---

## Integration

### With Codebase Analysis

Use analysis model to inform C4 model:
- `architecture.components` → Containers/Components
- `interfaces.apis` → Relationships
- `technologies.infrastructure` → Data stores

### With Architecture Documentation

C4 diagrams complement written documentation:
- Embed diagrams in architecture docs
- Reference components by name
- Link to detailed specs

---

## Tools

### Structurizr Lite (Local)

```bash
docker run -it --rm -p 8080:8080 \
  -v $(pwd)/architecture:/usr/local/structurizr \
  structurizr/lite
```

### Structurizr CLI

```bash
# Export to images
structurizr-cli export -workspace workspace.dsl -format plantuml

# Validate workspace
structurizr-cli validate -workspace workspace.dsl
```

### VS Code Extension

- Structurizr DSL syntax highlighting
- Live preview
- Validation

---

## References

- [Workflows](workflows.md) - Step-by-step procedures
- [Templates](templates.md) - DSL patterns and snippets
- [Checklist](checklist.md) - Model completeness
- [Examples](examples.md) - Sample workspaces
- [Structurizr DSL Reference](https://docs.structurizr.com/dsl)
- [C4 Model](https://c4model.com/)
