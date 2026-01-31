# Security Analysis Examples

Sample findings and report excerpts.

---

## Sample Findings

### Critical: SQL Injection

```markdown
## SEC-001: SQL Injection in Search Endpoint

**Severity**: Critical | **CVSS**: 9.8
**Location**: `src/api/search.js:42`
**Phase**: Input Validation

### Description

The search endpoint constructs SQL queries using string concatenation with user-supplied input, allowing SQL injection attacks.

### Vulnerable Code

```javascript
// src/api/search.js:42
async function searchUsers(req, res) {
  const { query } = req.query;
  const sql = `SELECT * FROM users WHERE name LIKE '%${query}%'`;
  const results = await db.query(sql);
  return res.json(results);
}
```

### Proof of Concept

Request:
```
GET /api/search?query=' OR '1'='1' --
```

Results in SQL:
```sql
SELECT * FROM users WHERE name LIKE '%' OR '1'='1' -- %'
```

This returns all users, bypassing the search filter.

### Impact

- Full database read access
- Potential data exfiltration
- Possible database modification or deletion
- Authentication bypass if used in login

### Remediation

Use parameterized queries:

```javascript
// FIXED: src/api/search.js:42
async function searchUsers(req, res) {
  const { query } = req.query;
  const sql = 'SELECT * FROM users WHERE name LIKE ?';
  const results = await db.query(sql, [`%${query}%`]);
  return res.json(results);
}
```

### References

- [OWASP SQL Injection](https://owasp.org/www-community/attacks/SQL_Injection)
- CWE-89: SQL Injection
```

---

### Critical: Hardcoded JWT Secret

```markdown
## SEC-002: Hardcoded JWT Signing Secret

**Severity**: Critical | **CVSS**: 9.1
**Location**: `src/auth/jwt.js:8`
**Phase**: Secrets Management

### Description

The JWT signing secret is hardcoded in the source code, allowing anyone with code access to forge valid authentication tokens.

### Vulnerable Code

```javascript
// src/auth/jwt.js:8
const JWT_SECRET = 'super-secret-key-12345';

function generateToken(user) {
  return jwt.sign({ id: user.id, role: user.role }, JWT_SECRET);
}
```

### Impact

- Any developer or attacker with code access can create valid tokens
- Complete authentication bypass
- Impersonation of any user including admins
- Secret exposed in version control history

### Remediation

1. Move secret to environment variable:

```javascript
// FIXED: src/auth/jwt.js
const JWT_SECRET = process.env.JWT_SECRET;

if (!JWT_SECRET) {
  throw new Error('JWT_SECRET environment variable required');
}
```

2. Rotate the compromised secret immediately
3. Generate a strong secret (256+ bits):
   ```bash
   openssl rand -base64 32
   ```

4. Invalidate all existing tokens (logout all users)

### References

- CWE-798: Use of Hard-coded Credentials
- [OWASP Key Management](https://cheatsheetseries.owasp.org/cheatsheets/Key_Management_Cheat_Sheet.html)
```

---

### High: Missing Rate Limiting

```markdown
## SEC-003: No Rate Limiting on Authentication

**Severity**: High | **CVSS**: 7.5
**Location**: `src/api/auth.js` (POST /login)
**Phase**: Security Surface

### Description

The login endpoint has no rate limiting, allowing unlimited authentication attempts. This enables brute force attacks against user accounts.

### Evidence

Tested 100 requests in 1 second - all processed without throttling.

```bash
for i in {1..100}; do
  curl -X POST http://api/login \
    -d '{"email":"test@example.com","password":"guess'$i'"}' &
done
```

### Impact

- Credential stuffing attacks
- Brute force password guessing
- Account lockout denial of service (if lockout exists)
- Increased infrastructure costs

### Remediation

Implement rate limiting:

```javascript
// Using express-rate-limit
const rateLimit = require('express-rate-limit');

const loginLimiter = rateLimit({
  windowMs: 15 * 60 * 1000, // 15 minutes
  max: 5, // 5 attempts per window
  message: 'Too many login attempts, please try again later',
  standardHeaders: true,
  legacyHeaders: false,
});

