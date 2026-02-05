# Security Analysis Skill

Comprehensive security posture assessment with dual output formats.

---

## Purpose

Analyze codebase security to:
- Map attack surface and entry points
- Assess authentication and authorization
- Trace sensitive data handling
- Identify vulnerabilities and misconfigurations
- Generate actionable remediation guidance

---

## When to Use

Invoke this skill when:

- Starting security review of a new or existing codebase
- Preparing for security audit or penetration test
- Assessing compliance requirements
- Investigating potential vulnerabilities
- Onboarding to understand security architecture

**Trigger phrases**:
```
"Analyze security of this codebase"
"Run security assessment"
"Generate OWASP ASVS report"
"Generate NIS 2 compliance report"
"Check for security vulnerabilities"
"Map the attack surface"
"Assess authentication security"
```

---

## Dual Output Format

This skill produces two complementary outputs:

### 1. Human-Readable Analysis

Detailed narrative reports with:
- Security-focused architecture diagrams
- Sequence diagrams for auth/data flows
- Code snippets showing vulnerabilities
- Threat modeling visuals
- Remediation guidance with examples

**Not constrained by any spec** - focuses on clarity and actionability.

### 2. Standards-Based Compliance Report

Structured report following your selected framework(s):

| Framework | Structure | Best For |
|-----------|-----------|----------|
| **OWASP ASVS** | Verification requirements by level (L1/L2/L3) | Web/API security audits |
| **NIST CSF** | Identify/Protect/Detect/Respond/Recover | Enterprise risk management |
| **CIS Controls** | Prioritized safeguards (IG1/IG2/IG3) | Implementation roadmap |
| **ISO 27001** | Annex A controls mapping | Compliance certification |
| **NIS 2** | EU Directive Article 21 technical measures | EU critical infrastructure |

You can select multiple frameworks - a separate compliance report is generated for each.

