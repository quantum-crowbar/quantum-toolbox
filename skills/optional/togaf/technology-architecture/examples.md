# Technology Architecture Examples

Concrete examples for TOGAF Phase D deliverables.

---

## Example 1: Technology Catalog

### Technology Summary

| Tech ID | Name | Category | Status | Owner |
|---------|------|----------|--------|-------|
| TECH-001 | EKS | Container Platform | Adopt | Platform Team |
| TECH-002 | PostgreSQL | Database | Adopt | Platform Team |
| TECH-003 | Redis | Cache | Adopt | Platform Team |
| TECH-004 | Kafka (MSK) | Messaging | Adopt | Platform Team |
| TECH-005 | Terraform | IaC | Adopt | Platform Team |
| TECH-006 | ArgoCD | GitOps | Trial | Platform Team |
| TECH-007 | Istio | Service Mesh | Assess | Platform Team |
| TECH-008 | MongoDB | Document DB | Hold | Platform Team |

### Technology Detail: TECH-001 EKS

| Attribute | Value |
|-----------|-------|
| **Tech ID** | TECH-001 |
| **Name** | Amazon EKS |
| **Category** | Container Platform |
| **Vendor** | AWS |
| **Version** | 1.29+ |
| **Status** | Adopt |
| **Owner** | Platform Team |

**Description**: Managed Kubernetes service for running containerized applications.

**Use Cases**:
- All stateless microservices
- Background workers
- Scheduled jobs (via CronJob)

**Alternatives Considered**:

| Alternative | Reason Not Selected |
|-------------|---------------------|
| ECS | Less portable, smaller ecosystem |
| Self-managed K8s | Higher operational burden |
| GKE | AWS is primary cloud provider |

**Standards**:
- Approved versions: 1.28, 1.29, 1.30 (N-1 from latest)
- Configuration standards: See platform/eks-config.md
- Security requirements: Private API endpoint, IRSA for pods

**Dependencies**:
- VPC with private subnets
- IAM roles for service accounts
- ECR for container images

---

## Example 2: Platform Architecture

### Platform Overview

```
┌─────────────────────────────────────────────────────────────┐
│                   ACME PLATFORM ARCHITECTURE                 │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ┌─────────────────────────────────────────────────────┐   │
│  │              DEVELOPER EXPERIENCE                    │   │
│  │   GitHub Actions │ ArgoCD │ Backstage │ Confluence  │   │
│  └─────────────────────────────────────────────────────┘   │
│                                                             │
│  ┌─────────────────────────────────────────────────────┐   │
│  │                APPLICATION RUNTIME                   │   │
│  │   EKS (Fargate) │ Lambda │ NGINX Ingress            │   │
│  └─────────────────────────────────────────────────────┘   │
│                                                             │
│  ┌─────────────────────────────────────────────────────┐   │
│  │                  DATA PLATFORM                       │   │
│  │   RDS PostgreSQL │ ElastiCache Redis │ MSK Kafka    │   │
│  │   S3 │ OpenSearch                                    │   │
│  └─────────────────────────────────────────────────────┘   │
│                                                             │
│  ┌─────────────────────────────────────────────────────┐   │
│  │                  OBSERVABILITY                       │   │
│  │   Prometheus │ Grafana │ CloudWatch │ X-Ray         │   │
│  └─────────────────────────────────────────────────────┘   │
│                                                             │
│  ┌─────────────────────────────────────────────────────┐   │
│  │                    SECURITY                          │   │
│  │   Secrets Manager │ ACM │ IAM │ GuardDuty           │   │
│  └─────────────────────────────────────────────────────┘   │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Container Platform

| Component | Technology | Purpose |
|-----------|------------|---------|
| Orchestration | EKS 1.29 | Container scheduling |
| Runtime | containerd | Container execution |
| Ingress | NGINX Ingress Controller | HTTP routing |
| Service Mesh | None (future: Istio) | N/A |
| Secrets | External Secrets + Secrets Manager | Secret injection |

### Cluster Configuration

| Attribute | Value |
|-----------|-------|
| Provider | Amazon EKS |
| Version | 1.29 |
| Node Groups | Fargate profiles per namespace |
| Scaling | Karpenter |
| Networking | VPC CNI |

### Data Platform

| Service | Technology | Use Case |
|---------|------------|----------|
| Relational DB | RDS PostgreSQL 15 | Transactional data |
| Cache | ElastiCache Redis 7 | Session, caching |
| Search | OpenSearch 2.x | Full-text search |
| Event Streaming | MSK (Kafka 3.x) | Domain events |
| Object Storage | S3 | Files, backups |

### Observability Stack

| Component | Technology | Purpose |
|-----------|------------|---------|
| Metrics | Prometheus + Grafana | Performance metrics |
| Logs | Fluent Bit + CloudWatch Logs | Log aggregation |
| Traces | X-Ray | Distributed tracing |
| Dashboards | Grafana | Visualization |
| Alerts | AlertManager + PagerDuty | Incident notification |

---

## Example 3: Network Architecture

### Network Diagram

```
                           Internet
                              │
                              ▼
                    ┌─────────────────┐
                    │   CloudFront    │
                    │  (Static + API) │
                    └────────┬────────┘
                             │
                    ┌────────▼────────┐
                    │    AWS WAF      │
                    │  (OWASP Rules)  │
                    └────────┬────────┘
                             │