app.post('/login', loginLimiter, authController.login);
```

Consider also:
- Progressive delays after failures
- CAPTCHA after 3 failed attempts
- Account lockout notification

### References

- [OWASP Brute Force](https://owasp.org/www-community/controls/Blocking_Brute_Force_Attacks)
- CWE-307: Improper Restriction of Excessive Authentication Attempts
```

---

### High: IDOR Vulnerability

```markdown
## SEC-004: Insecure Direct Object Reference (IDOR)

**Severity**: High | **CVSS**: 7.2
**Location**: `src/api/users.js:28`
**Phase**: Authorization

### Description

The user profile endpoint allows any authenticated user to access any other user's profile by changing the ID parameter. No ownership verification is performed.

### Vulnerable Code

```javascript
// src/api/users.js:28
router.get('/users/:id', authenticate, async (req, res) => {
  const user = await User.findById(req.params.id);
  return res.json(user); // Returns any user's data!
});
```

### Proof of Concept

1. Login as user with ID 123
2. Request: `GET /api/users/456`
3. Response: Full profile of user 456 (not your account)

### Impact

- Access to other users' personal data
- Potential PII exposure (email, phone, address)
- Privacy violation
- Possible regulatory compliance issues (GDPR, CCPA)

### Remediation

Add ownership verification:

```javascript
// FIXED: src/api/users.js:28
router.get('/users/:id', authenticate, async (req, res) => {
  // Option 1: Only allow own profile
  if (req.params.id !== req.user.id) {
    return res.status(403).json({ error: 'Access denied' });
  }

  // Option 2: Allow admins to view any
  if (req.params.id !== req.user.id && req.user.role !== 'admin') {
    return res.status(403).json({ error: 'Access denied' });
  }

  const user = await User.findById(req.params.id);
  return res.json(user);
});
```

### References

- [OWASP IDOR](https://owasp.org/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/05-Authorization_Testing/04-Testing_for_Insecure_Direct_Object_References)
- CWE-639: Authorization Bypass Through User-Controlled Key
```

---

### Medium: PII in Logs

```markdown
## SEC-005: Sensitive Data Exposure in Logs

**Severity**: Medium | **CVSS**: 5.3
**Location**: `src/middleware/logger.js:15`
**Phase**: Data Protection

### Description

The request logger captures full request bodies, which may include passwords, tokens, and other sensitive data.

### Vulnerable Code

```javascript
// src/middleware/logger.js:15
app.use((req, res, next) => {
  console.log({
    method: req.method,
    path: req.path,
    body: req.body, // Logs passwords, tokens, PII
    headers: req.headers // Logs auth tokens
  });
  next();
});
```

### Log Output Example

```json
{
  "method": "POST",
  "path": "/api/login",
  "body": {
    "email": "user@example.com",
    "password": "MySecretPassword123!"  // Exposed!
  },
  "headers": {
    "authorization": "Bearer eyJhbG..."  // Token exposed!
  }
}
```

### Impact

- Passwords visible in logs
- Auth tokens exposed
- PII (email, personal data) logged
- Compliance violations (GDPR, PCI-DSS)
- Attackers with log access gain credentials

### Remediation

Implement log redaction:

```javascript
// FIXED: src/middleware/logger.js
const sensitiveFields = ['password', 'token', 'authorization', 'ssn', 'creditCard'];

function redactSensitive(obj, fields) {
  const redacted = { ...obj };
  for (const field of fields) {
    if (redacted[field]) {
      redacted[field] = '[REDACTED]';
    }
  }
  return redacted;
}

app.use((req, res, next) => {
  console.log({
    method: req.method,
    path: req.path,
    body: redactSensitive(req.body, sensitiveFields),
    // Don't log auth headers at all
  });
  next();
});
```

### References

- CWE-532: Insertion of Sensitive Information into Log File
- [OWASP Logging Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Logging_Cheat_Sheet.html)
```

---

## Sample Compliance Mapping

### OWASP ASVS Mapping Example

