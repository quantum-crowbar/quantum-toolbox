# Structurizr Examples

Complete workspace examples for different architectures.

---

## Example 1: E-Commerce Platform

A typical online shopping platform.

```dsl
workspace "E-Commerce Platform" "Online shopping and order management system" {

    !identifiers hierarchical

    model {
        # ==================
        # People
        # ==================
        customer = person "Customer" "A person who browses and purchases products"
        admin = person "Administrator" "Manages products, orders, and users"

        # ==================
        # External Systems
        # ==================
        paymentGateway = softwareSystem "Stripe" "Handles payment processing" "External"
        emailService = softwareSystem "SendGrid" "Sends transactional emails" "External"
        shippingProvider = softwareSystem "ShipStation" "Manages shipping and fulfillment" "External"

        # ==================
        # E-Commerce System
        # ==================
        ecommerce = softwareSystem "E-Commerce Platform" "Allows customers to browse products and place orders" {

            # Frontend
            webApp = container "Web Application" "Provides the shopping experience" "React/Next.js" "webapp"
            adminPortal = container "Admin Portal" "Management interface" "React" "webapp"

            # Backend Services
            api = container "API Gateway" "Routes and authenticates requests" "Node.js/Express"
            productService = container "Product Service" "Product catalog management" "Node.js"
            orderService = container "Order Service" "Order processing and management" "Node.js"
            userService = container "User Service" "User accounts and authentication" "Node.js"
            searchService = container "Search Service" "Product search and filtering" "Elasticsearch"

            # Data Stores
            productDb = container "Product Database" "Product catalog" "PostgreSQL" "database"
            orderDb = container "Order Database" "Orders and transactions" "PostgreSQL" "database"
            userDb = container "User Database" "User accounts" "PostgreSQL" "database"
            cache = container "Cache" "Session and product cache" "Redis" "cache"

            # Async Processing
            messageQueue = container "Message Queue" "Async event processing" "RabbitMQ" "queue"
            notificationWorker = container "Notification Worker" "Sends emails and notifications" "Node.js" "worker"
            fulfillmentWorker = container "Fulfillment Worker" "Processes orders for shipping" "Node.js" "worker"
        }

        # ==================
        # Relationships
        # ==================

        # Customer interactions
        customer -> webApp "Browses products and places orders via" "HTTPS"
        admin -> adminPortal "Manages catalog and orders via" "HTTPS"

        # Frontend to API
        webApp -> api "Makes API calls to" "HTTPS/JSON"
        adminPortal -> api "Makes API calls to" "HTTPS/JSON"

        # API to services
        api -> productService "Routes product requests to" "HTTP"
        api -> orderService "Routes order requests to" "HTTP"
        api -> userService "Routes user requests to" "HTTP"
        api -> searchService "Routes search requests to" "HTTP"
        api -> cache "Checks session in" "Redis Protocol"

        # Services to databases
        productService -> productDb "Reads/writes products" "SQL"
        orderService -> orderDb "Reads/writes orders" "SQL"
        userService -> userDb "Reads/writes users" "SQL"
        productService -> searchService "Syncs products to" "HTTP"

        # Async flows
        orderService -> messageQueue "Publishes order events to" "AMQP"
        messageQueue -> notificationWorker "Delivers events to" "AMQP"
        messageQueue -> fulfillmentWorker "Delivers events to" "AMQP"

        # External integrations
        orderService -> paymentGateway "Processes payments via" "HTTPS/REST"
        notificationWorker -> emailService "Sends emails via" "HTTPS/REST"
        fulfillmentWorker -> shippingProvider "Creates shipments via" "HTTPS/REST"
    }

    views {
        systemContext ecommerce "SystemContext" {
            include *
            autoLayout
            description "System context showing the e-commerce platform and its environment"
        }

        container ecommerce "Containers" {
            include *
            autoLayout
            description "Container diagram showing the technical building blocks"
        }

        dynamic ecommerce "PlaceOrder" "Order placement flow" {
            customer -> webApp "1. Clicks 'Place Order'"
            webApp -> api "2. POST /orders"
            api -> orderService "3. Create order"
            orderService -> paymentGateway "4. Process payment"
            paymentGateway -> orderService "5. Payment confirmed"
            orderService -> orderDb "6. Save order"
            orderService -> messageQueue "7. Publish OrderCreated"
            messageQueue -> notificationWorker "8. Deliver event"
            notificationWorker -> emailService "9. Send confirmation email"
            api -> webApp "10. Order confirmation"

            autoLayout
            description "Shows the flow when a customer places an order"
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
            element "External" {
                background #999999
                color #ffffff
            }
            element "Container" {
                background #438dd5
                color #ffffff
            }
            element "database" {
                shape Cylinder
            }
            element "cache" {
                shape Cylinder
                background #438dd5
            }
            element "queue" {
                shape Pipe
            }
            element "webapp" {
                shape WebBrowser
            }
            element "worker" {
                shape Hexagon
            }
        }
    }
}
```

---

