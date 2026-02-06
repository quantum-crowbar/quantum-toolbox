# Technology Architecture Templates

Artifact templates for TOGAF Phase D deliverables.

---

## Technology Catalog Template

```markdown
# Technology Catalog

**Organization**: {organization_name}
**Version**: {version}
**Date**: {date}

---

## Technology Summary

| Tech ID | Name | Category | Status | Owner |
|---------|------|----------|--------|-------|
| TECH-001 | {name} | {category} | {Adopt/Trial/Assess/Hold} | {owner} |

---

## Technology Details

### TECH-{number}: {Technology Name}

| Attribute | Value |
|-----------|-------|
| **Tech ID** | TECH-{number} |
| **Name** | {technology name} |
| **Category** | {Compute/Storage/Database/Messaging/Security/Observability} |
| **Vendor** | {vendor or "Open Source"} |
| **Version** | {current version} |
| **Status** | {Adopt/Trial/Assess/Hold} |
| **Owner** | {owning team} |

**Description**: {what this technology does}

**Use Cases**:
- {use case 1}
- {use case 2}

**Alternatives Considered**:
| Alternative | Reason Not Selected |
|-------------|---------------------|
| {alt 1} | {reason} |
| {alt 2} | {reason} |

**Standards**:
- Approved versions: {versions}
- Configuration standards: {link}
- Security requirements: {requirements}

**Dependencies**:
- {dependency 1}
- {dependency 2}
```

---

## Platform Architecture Template

```markdown
# Platform Architecture

**Organization**: {organization_name}
**Version**: {version}
**Date**: {date}

---

## Platform Overview

```
┌─────────────────────────────────────────────────────────────┐
│                    PLATFORM ARCHITECTURE                     │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ┌─────────────────────────────────────────────────────┐   │
│  │              DEVELOPER EXPERIENCE                    │   │
│  │   CI/CD │ GitOps │ Developer Portal │ Documentation │   │
│  └─────────────────────────────────────────────────────┘   │
│                                                             │
│  ┌─────────────────────────────────────────────────────┐   │
│  │                APPLICATION RUNTIME                   │   │
│  │   Container Platform │ Serverless │ Service Mesh    │   │
│  └─────────────────────────────────────────────────────┘   │
│                                                             │
│  ┌─────────────────────────────────────────────────────┐   │
│  │                  DATA PLATFORM                       │   │
│  │   Databases │ Caching │ Messaging │ Object Storage  │   │
│  └─────────────────────────────────────────────────────┘   │
│                                                             │
│  ┌─────────────────────────────────────────────────────┐   │
│  │                  OBSERVABILITY                       │   │
│  │   Metrics │ Logs │ Traces │ Alerts                  │   │
│  └─────────────────────────────────────────────────────┘   │
│                                                             │
│  ┌─────────────────────────────────────────────────────┐   │
│  │                    SECURITY                          │   │
│  │   Secrets │ Certificates │ IAM │ Network Policies   │   │
│  └─────────────────────────────────────────────────────┘   │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## Container Platform

| Component | Technology | Purpose |
|-----------|------------|---------|
| Orchestration | {Kubernetes/ECS} | Container scheduling |
| Runtime | {containerd/Docker} | Container execution |
| Ingress | {NGINX/Traefik/ALB} | Traffic routing |
| Service Mesh | {Istio/Linkerd/None} | Service communication |
| Secrets | {Vault/SecretsManager} | Secret management |

### Cluster Configuration

| Attribute | Value |
|-----------|-------|
| Provider | {EKS/AKS/GKE/Self-managed} |
| Version | {version} |
| Node Groups | {description} |
| Scaling | {cluster autoscaler config} |
| Networking | {CNI plugin} |

---

## Data Platform

| Service | Technology | Use Case |
|---------|------------|----------|
| Relational DB | {PostgreSQL/MySQL} | {use case} |
| Document DB | {MongoDB/DynamoDB} | {use case} |
| Cache | {Redis/Memcached} | {use case} |
| Search | {Elasticsearch/OpenSearch} | {use case} |
| Messaging | {Kafka/RabbitMQ/SQS} | {use case} |
| Object Storage | {S3/GCS/Azure Blob} | {use case} |

---

## Observability Stack

