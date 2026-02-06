# TOGAF Phase D: Technology Architecture

Guidelines for developing the technology infrastructure architecture.

---

## Overview

Phase D develops the Technology Architecture that hosts and enables the Information Systems from Phase C:

- **Infrastructure** - Compute, storage, networking
- **Platforms** - Containers, serverless, databases
- **Standards** - Technologies, protocols, security

```
Phase A (Vision) → Phase B (Business) → Phase C (Info Systems) → Phase D (Technology)
                                                                       ↑
                                                                  YOU ARE HERE
```

---

## When to Use This Skill

Use Phase D when you need to:

- Define infrastructure requirements
- Design deployment architectures
- Select technology platforms
- Establish technology standards
- Plan technology migrations
- Document technology landscapes

---

## Key Concepts

### Technology Architecture Layers

```
┌─────────────────────────────────────────────────────────────┐
│                  TECHNOLOGY ARCHITECTURE                     │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ┌─────────────────────────────────────────────────────┐   │
│  │                 APPLICATION LAYER                    │   │
│  │   (Applications from Phase C)                       │   │
│  └─────────────────────────────────────────────────────┘   │
│                          ▲                                  │
│  ┌─────────────────────────────────────────────────────┐   │
│  │                  PLATFORM LAYER                      │   │
│  │   Containers │ Serverless │ Databases │ Messaging   │   │
│  └─────────────────────────────────────────────────────┘   │
│                          ▲                                  │
│  ┌─────────────────────────────────────────────────────┐   │
│  │               INFRASTRUCTURE LAYER                   │   │
│  │   Compute │ Storage │ Network │ Security            │   │
│  └─────────────────────────────────────────────────────┘   │
│                          ▲                                  │
│  ┌─────────────────────────────────────────────────────┐   │
│  │                  PHYSICAL LAYER                      │   │
│  │   Data Centers │ Cloud Regions │ Edge Locations     │   │
│  └─────────────────────────────────────────────────────┘   │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Core Components

| Component | Description | Artifacts |
|-----------|-------------|-----------|
| **Compute** | Processing resources | Server catalog, container platforms |
| **Storage** | Data persistence | Storage inventory, backup policies |
| **Network** | Connectivity | Network diagrams, security zones |
| **Platforms** | Managed services | Platform catalog, service matrix |
| **Security** | Protection mechanisms | Security architecture, controls |
| **Operations** | Management & monitoring | Tooling inventory, runbooks |

---

## Technology Domains

### Compute

```
┌─────────────────────────────────────────────────────────────┐
│                      COMPUTE OPTIONS                         │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  Traditional VMs    │    Containers      │    Serverless   │
│                     │                    │                  │
│  ┌───────────┐      │  ┌───────────┐    │  ┌───────────┐  │
│  │    VM     │      │  │ Container │    │  │ Function  │  │
│  │   ┌───┐   │      │  │  ┌───┐    │    │  │    λ      │  │
│  │   │App│   │      │  │  │App│    │    │  │           │  │
│  │   └───┘   │      │  │  └───┘    │    │  │           │  │
│  │   ┌───┐   │      │  └───────────┘    │  └───────────┘  │
│  │   │ OS │   │      │                   │                  │
│  │   └───┘   │      │  Kubernetes/ECS   │  Lambda/Functions│
│  └───────────┘      │                    │                  │
│                     │                    │                  │
│  EC2/VMs           │                    │                  │
└─────────────────────────────────────────────────────────────┘
```

### Storage

| Type | Use Case | Examples |
|------|----------|----------|
| **Block** | Databases, VMs | EBS, Azure Disk |
| **Object** | Files, backups, media | S3, Azure Blob, GCS |
| **File** | Shared access | EFS, Azure Files |
| **Database** | Structured data | RDS, Aurora, Cloud SQL |
| **Cache** | Fast access | ElastiCache, Memorystore |

### Networking

```
┌─────────────────────────────────────────────────────────────┐
│                    NETWORK ARCHITECTURE                      │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  Internet                                                   │
│      │                                                      │
│      ▼                                                      │
│  ┌──────────────┐                                          │
│  │     CDN      │  (CloudFront, Cloudflare)                │
│  └──────┬───────┘                                          │
│         │                                                   │
│         ▼                                                   │
│  ┌──────────────┐                                          │
│  │  WAF / DDoS  │  (Shield, WAF)                          │
│  └──────┬───────┘                                          │
│         │                                                   │
│         ▼                                                   │
│  ┌──────────────────────────────────────────────────┐      │
│  │                      VPC                          │      │
│  │  ┌────────────────┐    ┌────────────────┐        │      │
│  │  │ Public Subnet  │    │ Private Subnet │        │      │
│  │  │   (ALB, NAT)   │───▶│ (Apps, DBs)    │        │      │
│  │  └────────────────┘    └────────────────┘        │      │
│  └──────────────────────────────────────────────────┘      │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Security Zones

