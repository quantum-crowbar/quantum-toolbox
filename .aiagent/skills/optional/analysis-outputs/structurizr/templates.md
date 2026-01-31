# Structurizr DSL Templates

Templates for generating C4 model workspaces from analysis model.

---

## Complete Workspace Template

```dsl
workspace "{meta.project_name}" "{meta.description}" {

    !identifiers hierarchical

    model {
        # ============================================
        # PEOPLE (Users/Actors)
        # ============================================
        {for user_type in inferred_user_types}
        {user_type.id} = person "{user_type.name}" "{user_type.description}"
        {/for}

        # ============================================
        # EXTERNAL SYSTEMS
        # ============================================
        {for integration in interfaces.integrations}
        {integration.id} = softwareSystem "{integration.name}" "{integration.purpose}" "External"
        {/for}

        # ============================================
        # MAIN SYSTEM
        # ============================================
        {meta.system_id} = softwareSystem "{meta.project_name}" "{meta.description}" {

            # ------------------------------------------
            # Containers
            # ------------------------------------------
            {for container in containers}
            {container.id} = container "{container.name}" "{container.description}" "{container.technology}" {container.tags}
            {/for}

            # ------------------------------------------
            # Components (per container)
            # ------------------------------------------
            {for container in containers where container.has_components}
            {container.id} {
                {for component in container.components}
                {component.id} = component "{component.name}" "{component.description}" "{component.technology}"
                {/for}
            }
            {/for}
        }

        # ============================================
        # RELATIONSHIPS
        # ============================================

        # User to System
        {for user_type in inferred_user_types}
        {user_type.id} -> {meta.system_id} "Uses"
        {/for}

        # User to Container
        {for user_container_rel in user_container_relationships}
        {user_container_rel.user} -> {user_container_rel.container} "{user_container_rel.description}"
        {/for}

        # Container to Container
        {for rel in container_relationships}
        {rel.source} -> {rel.target} "{rel.description}" "{rel.technology}"
        {/for}

        # Container to External System
        {for rel in external_relationships}
        {rel.source} -> {rel.target} "{rel.description}" "{rel.technology}"
        {/for}

        # Component to Component
        {for rel in component_relationships}
        {rel.source} -> {rel.target} "{rel.description}"
        {/for}
    }

    views {
        # ============================================
        # SYSTEM CONTEXT VIEW
        # ============================================
        systemContext {meta.system_id} "SystemContext" {
            include *
            autoLayout
            description "System context diagram showing {meta.project_name} and its interactions"
        }

        # ============================================
        # CONTAINER VIEW
        # ============================================
        container {meta.system_id} "Containers" {
            include *
            autoLayout
            description "Container diagram showing the high-level technical building blocks"
        }

        # ============================================
        # COMPONENT VIEWS (per container with components)
        # ============================================
        {for container in containers where container.has_components}
        component {container.id} "{container.name}Components" {
            include *
            autoLayout
            description "Component diagram for {container.name}"
        }
        {/for}

        # ============================================
        # STYLES
        # ============================================
        styles {
            element "Software System" {
                background #1168bd
                color #ffffff
                shape RoundedBox
            }
            element "External" {
                background #999999
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
            element "Person" {
                shape Person
                background #08427b
                color #ffffff
            }
            element "Database" {
                shape Cylinder
            }
            element "Cache" {
                shape Cylinder
                background #438dd5
            }
            element "Queue" {
                shape Pipe
            }
            element "WebBrowser" {
                shape WebBrowser
            }
            element "MobileApp" {
                shape MobileDeviceLandscape
            }
        }

        # ============================================
        # THEMES (optional)
        # ============================================
        # theme default
    }
}
```

---

## Model Section Templates

### People/Users Template

```dsl
# Inferred from authentication patterns
{if has_public_endpoints}
anonymousUser = person "Anonymous User" "Unauthenticated visitor"
{/if}

{if has_authenticated_endpoints}
authenticatedUser = person "User" "Authenticated application user"
{/if}

{if has_admin_endpoints}
admin = person "Administrator" "System administrator with elevated privileges"
{/if}

{for custom_role in interfaces.apis.auth.roles}
{custom_role.id} = person "{custom_role.name}" "{custom_role.description}"
{/for}
```

### External Systems Template

```dsl
# From interfaces.integrations
{for integration in interfaces.integrations}
{integration.sanitized_name} = softwareSystem "{integration.name}" "{integration.purpose}" {
    tags "External"
    {if integration.type == "database"}
    tags "External,Database"
    {/if}
}
{/for}
```

### Containers Template

