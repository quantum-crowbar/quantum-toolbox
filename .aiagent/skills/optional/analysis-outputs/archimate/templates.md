# ArchiMate Templates

Templates for generating ArchiMate models from analysis.

---

## PlantUML Templates

### Full Model Template

```plantuml
@startuml {meta.project_name}-archimate
!include <archimate/Archimate>

title {meta.project_name} - ArchiMate Model
caption Generated: {meta.analysis_date}

' ============================================
' BUSINESS LAYER (Inferred)
' ============================================
Boundary(businessLayer, "Business Layer") {
    {for actor in inferred_actors}
    Business_Actor({actor.id}, "{actor.name}")
    {/for}

    {for service in inferred_business_services}
    Business_Service({service.id}, "{service.name}")
    {/for}

    {for process in inferred_processes}
    Business_Process({process.id}, "{process.name}")
    {/for}
}

' ============================================
' APPLICATION LAYER
' ============================================
Boundary(applicationLayer, "Application Layer") {
    ' Components
    {for component in architecture.components}
    Application_Component({component.id}, "{component.name}", "{component.responsibilities[0]}")
    {/for}

    ' Interfaces
    {for api in interfaces.apis}
    Application_Interface({api.id}, "{api.path}", "{api.method}")
    {/for}

    ' Events
    {for event in interfaces.events}
    Application_Event({event.id}, "{event.name}")
    {/for}

    ' Data Objects
    {for entity in data.entities}
    Application_DataObject({entity.id}, "{entity.name}")
    {/for}
}

' ============================================
' TECHNOLOGY LAYER
' ============================================
Boundary(technologyLayer, "Technology Layer") {
    ' Infrastructure Services
    {for infra in technologies.infrastructure}
    Technology_Service({infra.id}, "{infra.name}", "{infra.type}")
    {/for}

    ' System Software (Frameworks/Runtimes)
    {for framework in technologies.frameworks}
    Technology_SystemSoftware({framework.id}, "{framework.name} {framework.version}")
    {/for}

    ' Nodes (if deployment info available)
    {for node in deployment.nodes}
    Technology_Node({node.id}, "{node.name}")
    {/for}
}

' ============================================
' RELATIONSHIPS
' ============================================

' Business to Application
{for rel in business_app_relationships}
Rel_Realization({rel.app_component}, {rel.business_service})
{/for}

' Within Application Layer
{for component in architecture.components}
{for dep in component.dependencies}
Rel_Flow({component.id}, {dep.id})
{/for}
{/for}

' Interface to Component (Serving)
{for api in interfaces.apis}
Rel_Serving({api.id}, {api.handler_component})
{/for}

' Component to Data (Access)
{for component in architecture.components}
{for data_access in component.data_accesses}
Rel_Access_w({component.id}, {data_access.entity_id})
{/for}
{/for}

' Application to Technology (Serving)
{for infra in technologies.infrastructure}
{for component in infra.used_by}
Rel_Serving({infra.id}, {component.id})
{/for}
{/for}

@enduml
```

---

### Application Layer Template

```plantuml
@startuml application-layer
!include <archimate/Archimate>

title Application Layer - {meta.project_name}
caption Generated: {meta.analysis_date}

LAYOUT_LEFT_RIGHT()

' ============================================
' APPLICATION COMPONENTS
' ============================================
package "Services" {
    {for component in architecture.components where component.type == "service"}
    Application_Component({component.id}, "{component.name}") <<service>>
    {/for}
}

package "Modules" {
    {for component in architecture.components where component.type == "module"}
    Application_Function({component.id}, "{component.name}")
    {/for}
}

package "Handlers" {
    {for component in architecture.components where component.type == "handler"}
    Application_Process({component.id}, "{component.name}")
    {/for}
}

' ============================================
' APPLICATION INTERFACES
' ============================================
package "APIs" {
    {for api_group in grouped_apis}
    Application_Interface({api_group.id}, "{api_group.name}", "{api_group.base_path}")
    {/for}
}

package "Events" {
    {for event in interfaces.events}
    Application_Event({event.id}, "{event.name}")
    {/for}
}

' ============================================
' DATA OBJECTS
' ============================================
package "Data" {
    {for entity in data.entities}
    Application_DataObject({entity.id}, "{entity.name}")
    {/for}
}

' ============================================
' RELATIONSHIPS
' ============================================

' Service composition
{for component in architecture.components}
{for dep in component.dependencies}
Rel_Composition({component.id}, {dep.id})
{/for}
{/for}

' Interface serving
{for api_group in grouped_apis}
Rel_Serving({api_group.id}, {api_group.handler_id})
{/for}

' Event triggering
{for event in interfaces.events}
{for consumer in event.consumers}
Rel_Triggering({event.id}, {consumer.id})
{/for}
{/for}

' Data access
{for component in architecture.components}
{for entity in component.accessed_entities}
Rel_Access_rw({component.id}, {entity.id})
{/for}
{/for}

@enduml
```

---

### Technology Layer Template