| Zone | Purpose | Access |
|------|---------|--------|
| **DMZ** | Public-facing services | Internet accessible |
| **Application** | Business logic | Internal only |
| **Data** | Databases, storage | Application zone only |
| **Management** | Admin, monitoring | Restricted access |

---

## Platform Services

### Container Platform

```yaml
platform:
  orchestration: Kubernetes / ECS / AKS
  components:
    - name: "Container Runtime"
      options: [containerd, Docker]
    - name: "Service Mesh"
      options: [Istio, Linkerd, None]
    - name: "Ingress"
      options: [NGINX, Traefik, ALB]
    - name: "Secrets"
      options: [Vault, AWS Secrets Manager, K8s Secrets]
```

### Database Platform

| Pattern | Use Case | Technology Options |
|---------|----------|-------------------|
| **Relational** | Transactions, ACID | PostgreSQL, MySQL, Aurora |
| **Document** | Flexible schema | MongoDB, DynamoDB |
| **Key-Value** | Caching, sessions | Redis, Memcached |
| **Time Series** | Metrics, IoT | InfluxDB, TimescaleDB |
| **Graph** | Relationships | Neo4j, Neptune |
| **Search** | Full-text search | Elasticsearch, OpenSearch |

### Messaging Platform

```
┌─────────────────────────────────────────────────────────────┐
│                   MESSAGING OPTIONS                          │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  Message Queues        Event Streaming      Pub/Sub        │
│                                                             │
│  ┌───────────┐        ┌───────────┐       ┌───────────┐   │
│  │  RabbitMQ │        │   Kafka   │       │  SNS/SQS  │   │
│  │    SQS    │        │  Kinesis  │       │  Pub/Sub  │   │
│  └───────────┘        └───────────┘       └───────────┘   │
│                                                             │
│  Point-to-point       Log-based           Fan-out          │
│  Task queues          Event sourcing      Notifications    │
└─────────────────────────────────────────────────────────────┘
```

---

## Deployment Patterns

### Single Region

```
┌─────────────────────────────────────────┐
│              Region: us-east-1          │
│  ┌─────────┐  ┌─────────┐  ┌─────────┐ │
│  │  AZ-1a  │  │  AZ-1b  │  │  AZ-1c  │ │
│  │   App   │  │   App   │  │   App   │ │
│  │   DB    │  │   DB    │  │   DB    │ │
│  │(Primary)│  │(Replica)│  │(Replica)│ │
│  └─────────┘  └─────────┘  └─────────┘ │
└─────────────────────────────────────────┘
```

### Multi-Region Active-Passive

