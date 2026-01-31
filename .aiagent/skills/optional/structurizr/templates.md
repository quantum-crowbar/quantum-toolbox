# Structurizr DSL Templates

Reusable patterns and snippets for C4 modeling.

---

## Workspace Templates

### Minimal Workspace

```dsl
workspace "System Name" "Brief description of the system" {

    model {
        user = person "User" "Description of the user"

        system = softwareSystem "System Name" "What the system does"

        user -> system "Uses"
    }

    views {
        systemContext system "Context" {
            include *
            autoLayout
        }

        styles {
            element "Person" {
                shape Person
                background #08427b
                color #ffffff
            }
            element "Software System" {
                background #1168bd
                color #ffffff
            }
        }
    }
}
```

### Standard Workspace

```dsl
workspace "System Name" "Brief description" {

    !identifiers hierarchical

    model {
        # ==================
        # People
        # ==================
        user = person "User" "End user of the system"
        admin = person "Administrator" "System administrator"

        # ==================
        # External Systems
        # ==================
        external = softwareSystem "External System" "Third-party service" "External"

        # ==================
        # Main System
        # ==================
        system = softwareSystem "System Name" "Description" {

            webapp = container "Web Application" "User interface" "React" "webapp"
            api = container "API" "Backend services" "Node.js"
            database = container "Database" "Data storage" "PostgreSQL" "database"
        }

        # ==================
        # Relationships
        # ==================
        user -> webapp "Uses" "HTTPS"
        admin -> webapp "Administers" "HTTPS"
        webapp -> api "Calls" "HTTPS/JSON"
        api -> database "Reads/writes" "SQL"
        api -> external "Integrates with" "HTTPS"
    }

    views {
        systemContext system "Context" {
            include *
            autoLayout
        }

        container system "Containers" {
            include *
            autoLayout
        }

        !include styles.dsl
    }
}
```

### Multi-File Workspace

**workspace.dsl**
```dsl
workspace "System Name" "Description" {

    !identifiers hierarchical

    model {
        !include model/people.dsl
        !include model/external.dsl
        !include model/system.dsl
        !include model/relationships.dsl
    }

    views {
        !include views/context.dsl
        !include views/containers.dsl
        !include views/styles.dsl
    }
}
```

**model/people.dsl**
```dsl
user = person "User" "End user"
admin = person "Admin" "Administrator"
```

**model/system.dsl**
```dsl
system = softwareSystem "Name" "Description" {
    !include containers.dsl
}
```

---

## Element Templates

### Person

```dsl
# Basic
user = person "User" "Description"

# With tags
admin = person "Administrator" "Manages the system" "admin,internal"

# Multiple roles
customer = person "Customer" "Places orders"
merchant = person "Merchant" "Sells products"
support = person "Support Agent" "Handles inquiries"
```

### Software System

```dsl
# Internal system
system = softwareSystem "My System" "Description" {
    # Containers go here
}

# External system
paymentGateway = softwareSystem "Stripe" "Payment processing" "External"
emailService = softwareSystem "SendGrid" "Email delivery" "External"

# Enterprise system
erp = softwareSystem "SAP ERP" "Enterprise resource planning" "External,Enterprise"
```

### Container

```dsl
# Web application
webapp = container "Web App" "User interface" "React" "webapp"
spa = container "SPA" "Single-page app" "Vue.js" "webapp"

# Mobile
mobileApp = container "Mobile App" "Native mobile" "Swift/Kotlin" "mobile"
hybridApp = container "Mobile App" "Hybrid mobile" "React Native" "mobile"

# API/Backend
api = container "API" "REST API" "Node.js/Express"
graphqlApi = container "GraphQL API" "Query API" "Apollo Server"
grpcService = container "gRPC Service" "Internal service" "Go"

# Database
postgres = container "Database" "Relational data" "PostgreSQL" "database"
mongo = container "Document Store" "Documents" "MongoDB" "database"
redis = container "Cache" "Caching layer" "Redis" "cache"

# Messaging
kafka = container "Event Bus" "Event streaming" "Kafka" "queue"
rabbitmq = container "Message Queue" "Task queue" "RabbitMQ" "queue"
sqs = container "Queue" "Message queue" "AWS SQS" "queue"

# Workers
worker = container "Worker" "Background jobs" "Node.js" "worker"
scheduler = container "Scheduler" "Cron jobs" "Node.js" "worker"

# Storage
s3 = container "Object Storage" "File storage" "AWS S3" "storage"
cdn = container "CDN" "Static assets" "CloudFront" "cdn"
```