```plantuml
@startuml technology-layer
!include <archimate/Archimate>

title Technology Layer - {meta.project_name}
caption Generated: {meta.analysis_date}

LAYOUT_TOP_DOWN()

' ============================================
' TECHNOLOGY SERVICES
' ============================================
package "Data Services" {
    {for infra in technologies.infrastructure where infra.type == "database"}
    Technology_Service({infra.id}, "{infra.name}", "Database")
    {/for}

    {for infra in technologies.infrastructure where infra.type == "cache"}
    Technology_Service({infra.id}, "{infra.name}", "Cache")
    {/for}
}

package "Messaging" {
    {for infra in technologies.infrastructure where infra.type == "queue"}
    Technology_Service({infra.id}, "{infra.name}", "Message Queue")
    {/for}
}

package "External Services" {
    {for integration in interfaces.integrations}
    Technology_Service({integration.id}, "{integration.name}", "External")
    {/for}
}

' ============================================
' SYSTEM SOFTWARE
' ============================================
package "Runtime & Frameworks" {
    {for lang in technologies.languages where lang.primary}
    Technology_SystemSoftware({lang.id}, "{lang.name} {lang.version}", "Language")
    {/for}

    {for framework in technologies.frameworks}
    Technology_SystemSoftware({framework.id}, "{framework.name}", "{framework.purpose}")
    {/for}
}

' ============================================
' NODES (if available)
' ============================================
{if deployment}
package "Infrastructure" {
    {for node in deployment.nodes}
    Technology_Node({node.id}, "{node.name}")
    {/for}
}
{/if}

' ============================================
' RELATIONSHIPS
' ============================================

' Framework on runtime
{for framework in technologies.frameworks}
Rel_Assignment({framework.runtime_id}, {framework.id})
{/for}

' Node assignments
{if deployment}
{for assignment in deployment.assignments}
Rel_Assignment({assignment.node_id}, {assignment.software_id})
{/for}
{/if}

@enduml
```

---

### Application Cooperation View

```plantuml
@startuml application-cooperation
!include <archimate/Archimate>

title Application Cooperation - {meta.project_name}

' Show how application components collaborate

{for component in architecture.components where component.type == "service"}
Application_Component({component.id}, "{component.name}")
{/for}

' Show data flows between components
{for flow in data.flows}
Rel_Flow({flow.source_component}, {flow.target_component}, "{flow.data_type}")
{/for}

' Show shared data objects
{for entity in shared_entities}
Application_DataObject({entity.id}, "{entity.name}")
{for accessor in entity.accessors}
Rel_Access_r({accessor.id}, {entity.id})
{/for}
{/for}

@enduml
```

---

### Technology Usage View

```plantuml
@startuml technology-usage
!include <archimate/Archimate>

title Technology Usage - {meta.project_name}

' Application components
{for component in key_components}
Application_Component({component.id}, "{component.name}")
{/for}

' Technology services they use
{for infra in technologies.infrastructure}
Technology_Service({infra.id}, "{infra.name}")
{/for}

' Usage relationships
{for usage in technology_usage}
Rel_Serving({usage.tech_id}, {usage.app_id}, "{usage.purpose}")
{/for}

@enduml
```

---

### Information Structure View

```plantuml
@startuml information-structure
!include <archimate/Archimate>

title Information Structure - {meta.project_name}

' Data objects with relationships

{for entity in data.entities}
Application_DataObject({entity.id}, "{entity.name}")
{/for}

' Relationships between data
{for rel in data.relationships}
{if rel.type == "one-to-many"}
Rel_Aggregation({rel.source_id}, {rel.target_id})
{else if rel.type == "one-to-one"}
Rel_Association({rel.source_id}, {rel.target_id})
{else}
Rel_Association({rel.source_id}, {rel.target_id})
{/if}
{/for}

' Data access by components
{for access in data_accesses}
{if access.type == "read"}
Rel_Access_r({access.component_id}, {access.entity_id})
{else if access.type == "write"}
Rel_Access_w({access.component_id}, {access.entity_id})
{else}
Rel_Access_rw({access.component_id}, {access.entity_id})
{/if}
{/for}

@enduml
```

---

## Open Exchange XML Template