> **Note on NIS 2**: Code analysis can assess ~40-50% of NIS 2 requirements (technical controls). Organizational measures (policies, training, governance) require separate assessment. See [NIS 2 Scope Limitations](#nis-2-scope-limitations).

---

## Output Structure

```
{docs-directory}/
└── security-docs/
    ├── index.md                              # Main entry point
    ├── analysis/                             # Human-readable reports
    │   ├── 01-security-surface.md            # Attack surface mapping
    │   ├── 02-authentication.md              # Auth mechanisms analysis
    │   ├── 03-authorization.md               # Access control analysis
    │   ├── 04-data-protection.md             # PII and sensitive data
    │   ├── 05-input-validation.md            # Input/output sanitization
    │   ├── 06-secrets-management.md          # Credentials and secrets
    │   └── 07-findings-summary.md            # Prioritized findings
    └── compliance/                           # Standards-based reports
        ├── owasp-asvs.md                     # If selected
        ├── nist-csf.md                       # If selected
        ├── cis-controls.md                   # If selected
        ├── iso-27001.md                      # If selected
        └── nis2.md                           # If selected (EU critical infrastructure)
```

---

## Analysis Phases

| Phase | Focus | Output |
|-------|-------|--------|
| **Phase 1** | Security Surface | Entry points, network boundaries, exposed functionality |
| **Phase 2** | Authentication | Auth mechanisms, flows, session management |
| **Phase 3** | Authorization | Access control model, roles, privilege escalation |
| **Phase 4** | Data Protection | PII inventory, encryption, data flows |
| **Phase 5** | Input Validation | Injection risks, output encoding, sanitization |
| **Phase 6** | Secrets Management | Credentials, API keys, hardcoded secrets |
| **Phase 7** | Findings Summary | Prioritized findings, remediation roadmap |

---

## Prerequisites

Before starting:

- [ ] Codebase accessible for analysis
- [ ] Understanding of application purpose (helps context)
- [ ] Knowledge of deployment environment (optional but helpful)
- [ ] Access to configuration files (for secrets analysis)

**Recommended**: Run `arch-analysis` first for baseline understanding.

---

## Integration with Other Skills

| Skill | Integration |
|-------|-------------|
| `arch-analysis` | Use first to understand baseline architecture |
| `togaf/vision` | Security concerns feed into stakeholder analysis |
| `nonfunctional-analysis` | Complements with testing/health metrics |

### Typical Flow

```
arch-analysis (baseline)
    ↓
security-analysis (security deep-dive)
    ↓
Combined architecture + security view
```

Security analysis can reference arch-analysis outputs for:
- Technology manifest (known CVEs for versions)
- Interface specification (API security assessment)
- Data flow (PII tracing baseline)

---

## Severity Classification

Findings are classified using standard severity levels:

| Severity | CVSS Range | Description |
|----------|------------|-------------|
| **Critical** | 9.0 - 10.0 | Immediate exploitation risk, full compromise |
| **High** | 7.0 - 8.9 | Significant risk, direct impact on security |
| **Medium** | 4.0 - 6.9 | Moderate risk, requires specific conditions |
| **Low** | 0.1 - 3.9 | Minor risk, limited impact |
| **Info** | N/A | Best practice recommendation, no direct risk |

---

## Excluded from Analysis

Same as arch-analysis, AI agent configuration files are excluded:
- `.aiagent/`, `.aider/`, `.cursor/`, `.continue/`
- `AGENTS.md`, `CLAUDE.md`, `.cursorrules`, `.aider*`

These contain agent instructions, not application security concerns.

---

## NIS 2 Scope Limitations

The EU NIS 2 Directive (2022/2555) requires both technical and organizational security measures. **Code analysis can only assess technical controls**.

### What We CAN Analyze (~40-50%)

| NIS 2 Article | Technical Aspect | Maps To Phase |
|---------------|------------------|---------------|
| Art. 21(2)(c) | Business continuity (backup code, retry patterns, failover) | Phase 1, 4 |
| Art. 21(2)(d) | Supply chain security (dependencies, SBOM, vulnerabilities) | Phase 6 |
| Art. 21(2)(e) | Secure development (input validation, secure coding) | Phase 5 |
| Art. 21(2)(h) | Cryptography (encryption at rest/transit, key handling) | Phase 4 |
| Art. 21(2)(i) | Access control (RBAC, authorization, session management) | Phase 2, 3 |
| Art. 21(2)(j) | Multi-factor authentication implementation | Phase 2 |

### What We CANNOT Analyze (~50-60%)

| NIS 2 Article | Requirement | Why Out of Scope |
|---------------|-------------|------------------|
| Art. 21(2)(a) | Risk analysis policies | Governance documents, not code |
| Art. 21(2)(b) | Incident handling | Process/procedures, not code |
| Art. 21(2)(f) | Effectiveness assessment | Audit processes, not code |
| Art. 21(2)(g) | Cybersecurity training | HR/organizational, not code |
| Art. 20 | Incident reporting (24h/72h) | Regulatory process |
| Art. 32 | Management accountability | Board-level governance |

### Cross-Framework Mapping

NIS 2 requirements map to other frameworks already supported:

| NIS 2 Article | ISO 27001 | NIST CSF | CIS Controls |
|---------------|-----------|----------|--------------|
| Art. 21(2)(c) | A.8.14 | PR.IP-4, RC.RP | 11 |
| Art. 21(2)(d) | A.5.21-23 | ID.SC | 15 |
| Art. 21(2)(e) | A.8.25-31 | PR.DS | 16 |
| Art. 21(2)(h) | A.8.24 | PR.DS-1,2 | 3 |
| Art. 21(2)(i) | A.8.2-5 | PR.AC | 5, 6 |
| Art. 21(2)(j) | A.8.5 | PR.AC-7 | 6.5 |

---

## Quick Start

**For comprehensive analysis**:
1. Say "Analyze security of this codebase"
2. Provide documentation directory when asked
3. Select compliance framework(s)
4. Select diagram format
5. Review outputs as they're generated

**For targeted analysis**:
```
"Check authentication security"      → Phase 2 only
"Scan for hardcoded secrets"         → Phase 6 only
"Generate OWASP ASVS report"         → Compliance output only
"Map the attack surface"             → Phase 1 only
```

---

## References

- [Workflows](workflows.md) - Step-by-step analysis procedures
- [Templates](templates.md) - Report templates
- [Checklist](checklist.md) - Quick reference checklist
- [Examples](examples.md) - Sample findings and reports
- [OWASP ASVS](https://owasp.org/www-project-application-security-verification-standard/)
- [NIST CSF](https://www.nist.gov/cyberframework)
- [CIS Controls](https://www.cisecurity.org/controls)
- [ISO 27001](https://www.iso.org/isoiec-27001-information-security.html)
- [NIS 2 Directive](https://eur-lex.europa.eu/eli/dir/2022/2555) (EU 2022/2555)