| Component | Technology | Purpose |
|-----------|------------|---------|
| Metrics | {Prometheus/CloudWatch} | Performance metrics |
| Logs | {ELK/CloudWatch Logs} | Log aggregation |
| Traces | {Jaeger/X-Ray} | Distributed tracing |
| Dashboards | {Grafana/CloudWatch} | Visualization |
| Alerts | {AlertManager/PagerDuty} | Incident notification |
```

---

## Network Architecture Template

```markdown
# Network Architecture

**Organization**: {organization_name}
**Version**: {version}
**Date**: {date}

---

## Network Diagram

```
                           Internet
                              │
                              ▼
                    ┌─────────────────┐
                    │   CloudFront    │
                    │      (CDN)      │
                    └────────┬────────┘
                             │
                    ┌────────▼────────┐
                    │      WAF        │
                    │  (Web Firewall) │
                    └────────┬────────┘
                             │
┌────────────────────────────▼────────────────────────────────┐
│                         VPC: {CIDR}                          │
│                                                              │
│  ┌─────────────────────────────────────────────────────┐    │
│  │               Public Subnets: {CIDRs}               │    │
│  │   ┌─────────┐    ┌─────────┐    ┌─────────┐        │    │
│  │   │   ALB   │    │   NAT   │    │   NAT   │        │    │
│  │   └────┬────┘    └─────────┘    └─────────┘        │    │
│  └────────┼────────────────────────────────────────────┘    │
│           │                                                  │
│  ┌────────▼────────────────────────────────────────────┐    │
│  │             Private App Subnets: {CIDRs}            │    │
│  │   ┌─────────┐    ┌─────────┐    ┌─────────┐        │    │
│  │   │  App    │    │  App    │    │  App    │        │    │
│  │   │  AZ-1   │    │  AZ-2   │    │  AZ-3   │        │    │
│  │   └────┬────┘    └────┬────┘    └────┬────┘        │    │
│  └────────┼──────────────┼──────────────┼──────────────┘    │
│           │              │              │                    │
│  ┌────────▼──────────────▼──────────────▼──────────────┐    │
│  │             Private Data Subnets: {CIDRs}           │    │
│  │   ┌─────────┐    ┌─────────┐    ┌─────────┐        │    │
│  │   │   DB    │    │   DB    │    │  Cache  │        │    │
│  │   │Primary  │    │Standby  │    │         │        │    │
│  │   └─────────┘    └─────────┘    └─────────┘        │    │
│  └─────────────────────────────────────────────────────┘    │
│                                                              │
└──────────────────────────────────────────────────────────────┘
```

---

## VPC Configuration

| Attribute | Value |
|-----------|-------|
| Region | {region} |
| VPC CIDR | {CIDR} |
| Availability Zones | {list} |
| DNS Resolution | Enabled |
| DNS Hostnames | Enabled |

---

## Subnet Design

| Subnet Type | CIDR | AZ | Purpose |
|-------------|------|-----|---------|
| Public | {CIDR} | {AZ} | Load balancers, NAT |
| Private-App | {CIDR} | {AZ} | Application workloads |
| Private-Data | {CIDR} | {AZ} | Databases, caches |

---

## Security Groups

| SG Name | Purpose | Inbound | Outbound |
|---------|---------|---------|----------|
| {sg-name} | {purpose} | {rules} | {rules} |

---

## Connectivity

| Connection | Type | Endpoints |
|------------|------|-----------|
| Internet | NAT Gateway | {per AZ} |
| Corporate | VPN / Direct Connect | {endpoint} |
| Other VPCs | Transit Gateway / Peering | {VPCs} |
```

---

## Deployment Architecture Template

```markdown
# Deployment Architecture

**Environment**: {Production/Staging/Development}
**Version**: {version}
**Date**: {date}

---

## Deployment Diagram