┌────────────────────────────▼────────────────────────────────┐
│                    VPC: 10.0.0.0/16                          │
│                    Region: us-east-1                         │
│                                                              │
│  ┌─────────────────────────────────────────────────────┐    │
│  │          Public Subnets: 10.0.0.0/20                │    │
│  │   ┌─────────┐    ┌─────────┐    ┌─────────┐        │    │
│  │   │   ALB   │    │  NAT-1  │    │  NAT-2  │        │    │
│  │   │         │    │         │    │         │        │    │
│  │   │10.0.1.x │    │10.0.2.x │    │10.0.3.x │        │    │
│  │   └────┬────┘    └─────────┘    └─────────┘        │    │
│  └────────┼────────────────────────────────────────────┘    │
│           │                                                  │
│  ┌────────▼────────────────────────────────────────────┐    │
│  │        Private App Subnets: 10.0.16.0/20            │    │
│  │   ┌─────────┐    ┌─────────┐    ┌─────────┐        │    │
│  │   │  EKS    │    │  EKS    │    │  EKS    │        │    │
│  │   │  AZ-1a  │    │  AZ-1b  │    │  AZ-1c  │        │    │
│  │   │10.0.16.x│    │10.0.17.x│    │10.0.18.x│        │    │
│  │   └────┬────┘    └────┬────┘    └────┬────┘        │    │
│  └────────┼──────────────┼──────────────┼──────────────┘    │
│           │              │              │                    │
│  ┌────────▼──────────────▼──────────────▼──────────────┐    │
│  │        Private Data Subnets: 10.0.32.0/20           │    │
│  │   ┌─────────┐    ┌─────────┐    ┌─────────┐        │    │
│  │   │   RDS   │    │   RDS   │    │  Redis  │        │    │
│  │   │ Primary │    │ Standby │    │ Cluster │        │    │
│  │   │10.0.32.x│    │10.0.33.x│    │10.0.34.x│        │    │
│  │   └─────────┘    └─────────┘    └─────────┘        │    │
│  └─────────────────────────────────────────────────────┘    │
│                                                              │
└──────────────────────────────────────────────────────────────┘
```

### VPC Configuration

| Attribute | Value |
|-----------|-------|
| Region | us-east-1 |
| VPC CIDR | 10.0.0.0/16 |
| Availability Zones | us-east-1a, us-east-1b, us-east-1c |
| DNS Resolution | Enabled |
| DNS Hostnames | Enabled |

### Subnet Design

| Subnet Type | CIDR | AZ | Purpose |
|-------------|------|-----|---------|
| Public | 10.0.1.0/24 | us-east-1a | ALB, NAT Gateway |
| Public | 10.0.2.0/24 | us-east-1b | NAT Gateway |
| Public | 10.0.3.0/24 | us-east-1c | NAT Gateway |
| Private-App | 10.0.16.0/24 | us-east-1a | EKS workloads |
| Private-App | 10.0.17.0/24 | us-east-1b | EKS workloads |
| Private-App | 10.0.18.0/24 | us-east-1c | EKS workloads |
| Private-Data | 10.0.32.0/24 | us-east-1a | RDS, ElastiCache |
| Private-Data | 10.0.33.0/24 | us-east-1b | RDS, ElastiCache |
| Private-Data | 10.0.34.0/24 | us-east-1c | ElastiCache |

### Security Groups

| SG Name | Purpose | Inbound | Outbound |
|---------|---------|---------|----------|
| sg-alb | Application Load Balancer | 443 from 0.0.0.0/0 | All to VPC |
| sg-eks-nodes | EKS worker nodes | All from sg-alb, sg-eks-nodes | All |
| sg-rds | PostgreSQL database | 5432 from sg-eks-nodes | None |
| sg-redis | Redis cache | 6379 from sg-eks-nodes | None |

---

## Example 4: Deployment Architecture - Production

### Deployment Diagram

```
┌─────────────────────────────────────────────────────────────┐
│                      PRODUCTION                              │
│                   Region: us-east-1                          │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐         │
│  │   AZ-1a     │  │   AZ-1b     │  │   AZ-1c     │         │
│  │             │  │             │  │             │         │
│  │  ┌───────┐  │  │  ┌───────┐  │  │  ┌───────┐  │         │
│  │  │ Order │  │  │  │ Order │  │  │  │ Order │  │         │
│  │  │Service│  │  │  │Service│  │  │  │Service│  │         │
│  │  │ x2    │  │  │  │ x2    │  │  │  │ x2    │  │         │
│  │  └───────┘  │  │  └───────┘  │  │  └───────┘  │         │
│  │  ┌───────┐  │  │  ┌───────┐  │  │  ┌───────┐  │         │
│  │  │Product│  │  │  │Product│  │  │  │Product│  │         │
│  │  │Service│  │  │  │Service│  │  │  │Service│  │         │
│  │  │ x2    │  │  │  │ x2    │  │  │  │ x2    │  │         │
│  │  └───────┘  │  │  └───────┘  │  │  └───────┘  │         │
│  │             │  │             │  │             │         │
│  │  ┌───────┐  │  │  ┌───────┐  │  │             │         │
│  │  │  RDS  │  │  │  │  RDS  │  │  │             │         │
│  │  │Primary│  │  │  │Standby│  │  │             │         │
│  │  └───────┘  │  │  └───────┘  │  │             │         │
│  │  ┌───────┐  │  │  ┌───────┐  │  │  ┌───────┐  │         │
│  │  │ Redis │  │  │  │ Redis │  │  │  │ Redis │  │         │
│  │  │Primary│  │  │  │Replica│  │  │  │Replica│  │         │
│  │  └───────┘  │  │  └───────┘  │  │  └───────┘  │         │
│  └─────────────┘  └─────────────┘  └─────────────┘         │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Application Deployments