```markdown
## V2.1 Password Security Requirements

| Req | Description | L1 | L2 | L3 | Status | Finding |
|-----|-------------|:--:|:--:|:--:|:------:|---------|
| 2.1.1 | User set passwords at least 12 chars | ✓ | ✓ | ✓ | ❌ | SEC-006 |
| 2.1.2 | Passwords 64+ chars permitted | ✓ | ✓ | ✓ | ✅ | - |
| 2.1.3 | Password truncation not performed | ✓ | ✓ | ✓ | ✅ | - |
| 2.1.4 | Any Unicode chars allowed | ✓ | ✓ | ✓ | ⚠️ | ASCII only |
| 2.1.5 | Compromised password check | | ✓ | ✓ | ❌ | SEC-007 |
| 2.1.6 | Password strength meter | | ✓ | ✓ | ❌ | - |
| 2.1.7 | No password composition rules | ✓ | ✓ | ✓ | ❌ | Complex rules |
| 2.1.8 | No password hints | ✓ | ✓ | ✓ | ✅ | - |
| 2.1.9 | No knowledge-based auth | ✓ | ✓ | ✓ | ✅ | - |
| 2.1.10 | No periodic credential rotation | ✓ | ✓ | ✓ | ⚠️ | 90-day policy |
| 2.1.11 | Paste allowed in password fields | ✓ | ✓ | ✓ | ✅ | - |
| 2.1.12 | Show/hide password toggle | ✓ | ✓ | ✓ | ✅ | - |

### Summary
- **Passed**: 6/12 (50%)
- **Failed**: 4/12
- **Partial**: 2/12
```

---

## Sample Executive Summary

```markdown
# Executive Summary

## Security Assessment: Acme E-Commerce API

**Date**: 2024-01-15
**Scope**: Backend API (api.acme.com)
**Grade**: C

---

### Overall Posture

The application demonstrates a **moderate security posture** with several critical issues requiring immediate attention. While basic security controls are in place (HTTPS, authentication), significant vulnerabilities were identified in input validation, secrets management, and authorization.

### Key Statistics

| Category | Count |
|----------|-------|
| Critical Findings | 2 |
| High Findings | 4 |
| Medium Findings | 6 |
| Low Findings | 3 |

### Immediate Actions Required

1. **SQL Injection (SEC-001)** - Critical vulnerability in search allowing database compromise. Fix: Convert to parameterized queries.

2. **Hardcoded Secrets (SEC-002)** - JWT secret in source code enables authentication bypass. Fix: Rotate secret, move to environment.

3. **Missing Rate Limiting (SEC-003)** - Login endpoint vulnerable to brute force. Fix: Implement rate limiting middleware.

### Positive Observations

- TLS 1.3 properly configured
- Password hashing uses bcrypt
- Session cookies have Secure flag
- No sensitive data in URLs

### Compliance Summary

| Framework | Score |
|-----------|-------|
| OWASP ASVS L1 | 62% |
| NIST CSF | 58% |
| CIS Controls IG1 | 55% |

### Estimated Remediation

| Priority | Findings | Effort |
|----------|----------|--------|
| Critical | 2 | 1 week |
| High | 4 | 2 weeks |
| Medium | 6 | 1 month |

### Recommendation

Address critical findings within 48 hours. Schedule high-priority fixes for the next sprint. Medium findings should be included in the quarterly security roadmap.
```

---

## Sample Remediation Roadmap

```mermaid
gantt
    title Security Remediation Roadmap
    dateFormat YYYY-MM-DD

    section Critical (Week 1)
        SEC-001 SQL Injection       :crit, done, c1, 2024-01-15, 2d
        SEC-002 Rotate secrets      :crit, active, c2, 2024-01-15, 3d
        Verify critical fixes       :crit, c3, after c2, 1d

    section High (Week 2-3)
        SEC-003 Rate limiting       :high, h1, 2024-01-22, 2d
        SEC-004 IDOR fixes          :high, h2, 2024-01-22, 3d
        SEC-005 Log redaction       :high, h3, 2024-01-25, 2d
        SEC-008 Session hardening   :high, h4, 2024-01-29, 2d

    section Medium (Week 4-6)
        SEC-006 Password policy     :med, m1, 2024-02-05, 2d
        SEC-007 Breach check        :med, m2, 2024-02-07, 3d
        SEC-009 Headers             :med, m3, 2024-02-12, 1d
        SEC-010 CORS config         :med, m4, 2024-02-13, 1d

    section Verification
        Retest all findings         :2024-02-19, 3d
        Final report                :2024-02-22, 1d
```