```xml
<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.opengroup.org/xsd/archimate/3.0/"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xsi:schemaLocation="http://www.opengroup.org/xsd/archimate/3.0/ archimate3_Diagram.xsd"
       identifier="model-{meta.project_id}">

    <name xml:lang="en">{meta.project_name}</name>
    <documentation xml:lang="en">{meta.description}</documentation>

    <properties>
        <property propertyDefinitionRef="propdef-source">
            <value xml:lang="en">Code Analysis</value>
        </property>
        <property propertyDefinitionRef="propdef-date">
            <value xml:lang="en">{meta.analysis_date}</value>
        </property>
    </properties>

    <elements>
        <!-- ================================ -->
        <!-- APPLICATION LAYER ELEMENTS       -->
        <!-- ================================ -->

        {for component in architecture.components}
        <element identifier="{component.xml_id}" xsi:type="ApplicationComponent">
            <name xml:lang="en">{component.name}</name>
            <documentation xml:lang="en">{component.responsibilities.join(". ")}</documentation>
            <properties>
                <property propertyDefinitionRef="propdef-location">
                    <value>{component.location}</value>
                </property>
            </properties>
        </element>
        {/for}

        {for api in interfaces.apis}
        <element identifier="{api.xml_id}" xsi:type="ApplicationInterface">
            <name xml:lang="en">{api.method} {api.path}</name>
            <documentation xml:lang="en">{api.description}</documentation>
        </element>
        {/for}

        {for event in interfaces.events}
        <element identifier="{event.xml_id}" xsi:type="ApplicationEvent">
            <name xml:lang="en">{event.name}</name>
        </element>
        {/for}

        {for entity in data.entities}
        <element identifier="{entity.xml_id}" xsi:type="DataObject">
            <name xml:lang="en">{entity.name}</name>
            <documentation xml:lang="en">Fields: {entity.fields.map(f => f.name).join(", ")}</documentation>
        </element>
        {/for}

        <!-- ================================ -->
        <!-- TECHNOLOGY LAYER ELEMENTS        -->
        <!-- ================================ -->

        {for infra in technologies.infrastructure}
        <element identifier="{infra.xml_id}" xsi:type="TechnologyService">
            <name xml:lang="en">{infra.name}</name>
            <documentation xml:lang="en">{infra.purpose}</documentation>
        </element>
        {/for}

        {for framework in technologies.frameworks}
        <element identifier="{framework.xml_id}" xsi:type="SystemSoftware">
            <name xml:lang="en">{framework.name} {framework.version}</name>
        </element>
        {/for}
    </elements>

    <relationships>
        <!-- Component dependencies (Flow) -->
        {for component in architecture.components}
        {for dep in component.dependencies}
        <relationship identifier="rel-{component.id}-{dep.id}"
                      xsi:type="Flow"
                      source="{component.xml_id}"
                      target="{dep.xml_id}">
            <name xml:lang="en">uses</name>
        </relationship>
        {/for}
        {/for}

        <!-- Interface serving -->
        {for api in interfaces.apis}
        <relationship identifier="rel-{api.id}-serving"
                      xsi:type="Serving"
                      source="{api.xml_id}"
                      target="{api.handler_xml_id}"/>
        {/for}

        <!-- Technology serving application -->
        {for serving in tech_app_serving}
        <relationship identifier="rel-{serving.id}"
                      xsi:type="Serving"
                      source="{serving.tech_xml_id}"
                      target="{serving.app_xml_id}"/>
        {/for}

        <!-- Data access -->
        {for access in data_accesses}
        <relationship identifier="rel-{access.id}"
                      xsi:type="Access"
                      source="{access.component_xml_id}"
                      target="{access.entity_xml_id}"
                      accessType="{access.type}"/>
        {/for}
    </relationships>

    <organizations>
        <item>
            <label xml:lang="en">Application Layer</label>
            {for component in architecture.components}
            <item identifierRef="{component.xml_id}"/>
            {/for}
        </item>
        <item>
            <label xml:lang="en">Technology Layer</label>
            {for infra in technologies.infrastructure}
            <item identifierRef="{infra.xml_id}"/>
            {/for}
        </item>
    </organizations>

    <propertyDefinitions>
        <propertyDefinition identifier="propdef-source" type="string">
            <name xml:lang="en">Source</name>
        </propertyDefinition>
        <propertyDefinition identifier="propdef-date" type="string">
            <name xml:lang="en">Analysis Date</name>
        </propertyDefinition>
        <propertyDefinition identifier="propdef-location" type="string">
            <name xml:lang="en">Code Location</name>
        </propertyDefinition>
    </propertyDefinitions>

</model>
```

---

## Transformation Rules

### Element ID Generation

```yaml
# Sanitize names for XML IDs
rules:
  - Remove spaces, special characters
  - Prefix with layer indicator (app-, tech-, bus-)
  - Ensure uniqueness

examples:
  "User Service" → "app-user-service"
  "PostgreSQL" → "tech-postgresql"
  "Order Data" → "data-order"
```

### Relationship Type Selection

```yaml
# Model relationship → ArchiMate relationship
component_dependency: Flow
api_to_handler: Serving
component_to_entity: Access
infra_to_component: Serving
framework_to_runtime: Assignment
event_to_handler: Triggering
handler_to_event: Triggering
```

### Layer Assignment

```yaml
# Determine layer from component type
application_layer:
  - service, module, handler, repository
  - api, interface
  - event
  - data object

technology_layer:
  - database, cache, queue
  - framework, runtime
  - node, device

business_layer:
  - Inferred from API groups → Business Service
  - Inferred from auth roles → Business Actor
```

---

## Validation

Before generating output:

- [ ] All element IDs are valid XML identifiers
- [ ] No duplicate identifiers
- [ ] All relationship sources/targets exist
- [ ] Layer assignments are consistent
- [ ] Required elements present (at least one component)