### Component

```dsl
api = container "API" "Backend" "Node.js" {

    # Controllers/Handlers
    authController = component "Auth Controller" "Authentication" "Express Router"
    userController = component "User Controller" "User operations" "Express Router"

    # Services
    authService = component "Auth Service" "Auth logic" "TypeScript"
    userService = component "User Service" "User logic" "TypeScript"

    # Repositories
    userRepository = component "User Repository" "Data access" "Prisma"

    # Infrastructure
    logger = component "Logger" "Logging" "Winston"
    cache = component "Cache Client" "Caching" "ioredis"
}
```

---

## Relationship Templates

### Basic Relationships

```dsl
# Simple
user -> system "Uses"

# With technology
webapp -> api "Calls" "HTTPS/JSON"

# With description and technology
api -> database "Reads from and writes to" "PostgreSQL Wire Protocol"
```

### Common Patterns

```dsl
# User interactions
user -> webapp "Browses and purchases via" "HTTPS"
admin -> adminPortal "Manages via" "HTTPS"

# Frontend to backend
webapp -> api "Makes API calls to" "HTTPS/REST"
mobileApp -> api "Makes API calls to" "HTTPS/REST"

# Service to database
api -> database "Persists data in" "SQL/TCP"
api -> cache "Caches data in" "Redis Protocol"

# Service to service
orderService -> inventoryService "Checks availability via" "gRPC"
paymentService -> notificationService "Triggers notifications via" "AMQP"

# Async/Events
producer -> messageBroker "Publishes events to" "AMQP"
messageBroker -> consumer "Delivers events to" "AMQP"

# External integrations
api -> paymentGateway "Processes payments via" "HTTPS/REST"
worker -> emailService "Sends emails via" "SMTP"
```

### Component Relationships

```dsl
# Controller -> Service
authController -> authService "Delegates to"
userController -> userService "Delegates to"

# Service -> Service
orderService -> userService "Validates user via"
orderService -> inventoryService "Reserves inventory via"

# Service -> Repository
userService -> userRepository "Persists via"
orderService -> orderRepository "Persists via"

# Repository -> Database
userRepository -> database "Queries"
orderRepository -> database "Queries"
```

---

## View Templates

### System Context View

```dsl
systemContext system "SystemContext" {
    include *
    autoLayout tb
    description "System context diagram"
}

# Or with explicit includes
systemContext system "SystemContext" {
    include user
    include admin
    include system
    include paymentGateway
    include emailService
    autoLayout
}
```

### Container View

```dsl
container system "Containers" {
    include *
    autoLayout lr
    description "Container diagram showing building blocks"
}

# With external systems
container system "Containers" {
    include *
    include paymentGateway
    include emailService
    autoLayout
}
```

### Component View

```dsl
component api "APIComponents" {
    include *
    autoLayout
    description "Component diagram for API"
}

# Filtered
component api "APIControllers" {
    include element.tag==controller
    autoLayout
}
```

### Dynamic View

```dsl
dynamic system "PlaceOrder" "Order placement flow" {
    user -> webapp "1. Clicks 'Place Order'"
    webapp -> api "2. POST /orders"
    api -> inventoryService "3. Check availability"
    inventoryService -> api "4. Availability confirmed"
    api -> paymentGateway "5. Process payment"
    paymentGateway -> api "6. Payment successful"
    api -> database "7. Save order"
    api -> webapp "8. Order confirmation"
    webapp -> user "9. Display confirmation"

    autoLayout
    description "Shows the flow when a user places an order"
}
```

### Deployment View

```dsl
deploymentEnvironment "Production" {

    deploymentNode "AWS" "Cloud Provider" "" {

        deploymentNode "us-east-1" "Region" "" {

            deploymentNode "VPC" "" "AWS VPC" {

                deploymentNode "ECS" "Container Service" "AWS ECS" {
                    containerInstance api
                    containerInstance worker
                }

                deploymentNode "RDS" "Database" "AWS RDS" {
                    containerInstance database
                }
            }
        }

        deploymentNode "CloudFront" "CDN" "AWS CloudFront" {
            containerInstance webapp
        }
    }
}

deployment system "Production" "ProductionDeployment" {
    include *
    autoLayout
    description "Production deployment architecture"
}
```

---

## Style Templates

### Standard Styles

