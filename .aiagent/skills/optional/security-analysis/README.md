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

You can select multiple frameworks - a separate compliance report is generated for each.

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
        └── iso-27001.md                      # If selected
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