## Example 2: SaaS API Platform

A B2B API-first platform.

```dsl
workspace "API Platform" "B2B SaaS platform providing APIs for document processing" {

    !identifiers hierarchical

    model {
        # People
        developer = person "Developer" "Integrates with our APIs"
        endUser = person "End User" "Uses applications built on our platform"
        platformAdmin = person "Platform Admin" "Manages tenants and monitors usage"

        # External
        cloudStorage = softwareSystem "AWS S3" "Document storage" "External"
        authProvider = softwareSystem "Auth0" "Identity provider" "External"

        # Platform
        platform = softwareSystem "Document API Platform" "Provides document processing APIs" {

            # Public-facing
            apiGateway = container "API Gateway" "Authentication, rate limiting, routing" "Kong"
            developerPortal = container "Developer Portal" "Documentation and API keys" "React" "webapp"
            adminDashboard = container "Admin Dashboard" "Platform management" "React" "webapp"

            # Core Services
            documentApi = container "Document API" "Document CRUD operations" "Go"
            processingApi = container "Processing API" "Document transformations" "Python"
            webhookService = container "Webhook Service" "Event delivery" "Node.js"

            # Processing
            processingQueue = container "Processing Queue" "Job queue" "Redis" "queue"
            processingWorker = container "Processing Worker" "Document processing jobs" "Python" "worker"

            # Data
            metadataDb = container "Metadata DB" "Document metadata" "PostgreSQL" "database"
            usageDb = container "Usage DB" "API usage and billing" "PostgreSQL" "database"
            cacheLayer = container "Cache" "API response caching" "Redis" "cache"
        }

        # Relationships
        developer -> developerPortal "Gets API keys and docs from" "HTTPS"
        developer -> apiGateway "Calls APIs via" "HTTPS/REST"
        endUser -> apiGateway "Uses apps that call" "HTTPS"
        platformAdmin -> adminDashboard "Monitors and manages via" "HTTPS"

        developerPortal -> authProvider "Authenticates via" "OAuth 2.0"
        adminDashboard -> authProvider "Authenticates via" "OAuth 2.0"

        apiGateway -> documentApi "Routes to" "HTTP"
        apiGateway -> processingApi "Routes to" "HTTP"
        apiGateway -> cacheLayer "Checks cache" "Redis Protocol"

        documentApi -> metadataDb "Stores metadata in" "SQL"
        documentApi -> cloudStorage "Stores documents in" "S3 API"
        documentApi -> webhookService "Triggers events via" "HTTP"

        processingApi -> processingQueue "Queues jobs to" "Redis Protocol"
        processingQueue -> processingWorker "Delivers jobs to" "Redis Protocol"
        processingWorker -> cloudStorage "Reads/writes documents" "S3 API"
        processingWorker -> webhookService "Reports completion to" "HTTP"

        apiGateway -> usageDb "Logs usage to" "SQL"
    }

    views {
        systemContext platform "Context" {
            include *
            autoLayout
        }

        container platform "Containers" {
            include *
            autoLayout
        }

        dynamic platform "ProcessDocument" "Async document processing" {
            developer -> apiGateway "1. POST /documents/{id}/process"
            apiGateway -> processingApi "2. Route request"
            processingApi -> processingQueue "3. Queue job"
            processingApi -> apiGateway "4. Return job ID"
            apiGateway -> developer "5. 202 Accepted + job ID"
            processingQueue -> processingWorker "6. Deliver job"
            processingWorker -> cloudStorage "7. Process document"
            processingWorker -> webhookService "8. Report completion"
            webhookService -> developer "9. POST to callback URL"

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
            element "External" {
                background #999999
            }
            element "Container" {
                background #438dd5
                color #ffffff
            }
            element "database" {
                shape Cylinder
            }
            element "cache" {
                shape Cylinder
            }
            element "queue" {
                shape Pipe
            }
            element "webapp" {
                shape WebBrowser
            }
            element "worker" {
                shape Hexagon
            }
        }
    }
}
```

---

## Example 3: Microservices with Components

Showing component-level detail.

