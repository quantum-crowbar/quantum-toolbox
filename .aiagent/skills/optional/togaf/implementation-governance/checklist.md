# Implementation Governance Checklist

Quality gates and verification criteria for TOGAF Phase G activities.

---

## Governance Framework Checklist

### Framework Setup
- [ ] Governance operating model defined
- [ ] Roles and responsibilities documented
- [ ] Escalation paths established
- [ ] Decision-making authority clarified
- [ ] Communication channels established
- [ ] Tooling and repositories configured

### Governance Scope
- [ ] In-scope projects identified
- [ ] Governance tiers defined (if applicable)
- [ ] Exemption criteria documented
- [ ] Governance touchpoints mapped to SDLC

### Standards and References
- [ ] Current architecture documented
- [ ] Target architecture accessible
- [ ] Standards catalog available
- [ ] Principles documented
- [ ] Reference architectures published

---

## Architecture Contract Checklist

### Contract Content
- [ ] Parties identified with roles
- [ ] Scope clearly defined
- [ ] Architecture references specified
- [ ] Standards requirements listed
- [ ] Principle implications stated
- [ ] NFR targets documented
- [ ] Verification methods specified

### Contract Process
- [ ] Review checkpoints scheduled
- [ ] Review criteria defined
- [ ] Exception process documented
- [ ] Acceptance criteria stated
- [ ] Sign-off authorities identified

### Contract Quality
- [ ] Language is clear and unambiguous
- [ ] All referenced documents accessible
- [ ] Realistic and achievable requirements
- [ ] Measurable acceptance criteria
- [ ] All parties have reviewed

---

## Compliance Review Checklist

### Pre-Review Preparation
- [ ] Review type determined (design/implementation/go-live)
- [ ] Contract reference identified
- [ ] Review criteria confirmed
- [ ] Documentation collected
- [ ] Reviewers assigned
- [ ] Review meeting scheduled
- [ ] Attendees notified

### Architecture Conformance
- [ ] Solution aligns with target architecture
- [ ] Component design matches architecture
- [ ] Interfaces follow specified patterns
- [ ] Data model conforms to architecture
- [ ] Integration approach consistent
- [ ] Deployment model appropriate

### Standards Compliance
- [ ] Technology stack follows standards
- [ ] Security controls implemented
- [ ] API standards followed
- [ ] Data standards observed
- [ ] Coding standards applied
- [ ] Documentation standards met

### Principle Adherence
- [ ] Each principle assessed
- [ ] Implications documented
- [ ] Violations identified
- [ ] Justifications provided for deviations

### Non-Functional Requirements
- [ ] Performance requirements met
- [ ] Scalability verified
- [ ] Availability targets achievable
- [ ] Security requirements addressed
- [ ] Disaster recovery planned

### Documentation Review
- [ ] Solution design complete
- [ ] Architecture decision records current
- [ ] Interface specifications accurate
- [ ] Deployment documentation ready
- [ ] Operational runbooks prepared

---

## Review Decision Checklist

### For Approval
- [ ] All review criteria passed
- [ ] No unresolved non-compliances
- [ ] Documentation complete
- [ ] Stakeholders consulted

### For Conditional Approval
- [ ] Conditions clearly stated
- [ ] Due dates specified
- [ ] Owners assigned
- [ ] Verification method defined
- [ ] Risk of proceeding accepted

### For Deferral
- [ ] Specific issues documented
- [ ] Actions to resolve defined
- [ ] Re-review date scheduled
- [ ] Interim guidance provided

### For Rejection
- [ ] Clear rationale documented
- [ ] Guidance for remediation provided
- [ ] Escalation path communicated

---

## Deviation Management Checklist

### Deviation Request Quality
- [ ] Deviation type appropriate
- [ ] Category correctly identified
- [ ] Reference clearly stated
- [ ] Description complete
- [ ] Justification compelling
- [ ] Alternatives considered
- [ ] Impact assessment thorough
- [ ] Risk assessment complete

