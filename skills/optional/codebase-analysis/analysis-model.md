# Analysis Model Specification

Internal data model produced by codebase analysis. Output adapters consume this model to generate various formats.

---

## Overview

The analysis model is the structured output of codebase analysis. It captures everything discovered about a codebase in a format-agnostic way that can be transformed into:

- Architecture documentation
- Coding context (AGENTS.md, CONTEXT.md)
- Product specifications
- C4 models (Structurizr DSL)
- Enterprise models (ArchiMate)

---

## Model Structure

```yaml
analysis_model:
  # Metadata
  meta:
    project_name: string
    description: string
    repository: string
    commit: string
    analysis_date: string
    analyzer: string

  # Phase 1: Reconnaissance
  reconnaissance:
    documentation:
      - location: string        # File path
        type: string            # readme, api-doc, adr, inline, etc.
        coverage: string        # high, medium, low
        last_updated: string    # Date or "unknown"
        accuracy: string        # verified, unverified, outdated

  # Phase 2: Technology Discovery
  technologies:
    languages:
      - name: string
        version: string
        evidence: string[]      # File paths where detected
        primary: boolean        # Is this the primary language?

    frameworks:
      - name: string
        version: string
        purpose: string         # web, api, testing, etc.
        evidence: string[]

    libraries:
      - name: string
        version: string
        category: string        # utility, database, auth, etc.
        evidence: string[]

    infrastructure:
      - name: string
        type: string            # database, cache, queue, storage, etc.
        purpose: string
        evidence: string[]

    build_tools:
      - name: string
        config_file: string
        scripts: object         # Key build/test/deploy scripts

  # Phase 3: Interface Discovery
  interfaces:
    apis:
      - path: string
        method: string          # GET, POST, etc.
        handler: string         # File:line
        auth: string            # none, jwt, session, api_key, etc.
        request_schema: object
        response_schema: object
        description: string

    events:
      - name: string
        type: string            # published, consumed, both
        schema: object
        publishers: string[]    # Components that publish
        consumers: string[]     # Components that consume
        evidence: string[]

    integrations:
      - name: string
        direction: string       # inbound, outbound, bidirectional
        type: string            # rest, graphql, grpc, webhook, etc.
        auth: string
        base_url: string
        evidence: string[]

    cli:
      - command: string
        description: string
        handler: string         # File:line

  # Phase 4: Architecture Discovery
  architecture:
    components:
      - name: string
        type: string            # service, module, library, handler, etc.
        location: string        # Directory or file
        responsibilities: string[]
        dependencies: string[]  # Other component names
        interfaces: string[]    # API paths or event names exposed

    layers:
      - name: string            # presentation, api, domain, data, etc.
        components: string[]    # Component names in this layer
        boundaries: string      # How layer boundaries are enforced

    patterns:
      - name: string            # mvc, repository, factory, etc.
        where_used: string[]    # Locations where pattern is applied
        evidence: string[]

    structure:
      entry_points: string[]    # Main files, index files
      config_locations: string[]
      test_locations: string[]

  # Phase 5: Data Discovery
  data:
    entities:
      - name: string
        location: string        # Model/schema file
        fields:
          - name: string
            type: string
            constraints: string[]
        relationships:
          - target: string      # Other entity name
            type: string        # one-to-one, one-to-many, many-to-many
            foreign_key: string
        storage: string         # Table name, collection, etc.

    flows:
      - name: string
        source: string          # Entry point
        transformations: string[] # Processing steps
        destination: string     # Where data ends up
        data_types: string[]    # Entity names involved

    lifecycle:
      - entity: string
        create: string          # Where/how created
        read: string            # Where/how read
        update: string          # Where/how updated
        delete: string          # Where/how deleted
        retention: string       # Policy if known

  # Phase 6: Dependency Health
  dependencies:
    packages:
      - name: string
        current_version: string
        latest_version: string
        update_type: string     # major, minor, patch, up-to-date
        last_publish: string    # Date
        vulnerabilities:
          - id: string
            severity: string
            description: string
        license: string
        deprecated: boolean

    health_summary:
      total: number
      outdated: number
      vulnerable: number
      deprecated: number
      unmaintained: number      # No updates in 2+ years

  # Phase 7: Error Handling
  error_handling:
    patterns:
      - type: string            # try-catch, error-boundary, middleware, etc.
        location: string
        coverage: string        # Scope of what it handles

    propagation:
      - source: string          # Where errors originate
        handlers: string[]      # Where they're caught
        recovery: string        # How recovered/handled
        user_facing: boolean    # Does it reach users?

    gaps:
      - location: string
        risk: string            # high, medium, low
        description: string
        recommendation: string

    logging:
      framework: string
      levels: string[]          # error, warn, info, debug
      destinations: string[]    # console, file, service

  # Quality Indicators
  quality:
    documentation_coverage: string  # high, medium, low
    test_coverage: string           # high, medium, low, none
    type_safety: string             # strong, partial, none
    code_organization: string       # excellent, good, fair, poor

  # Recommendations
  recommendations:
    immediate:
      - priority: string        # critical, high, medium
        category: string        # security, architecture, maintainability
        finding: string
        recommendation: string
        location: string

    improvements:
      - category: string
        finding: string
        recommendation: string
```