| Application | Hosting | Replicas | Resources | Scaling |
|-------------|---------|----------|-----------|---------|
| Order Service | EKS Fargate | 6 (2/AZ) | 1 vCPU, 2GB | HPA 50% CPU |
| Product Service | EKS Fargate | 6 (2/AZ) | 0.5 vCPU, 1GB | HPA 60% CPU |
| Worker | EKS Fargate | 3 (1/AZ) | 1 vCPU, 2GB | KEDA (queue) |
| Web App | CloudFront + S3 | N/A | N/A | N/A |

### Database Deployments

| Database | Engine | Instance | Multi-AZ | Storage |
|----------|--------|----------|----------|---------|
| Order DB | PostgreSQL 15 | db.r6g.large | Yes | 500GB gp3 |
| Product DB | PostgreSQL 15 | db.r6g.medium | Yes | 200GB gp3 |
| Cache | Redis 7 | cache.r6g.large | Cluster (3 shards) | N/A |

### Disaster Recovery

| Attribute | Value |
|-----------|-------|
| Strategy | Warm Standby |
| Primary Region | us-east-1 |
| DR Region | us-west-2 |
| RTO | 4 hours |
| RPO | 1 hour |

**Replication**:
- RDS: Cross-region read replica (async)
- S3: Cross-region replication enabled
- Secrets: Multi-region secrets
- ECR: Images replicated to DR region

**Failover Process**:
1. Promote DR database replica to primary
2. Update Route 53 to point to DR ALB
3. Scale up DR EKS cluster
4. Verify all services healthy
5. Notify stakeholders

---

## Example 5: Security Architecture

### Security Layers