```
┌─────────────────────────────────────────────────────────────┐
│                    {ENVIRONMENT NAME}                        │
│                    Region: {region}                         │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐         │
│  │    AZ-1     │  │    AZ-2     │  │    AZ-3     │         │
│  │             │  │             │  │             │         │
│  │  ┌───────┐  │  │  ┌───────┐  │  │  ┌───────┐  │         │
│  │  │ App A │  │  │  │ App A │  │  │  │ App A │  │         │
│  │  └───────┘  │  │  └───────┘  │  │  └───────┘  │         │
│  │  ┌───────┐  │  │  ┌───────┐  │  │  ┌───────┐  │         │
│  │  │ App B │  │  │  │ App B │  │  │  │ App B │  │         │
│  │  └───────┘  │  │  └───────┘  │  │  └───────┘  │         │
│  │             │  │             │  │             │         │
│  │  ┌───────┐  │  │  ┌───────┐  │  │             │         │
│  │  │DB Pri │  │  │  │DB Stby│  │  │             │         │
│  │  └───────┘  │  │  └───────┘  │  │             │         │
│  └─────────────┘  └─────────────┘  └─────────────┘         │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## Application Deployments

| Application | Hosting | Replicas | Resources | Scaling |
|-------------|---------|----------|-----------|---------|
| {app name} | {platform} | {count} | {cpu/mem} | {policy} |

### {Application Name}

| Attribute | Value |
|-----------|-------|
| Platform | {EKS/ECS/Lambda/EC2} |
| Replicas | {count per AZ} |
| CPU | {request/limit} |
| Memory | {request/limit} |
| Storage | {type and size} |
| Scaling | {HPA/target tracking} |
| Health Check | {endpoint, interval} |

---

## Database Deployments

| Database | Engine | Instance | Multi-AZ | Storage |
|----------|--------|----------|----------|---------|
| {name} | {engine} | {class} | {Yes/No} | {size} |

---

## High Availability

| Component | HA Strategy | Failover |
|-----------|-------------|----------|
| Application | Multi-AZ, auto-scaling | Automatic (LB) |
| Database | Multi-AZ RDS | Automatic (DNS) |
| Cache | Cluster mode | Automatic |
| Messaging | Multi-AZ | Automatic |

---

## Disaster Recovery

| Attribute | Value |
|-----------|-------|
| Strategy | {Backup-Restore/Pilot-Light/Warm-Standby/Active-Active} |
| Primary Region | {region} |
| DR Region | {region} |
| RTO | {hours} |
| RPO | {hours/minutes} |
| Failover Process | {link to runbook} |
```

---

## Security Architecture Template

```markdown
# Security Architecture

**Organization**: {organization_name}
**Version**: {version}
**Date**: {date}

---

## Security Layers

```
┌─────────────────────────────────────────────────────────────┐
│                    SECURITY ARCHITECTURE                     │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ┌─────────────────────────────────────────────────────┐   │
│  │                 PERIMETER SECURITY                   │   │
│  │   DDoS Protection │ WAF │ CDN │ API Gateway         │   │
│  └─────────────────────────────────────────────────────┘   │
│                                                             │
│  ┌─────────────────────────────────────────────────────┐   │
│  │                 NETWORK SECURITY                     │   │
│  │   VPC │ Security Groups │ NACLs │ Private Subnets   │   │
│  └─────────────────────────────────────────────────────┘   │
│                                                             │
│  ┌─────────────────────────────────────────────────────┐   │
│  │                 IDENTITY & ACCESS                    │   │
│  │   IAM │ Service Accounts │ RBAC │ MFA               │   │
│  └─────────────────────────────────────────────────────┘   │
│                                                             │
│  ┌─────────────────────────────────────────────────────┐   │
│  │                 DATA PROTECTION                      │   │
│  │   Encryption at Rest │ In Transit │ Key Management  │   │
│  └─────────────────────────────────────────────────────┘   │
│                                                             │
│  ┌─────────────────────────────────────────────────────┐   │
│  │              DETECTION & RESPONSE                    │   │
│  │   SIEM │ IDS │ Vulnerability Scanning │ Audit Logs  │   │
│  └─────────────────────────────────────────────────────┘   │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## Security Controls

| Layer | Control | Technology | Status |
|-------|---------|------------|--------|
| Perimeter | DDoS Protection | {AWS Shield} | {Implemented} |
| Perimeter | Web Application Firewall | {AWS WAF} | {Implemented} |
| Network | VPC Isolation | {AWS VPC} | {Implemented} |
| Network | Security Groups | {AWS SG} | {Implemented} |
| Identity | IAM Policies | {AWS IAM} | {Implemented} |
| Identity | MFA | {AWS MFA} | {Implemented} |
| Data | Encryption at Rest | {AWS KMS} | {Implemented} |
| Data | Encryption in Transit | {TLS 1.3} | {Implemented} |
| Detection | SIEM | {Splunk/CloudTrail} | {Implemented} |

---

## Encryption Standards

| Data State | Standard | Technology |
|------------|----------|------------|
| At Rest | AES-256 | KMS managed keys |
| In Transit | TLS 1.2+ | ACM certificates |
| In Use | {N/A or specific} | {if applicable} |

