# Structurizr Adapter

Transforms codebase analysis into C4 model using Structurizr DSL.

---

## Purpose

Generate architecture-as-code using the C4 model and Structurizr DSL:

- **System Context**: External actors and systems
- **Containers**: Deployable units (APIs, databases, etc.)
- **Components**: Internal building blocks
- **Deployment**: Infrastructure mapping

Output can be:
- Rendered in Structurizr (cloud or on-premise)
- Exported to images via Structurizr CLI
- Version controlled alongside code

---

## Output

```
{output-directory}/
└── workspace.dsl          # Complete Structurizr workspace
```

Or with separate views:
```
{output-directory}/
├── workspace.dsl          # Main workspace definition
├── model.dsl              # System, containers, components
└── views.dsl              # Diagram definitions
```

---

## C4 Model Mapping

### Level 1: System Context

| Model Path | C4 Element |
|------------|------------|
| `meta.project_name` | Software System |
| `interfaces.integrations[direction=inbound]` | External Systems (upstream) |
| `interfaces.integrations[direction=outbound]` | External Systems (downstream) |
| Inferred from auth | Person (User types) |

### Level 2: Containers

| Model Path | C4 Element |
|------------|------------|
| `architecture.components[type=service]` | Container |
| `technologies.infrastructure[type=database]` | Container (Database) |
| `technologies.infrastructure[type=cache]` | Container (Cache) |
| `technologies.infrastructure[type=queue]` | Container (Message Queue) |

### Level 3: Components

| Model Path | C4 Element |
|------------|------------|
| `architecture.components[type=module]` | Component |
| `architecture.components[type=handler]` | Component |
| `architecture.components.dependencies[]` | Relationships |

### Relationships

| Model Path | C4 Relationship |
|------------|-----------------|
| `architecture.components[].dependencies[]` | "uses" |
| `interfaces.apis[]` | "exposes API" |
| `interfaces.integrations[]` | "calls" / "receives from" |
| `data.flows[]` | Data flow relationships |

---

## Required Model Sections

| Section | Required | Used For |
|---------|----------|----------|
| `meta` | Yes | Workspace metadata |
| `architecture.components` | Yes | Containers and components |
| `interfaces` | Yes | Relationships, external systems |
| `technologies.infrastructure` | Optional | Database/cache containers |
| `data` | Optional | Data flow annotations |

---

## Invocation

```
"Generate C4 model"
"Create Structurizr workspace"
"Export architecture to C4"
"Generate architecture diagrams as code"
```

Or as part of multi-output:
```
"Analyze this codebase"
  ☑ C4 model (Structurizr)
```

---

## Configuration

### Output Location

```
Where should I create the Structurizr workspace?
Default: ./architecture
```

### Workspace Style

```
What workspace style?

1. Single file - Everything in workspace.dsl
2. Split files - Separate model.dsl and views.dsl
```

Default: Single file

### Diagram Levels

```
Which C4 levels to generate?

☑ System Context (Level 1)
☑ Container (Level 2)
☑ Component (Level 3)
☐ Deployment (Level 4)
```

Default: Levels 1-3

---

## DSL Output Example

```dsl
workspace "{meta.project_name}" "{meta.description}" {

    model {
        # Users
        user = person "User" "End user of the system"
        admin = person "Admin" "System administrator"

        # External Systems
        paymentGateway = softwareSystem "Payment Gateway" "Processes payments" "External"
        emailService = softwareSystem "Email Service" "Sends emails" "External"

        # Main System
        system = softwareSystem "{meta.project_name}" "{meta.description}" {

            # Containers
            webApp = container "Web Application" "Serves the frontend" "React"
            api = container "API" "Backend REST API" "Node.js/Express"
            database = container "Database" "Stores application data" "PostgreSQL" "Database"
            cache = container "Cache" "Session and data cache" "Redis" "Cache"

            # Components (inside API container)
            api {
                userController = component "User Controller" "Handles user operations"
                authService = component "Auth Service" "Authentication logic"
                userRepository = component "User Repository" "Data access for users"
            }
        }

        # Relationships
        user -> webApp "Uses"
        webApp -> api "Makes API calls to" "HTTPS/JSON"
        api -> database "Reads from and writes to" "SQL"
        api -> cache "Caches data in" "Redis Protocol"
        api -> paymentGateway "Processes payments via" "HTTPS"
        api -> emailService "Sends emails via" "SMTP"

        # Component relationships
        userController -> authService "Uses"
        userController -> userRepository "Uses"
        userRepository -> database "Queries"
    }

    views {
        systemContext system "SystemContext" {
            include *
            autoLayout
        }

        container system "Containers" {
            include *
            autoLayout
        }

        component api "Components" {
            include *
            autoLayout
        }

        styles {
            element "Software System" {
                background #1168bd
                color #ffffff
            }
            element "Container" {
                background #438dd5
                color #ffffff
            }
            element "Component" {
                background #85bbf0
                color #000000
            }
            element "Database" {
                shape Cylinder
            }
            element "External" {
                background #999999
                color #ffffff
            }
            element "Person" {
                shape Person
                background #08427b
                color #ffffff
            }
        }
    }
}
```

---

## Mapping Rules

### Component Type to C4 Element

| Component Type | C4 Level | Element |
|----------------|----------|---------|
| `service` | Container | Application service |
| `api` | Container | API layer |
| `module` | Component | Logical module |
| `handler` | Component | Request handler |
| `repository` | Component | Data access |
| `library` | Component | Shared library |

### Infrastructure to Container

| Infrastructure Type | C4 Tag | Shape |
|--------------------|--------|-------|
| `database` | Database | Cylinder |
| `cache` | Cache | Cylinder |
| `queue` | Queue | Pipe |
| `storage` | Storage | Folder |

### Integration Direction to Relationship

| Direction | Relationship |
|-----------|--------------|
| `outbound` | System -> External "calls" |
| `inbound` | External -> System "sends to" |
| `bidirectional` | System <-> External |

---

## Advanced Features

### Deployment Views

If deployment info is available:

```dsl
deploymentEnvironment "Production" {
    deploymentNode "AWS" {
        deploymentNode "ECS" {
            containerInstance api
        }
        deploymentNode "RDS" {
            containerInstance database
        }
    }
}
```

### Custom Tags

Analysis-derived tags for filtering:

```dsl
element "Component" {
    tag "Auth" # From component responsibilities
    tag "Critical" # From error handling gaps
}
```

### Documentation

Include analysis findings:

```dsl
system {
    !docs docs/architecture
    !adrs docs/decisions
}
```

---

## Validation

Before generating DSL:

1. **Unique Names**: Ensure no duplicate component names
2. **Valid References**: All relationship targets exist
3. **Reasonable Scope**: Limit components per container (< 20)

---

## See Also

- [Templates](templates.md) - DSL templates
- [codebase-analysis](../../codebase-analysis/) - Analysis engine
- [analysis-outputs](../_index.md) - Adapter family
- [Structurizr DSL Reference](https://docs.structurizr.com/dsl)
