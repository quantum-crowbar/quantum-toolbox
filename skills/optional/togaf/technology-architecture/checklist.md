# Technology Architecture Checklist

Quick reference for TOGAF Phase D deliverables.

---

## Phase Entry Criteria

- [ ] Information Systems Architecture approved (Phase C complete)
- [ ] Application architecture available
- [ ] Data architecture available
- [ ] Integration requirements documented
- [ ] Non-functional requirements defined (SLAs, capacity)

---

## Platform Architecture Checklist

### Container Platform

- [ ] Orchestration platform selected (EKS/AKS/GKE/etc.)
- [ ] Version policy defined
- [ ] Node configuration documented
- [ ] Ingress controller specified
- [ ] Service mesh decision made
- [ ] Secrets management defined
- [ ] Container registry specified
- [ ] Networking (CNI) configured

### Database Platform

- [ ] Relational database standard defined
- [ ] Document database standard defined
- [ ] Caching solution specified
- [ ] Search platform defined
- [ ] Time-series database (if needed)
- [ ] Version policies documented

### Messaging Platform

- [ ] Event streaming platform specified
- [ ] Message queue solution defined
- [ ] Pub/sub mechanism defined
- [ ] Retention policies documented

### Observability Stack

- [ ] Metrics collection defined
- [ ] Log aggregation specified
- [ ] Distributed tracing configured
- [ ] Dashboard platform selected
- [ ] Alerting mechanism defined
- [ ] On-call integration specified

---

## Infrastructure Architecture Checklist

### Network Architecture

- [ ] VPC/VNet designed
- [ ] CIDR blocks allocated
- [ ] Subnets designed (public/private)
- [ ] Availability zones mapped
- [ ] NAT gateways planned
- [ ] Load balancers specified
- [ ] DNS configuration defined
- [ ] CDN configuration defined

### Security Zones

- [ ] DMZ defined
- [ ] Application zone defined
- [ ] Data zone defined
- [ ] Management zone defined
- [ ] Zone boundaries documented
- [ ] Inter-zone traffic rules defined

### Compute Standards

- [ ] Container workload standards defined
- [ ] VM standards defined (when needed)
- [ ] Serverless standards defined
- [ ] Instance sizing guidelines created
- [ ] Scaling policies defined

### Storage Standards

- [ ] Block storage standards defined
- [ ] Object storage standards defined
- [ ] File storage standards defined
- [ ] Encryption requirements specified
- [ ] Lifecycle policies defined
- [ ] Backup policies defined

### Connectivity

- [ ] Internet access designed
- [ ] VPN/Direct Connect planned (if needed)
- [ ] VPC peering/Transit Gateway designed
- [ ] Cross-region connectivity planned

---

## Deployment Architecture Checklist

### Environment Design

For each environment (Dev/Staging/Prod):

- [ ] Purpose documented
- [ ] Infrastructure scale defined
- [ ] Access controls specified
- [ ] Data policies defined
- [ ] Deployment diagram created

### High Availability

- [ ] Multi-AZ deployment designed
- [ ] Load balancing configured
- [ ] Auto-scaling defined
- [ ] Health checks specified
- [ ] Failover mechanisms documented
- [ ] SLA targets defined

### Disaster Recovery

- [ ] DR strategy selected (Backup/Pilot/Warm/Active)
- [ ] DR region identified
- [ ] RTO defined
- [ ] RPO defined
- [ ] Replication configured
- [ ] Failover process documented
- [ ] Failback process documented
- [ ] DR testing schedule defined

---

## Security Architecture Checklist

### Perimeter Security

- [ ] DDoS protection configured
- [ ] WAF rules defined
- [ ] API gateway security configured
- [ ] Rate limiting defined

### Network Security

- [ ] Security groups designed
- [ ] Network ACLs defined
- [ ] Private subnets used for workloads
- [ ] VPC flow logs enabled
- [ ] Network policies defined (K8s)

### Identity & Access

- [ ] IAM policies defined
- [ ] Least privilege enforced
- [ ] MFA required for console
- [ ] Service accounts configured
- [ ] RBAC defined
- [ ] Federation configured (if SSO)