```dsl
workspace "Order Service" "Microservice for order management" {

    !identifiers hierarchical

    model {
        # People and systems
        customer = person "Customer" "Places orders"
        orderSystem = softwareSystem "Order Management" "Handles order lifecycle" {

            api = container "Order API" "REST API for orders" "Go" {

                # HTTP Layer
                httpHandler = component "HTTP Handler" "Request routing and validation" "Gin"
                authMiddleware = component "Auth Middleware" "JWT validation" "Gin Middleware"

                # Application Layer
                orderService = component "Order Service" "Order business logic" "Go"
                paymentService = component "Payment Service" "Payment integration" "Go"
                inventoryClient = component "Inventory Client" "Inventory service client" "Go"

                # Domain Layer
                orderAggregate = component "Order Aggregate" "Order domain model" "Go"
                orderRepository = component "Order Repository" "Order persistence" "Go"

                # Infrastructure
                dbClient = component "DB Client" "Database connection" "pgx"
                eventPublisher = component "Event Publisher" "Publishes domain events" "Go"
            }

            database = container "Order DB" "Order data" "PostgreSQL" "database"
            eventBus = container "Event Bus" "Domain events" "Kafka" "queue"
        }

        inventoryService = softwareSystem "Inventory Service" "Stock management" "External"
        paymentGateway = softwareSystem "Payment Gateway" "Payment processing" "External"

        # Container relationships
        customer -> api "Places orders via" "HTTPS/JSON"
        api -> database "Persists orders to" "SQL"
        api -> eventBus "Publishes events to" "Kafka"
        api -> inventoryService "Reserves stock via" "gRPC"
        api -> paymentGateway "Processes payments via" "HTTPS"

        # Component relationships
        httpHandler -> authMiddleware "Uses"
        httpHandler -> orderService "Delegates to"

        orderService -> paymentService "Uses for payment"
        orderService -> inventoryClient "Uses for stock"
        orderService -> orderAggregate "Creates/updates"
        orderService -> orderRepository "Persists via"
        orderService -> eventPublisher "Publishes events via"

        paymentService -> paymentGateway "Calls"
        inventoryClient -> inventoryService "Calls"
        orderRepository -> dbClient "Uses"
        dbClient -> database "Queries"
        eventPublisher -> eventBus "Publishes to"
    }

    views {
        systemContext orderSystem "Context" {
            include *
            autoLayout
        }

        container orderSystem "Containers" {
            include *
            autoLayout
        }

        component api "Components" {
            include *
            autoLayout lr
            description "Internal structure of the Order API"
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
            element "External" {
                background #999999
            }
            element "Container" {
                background #438dd5
                color #ffffff
            }
            element "Component" {
                background #85bbf0
                color #000000
            }
            element "database" {
                shape Cylinder
            }
            element "queue" {
                shape Pipe
            }
        }
    }
}
```

---

## Example 4: Deployment View

Showing infrastructure mapping.

```dsl
workspace "Deployed System" "System with deployment architecture" {

    !identifiers hierarchical

    model {
        user = person "User" "System user"

        system = softwareSystem "Application" {
            webApp = container "Web App" "Frontend" "React" "webapp"
            api = container "API" "Backend" "Node.js"
            database = container "Database" "Data" "PostgreSQL" "database"
            cache = container "Cache" "Caching" "Redis" "cache"
        }

        user -> webApp "Uses"
        webApp -> api "Calls"
        api -> database "Queries"
        api -> cache "Caches"

        # Deployment
        production = deploymentEnvironment "Production" {

            deploymentNode "AWS" "" "Amazon Web Services" {

                deploymentNode "CloudFront" "" "CDN" {
                    webAppInstance = containerInstance webApp
                }

                deploymentNode "us-east-1" "" "Region" {

                    deploymentNode "VPC" "" "Virtual Private Cloud" {

                        deploymentNode "ECS Cluster" "" "AWS ECS" "cluster" {

                            deploymentNode "API Service" "" "ECS Service" {
                                apiInstance = containerInstance api
                            }
                        }

                        deploymentNode "RDS" "" "AWS RDS" {
                            databaseInstance = containerInstance database
                        }

                        deploymentNode "ElastiCache" "" "AWS ElastiCache" {
                            cacheInstance = containerInstance cache
                        }
                    }
                }
            }
        }

        development = deploymentEnvironment "Development" {

            deploymentNode "Docker Desktop" "" "Local Docker" {

                deploymentNode "docker-compose" "" "" {
                    containerInstance webApp
                    containerInstance api
                    containerInstance database
                    containerInstance cache
                }
            }
        }
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

        deployment system production "Production" {
            include *
            autoLayout
            description "Production deployment on AWS"
        }

        deployment system development "Development" {
            include *
            autoLayout
            description "Local development environment"
        }

        styles {
            element "Person" {
                shape Person
                background #08427b
                color #ffffff
            }
            element "Container" {
                background #438dd5
                color #ffffff
            }
            element "database" {
                shape Cylinder
            }
            element "cache" {
                shape Cylinder
            }
            element "webapp" {
                shape WebBrowser
            }
            element "cluster" {
                shape Hexagon
            }
        }
    }
}
```

---

## Example 5: Minimal Startup

Quick start for a simple application.

```dsl
workspace "My App" "A simple web application" {

    model {
        user = person "User" "Application user"

        app = softwareSystem "My App" "Does useful things" {
            frontend = container "Frontend" "User interface" "React"
            backend = container "Backend" "API server" "Node.js"
            db = container "Database" "Data storage" "PostgreSQL" "database"
        }

        user -> frontend "Uses"
        frontend -> backend "Calls API"
        backend -> db "Reads/writes"
    }

    views {
        systemContext app "Context" {
            include *
            autoLayout
        }

        container app "Containers" {
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
            element "Container" {
                background #438dd5
                color #ffffff
            }
            element "database" {
                shape Cylinder
            }
        }
    }
}
```

This minimal example can be expanded as the system grows.