```dsl
styles {
    # Core elements
    element "Person" {
        shape Person
        background #08427b
        color #ffffff
    }

    element "Software System" {
        background #1168bd
        color #ffffff
        shape RoundedBox
    }

    element "Container" {
        background #438dd5
        color #ffffff
    }

    element "Component" {
        background #85bbf0
        color #000000
    }

    # External
    element "External" {
        background #999999
        color #ffffff
    }

    # Infrastructure
    element "database" {
        shape Cylinder
    }

    element "queue" {
        shape Pipe
    }

    element "cache" {
        shape Cylinder
        background #438dd5
    }

    # UI
    element "webapp" {
        shape WebBrowser
    }

    element "mobile" {
        shape MobileDeviceLandscape
    }

    # Relationships
    relationship "Relationship" {
        thickness 2
        color #707070
    }

    relationship "Async" {
        style dotted
        color #999999
    }
}
```

### Color Schemes

```dsl
# Blue theme (default)
styles {
    element "Person" { background #08427b }
    element "Software System" { background #1168bd }
    element "Container" { background #438dd5 }
    element "Component" { background #85bbf0 }
}

# Green theme
styles {
    element "Person" { background #0b5d1e }
    element "Software System" { background #2e7d32 }
    element "Container" { background #4caf50 }
    element "Component" { background #81c784 }
}

# Corporate theme
styles {
    element "Person" { background #333333 }
    element "Software System" { background #e91e63 }
    element "Container" { background #f06292 }
    element "Component" { background #f8bbd0 }
}
```

---

## Architecture Pattern Templates

### Three-Tier

```dsl
system = softwareSystem "Application" {
    presentation = container "Web UI" "User interface" "React"
    application = container "API" "Business logic" "Node.js"
    data = container "Database" "Data storage" "PostgreSQL" "database"
}

user -> presentation "Uses"
presentation -> application "Calls"
application -> data "Reads/writes"
```

### Microservices

```dsl
system = softwareSystem "Platform" {
    gateway = container "API Gateway" "Routing" "Kong"

    userService = container "User Service" "" "Node.js"
    orderService = container "Order Service" "" "Go"
    productService = container "Product Service" "" "Python"

    userDb = container "User DB" "" "PostgreSQL" "database"
    orderDb = container "Order DB" "" "PostgreSQL" "database"
    productDb = container "Product DB" "" "MongoDB" "database"

    messageBus = container "Message Bus" "" "Kafka" "queue"
}

user -> gateway "Uses"
gateway -> userService "Routes"
gateway -> orderService "Routes"
gateway -> productService "Routes"

userService -> userDb "Uses"
orderService -> orderDb "Uses"
productService -> productDb "Uses"

orderService -> messageBus "Publishes"
userService -> messageBus "Subscribes"
```

### Event-Driven

```dsl
system = softwareSystem "Event Platform" {
    producer = container "Event Producer" "" "Node.js"
    broker = container "Event Broker" "" "Kafka" "queue"
    consumer1 = container "Analytics Consumer" "" "Python"
    consumer2 = container "Notification Consumer" "" "Go"
}

producer -> broker "Publishes to"
broker -> consumer1 "Delivers to"
broker -> consumer2 "Delivers to"
```

### Serverless

```dsl
system = softwareSystem "Serverless App" {
    cdn = container "CDN" "Static hosting" "CloudFront" "cdn"
    spa = container "SPA" "Frontend" "React" "webapp"
    apiGateway = container "API Gateway" "HTTP routing" "AWS API Gateway"
    functions = container "Functions" "Business logic" "AWS Lambda"
    database = container "Database" "Data" "DynamoDB" "database"
}

user -> cdn "Requests"
cdn -> spa "Serves"
spa -> apiGateway "Calls"
apiGateway -> functions "Invokes"
functions -> database "Queries"
```

---

## Tag Reference

Common tags for filtering and styling:

```dsl
# Element types
"webapp"      # Web browser application
"mobile"      # Mobile application
"database"    # Data storage
"cache"       # Caching system
"queue"       # Message queue
"worker"      # Background worker
"storage"     # File/object storage
"cdn"         # Content delivery

# Characteristics
"External"    # Third-party system
"Legacy"      # Legacy system
"Deprecated"  # Being phased out
"Critical"    # Business critical

# Teams
"team-a"      # Owned by Team A
"team-b"      # Owned by Team B

# Security
"pii"         # Contains PII
"pci"         # PCI compliant
"internal"    # Internal only
```