---

## Model Sections by Analysis Phase

| Phase | Model Section | Description |
|-------|---------------|-------------|
| 1: Reconnaissance | `reconnaissance` | Documentation inventory |
| 2: Technology Stack | `technologies` | Languages, frameworks, libraries, infra |
| 3: Interface Mapping | `interfaces` | APIs, events, integrations, CLI |
| 4: Architecture Synthesis | `architecture` | Components, layers, patterns |
| 5: Data Flow | `data` | Entities, flows, lifecycle |
| 6: Dependency Health | `dependencies` | Package health, vulnerabilities |
| 7: Error Handling | `error_handling` | Error patterns, gaps |
| - | `quality`, `recommendations` | Cross-cutting findings |
| *adapter* | `extensions.sre` | SRE signals derived by architecture-docs View 08 |
| *optional* | `code_graph` | Function call graph (code-graph skill only) |

---

## Using the Model

### For Adapters

Each output adapter reads relevant sections of the model:

| Adapter | Primary Sections Used |
|---------|----------------------|
| architecture-docs | All sections |
| coding-context | `technologies`, `architecture`, `interfaces`, `quality` |
| product-spec | `interfaces`, `data`, `architecture.components` |
| structurizr | `architecture`, `interfaces`, `technologies.infrastructure` |
| archimate | All sections (maps to ArchiMate layers) |

### Model Population

The analysis workflow populates the model incrementally:

```
Phase 1 → reconnaissance populated
Phase 2 → technologies populated
Phase 3 → interfaces populated
Phase 4 → architecture populated
Phase 5 → data populated
Phase 6 → dependencies populated
Phase 7 → error_handling populated
Final   → quality, recommendations populated
```

### Partial Analysis

Adapters should handle partially populated models gracefully:
- Check if sections exist before accessing
- Provide sensible defaults or "Not analyzed" markers
- Document which phases are required for each adapter

---

## Evidence Tracking

Most model elements include `evidence` fields pointing to source files. This enables:

1. **Traceability** - Link findings back to code
2. **Verification** - Human can check accuracy
3. **Updates** - Know what to re-analyze when code changes

Evidence format: `file/path:line` or `file/path` for general references.

---

## Extension Points

The model can be extended for specific needs:

```yaml
# Custom extensions under 'extensions' key
extensions:
  security:
    # Security-specific analysis data
    auth_mechanisms: [...]
    sensitive_data: [...]

  performance:
    # Performance-specific data
    hotspots: [...]
    caching: [...]

  sre:
    # SRE-specific signals derived from existing model sections during View 08 generation.
    # Not a separate analysis phase — populated by the architecture-docs SRE adapter.
    observability:
      logging_detected: boolean
      metrics_detected: boolean
      tracing_detected: boolean
      structured_logging: boolean       # true if JSON/structured output detected
      metrics_libraries: string[]       # e.g. ["prom-client", "micrometer"]
      metrics_endpoints: string[]       # e.g. ["/metrics", "/actuator/prometheus"]
      tracing_libraries: string[]       # e.g. ["opentelemetry", "jaeger-client"]

    health_checks:
      - path: string                    # e.g. /health/live
        type: string                    # liveness | readiness | startup | general
        handler: string                 # file:line
        checks_dependencies: boolean    # true if it verifies DB, cache, etc.

    reliability_patterns:
      - name: string                    # circuit_breaker | retry | timeout | bulkhead | rate_limiter | fallback | idempotency
        detected: boolean
        library: string                 # e.g. "resilience4j", "opossum", "axios-retry"
        location: string                # file:line or component name
        evidence: string[]

    slo_readiness:
      availability_instrumented: boolean
      latency_instrumented: boolean
      throughput_instrumented: boolean
      saturation_instrumented: boolean

    deployment:
      feature_flags_detected: boolean
      feature_flag_library: string      # e.g. "launchdarkly", "unleash", "env-based"
      graceful_shutdown_detected: boolean
      rollback_capability: boolean      # migrations + versioned artifacts
      progressive_delivery: boolean     # canary / blue-green signals

    spofs:
      - component: string
        type: string                    # database | cache | queue | service
        mitigation: string              # replica | fallback | DLQ | "none"
        risk: string                    # high | medium | low
```