### For Variance Requests
- [ ] Impact confirmed as minor
- [ ] Risk confirmed as low
- [ ] No precedent concerns
- [ ] No security implications

### For Deferral Requests
- [ ] Remediation plan realistic
- [ ] Timeline acceptable
- [ ] Resources available
- [ ] Tracking mechanism defined
- [ ] Expiry date set

### For Waiver Requests
- [ ] Compelling justification
- [ ] Full impact understood
- [ ] Mitigations defined
- [ ] Stakeholder alignment
- [ ] Precedent implications considered

### Deviation Decision
- [ ] Appropriate authority deciding
- [ ] Decision documented
- [ ] Conditions stated (if applicable)
- [ ] Communication plan executed
- [ ] Register updated

---

## Deviation Register Checklist

### Register Maintenance
- [ ] All active deviations current
- [ ] Status regularly updated
- [ ] Expiry dates monitored
- [ ] At-risk deferrals escalated
- [ ] Remediated items closed

### Reporting
- [ ] Summary statistics current
- [ ] Trends identified
- [ ] Report distributed
- [ ] Escalations raised

---

## Implementation Support Checklist

### Guidance Activities
- [ ] Architecture interpretation provided
- [ ] Standards clarification given
- [ ] Pattern recommendations made
- [ ] Design alternatives explored

### Risk Monitoring
- [ ] Compliance risks tracked
- [ ] Early warnings raised
- [ ] Mitigation support provided
- [ ] Progress monitored

### Communication
- [ ] Regular touchpoints occurring
- [ ] Issues logged and tracked
- [ ] Decisions documented
- [ ] Knowledge shared

---

## Lessons Learned Checklist

### Capture
- [ ] Source identified
- [ ] Description clear
- [ ] Root cause analyzed
- [ ] Contributing factors noted

### Analysis
- [ ] Impact assessed
- [ ] Pattern identified (if recurring)
- [ ] Affected artifacts identified

### Action
- [ ] Recommendations specific
- [ ] Owners assigned
- [ ] Due dates set
- [ ] Follow-up scheduled

### Integration
- [ ] Architecture updates applied
- [ ] Standards updated
- [ ] Processes improved
- [ ] Training delivered
- [ ] Knowledge base updated

---

## Phase Entry Criteria

Before beginning Phase G activities:

- [ ] Implementation projects initiated
- [ ] Architecture contracts needed
- [ ] Governance framework defined (or ready to define)
- [ ] Architecture artifacts available for reference
- [ ] Roles and responsibilities assigned

---

## Phase Exit Criteria

Phase G activities continue throughout implementation, but key milestones:

### Per Project
- [ ] Architecture contract signed
- [ ] All review checkpoints completed
- [ ] Deviations resolved or tracked
- [ ] Final compliance confirmed
- [ ] Lessons captured

### Overall Governance
- [ ] Governance framework operational
- [ ] Register maintained
- [ ] Lessons integrated
- [ ] Metrics reported

---

## Quality Metrics

### Compliance Metrics
| Metric | Target | Formula |
|--------|--------|---------|
| Compliance Rate | >90% | Compliant items / Total items |
| First-Pass Approval | >70% | First-time approvals / Total reviews |
| Critical Findings | <5% | Critical findings / Total findings |

### Deviation Metrics
| Metric | Target | Formula |
|--------|--------|---------|
| Deferral Remediation | >95% | Remediated on time / Total deferrals |
| Waiver Rate | <5% | Waivers / Total decisions |
| Request Processing Time | <5 days | Avg days: submitted → decided |

### Process Metrics
| Metric | Target | Formula |
|--------|--------|---------|
| Review Coverage | 100% | Projects reviewed / Total projects |
| Lesson Implementation | >80% | Actions closed / Total actions |
| Stakeholder Satisfaction | >4/5 | Avg satisfaction score |