```dsl
# Application containers from components
{for service in architecture.components where service.type == "service"}
{service.id} = container "{service.name}" "{service.responsibilities[0]}" "{service.technology}" {
    {if service.is_api}
    tags "API"
    {/if}
    {if service.is_web}
    tags "WebBrowser"
    {/if}
}
{/for}

# Infrastructure containers
{for infra in technologies.infrastructure}
{infra.id} = container "{infra.name}" "{infra.purpose}" "{infra.type}" {
    {if infra.type == "database"}
    tags "Database"
    {else if infra.type == "cache"}
    tags "Cache"
    {else if infra.type == "queue"}
    tags "Queue"
    {/if}
}
{/for}
```

### Components Template

```dsl
# Components within a container
{container.id} {
    {for module in architecture.components where module.container == container.id}
    {module.id} = component "{module.name}" "{module.responsibilities[0]}" "{module.technology}"
    {/for}
}
```

### Relationships Template

```dsl
# Component dependencies → relationships
{for component in architecture.components}
{for dep in component.dependencies}
{component.id} -> {dep.id} "uses"
{/for}
{/for}

# API handlers → container relationships
{for api in interfaces.apis}
{api.handler_component} -> {api.database_component} "reads/writes" "SQL"
{/for}

# External integrations
{for integration in interfaces.integrations}
{if integration.direction == "outbound"}
{integration.calling_component} -> {integration.id} "{integration.action}" "{integration.protocol}"
{else if integration.direction == "inbound"}
{integration.id} -> {integration.receiving_component} "{integration.action}" "{integration.protocol}"
{else}
{integration.component} -> {integration.id} "{integration.action}" "{integration.protocol}"
{integration.id} -> {integration.component} "responds" "{integration.protocol}"
{/if}
{/for}
```

---

## View Templates

### System Context View

```dsl
systemContext {system.id} "SystemContext" {
    include *
    # Include all users
    {for user in users}
    include {user.id}
    {/for}
    # Include all external systems
    {for external in external_systems}
    include {external.id}
    {/for}
    autoLayout tb
    description "The system context diagram for {meta.project_name}"
}
```

### Container View

```dsl
container {system.id} "Containers" {
    include *
    # Show external system interactions
    {for external in external_systems}
    include {external.id}
    {/for}
    autoLayout tb
    description "Container diagram showing the high-level shape of {meta.project_name}"
}
```

### Component View

```dsl
component {container.id} "{container.name}Components" {
    include *
    # Include related containers
    {for related in container.related_containers}
    include {related.id}
    {/for}
    autoLayout lr
    description "Component diagram for the {container.name}"
}
```

### Dynamic View (for key flows)

```dsl
dynamic {system.id} "{flow.name}" "{flow.description}" {
    {for step in flow.steps}
    {step.source} -> {step.target} "{step.description}"
    {/for}
    autoLayout
}
```

---

## Transformation Rules

### Identifier Sanitization

```
Input: "User Service"     → Output: userService
Input: "API Gateway"      → Output: apiGateway
Input: "PostgreSQL DB"    → Output: postgresqlDb
Input: "Redis Cache"      → Output: redisCache
```

Rules:
1. Remove special characters
2. Convert to camelCase
3. Ensure uniqueness (append number if needed)

### Technology Detection

```yaml
# Map from analysis to Structurizr technology strings
framework_mapping:
  express: "Node.js/Express"
  fastapi: "Python/FastAPI"
  spring: "Java/Spring Boot"
  rails: "Ruby on Rails"
  django: "Python/Django"
  nextjs: "Next.js"
  react: "React"
  vue: "Vue.js"

infrastructure_mapping:
  postgresql: "PostgreSQL"
  mysql: "MySQL"
  mongodb: "MongoDB"
  redis: "Redis"
  rabbitmq: "RabbitMQ"
  kafka: "Apache Kafka"
```

### Container Inference

```yaml
# When no explicit containers, infer from:
api_container:
  - Has interfaces.apis
  - Main application service

web_container:
  - Has frontend framework
  - Serves static assets

worker_container:
  - Has event consumers
  - Background processing

database_container:
  - From technologies.infrastructure[type=database]
```

---

## Multi-File Template

### workspace.dsl (root)

```dsl
workspace "{meta.project_name}" "{meta.description}" {
    !identifiers hierarchical
    !include model.dsl
    !include views.dsl
}
```

### model.dsl

```dsl
model {
    # People
    !include model/people.dsl

    # External systems
    !include model/external.dsl

    # Main system
    {system.id} = softwareSystem "{meta.project_name}" {
        !include model/containers.dsl
    }

    # Relationships
    !include model/relationships.dsl
}
```

### views.dsl

```dsl
views {
    !include views/system-context.dsl
    !include views/containers.dsl
    !include views/components.dsl
    !include views/styles.dsl
}
```

---

## Validation Checklist

Before outputting DSL:

- [ ] All identifiers are valid (alphanumeric, camelCase)
- [ ] No duplicate identifiers
- [ ] All relationship targets exist
- [ ] Container count reasonable (< 10 recommended)
- [ ] Component count per container reasonable (< 20)
- [ ] All external systems have relationships
- [ ] Styles applied to all element types used