```
┌─────────────────────────────────────────────────────────────┐
│                    SECURITY ARCHITECTURE                     │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ┌─────────────────────────────────────────────────────┐   │
│  │                 PERIMETER SECURITY                   │   │
│  │   AWS Shield Advanced │ AWS WAF │ CloudFront        │   │
│  └─────────────────────────────────────────────────────┘   │
│                                                             │
│  ┌─────────────────────────────────────────────────────┐   │
│  │                 NETWORK SECURITY                     │   │
│  │   VPC │ Private Subnets │ Security Groups │ NACLs   │   │
│  └─────────────────────────────────────────────────────┘   │
│                                                             │
│  ┌─────────────────────────────────────────────────────┐   │
│  │                 IDENTITY & ACCESS                    │   │
│  │   IAM │ IRSA │ RBAC │ SSO (Okta) │ MFA              │   │
│  └─────────────────────────────────────────────────────┘   │
│                                                             │
│  ┌─────────────────────────────────────────────────────┐   │
│  │                 DATA PROTECTION                      │   │
│  │   KMS │ ACM │ TLS 1.3 │ RDS Encryption              │   │
│  └─────────────────────────────────────────────────────┘   │
│                                                             │
│  ┌─────────────────────────────────────────────────────┐   │
│  │              DETECTION & RESPONSE                    │   │
│  │   GuardDuty │ Security Hub │ CloudTrail │ Splunk    │   │
│  └─────────────────────────────────────────────────────┘   │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Security Controls

| Layer | Control | Technology | Status |
|-------|---------|------------|--------|
| Perimeter | DDoS Protection | AWS Shield Advanced | ✅ Implemented |
| Perimeter | Web Application Firewall | AWS WAF (OWASP rules) | ✅ Implemented |
| Perimeter | Bot Protection | WAF Bot Control | ✅ Implemented |
| Network | VPC Isolation | AWS VPC | ✅ Implemented |
| Network | Private Subnets | No public IPs for apps | ✅ Implemented |
| Network | Security Groups | Least privilege | ✅ Implemented |
| Network | VPC Flow Logs | CloudWatch Logs | ✅ Implemented |
| Identity | IAM Policies | Least privilege | ✅ Implemented |
| Identity | Pod Identity | IRSA | ✅ Implemented |
| Identity | MFA | Required for console | ✅ Implemented |
| Identity | SSO | Okta integration | ✅ Implemented |
| Data | Encryption at Rest | KMS (CMK) | ✅ Implemented |
| Data | Encryption in Transit | TLS 1.3 | ✅ Implemented |
| Detection | Threat Detection | GuardDuty | ✅ Implemented |
| Detection | Audit Logs | CloudTrail | ✅ Implemented |
| Detection | SIEM | Splunk integration | ✅ Implemented |

### Secret Management

| Secret Type | Storage | Rotation |
|-------------|---------|----------|
| Database Credentials | Secrets Manager | 30 days (auto) |
| API Keys | Secrets Manager | 90 days |
| TLS Certificates | ACM | Automatic |
| SSH Keys | Not used (SSM) | N/A |
| Service Tokens | IRSA | Dynamic |

---

## Example 6: Technology Gap Analysis

### Technology Gaps

| Gap ID | Area | Baseline | Target | Description | Priority |
|--------|------|----------|--------|-------------|----------|
| TG-001 | Compute | EC2 instances | EKS | No container orchestration | Critical |
| TG-002 | DR | None | Warm Standby | No disaster recovery | Critical |
| TG-003 | IaC | Manual/Console | Terraform | Infrastructure not codified | High |
| TG-004 | Observability | CloudWatch only | Full stack | Limited metrics/tracing | High |
| TG-005 | Secrets | Env variables | Secrets Manager | Secrets in code/config | High |
| TG-006 | GitOps | Manual deploy | ArgoCD | No declarative deployments | Medium |

### Gap Detail: TG-002 Disaster Recovery

| Current State | Target State |
|---------------|--------------|
| Single region (us-east-1) | Multi-region with DR in us-west-2 |
| No database replication | Cross-region read replica |
| No S3 replication | Cross-region replication |
| No failover process | Documented and tested runbook |
| Undefined RTO/RPO | RTO: 4h, RPO: 1h |

**Impact of Gap**:
- Complete service outage if region fails
- Potential data loss
- Regulatory non-compliance
- Customer trust impact

**Resolution Approach**:
- Set up DR VPC in us-west-2
- Configure RDS cross-region replica
- Enable S3 CRR
- Deploy scaled-down EKS cluster
- Create and test failover runbook

**Dependencies**:
- TG-003: IaC must be in place first for consistent DR setup

**Estimated Effort**: Large (L)

### Gap Summary

| Category | Critical | High | Medium | Low | Total |
|----------|----------|------|--------|-----|-------|
| Platform | 1 | 0 | 1 | 0 | 2 |
| Infrastructure | 1 | 1 | 0 | 0 | 2 |
| Security | 0 | 1 | 0 | 0 | 1 |
| Operations | 0 | 1 | 0 | 0 | 1 |
| **Total** | **2** | **3** | **1** | **0** | **6** |

---

## Example 7: Technology Work Package

### Work Package: Container Platform

| Attribute | Value |
|-----------|-------|
| **Work Package ID** | WP-D-001 |
| **Name** | Container Platform Implementation |
| **Phase** | D - Technology Architecture |
| **Description** | Deploy EKS cluster with supporting platform components |
| **Business Outcome** | Enable containerized deployments with improved scalability and developer productivity |
| **Sponsor** | CTO |
| **Lead** | Platform Lead |

### Gaps Addressed

| Gap ID | Gap Description |
|--------|-----------------|
| TG-001 | No container orchestration platform |

### Scope

**In Scope**:
- EKS cluster provisioning (multi-AZ)
- Fargate profiles for workloads
- NGINX Ingress Controller
- External Secrets Operator
- Prometheus/Grafana observability
- ArgoCD for GitOps
- CI/CD pipeline updates
- Developer documentation

**Out of Scope**:
- Application migration (separate work packages)
- Service mesh (future consideration)
- Multi-cluster federation

### Technical Specifications

| Component | Specification |
|-----------|---------------|
| EKS Version | 1.29 |
| Compute | Fargate (no managed nodes) |
| Networking | VPC CNI, Calico policies |
| Ingress | NGINX Ingress Controller 1.9+ |
| Secrets | External Secrets + Secrets Manager |
| Monitoring | Prometheus 2.x, Grafana 10.x |
| GitOps | ArgoCD 2.x |

### Dependencies

| Dependency | Type | Description |
|------------|------|-------------|
| WP-D-003 | Predecessor | Terraform IaC foundation must exist |
| WP-D-004 | Parallel | Observability stack (can proceed together) |
| WP-C-* | Successor | App migrations depend on this |

### Estimates

| Attribute | Estimate |
|-----------|----------|
| Duration | 8 weeks |
| Effort | 320 person-days |
| Cost | $250,000 (labor + infra) |

### Risks

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| Learning curve | Medium | Medium | Training + pair programming |
| Fargate limitations | Low | Medium | Evaluate during design |
| Networking complexity | Medium | High | Network team involvement early |
| Timeline pressure | Medium | Medium | Phased rollout, MVP first |

---

## Example 8: Technology Standards

### Technology Radar

| Quadrant | Adopt | Trial | Assess | Hold |
|----------|-------|-------|--------|------|
| **Languages** | TypeScript, Go, Python | Rust | Zig | Java (new projects) |
| **Frameworks** | Next.js, FastAPI, Express | Remix | Qwik | Angular |
| **Databases** | PostgreSQL, Redis | CockroachDB | Vitess | MySQL |
| **Platforms** | EKS, Lambda | Fargate, Step Functions | App Runner | EC2 (new) |
| **Tools** | Terraform, GitHub Actions | ArgoCD, Backstage | Pulumi | Jenkins |

### Standard Technology Stack

| Layer | Standard | Alternatives | Notes |
|-------|----------|--------------|-------|
| Frontend | Next.js 14+ | React SPA | SSR preferred |
| Backend API | Node.js + Express | FastAPI (Python) | TypeScript required |
| Background Jobs | Node.js workers | Go | Based on team skills |
| Database | PostgreSQL 15+ | DynamoDB (specific cases) | RDS managed |
| Cache | Redis 7+ | None | ElastiCache |
| Messaging | Kafka (MSK) | SQS (simple queues) | Based on pattern |
| Container | EKS 1.28+ | Fargate (preferred) | No EC2 nodes |
| IaC | Terraform 1.5+ | None | HCL required |
| CI/CD | GitHub Actions | None | Standard workflows |
| Monitoring | Prometheus + Grafana | CloudWatch (backup) | Platform managed |

### Version Policies

| Technology | Supported Versions | EOL Policy |
|------------|-------------------|------------|
| Node.js | 18 LTS, 20 LTS | Upgrade within 6 months of new LTS |
| PostgreSQL | 14, 15, 16 | Upgrade within 12 months of new major |
| EKS | N-1, N (latest) | Upgrade within 3 months of new version |
| Terraform | 1.5+ | Always latest minor |