```
┌───────────────────┐     ┌───────────────────┐
│ Region: us-east-1 │     │ Region: us-west-2 │
│     (PRIMARY)     │────▶│    (STANDBY)      │
│   ┌───────────┐   │     │   ┌───────────┐   │
│   │    App    │   │     │   │    App    │   │
│   │    DB     │   │ Rep │   │    DB     │   │
│   │ (Active)  │   │─────│   │ (Passive) │   │
│   └───────────┘   │     │   └───────────┘   │
└───────────────────┘     └───────────────────┘
```

### Multi-Region Active-Active

```
       ┌─────────────────────────────────────┐
       │          Global Load Balancer       │
       └─────────────┬───────────────────────┘
                     │
        ┌────────────┴────────────┐
        │                         │
┌───────▼───────┐        ┌───────▼───────┐
│  us-east-1    │◄──────▶│  eu-west-1    │
│   (Active)    │  Sync  │   (Active)    │
│  ┌─────────┐  │        │  ┌─────────┐  │
│  │   App   │  │        │  │   App   │  │
│  │   DB    │  │        │  │   DB    │  │
│  └─────────┘  │        │  └─────────┘  │
└───────────────┘        └───────────────┘
```

---

## Technology Standards

### Selection Criteria

| Criterion | Weight | Questions |
|-----------|--------|-----------|
| **Fit** | High | Does it meet technical requirements? |
| **Maturity** | High | Is it production-ready? |
| **Support** | High | Is support available? |
| **Cost** | Medium | Is TCO acceptable? |
| **Skills** | Medium | Do teams have skills? |
| **Ecosystem** | Medium | Is integration easy? |
| **Future** | Low | Is it strategic direction? |

### Technology Radar

```
┌─────────────────────────────────────────────────────────────┐
│                    TECHNOLOGY RADAR                          │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│      ADOPT          TRIAL         ASSESS        HOLD       │
│    (Standard)     (Evaluate)     (Watch)      (Avoid)      │
│                                                             │
│   PostgreSQL      CockroachDB    Vitess       MySQL        │
│   Kubernetes      Nomad          Firecracker  Mesos        │
│   Kafka           Pulsar         NATS         ActiveMQ     │
│   React           Svelte         Qwik         Angular 1.x  │
│   Go              Rust           Zig          Perl         │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## Phase D Inputs

From previous phases:

| Input | Source | Usage |
|-------|--------|-------|
| Application Architecture | Phase C | Apps to host |
| Data Architecture | Phase C | Data stores needed |
| Integration Architecture | Phase C | Connectivity requirements |
| Non-functional requirements | Phase A | Performance, availability |
| Existing infrastructure | Baseline | Current state |

---

## Phase D Outputs

Deliverables from this phase:

| Output | Description | Audience |
|--------|-------------|----------|
| **Technology Catalog** | All technology components | Operations, architects |
| **Platform Architecture** | Container, database, messaging | Platform team |
| **Network Architecture** | Connectivity, security zones | Network team |
| **Deployment Architecture** | How applications deploy | DevOps, operations |
| **Security Architecture** | Controls, compliance | Security team |
| **Technology Standards** | Approved technologies | All teams |
| **Technology Gap Analysis** | Infrastructure gaps | Architecture Board |
| **Work Packages** | Projects to address gaps | PMO |

---

## Key Principles

1. **Cloud-First** - Prefer cloud services over self-managed
2. **Infrastructure as Code** - All infrastructure defined in code
3. **Immutable Infrastructure** - Replace, don't modify
4. **Defense in Depth** - Multiple security layers
5. **Design for Failure** - Assume components will fail
6. **Observability** - Built-in monitoring, logging, tracing

---

## Related Skills

- [Information Systems Architecture](../information-systems/) - Applications to host
- [Business Architecture](../business-architecture/) - Requirements source
- [Structurizr](../../structurizr/) - Deployment diagrams
- [Security Analysis](../../security-analysis/) - Security assessment

---

## References

- TOGAF 10 Chapter 20: Phase D - Technology Architecture
- AWS Well-Architected Framework
- Azure Architecture Center
- Google Cloud Architecture Framework