Output adapters can define their own extension schemas.

---

## code_graph Section (code-graph skill)

Populated by the optional `code-graph` skill. Not present in standard codebase analysis.

```yaml
analysis_model:
  code_graph:
    meta:
      node_count: number          # Total function/method nodes extracted
      edge_count: number          # Total call edges extracted
      extraction_method: string   # static | ai | mixed
      tool_used: string           # e.g. "ts-morph 21.0", "pyan3 0.7", "ai-only"
      backend: string             # yaml | sqlite
      generated: string           # ISO date

    nodes:
      - id: string                # Canonical: "file/path.ext:QualifiedName"
        type: string              # function | method | constructor | lambda | handler
        name: string              # Short function name
        qualified_name: string    # Class.method or module.function
        signature: string         # Full signature with types if available
        location: string          # file/path.ext:line
        fan_in: number            # Count of inbound call edges
        fan_out: number           # Count of outbound call edges
        cyclomatic_complexity: number
        is_entry_point: boolean   # True if HTTP/CLI/event/scheduler handler
        is_dead_code: boolean     # fan_in = 0 AND is_entry_point = false
        extraction_method: string # static | ai
        tags: string[]            # db | cache | external | auth | async | handler

    edges:
      - from: string              # Caller node id
        to: string                # Callee node id
        type: string              # call | import | implements | extends | instantiates
        call_site: string         # file/path.ext:line of the call
        is_dynamic: boolean       # True if resolved via interface/virtual dispatch
        is_conditional: boolean   # True if inside if/try/catch
        is_async: boolean         # True if async/await or Promise chain

    views:
      hot_nodes:                  # Pre-sorted by fan_in descending
        - id: string
          fan_in: number
          fan_out: number
          location: string

      dead_code:                  # fan_in = 0 AND is_entry_point = false
        - id: string
          location: string
          last_modified: string   # From git log, or "unknown"

      entry_point_traces:         # Depth-first path from each entry point to leaves
        - entry: string           # Entry point node id
          entry_type: string      # http | cli | event | scheduler | export
          path: string[]          # Ordered node ids from entry to leaf
          external_calls: string[] # Nodes tagged 'external' in path
          data_stores: string[]   # Nodes tagged 'db' or 'cache' in path

      cycles:                     # Circular call chains
        - nodes: string[]         # All node ids in the cycle

      complexity_hotspots:        # cyclomatic_complexity > 10, sorted desc
        - id: string
          cyclomatic_complexity: number
          location: string
```

> **SQLite backend**: When `meta.preferences.code_graph_backend = sqlite`, this section
> is omitted from the YAML model and the graph is stored in `code_graph.sqlite` instead.
> See `skills/optional/code-graph/workflows.md` for the SQLite schema.

---

## Example: Minimal Model

```yaml
analysis_model:
  meta:
    project_name: "acme-api"
    description: "REST API for Acme Corp"
    repository: "github.com/acme/api"
    commit: "abc123"
    analysis_date: "2024-01-15"

  technologies:
    languages:
      - name: "TypeScript"
        version: "5.0"
        primary: true
        evidence: ["package.json", "tsconfig.json"]

    frameworks:
      - name: "Express"
        version: "4.18"
        purpose: "web"
        evidence: ["package.json", "src/app.ts"]

  interfaces:
    apis:
      - path: "/api/users"
        method: "GET"
        handler: "src/routes/users.ts:15"
        auth: "jwt"

  architecture:
    components:
      - name: "UserController"
        type: "handler"
        location: "src/controllers/user.ts"
        responsibilities: ["Handle user CRUD operations"]
        dependencies: ["UserService", "AuthMiddleware"]
```

---

## Validation

Before passing to adapters, validate:

1. **Required fields** - `meta.project_name`, `meta.analysis_date`
2. **Reference integrity** - Component dependencies reference existing components
3. **Evidence exists** - File paths in evidence are valid

Adapters should validate their required sections on input.
