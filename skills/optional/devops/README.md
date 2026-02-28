# DevOps

Guidelines for CI/CD, deployment, infrastructure as code, and observability.

## Core Principles

- **Pipeline as code** — CI/CD definitions live in the repo, versioned alongside the code they build
- **Immutable artifacts** — build once, deploy the same artifact to every environment
- **Environment parity** — dev, staging, and production differ only in config, not shape
- **Shift left on security** — scan dependencies, secrets, and containers in CI, not post-deploy
- **Observable by default** — logs, metrics, and traces are not optional; build them in from the start

## CI/CD Pipeline

### Core pipeline stages

```
Code push
  → Lint + type check (fast, fail early)
  → Unit tests
  → Build artifact (Docker image, binary, package)
  → Security scan (deps, image, secrets)
  → Integration tests
  → Deploy to staging
  → Smoke tests on staging
  → (manual gate or auto) → Deploy to production
  → Post-deploy verification
```

### GitHub Actions example

```yaml
name: CI

on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: oven-sh/setup-bun@v1
      - run: bun install --frozen-lockfile
      - run: bun run lint
      - run: bun run typecheck
      - run: bun test --coverage

  build:
    needs: test
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: docker/build-push-action@v5
        with:
          push: ${{ github.ref == 'refs/heads/main' }}
          tags: ghcr.io/org/app:${{ github.sha }}
          cache-from: type=gha
          cache-to: type=gha,mode=max
```

### Pipeline rules
- Lint and type check before tests — fastest feedback first
- Pin action versions to a commit SHA, not a floating tag
- Cache dependencies and build layers aggressively
- Fail on first error in CI (`set -e` / `fail-fast: true`)
- Never use `latest` as a Docker image tag in production

## Deployment Strategies

| Strategy | How | When to use |
|----------|-----|-------------|
| **Rolling** | Replace instances incrementally | Low-risk, stateless services |
| **Blue-green** | Run two identical envs; switch traffic | Zero-downtime; easy rollback |
| **Canary** | Route small % of traffic to new version first | High-risk changes; gradual confidence |
| **Feature flags** | Deploy code dark; enable per user/segment | Decouple deploy from release |

```yaml
# Kubernetes rolling update
spec:
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxSurge: 1         # one extra pod during update
      maxUnavailable: 0   # no downtime
```

## Infrastructure as Code

### Terraform conventions

```hcl
# Structure
environments/
  dev/
    main.tf
    variables.tf
    terraform.tfvars
  staging/
  production/
modules/
  vpc/
  database/
  app-service/

# State backend — always remote
terraform {
  backend "s3" {
    bucket = "my-terraform-state"
    key    = "production/terraform.tfstate"
    region = "eu-west-1"
  }
}
```

IaC rules:
- All infrastructure declared in code — no manual changes to production
- Separate state files per environment
- `terraform plan` output reviewed before `apply` (PR comment automation helps)
- Sensitive vars via secrets manager, not in `.tfvars`
- `terraform fmt` and `tflint` in CI

### Pulumi (TypeScript) alternative

```ts
import * as aws from '@pulumi/aws'

const bucket = new aws.s3.Bucket('app-assets', {
  acl: 'private',
  versioning: { enabled: true },
})

export const bucketName = bucket.id
```

## Container and Kubernetes

```dockerfile
# Good Dockerfile — layered for cache efficiency
FROM node:20-alpine AS deps
WORKDIR /app
COPY package.json bun.lockb ./
RUN bun install --frozen-lockfile

FROM node:20-alpine AS builder
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .
RUN bun run build

FROM node:20-alpine AS runner
WORKDIR /app
ENV NODE_ENV=production
COPY --from=builder /app/dist ./dist
USER node          # never run as root
EXPOSE 3000
CMD ["node", "dist/index.js"]
```

```yaml
# Kubernetes resource limits — always set them
resources:
  requests:
    memory: "128Mi"
    cpu: "100m"
  limits:
    memory: "256Mi"
    cpu: "500m"
```

- Always set resource `requests` and `limits` — unbounded pods cause noisy-neighbour failures
- Use `livenessProbe` and `readinessProbe` — Kubernetes needs them to route traffic correctly
- Namespace per environment or per team
- RBAC: least-privilege service accounts for all workloads

## Observability Stack

### Three pillars

```
Logs     → structured JSON; correlation ID per request; ship to ELK / CloudWatch / Loki
Metrics  → RED (Rate, Errors, Duration) per service; USE (Utilisation, Saturation, Errors) per resource
Traces   → distributed tracing via OpenTelemetry; trace across service boundaries
```

### Structured logging

```ts
// Always log structured JSON in production
import pino from 'pino'
const log = pino({ level: process.env.LOG_LEVEL ?? 'info' })

log.info({ requestId, userId, action: 'order.created', orderId }, 'Order created')
// Never: console.log(`Order created for user ${userId}`)
```

### Key metrics to expose

```
http_request_duration_seconds  (histogram, labelled by route + status)
http_requests_total            (counter, labelled by route + method + status)
db_query_duration_seconds      (histogram, labelled by query type)
queue_depth                    (gauge, labelled by queue name)
```

### Alerting rules

- Alert on symptoms, not causes — `error_rate > 1%` not `CPU > 80%`
- Every alert must have a runbook link
- On-call rotation documented; escalation path clear
- P1 alert wakes someone; P2 is next-business-day

## Secrets Management

```bash
# Never commit secrets — scan with truffleHog or gitleaks in CI
gitleaks detect --source . --verbose

# Inject secrets at runtime via environment
# AWS: Secrets Manager → ECS task definition parameter store reference
# Kubernetes: external-secrets operator → pulls from Vault / AWS SM
# Local dev: .env file (gitignored) + 1Password CLI / direnv
```

- Secrets rotation automated where possible
- Different secrets per environment — never share prod secrets with staging
- Audit log of who accessed what secret and when

## Rollback Plan

Every deploy must have a documented rollback:

```
1. Identify — detect the problem (alert fires, canary error rate spikes)
2. Decide — is a rollback faster than a fix-forward? (usually yes within first 30 min)
3. Execute — redeploy previous artifact SHA; revert IaC if infra changed
4. Verify — smoke tests pass; error rate returns to baseline
5. Post-mortem — blameless, within 48h; RCA + action items
```
