---
marp: true
theme: default
paginate: true
header: "AI Agent Toolbox"
footer: "NIS 2 Compliance Analysis | Planned Feature"
---

<!-- _class: lead -->
<!-- _paginate: false -->

# NIS 2 Compliance Analysis
## What We Analyze vs What's Out of Scope

Integration into `security-analysis` skill

---

# Technical Controls We Analyze (~40-50%)

| NIS 2 Article | What We Check | How |
|---------------|---------------|-----|
| **Art. 21(2)(c)** Business Continuity | Backup code, retry patterns, failover | Architecture analysis |
| **Art. 21(2)(d)** Supply Chain | Dependencies, SBOM, vulnerabilities | Dependency scan |
| **Art. 21(2)(e)** Secure Development | Input validation, secure coding | Code patterns |
| **Art. 21(2)(h)** Cryptography | Encryption at rest/transit, TLS config | Config review |
| **Art. 21(2)(i)** Access Control | RBAC, authorization, sessions | Auth analysis |
| **Art. 21(2)(j)** MFA | Multi-factor authentication | Auth flow check |

**Cross-mapped to:** ISO 27001, NIST CSF, CIS Controls

---

# Out of Scope (~50-60%) - Organizational Requirements

| Requirement | Why Not Code-Analyzable |
|-------------|------------------------|
| **Risk Policies** (Art. 21a) | Governance documents, board decisions |
| **Incident Handling** (Art. 21b) | Procedures, 24h/72h reporting to authorities |
| **Effectiveness Reviews** (Art. 21f) | Audit processes, penetration tests |
| **Cybersecurity Training** (Art. 21g) | HR processes, awareness programs |
| **Corporate Accountability** (Art. 20, 32) | Management responsibility, board oversight |

**Output includes:** Clear scope disclaimer + guidance for organizational requirements

<!--
Key message: We're transparent about what code analysis can and cannot cover.
Full NIS 2 compliance requires both technical AND organizational measures.
-->
