# Structurizr Skills Spec

Two complementary skills for C4 model work with Structurizr.

---

## Overview

| Skill | Purpose | Location |
|-------|---------|----------|
| **structurizr-export** | Convert analysis results to Structurizr DSL | `analysis-outputs/structurizr/` |
| **structurizr-authoring** | Create/update Structurizr workspaces | `skills/optional/structurizr/` |

---

## Skill 1: Structurizr Export (Analysis Output Adapter)

Part of the analysis outputs family - converts codebase analysis to C4 models.

### Location
```
skills/optional/analysis-outputs/structurizr/
├── README.md
└── templates.md
```

### Purpose

Transform analysis model data into Structurizr DSL workspace files.

### Input
Analysis model from `codebase-analysis` containing:
- Components and their responsibilities
- Dependencies between components
- External systems and integrations
- Technology choices
- Data stores

### Output
```
architecture/
├── workspace.dsl           # Main Structurizr workspace
├── model/
│   ├── people.dsl          # Users and actors (partial)
│   ├── systems.dsl         # Software systems (partial)
│   ├── containers.dsl      # Containers (partial)
│   └── components.dsl      # Components (partial)
└── views/
    ├── context.dsl         # System context views
    ├── containers.dsl      # Container views
    └── components.dsl      # Component views
```

### Templates

#### Workspace Template
```structurizr
workspace "{Project Name}" "{Description from analysis}" {

    !identifiers hierarchical

    model {
        # People (inferred from API consumers, auth patterns)
        {people_section}

        # Software Systems
        {system_name} = softwareSystem "{System Name}" "{Description}" {
            # Containers (from analysis.architecture.components where type=service)
            {containers_section}
        }

        # External Systems (from analysis.interfaces.integrations)
        {external_systems_section}

        # Relationships (from analysis.architecture.dependencies)
        {relationships_section}
    }

    views {
        systemContext {system_name} "Context" {
            include *
            autoLayout
        }

        container {system_name} "Containers" {
            include *
            autoLayout
        }

        # Component views per container
        {component_views_section}

        theme default
    }
}
```

#### Mapping Rules

| Analysis Model | Structurizr Element |
|----------------|---------------------|
| `architecture.components[type=service]` | Container |
| `architecture.components[type=module]` | Component |
| `interfaces.integrations[direction=outbound]` | External System |
| `data.entities[storage=*]` | Container (database) |
| `technologies.infrastructure[type=cache]` | Container (cache) |
| `technologies.infrastructure[type=queue]` | Container (queue) |

### Invocation
```
"Export analysis to Structurizr"
"Generate C4 model from analysis"
"Create Structurizr workspace"
```

---

## Skill 2: Structurizr Authoring (Full Skill)

Standalone skill for working with Structurizr workspaces directly.

### Location
```
skills/optional/structurizr/
├── README.md           # C4 model concepts, Structurizr DSL reference
├── workflows.md        # Creating, updating, reviewing workspaces
├── templates.md        # DSL templates for all diagram types
├── checklist.md        # C4 modeling checklist
└── examples.md         # Sample workspaces
```

### Purpose

Create, update, and maintain Structurizr workspaces for C4 architecture documentation.

### Capabilities

#### 1. Create New Workspace
Start from scratch with guided workflow:
- Define system scope
- Identify actors/users
- Map containers
- Detail components
- Add deployment views

#### 2. Update Existing Workspace
Modify existing `.dsl` files:
- Add new containers/components
- Update relationships
- Add views
- Refactor structure

#### 3. Review Workspace
Analyze existing workspace for:
- Completeness (all levels documented)
- Consistency (relationships match)
- Best practices (naming, descriptions)

#### 4. Generate from Code
Scan codebase and suggest additions:
- Find undocumented services
- Detect new dependencies
- Identify missing relationships

### Workflows

#### Create Workspace Workflow

```markdown
## Phase 1: Scope Definition

1. What is the system being documented?
2. What is the system boundary?
3. Who are the users/actors?

## Phase 2: Context Level (C1)

1. Identify external systems
2. Define relationships to/from external systems
3. Create system context view

## Phase 3: Container Level (C2)

1. List all containers (services, apps, databases, etc.)
2. Define container responsibilities
3. Map container-to-container relationships
4. Create container view

## Phase 4: Component Level (C3)

For each container needing detail:
1. List components within container
2. Define component responsibilities
3. Map component relationships
4. Create component view

## Phase 5: Deployment (Optional)

1. Define deployment environments
2. Map containers to infrastructure
3. Create deployment views
```