---

## Secret Management

| Secret Type | Storage | Rotation |
|-------------|---------|----------|
| API Keys | Secrets Manager | 90 days |
| Database Credentials | Secrets Manager | 30 days |
| TLS Certificates | ACM | Automatic |
| SSH Keys | SSM Parameter Store | Manual |

---

## Compliance Requirements

| Standard | Requirement | Implementation |
|----------|-------------|----------------|
| {SOC 2} | {requirement} | {how met} |
| {PCI DSS} | {requirement} | {how met} |
| {GDPR} | {requirement} | {how met} |
```

---

## Technology Gap Analysis Template

```markdown
# Technology Gap Analysis

**Initiative**: {name}
**Date**: {date}

---

## Technology Gaps

| Gap ID | Area | Baseline | Target | Description | Priority |
|--------|------|----------|--------|-------------|----------|
| TG-001 | {area} | {current} | {target} | {description} | {Critical/High/Med/Low} |

---

## Gap Details

### TG-{number}: {Gap Name}

| Current State | Target State |
|---------------|--------------|
| {description} | {description} |

**Impact of Gap**:
- {impact 1}
- {impact 2}

**Resolution Approach**:
- {approach}

**Dependencies**:
- {dependency}

**Estimated Effort**: {S/M/L/XL}

---

## Gap Summary

| Category | Critical | High | Medium | Low | Total |
|----------|----------|------|--------|-----|-------|
| Platform | {n} | {n} | {n} | {n} | {n} |
| Infrastructure | {n} | {n} | {n} | {n} | {n} |
| Security | {n} | {n} | {n} | {n} | {n} |
| Operations | {n} | {n} | {n} | {n} | {n} |
| **Total** | **{n}** | **{n}** | **{n}** | **{n}** | **{n}** |
```

---

## Technology Work Package Template

```markdown
# Work Package Definition

**Work Package ID**: WP-D-{number}
**Name**: {name}
**Phase**: D - Technology Architecture

---

## Overview

| Attribute | Value |
|-----------|-------|
| **Description** | {what this work package delivers} |
| **Business Outcome** | {why it matters} |
| **Sponsor** | {role} |
| **Lead** | {role} |

---

## Gaps Addressed

| Gap ID | Gap Description |
|--------|-----------------|
| TG-{n} | {description} |

---

## Scope

**In Scope**:
- {item 1}
- {item 2}

**Out of Scope**:
- {item 1}
- {item 2}

---

## Deliverables

| Deliverable | Description |
|-------------|-------------|
| {deliverable} | {description} |

---

## Technical Specifications

| Component | Specification |
|-----------|---------------|
| {component} | {spec} |

---

## Dependencies

| Dependency | Type | Description |
|------------|------|-------------|
| WP-{n} | Predecessor | {description} |

---

## Estimates

| Attribute | Estimate |
|-----------|----------|
| Duration | {weeks/months} |
| Effort | {person-days} |
| Cost | {$} |

---

## Risks

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| {risk} | {H/M/L} | {H/M/L} | {action} |
```

---

## Technology Standards Template

```markdown
# Technology Standards

**Organization**: {organization_name}
**Version**: {version}
**Date**: {date}

---

## Technology Radar

| Quadrant | Adopt | Trial | Assess | Hold |
|----------|-------|-------|--------|------|
| Languages | {list} | {list} | {list} | {list} |
| Frameworks | {list} | {list} | {list} | {list} |
| Platforms | {list} | {list} | {list} | {list} |
| Tools | {list} | {list} | {list} | {list} |

---

## Standard Technology Stack

| Layer | Standard | Alternatives | Notes |
|-------|----------|--------------|-------|
| Frontend | {tech} | {alts} | {notes} |
| Backend | {tech} | {alts} | {notes} |
| Database | {tech} | {alts} | {notes} |
| Cache | {tech} | {alts} | {notes} |
| Messaging | {tech} | {alts} | {notes} |
| Container | {tech} | {alts} | {notes} |
| CI/CD | {tech} | {alts} | {notes} |
| Monitoring | {tech} | {alts} | {notes} |

---

## Version Policies

| Technology | Supported Versions | EOL Policy |
|------------|-------------------|------------|
| {tech} | {versions} | {policy} |

---

## Exception Process

1. Submit exception request to Architecture Board
2. Provide justification and risk assessment
3. Define exit strategy
4. Obtain approval
5. Document exception with expiry date
```
