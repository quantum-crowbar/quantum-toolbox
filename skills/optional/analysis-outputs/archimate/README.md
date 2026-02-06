# ArchiMate Adapter

Transforms codebase analysis into ArchiMate enterprise architecture model.

---

## Purpose

Generate enterprise architecture documentation using ArchiMate notation:

- **Application Layer**: Applications, services, interfaces
- **Technology Layer**: Infrastructure, platforms, networks
- **Business Layer**: Processes, actors, services (inferred)
- **Motivation Layer**: Goals, requirements (from analysis)

Useful for:
- Enterprise architecture teams
- TOGAF-aligned documentation
- Integration with EA tools (Archi, Sparx, etc.)
- Compliance and governance documentation

---

## Output Options

### PlantUML Output (Default)

```
{output-directory}/archimate/
├── overview.puml           # Full model overview
├── application-layer.puml  # Application components
├── technology-layer.puml   # Infrastructure components
└── views/
    ├── system-context.puml
    ├── application-cooperation.puml
    └── technology-usage.puml
```

### Open Exchange Format

```
{output-directory}/archimate/
└── model.archimate         # ArchiMate Open Exchange XML
```

---

## ArchiMate Mapping

### Application Layer

| Model Path | ArchiMate Element |
|------------|-------------------|
| `architecture.components[type=service]` | Application Component |
| `interfaces.apis[]` | Application Interface |
| `interfaces.events[]` | Application Event |
| `architecture.components[type=module]` | Application Function |
| `data.entities[]` | Data Object |

### Technology Layer

| Model Path | ArchiMate Element |
|------------|-------------------|
| `technologies.infrastructure[type=database]` | Technology Service (DB) |
| `technologies.infrastructure[type=cache]` | Technology Service (Cache) |
| `technologies.infrastructure[type=queue]` | Technology Service (Queue) |
| `technologies.frameworks[]` | System Software |
| Deployment info | Node, Device |

### Business Layer (Inferred)

| Source | ArchiMate Element |
|--------|-------------------|
| User types from auth | Business Actor |
| API groupings | Business Service |
| Data flows | Business Process |

### Motivation Layer

| Model Path | ArchiMate Element |
|------------|-------------------|
| `recommendations.immediate[]` | Requirement |
| `quality.*` | Assessment |
| Inferred from patterns | Principle |

---

## Required Model Sections

| Section | Required | Used For |
|---------|----------|----------|
| `meta` | Yes | Model metadata |
| `architecture` | Yes | Application layer |
| `technologies` | Yes | Technology layer |
| `interfaces` | Optional | Interfaces, events |
| `data` | Optional | Data objects |
| `quality` | Optional | Assessments |
| `recommendations` | Optional | Requirements |

---

## Invocation

```
"Generate ArchiMate model"
"Export to enterprise architecture format"
"Create ArchiMate documentation"
```

Or as part of multi-output:
```
"Analyze this codebase"
  ☑ ArchiMate model
```

---

## Configuration

### Output Format

```
What ArchiMate output format?

1. PlantUML (Recommended) - Human-readable, renders in docs
2. Open Exchange XML - Import into EA tools
3. Both - Generate both formats
```

Default: PlantUML

### Layer Scope

```
Which ArchiMate layers to include?

☑ Application Layer (always included)
☑ Technology Layer
☐ Business Layer (inferred)
☐ Motivation Layer
```

Default: Application + Technology

### View Types

```
Which views to generate?

☑ Layered View (full overview)
☑ Application Cooperation View
☑ Technology Usage View
☐ Information Structure View
☐ Implementation & Migration View
```

---

## ArchiMate Relationships

### Within Application Layer

| Relationship | From → To |
|--------------|-----------|
| Serving | Interface → Component |
| Realization | Component → Interface |
| Access | Function → Data Object |
| Flow | Component → Component |
| Triggering | Event → Function |

### Application to Technology

| Relationship | From → To |
|--------------|-----------|
| Serving | Tech Service → App Component |
| Realization | System Software → App Component |
| Assignment | Node → System Software |

### Cross-Layer

| Relationship | Description |
|--------------|-------------|
| Business → Application | Business Service realized by Application |
| Application → Technology | Application served by Technology |

---

## Example Output

### PlantUML Application Layer

