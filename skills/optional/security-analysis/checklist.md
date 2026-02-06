# Security Analysis Checklist

Quick reference for security assessment completion.

---

## Setup (Phase 0)

- [ ] Documentation directory confirmed
- [ ] Output structure created (`security-docs/`)
- [ ] Compliance framework(s) selected
- [ ] Diagram format chosen
- [ ] Index initialized

---

## Phase 1: Security Surface

- [ ] **Entry Points**
  - [ ] REST API endpoints inventoried
  - [ ] GraphQL endpoints identified
  - [ ] WebSocket handlers documented
  - [ ] CLI entry points noted
  - [ ] Event handlers (webhooks, queues) mapped

- [ ] **Network Boundaries**
  - [ ] External-facing services identified
  - [ ] Internal service connections mapped
  - [ ] Database connections documented
  - [ ] Third-party integrations listed
  - [ ] Network diagram created

- [ ] **Functionality Matrix**
  - [ ] Public functions identified
  - [ ] Auth-required functions listed
  - [ ] Admin-only functions documented
  - [ ] Risk level assessed per function

---

## Phase 2: Authentication

- [ ] **Mechanisms**
  - [ ] All auth mechanisms identified
  - [ ] Implementation libraries noted
  - [ ] Strength assessed

- [ ] **Password Security**
  - [ ] Hashing algorithm verified (bcrypt/argon2)
  - [ ] Salt rounds checked (12+)
  - [ ] Minimum length verified (12+)
  - [ ] Complexity requirements checked
  - [ ] Breach check integration assessed

- [ ] **Token/Session**
  - [ ] Expiry times documented
  - [ ] Refresh rotation checked
  - [ ] HttpOnly flag verified
  - [ ] Secure flag verified
  - [ ] SameSite attribute checked

- [ ] **Brute Force**
  - [ ] Account lockout verified
  - [ ] Rate limiting checked
  - [ ] CAPTCHA integration assessed

---

## Phase 3: Authorization

- [ ] **Model**
  - [ ] Authorization model identified (RBAC/ABAC/ACL)
  - [ ] Roles documented
  - [ ] Permissions mapped

- [ ] **Enforcement**
  - [ ] Authorization checks located
  - [ ] Coverage assessed
  - [ ] Bypass risks identified

- [ ] **Privilege Escalation**
  - [ ] IDOR vulnerabilities checked
  - [ ] Missing auth checks identified
  - [ ] Role confusion risks assessed

- [ ] **Multi-Tenancy** (if applicable)
  - [ ] Tenant isolation verified
  - [ ] Cross-tenant access prevented

---

## Phase 4: Data Protection

- [ ] **Inventory**
  - [ ] PII fields identified
  - [ ] Sensitive data classified
  - [ ] Storage locations mapped

- [ ] **Encryption**
  - [ ] At-rest encryption verified
  - [ ] In-transit encryption verified
  - [ ] Key management assessed

- [ ] **Logging**
  - [ ] PII in logs checked
  - [ ] Sensitive data exposure assessed
  - [ ] Log retention documented

- [ ] **Retention**
  - [ ] Retention periods documented
  - [ ] Deletion methods verified
  - [ ] Compliance requirements checked

---

## Phase 5: Input Validation

- [ ] **Sources**
  - [ ] All input sources identified
  - [ ] Validation methods documented
  - [ ] Sanitization checked

- [ ] **Injection**
  - [ ] SQL injection scan complete
  - [ ] XSS vulnerabilities checked
  - [ ] Command injection assessed
  - [ ] Other injection types checked

- [ ] **Output Encoding**
  - [ ] HTML encoding verified
  - [ ] JS encoding checked
  - [ ] URL encoding verified

- [ ] **File Uploads**
  - [ ] Extension validation checked
  - [ ] MIME validation verified
  - [ ] Size limits confirmed
  - [ ] Filename sanitization checked

---

## Phase 6: Secrets Management

- [ ] **Inventory**
  - [ ] All secrets identified
  - [ ] Storage methods documented
  - [ ] Rotation policies checked

- [ ] **Hardcoded Scan**
  - [ ] Codebase scanned for secrets
  - [ ] Config files checked
  - [ ] Git history reviewed

- [ ] **Recommendations**
  - [ ] Migration path documented
  - [ ] Rotation schedule proposed

---

## Phase 7: Findings Summary

- [ ] **Compilation**
  - [ ] All findings consolidated
  - [ ] Severity assigned (CVSS)
  - [ ] Prioritization complete

- [ ] **Documentation**
  - [ ] Executive summary written
  - [ ] Remediation roadmap created
  - [ ] Risk matrix generated

---

## Compliance Reports

### OWASP ASVS
- [ ] All 14 categories assessed
- [ ] Target level selected (L1/L2/L3)
- [ ] Pass/fail documented per requirement
- [ ] Gaps summarized

### NIST CSF
- [ ] All 5 functions assessed
- [ ] Categories evaluated
- [ ] Evidence documented
- [ ] Gaps identified

### CIS Controls
- [ ] Implementation group selected
- [ ] Applicable controls assessed
- [ ] Safeguard status documented
- [ ] Priority remediation listed

### ISO 27001
- [ ] Annex A controls assessed
- [ ] Statement of applicability updated
- [ ] Gap analysis complete
- [ ] Remediation prioritized

### NIS 2 (EU Directive 2022/2555)
- [ ] Entity type identified (Essential/Important)
- [ ] Scope disclaimer included (technical controls only)
- [ ] Art. 21(2)(c) Business continuity assessed
- [ ] Art. 21(2)(d) Supply chain security assessed
- [ ] Art. 21(2)(e) Secure development assessed
- [ ] Art. 21(2)(h) Cryptography assessed
- [ ] Art. 21(2)(i) Access control assessed
- [ ] Art. 21(2)(j) MFA assessed
- [ ] Out-of-scope organizational measures documented
- [ ] Cross-framework mapping included

---

## Finalization

- [ ] All analysis files complete
- [ ] Index updated with summary
- [ ] All links verified
- [ ] Compliance reports generated
- [ ] Security grade assigned
- [ ] Recommendations prioritized

---

## Finding Severity Guide

| Severity | CVSS | Criteria | Response Time |
|----------|------|----------|---------------|
| **Critical** | 9.0-10.0 | Remote code execution, auth bypass, data breach | Immediate |
| **High** | 7.0-8.9 | Privilege escalation, sensitive data exposure | 1 week |
| **Medium** | 4.0-6.9 | Limited impact, requires conditions | 1 month |
| **Low** | 0.1-3.9 | Minor impact, defense in depth | Quarterly |
| **Info** | N/A | Best practice, no direct risk | As convenient |

---

## Common Vulnerabilities Quick Check

### Authentication
- [ ] No hardcoded credentials
- [ ] Secure password hashing
- [ ] Token expiry < 24h
- [ ] Refresh token rotation
- [ ] Brute force protection

### Authorization
- [ ] All endpoints protected
- [ ] IDOR prevention
- [ ] Role checks enforced
- [ ] Admin functions isolated

### Data
- [ ] PII encrypted
- [ ] No secrets in code
- [ ] No PII in logs
- [ ] Proper data retention

### Input
- [ ] Parameterized queries
- [ ] Output encoding
- [ ] File upload validation
- [ ] Content-Type validation

### Configuration
- [ ] HTTPS enforced
- [ ] Security headers set
- [ ] Debug mode disabled
- [ ] Error messages safe