#### Update Workspace Workflow

```markdown
## Phase 1: Understand Current State

1. Read existing workspace.dsl
2. Identify what's documented
3. Note current structure

## Phase 2: Identify Changes

1. What needs to be added?
2. What needs to be modified?
3. What needs to be removed?

## Phase 3: Apply Changes

1. Make minimal, focused edits
2. Preserve existing style
3. Update related views

## Phase 4: Validate

1. Check DSL syntax
2. Verify relationships are bidirectional where needed
3. Ensure views include new elements
```

### Templates

#### Empty Workspace
```structurizr
workspace "System Name" "Brief description" {

    model {
        # People
        user = person "User" "Description"

        # Systems
        system = softwareSystem "System Name" "Description" {
            # Containers go here
        }

        # External Systems
        # external = softwareSystem "External" "Description" "Existing System"

        # Relationships
        user -> system "Uses"
    }

    views {
        systemContext system "Context" {
            include *
            autoLayout
        }

        theme default
    }
}
```

#### Container Template
```structurizr
container "Name" "Description" "Technology" {
    # Components (optional)
    component "Name" "Description" "Technology"
}
```

#### Relationship Patterns
```structurizr
# Sync call
source -> destination "Action" "Protocol"

# Async
source -> destination "Publishes events to" "Kafka"

# Database
service -> database "Reads from and writes to" "SQL"
```

#### View Templates
```structurizr
# System Context
systemContext system "Context" {
    include *
    autoLayout
}

# Container
container system "Containers" {
    include *
    autoLayout
}

# Component (for specific container)
component container "Components" {
    include *
    autoLayout
}

# Deployment
deployment system "Production" "Deployment" {
    include *
    autoLayout
}

# Dynamic (sequence-like)
dynamic system "UserLogin" "User login flow" {
    user -> webApp "Enters credentials"
    webApp -> api "POST /auth/login"
    api -> database "Validates credentials"
    autoLayout
}
```

### Checklist

```markdown
## C4 Model Completeness

### Context Level (C1)
- [ ] System boundary clearly defined
- [ ] All external systems identified
- [ ] All user types identified
- [ ] Relationships have verb descriptions
- [ ] System context view created

### Container Level (C2)
- [ ] All deployable units identified
- [ ] Technologies specified for each container
- [ ] Container responsibilities described
- [ ] Inter-container relationships mapped
- [ ] Container view created

### Component Level (C3)
- [ ] Key containers have component breakdown
- [ ] Component responsibilities clear
- [ ] Internal relationships documented
- [ ] Component views created

### Quality Checks
- [ ] Descriptions are meaningful (not just names)
- [ ] Technologies are specific (not "database" but "PostgreSQL")
- [ ] Relationships describe what happens (verbs)
- [ ] No orphan elements (everything in a view)
- [ ] Consistent naming conventions
```

### Invocation Patterns

```
"Create a Structurizr workspace for this project"
"Add a new container to the C4 model"
"Update the architecture diagram"
"Review the Structurizr workspace"
"What's missing from the C4 model?"
"Generate component diagram for {service}"
```

---

## Integration

### With Analysis
```
codebase-analysis → structurizr-export → workspace.dsl
```

### With Existing Workspace
```
existing workspace.dsl → structurizr-authoring → updated workspace.dsl
```

### Workflow
```
1. No workspace exists?
   → Use structurizr-authoring to create from scratch
   → OR run analysis + structurizr-export for bootstrap

2. Workspace exists, code changed?
   → Use structurizr-authoring to update
   → OR re-run analysis + compare/merge

3. Just need quick C4 from analysis?
   → Use structurizr-export only
```

---

## Implementation Plan

### Phase 1: Structurizr Authoring Skill
- [ ] Create skill directory structure
- [ ] README.md with C4 concepts and DSL reference
- [ ] workflows.md for create/update/review
- [ ] templates.md with all DSL patterns
- [ ] checklist.md for completeness
- [ ] examples.md with sample workspaces

### Phase 2: Structurizr Export Adapter
- [ ] Create adapter in analysis-outputs/
- [ ] Mapping rules from analysis model
- [ ] Templates for workspace generation
- [ ] Integration with codebase-analysis

---

## References

- [Structurizr DSL](https://docs.structurizr.com/dsl)
- [C4 Model](https://c4model.com/)
- [Structurizr DSL Cookbook](https://docs.structurizr.com/dsl/cookbook)