### Data Protection

- [ ] Encryption at rest enabled
- [ ] Encryption in transit enforced
- [ ] Key management configured
- [ ] Key rotation policy defined
- [ ] Certificate management defined

### Detection & Response

- [ ] Audit logging enabled
- [ ] SIEM integration configured
- [ ] Alerting rules defined
- [ ] Incident response plan linked
- [ ] Vulnerability scanning scheduled

---

## Technology Standards Checklist

- [ ] Technology radar created
- [ ] Standard stack documented
- [ ] Version policies defined
- [ ] Exception process documented
- [ ] Review cycle established

---

## Gap Analysis Checklist

### Gap Identification

- [ ] Baseline infrastructure documented
- [ ] Target infrastructure defined
- [ ] Gaps identified across all domains
- [ ] Each gap has unique ID (TG-nnn)
- [ ] Impact documented
- [ ] Priority assigned

### Gap Categories

- [ ] Platform gaps identified
- [ ] Infrastructure gaps identified
- [ ] Security gaps identified
- [ ] Operational gaps identified

### Gap Summary

- [ ] Total gaps counted
- [ ] Priority distribution reviewed
- [ ] Critical gaps have owners
- [ ] All gaps addressed in work packages

---

## Roadmap Checklist

### Work Packages

For each work package:

- [ ] Unique ID (WP-D-nnn)
- [ ] Clear description
- [ ] Gaps addressed listed
- [ ] Technical specifications defined
- [ ] Scope defined (in/out)
- [ ] Deliverables listed
- [ ] Dependencies documented
- [ ] Estimates provided
- [ ] Risks identified

### Sequencing

- [ ] Dependencies respected
- [ ] Critical path identified
- [ ] Quick wins identified
- [ ] Resource constraints considered

---

## Stakeholder Review Checklist

### Documentation Ready

- [ ] Technology catalog complete
- [ ] Platform architecture documented
- [ ] Network diagrams ready
- [ ] Deployment diagrams ready
- [ ] Security architecture documented
- [ ] Technology standards published
- [ ] Gap analysis summary ready
- [ ] Roadmap visual ready

### Validation Complete

- [ ] Platform team validated architecture
- [ ] Network team validated design
- [ ] Security team reviewed controls
- [ ] Development teams validated DX
- [ ] Operations validated runbooks

### Approvals

- [ ] Platform architecture approved
- [ ] Security architecture approved
- [ ] Technology standards approved
- [ ] Phase D overall approved by Architecture Board
- [ ] Ready to proceed to Phase E

---

## Quality Scoring Matrix

| Dimension | Poor (1) | Adequate (3) | Good (5) |
|-----------|----------|--------------|----------|
| **Completeness** | Major gaps | Most areas covered | All domains covered |
| **Security** | Gaps in controls | Basic controls | Defense in depth |
| **Resilience** | Single points of failure | Some redundancy | Full HA/DR |
| **Scalability** | Fixed capacity | Manual scaling | Auto-scaling |
| **Operability** | Manual ops | Some automation | Full IaC + observability |

**Target**: Average score ≥ 4 across all dimensions

---

## Common Issues

| Issue | Symptom | Resolution |
|-------|---------|------------|
| Over-engineering | Gold-plated before MVP | Right-size for current needs |
| Under-sizing | Performance issues | Capacity planning |
| Security gaps | Failed audit | Security review early |
| Missing DR | No recovery plan | DR requirements upfront |
| Snowflakes | Inconsistent infra | Infrastructure as Code |
| Shadow IT | Unknown resources | Resource tagging/inventory |

---

## Phase Exit Criteria

- [ ] Technology Architecture artifacts complete
- [ ] Platform architecture documented
- [ ] Infrastructure architecture documented
- [ ] Deployment architecture documented
- [ ] Security architecture documented
- [ ] Technology standards established
- [ ] Gap analysis complete with priorities
- [ ] Work packages defined
- [ ] Stakeholder concerns addressed
- [ ] Architecture Board approval obtained
- [ ] Phase E scope confirmed
- [ ] Architecture Repository updated
