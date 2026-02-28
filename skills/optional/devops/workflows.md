# DevOps — Workflows

## Code Review Checklist

```
[ ] CI pipeline defined in code (not configured via UI)
[ ] Docker image built from pinned base image (not :latest)
[ ] Container does not run as root
[ ] Resource requests and limits set on all containers
[ ] Liveness and readiness probes configured
[ ] Secrets injected at runtime (not baked into image or committed)
[ ] IaC plan reviewed before apply
[ ] Deployment strategy documented (rolling/blue-green/canary)
[ ] Rollback procedure documented and tested
[ ] Alerts cover error rate and latency (not just CPU/memory)
[ ] Structured logging with correlation IDs
[ ] Post-deploy verification step in pipeline
```

## New Service Deployment Checklist

```
Infrastructure:
  [ ] VPC, subnets, security groups defined in IaC
  [ ] Database provisioned with automated backups
  [ ] Secrets stored in secrets manager (not hardcoded)
  [ ] Service account with least-privilege IAM

Pipeline:
  [ ] CI pipeline: lint → test → build → scan → deploy staging
  [ ] CD pipeline: deploy production (manual gate or auto on merge)
  [ ] Docker image tagged with git SHA (not :latest)
  [ ] Image vulnerability scan in CI (trivy, snyk, grype)

Observability:
  [ ] Structured logs shipping to centralised store
  [ ] RED metrics exposed (/metrics endpoint or sidecar)
  [ ] Distributed tracing instrumented (OpenTelemetry)
  [ ] Dashboards created for key service metrics
  [ ] Alerts configured for error rate and p99 latency

Runbook:
  [ ] Deployment steps documented
  [ ] Rollback steps documented and tested in staging
  [ ] On-call rotation updated
  [ ] Escalation path documented
```

## Incident Response Workflow

```
1. DETECT  — alert fires; on-call acknowledges within SLA
2. ASSESS  — what is the blast radius? Who is affected?
3. TRIAGE  — P1 (production down), P2 (degraded), P3 (minor)
4. NOTIFY  — stakeholders informed; status page updated
5. MITIGATE — stop the bleeding: rollback, scale, circuit-break
6. FIX     — root cause fixed and deployed
7. VERIFY  — metrics back to baseline; no regressions
8. CLOSE   — status page updated; stakeholders notified
9. RETRO   — blameless post-mortem within 48h
```

**During incident:** one person drives (incident commander), one communicates (comms lead). Don't have everyone debugging at once.

## Terraform Workflow

```bash
# Feature branch workflow
git checkout -b infra/add-redis-cluster

# Plan — always review before apply
terraform -chdir=environments/production plan -out=plan.out

# Apply only after review
terraform -chdir=environments/production apply plan.out

# Check drift
terraform -chdir=environments/production plan
# Clean output = no drift
```

**PR gate:** `terraform plan` output posted as PR comment automatically. Reviewer approves infra changes before merge.

## Container Build Optimisation

| Technique | Impact |
|-----------|--------|
| Layer ordering (deps before code) | Avoids reinstalling deps on code changes |
| BuildKit cache mounts | Speeds up package manager installs |
| Multi-stage builds | Removes build tooling from final image |
| `.dockerignore` | Excludes node_modules, .git, test files from context |
| Base image pinned to digest | Reproducible, no surprise updates |

```bash
# Build with BuildKit enabled (default in Docker 23+)
docker build --cache-from=type=gha --cache-to=type=gha,mode=max .

# Inspect image layers
docker history --no-trunc my-image:sha
```

## Kubernetes Troubleshooting

```bash
# Pod won't start
kubectl describe pod <pod-name> -n <namespace>
kubectl logs <pod-name> -n <namespace> --previous

# Service not reachable
kubectl get endpoints <service-name>           # check endpoints populated
kubectl exec -it debug-pod -- curl <svc-url>   # test from inside cluster

# Resource exhaustion
kubectl top nodes
kubectl top pods -n <namespace>

# Config / secret issues
kubectl get secret <name> -o jsonpath='{.data.KEY}' | base64 -d
```

## Cost Control Practices

- Right-size instances — profile actual usage before committing to instance type
- Spot / preemptible instances for batch and non-critical workloads
- Auto-scaling based on actual load metrics, not static schedules
- Delete unused resources — orphaned load balancers, volumes, snapshots
- Tag everything — `environment`, `team`, `service` — enables cost attribution
- Reserved instances for predictable base load; on-demand for spikes