```plantuml
@startuml application-layer
!include <archimate/Archimate>

title Application Layer - {meta.project_name}

' Application Components
Application_Component(userService, "User Service", "Handles user operations")
Application_Component(authService, "Auth Service", "Authentication logic")
Application_Component(orderService, "Order Service", "Order processing")

' Application Interfaces
Application_Interface(userApi, "User API", "REST /api/users")
Application_Interface(orderApi, "Order API", "REST /api/orders")

' Data Objects
Application_DataObject(userData, "User Data")
Application_DataObject(orderData, "Order Data")

' Relationships
Rel_Serving(userApi, userService)
Rel_Serving(orderApi, orderService)
Rel_Access_w(userService, userData)
Rel_Access_w(orderService, orderData)
Rel_Flow(orderService, userService, "validates user")

@enduml
```

### PlantUML Technology Layer

```plantuml
@startuml technology-layer
!include <archimate/Archimate>

title Technology Layer - {meta.project_name}

' Technology Services
Technology_Service(dbService, "PostgreSQL", "Primary database")
Technology_Service(cacheService, "Redis", "Caching layer")
Technology_Service(queueService, "RabbitMQ", "Message queue")

' System Software
Technology_SystemSoftware(nodejs, "Node.js", "Runtime")
Technology_SystemSoftware(express, "Express", "Web framework")

' Nodes (if deployment info available)
Technology_Node(appServer, "Application Server")
Technology_Node(dbServer, "Database Server")

' Relationships
Rel_Assignment(appServer, nodejs)
Rel_Serving(dbService, appServer)
Rel_Serving(cacheService, appServer)

@enduml
```

### Layered View

```plantuml
@startuml layered-view
!include <archimate/Archimate>

title Layered Architecture - {meta.project_name}

' Business Layer (inferred)
LAYOUT_LEFT_RIGHT()

Boundary(business, "Business Layer") {
    Business_Actor(user, "User")
    Business_Service(userMgmt, "User Management")
}

Boundary(application, "Application Layer") {
    Application_Component(userService, "User Service")
    Application_Interface(userApi, "User API")
    Application_DataObject(userData, "User Data")
}

Boundary(technology, "Technology Layer") {
    Technology_Service(db, "PostgreSQL")
    Technology_SystemSoftware(runtime, "Node.js")
}

' Cross-layer relationships
Rel_Realization(userService, userMgmt)
Rel_Serving(db, userService)
Rel_Composition(runtime, userService)

@enduml
```

---

## ArchiMate Open Exchange XML

For import into EA tools:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.opengroup.org/xsd/archimate/3.0/"
       identifier="{meta.project_id}"
       version="3.1">

    <name>{meta.project_name}</name>

    <elements>
        <!-- Application Components -->
        <element identifier="comp-1" xsi:type="ApplicationComponent">
            <name>User Service</name>
            <documentation>Handles user operations</documentation>
        </element>

        <!-- Technology Services -->
        <element identifier="tech-1" xsi:type="TechnologyService">
            <name>PostgreSQL</name>
        </element>
    </elements>

    <relationships>
        <relationship identifier="rel-1"
                      xsi:type="Serving"
                      source="tech-1"
                      target="comp-1"/>
    </relationships>

    <views>
        <!-- View definitions -->
    </views>
</model>
```

---

## Mapping Details

### Component Type to ArchiMate

| Component Type | ArchiMate Element | Rationale |
|----------------|-------------------|-----------|
| `service` | Application Component | Encapsulated behavior |
| `api` | Application Interface | Exposed service point |
| `module` | Application Function | Grouped behavior |
| `handler` | Application Process | Request handling |
| `repository` | Application Component | Data access encapsulation |

### Infrastructure to Technology

| Infrastructure Type | ArchiMate Element |
|--------------------|-------------------|
| `database` | Technology Service |
| `cache` | Technology Service |
| `queue` | Technology Service |
| `storage` | Artifact |
| `cdn` | Technology Service |

### Relationship Inference

```yaml
# From component dependencies
dependencies: → Flow relationship

# From API handlers
api_handler: → Serving relationship

# From data access
data_access: → Access relationship

# From infrastructure usage
infra_usage: → Serving relationship
```

---

## Limitations

ArchiMate model is inferred from code analysis:

- **Business Layer**: Approximate (derived from APIs and data)
- **Strategy Layer**: Not included (requires business input)
- **Implementation Layer**: Partial (from build/deploy info)

For complete enterprise architecture, supplement with:
- Business architecture input
- Strategic goals and drivers
- Organizational structure

---

## See Also

- [Templates](templates.md) - Output templates
- [codebase-analysis](../../codebase-analysis/) - Analysis engine
- [analysis-outputs](../_index.md) - Adapter family
- [ArchiMate Specification](https://pubs.opengroup.org/architecture/archimate3-doc/)
