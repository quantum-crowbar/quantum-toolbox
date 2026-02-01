# Change Management Templates

Artifact templates for TOGAF Phase H deliverables.

---

## Architecture Change Request Template

```markdown
# Architecture Change Request

**Request ID**: ACR-{nnn}
**Status**: {Draft/Submitted/Assessing/Decided/Closed}
**Date**: {date}

---

## Request Information

| Attribute | Value |
|-----------|-------|
| **Request ID** | ACR-{nnn} |
| **Title** | {brief descriptive title} |
| **Requestor** | {name} |
| **Department** | {department/team} |
| **Date Submitted** | {date} |
| **Urgency** | {Critical/High/Medium/Low} |

---

## Change Description

### Summary
{One paragraph overview of the proposed change}

### Detailed Description
{Comprehensive description of what is being proposed}

### Current State
{Description of the current architecture in the affected area}

### Proposed Future State
{Description of the desired architecture after the change}

---

## Change Driver

### Driver Type
| Type | Selected |
|------|----------|
| Business Strategy | {☐/☑} |
| Technology Lifecycle | {☐/☑} |
| Regulatory/Compliance | {☐/☑} |
| Performance Issue | {☐/☑} |
| Security Concern | {☐/☑} |
| Cost Optimization | {☐/☑} |
| Enhancement Request | {☐/☑} |
| Defect Resolution | {☐/☑} |
| Other: {specify} | {☐/☑} |

### Driver Details
{Explanation of why this change is needed}

### What Happens If We Don't Change
{Consequences of not implementing this change}

---

## Scope Estimate

### Affected Domains
| Domain | Affected | Impact Level |
|--------|----------|--------------|
| Business Architecture | {☐/☑} | {None/Low/Medium/High} |
| Data Architecture | {☐/☑} | {None/Low/Medium/High} |
| Application Architecture | {☐/☑} | {None/Low/Medium/High} |
| Technology Architecture | {☐/☑} | {None/Low/Medium/High} |

### Affected Systems
| System | Impact Description |
|--------|-------------------|
| {system name} | {how it's affected} |

### Estimated Scope
| Scope Level | Selected | Criteria |
|-------------|----------|----------|
| Minor | {☐/☑} | Single domain, <3 months, <$100K |
| Moderate | {☐/☑} | 2-3 domains, 3-12 months, $100K-$1M |
| Major | {☐/☑} | Enterprise-wide, >12 months, >$1M |

---

## Stakeholders

| Stakeholder | Interest | Impact |
|-------------|----------|--------|
| {name/role} | {their interest} | {High/Medium/Low} |

---

## Supporting Information

### Related Documents
| Document | Link/Reference |
|----------|----------------|
| {document name} | {location} |

### Related Changes
| Change ID | Relationship |
|-----------|--------------|
| {ACR-nnn} | {related/dependent/conflicts} |

---

## Submission

| Submitted By | Date | Notes |
|--------------|------|-------|
| {name} | {date} | |
```

---

## Change Impact Assessment Template

```markdown
# Change Impact Assessment

**Assessment ID**: CIA-{nnn}
**Change Request**: ACR-{nnn}
**Date**: {date}

---

## Assessment Information

| Attribute | Value |
|-----------|-------|
| **Assessment ID** | CIA-{nnn} |
| **Change Request** | ACR-{nnn} |
| **Assessor** | {name, role} |
| **Assessment Date** | {date} |
| **Assessment Duration** | {days} |

---

## Executive Summary

### Recommendation
| Recommendation | Rationale |
|----------------|-----------|
| {Approve/Approve with Modifications/Defer/Reject/Trigger ADM Cycle} | {brief rationale} |

### Key Findings
1. {finding 1}
2. {finding 2}
3. {finding 3}

### Critical Considerations
- {consideration 1}
- {consideration 2}

---

## Architecture Impact

### Principle Conformance
| Principle | Conformance | Notes |
|-----------|-------------|-------|
| {principle name} | {Conforms/Neutral/Conflicts} | {explanation} |

### Business Architecture Impact
| Aspect | Current | Proposed | Impact |
|--------|---------|----------|--------|
| Capabilities | {current} | {proposed} | {H/M/L/None} |
| Processes | {current} | {proposed} | {H/M/L/None} |
| Organization | {current} | {proposed} | {H/M/L/None} |

### Data Architecture Impact
| Aspect | Current | Proposed | Impact |
|--------|---------|----------|--------|
| Data Entities | {current} | {proposed} | {H/M/L/None} |
| Data Quality | {current} | {proposed} | {H/M/L/None} |
| Data Governance | {current} | {proposed} | {H/M/L/None} |

### Application Architecture Impact
| Aspect | Current | Proposed | Impact |
|--------|---------|----------|--------|
| Applications | {current} | {proposed} | {H/M/L/None} |
| Integrations | {current} | {proposed} | {H/M/L/None} |
| Services | {current} | {proposed} | {H/M/L/None} |

### Technology Architecture Impact
| Aspect | Current | Proposed | Impact |
|--------|---------|----------|--------|
| Infrastructure | {current} | {proposed} | {H/M/L/None} |
| Platforms | {current} | {proposed} | {H/M/L/None} |
| Standards | {current} | {proposed} | {H/M/L/None} |

---

## Dependency Analysis

### Upstream Dependencies
| Dependency | Type | Impact of Change |
|------------|------|------------------|
| {system/capability} | {data/service/platform} | {impact} |

### Downstream Dependencies
| Dependent | Type | Impact on Dependent |
|-----------|------|---------------------|
| {system/capability} | {data/service/platform} | {impact} |

### Related Initiatives
| Initiative | Relationship | Coordination Needed |
|------------|--------------|---------------------|
| {project/program} | {complementary/conflicting/prerequisite} | {actions} |

---

## Risk Assessment

### Implementation Risks
| Risk | Probability | Impact | Mitigation |
|------|-------------|--------|------------|
| {risk description} | {H/M/L} | {H/M/L} | {mitigation approach} |

### Non-Implementation Risks
| Risk | Probability | Impact | Notes |
|------|-------------|--------|-------|
| {risk if we don't change} | {H/M/L} | {H/M/L} | {notes} |

### Risk Summary
| Factor | Assessment |
|--------|------------|
| Overall Risk Level | {Critical/High/Medium/Low} |
| Risk Trend | {Increasing/Stable/Decreasing} |
| Reversibility | {Fully/Partially/Not Reversible} |

---

## Resource Estimate

### Effort Estimate
| Phase | Effort (person-days) | Notes |
|-------|---------------------|-------|
| Analysis/Design | {estimate} | {notes} |
| Implementation | {estimate} | {notes} |
| Testing | {estimate} | {notes} |
| Deployment | {estimate} | {notes} |
| **Total** | **{total}** | |

### Timeline Estimate
| Milestone | Target Date | Notes |
|-----------|-------------|-------|
| Design Complete | {date} | |
| Implementation Complete | {date} | |
| Testing Complete | {date} | |
| Deployed | {date} | |

### Cost Estimate
| Category | Estimate | Notes |
|----------|----------|-------|
| Internal Labor | ${amount} | {notes} |
| External Labor | ${amount} | {notes} |
| Software/Licenses | ${amount} | {notes} |
| Infrastructure | ${amount} | {notes} |
| Other | ${amount} | {notes} |
| **Total** | **${total}** | |

### Skills Required
| Skill | Quantity | Availability |
|-------|----------|--------------|
| {skill} | {FTEs} | {Available/Constrained/Not Available} |

---

## Stakeholder Impact

| Stakeholder | Impact | Concerns | Mitigation |
|-------------|--------|----------|------------|
| {stakeholder} | {H/M/L} | {their concerns} | {how addressed} |

---

## Disposition Analysis

### Phase H vs New ADM Cycle
| Criterion | Assessment | Score |
|-----------|------------|-------|
| Impacts Enterprise Vision | {Yes/No} | {1-5} |
| Multi-Domain Impact | {Yes/No} | {1-5} |
| Requires New Capabilities | {Yes/No} | {1-5} |
| Investment Scale | {<$100K/$100K-$1M/>$1M} | {1-5} |
| Timeline | {<3mo/3-12mo/>12mo} | {1-5} |
| **Total Score** | | **{total}** |

| Score Range | Recommendation |
|-------------|----------------|
| 5-10 | Handle in Phase H |
| 11-18 | Partial ADM Cycle |
| 19-25 | Full ADM Cycle |

### Recommended Disposition
| Disposition | Rationale |
|-------------|-----------|
| {recommendation} | {detailed rationale} |

---

## Appendices

### A. Affected Artifacts
| Artifact | Current Version | Changes Needed |
|----------|-----------------|----------------|
| {artifact} | {version} | {changes} |

### B. Consultation Log
| Date | Consulted | Input |
|------|-----------|-------|
| {date} | {name/role} | {summary of input} |
```

---

## Change Decision Record Template

```markdown
# Change Decision Record

**Decision ID**: CDR-{nnn}
**Change Request**: ACR-{nnn}
**Date**: {date}

---

## Decision Summary

| Attribute | Value |
|-----------|-------|
| **Change Request** | ACR-{nnn}: {title} |
| **Decision** | {Approved/Approved with Modifications/Deferred/Rejected/ADM Cycle Triggered} |
| **Decision Date** | {date} |
| **Decision Authority** | {name, role/body} |

---

## Decision Details

### Decision
{Full statement of the decision}

### Rationale
{Explanation of why this decision was made}

### Key Factors
1. {factor 1}
2. {factor 2}
3. {factor 3}

---

## Conditions (If Approved with Modifications)

| Condition | Description | Due Date | Owner |
|-----------|-------------|----------|-------|
| {condition} | {details} | {date} | {name} |

---

## Deferral Details (If Deferred)

| Attribute | Value |
|-----------|-------|
| Defer Until | {date or trigger event} |
| Reason | {why deferred} |
| Re-evaluation Trigger | {what will trigger re-assessment} |

---

## Rejection Details (If Rejected)

| Attribute | Value |
|-----------|-------|
| Reason | {why rejected} |
| Alternative Suggested | {any alternative approach} |
| Can Resubmit | {Yes/No} |
| Resubmit Conditions | {what would need to change} |

---

## ADM Cycle Details (If Triggered)

| Attribute | Value |
|-----------|-------|
| Cycle ID | {ADM-yyyy-nnn} |
| Starting Phase | {Phase A/B/C/D/E} |
| Scope | {cycle scope} |
| Target Start | {date} |
| Assigned Architect | {name} |

---

## Next Steps

| Step | Owner | Due Date | Status |
|------|-------|----------|--------|
| {step} | {name} | {date} | {Open/Complete} |

---

## Decision Record

| Role | Name | Decision | Date |
|------|------|----------|------|
| {decision maker role} | {name} | {Approve/Reject/etc.} | {date} |

### Discussion Notes
{Summary of key points from decision discussion}

---

## Change Request Closure

| Attribute | Value |
|-----------|-------|
| Closed Date | {date} |
| Closed By | {name} |
| Final Status | {Approved - Implementing/Rejected - Closed/Deferred - Pending} |
```

---

## Architecture Update Communication Template

```markdown
# Architecture Update Notification

**Update ID**: AUN-{nnn}
**Effective Date**: {date}

---

## Summary

| Attribute | Value |
|-----------|-------|
| **Update ID** | AUN-{nnn} |
| **Related Change** | ACR-{nnn} |
| **Update Type** | {New/Modified/Deprecated/Retired} |
| **Effective Date** | {date} |
| **Communication Date** | {date} |

---

## What Changed

### Overview
{Clear, non-technical summary of the change}

### Detailed Changes

| Artifact | Change Type | Description |
|----------|-------------|-------------|
| {artifact name} | {Added/Modified/Removed} | {what changed} |

---

## Why This Changed

### Driver
{Business or technical driver for this change}

### Expected Benefits
- {benefit 1}
- {benefit 2}

---

## Impact

### Who Is Affected
| Audience | Impact | Action Required |
|----------|--------|-----------------|
| {audience} | {how affected} | {what they need to do} |

### Systems Affected
| System | Impact | Timeline |
|--------|--------|----------|
| {system} | {impact} | {when} |

---

## What You Need to Do

### Immediate Actions
1. {action 1}
2. {action 2}

### Timeline
| Milestone | Date | Description |
|-----------|------|-------------|
| Effective | {date} | Change takes effect |
| Compliance Required | {date} | All systems must comply |

---

## Resources

| Resource | Link |
|----------|------|
| Updated Architecture | {link} |
| Migration Guide | {link} |
| FAQ | {link} |
| Support | {contact} |

---

## Questions and Support

| Question Type | Contact |
|---------------|---------|
| Architecture Clarification | {architect, email} |
| Implementation Support | {team, channel} |
| Exception Requests | {governance, process} |

---

## Feedback

We welcome feedback on this architecture update. Please submit feedback to:
{feedback channel/contact}

---

*Issued by: {Architecture Team}*
*Date: {date}*
```

---

## Architecture Health Report Template

```markdown
# Architecture Health Report

**Report Period**: {period}
**Report Date**: {date}

---

## Executive Summary

### Overall Health: {Healthy/Attention Needed/At Risk/Critical}

| Dimension | Status | Trend |
|-----------|--------|-------|
| Conformance | {G/Y/R} | {↑/→/↓} |
| Performance | {G/Y/R} | {↑/→/↓} |
| Technical Health | {G/Y/R} | {↑/→/↓} |
| Business Alignment | {G/Y/R} | {↑/→/↓} |

### Key Highlights
- {highlight 1}
- {highlight 2}
- {highlight 3}

### Recommended Actions
| Priority | Action | Owner |
|----------|--------|-------|
| {H/M/L} | {action} | {owner} |

---

## Conformance Status

### Compliance Metrics
| Metric | Target | Actual | Status |
|--------|--------|--------|--------|
| Overall Compliance | >90% | {%} | {G/Y/R} |
| Critical Findings | 0 | {n} | {G/Y/R} |
| Active Deviations | <10 | {n} | {G/Y/R} |
| Overdue Remediations | 0 | {n} | {G/Y/R} |

### By Domain
| Domain | Compliance | Findings | Deviations |
|--------|------------|----------|------------|
| Business | {%} | {n} | {n} |
| Data | {%} | {n} | {n} |
| Application | {%} | {n} | {n} |
| Technology | {%} | {n} | {n} |

### Notable Conformance Issues
| Issue | Domain | Impact | Status |
|-------|--------|--------|--------|
| {issue} | {domain} | {H/M/L} | {status} |

---

## Performance Status

### Key Performance Indicators
| KPI | Target | Actual | Status |
|-----|--------|--------|--------|
| Availability | {target} | {actual} | {G/Y/R} |
| Response Time (P95) | {target} | {actual} | {G/Y/R} |
| Error Rate | {target} | {actual} | {G/Y/R} |
| Throughput | {target} | {actual} | {G/Y/R} |

### SLA Status
| Service | SLA | Met | Breaches |
|---------|-----|-----|----------|
| {service} | {SLA} | {Y/N} | {n} |

### Performance Concerns
| Concern | Impact | Trend | Action |
|---------|--------|-------|--------|
| {concern} | {H/M/L} | {↑/→/↓} | {action} |

---

## Technical Health

### Technology Lifecycle
| Status | Count | Notable |
|--------|-------|---------|
| Current | {n} | |
| Approaching EOL | {n} | {list} |
| Past EOL | {n} | {list} |
| Unsupported | {n} | {list} |

### Security Posture
| Metric | Status | Notes |
|--------|--------|-------|
| Critical Vulnerabilities | {n} | {notes} |
| High Vulnerabilities | {n} | {notes} |
| Security Compliance | {%} | {notes} |

### Technical Debt
| Category | Level | Trend |
|----------|-------|-------|
| Code Quality | {H/M/L} | {↑/→/↓} |
| Documentation | {H/M/L} | {↑/→/↓} |
| Testing | {H/M/L} | {↑/→/↓} |
| Infrastructure | {H/M/L} | {↑/→/↓} |

---

## Business Alignment

### Strategic Alignment
| Strategic Goal | Architecture Support | Gaps |
|----------------|---------------------|------|
| {goal} | {how supported} | {gaps} |

### Capability Utilization
| Capability | Planned Usage | Actual Usage | Status |
|------------|---------------|--------------|--------|
| {capability} | {planned} | {actual} | {G/Y/R} |

### Stakeholder Feedback
| Stakeholder | Satisfaction | Key Feedback |
|-------------|--------------|--------------|
| {stakeholder} | {score/5} | {feedback summary} |

---

## Change Activity

### Change Requests
| Metric | This Period | Previous | Trend |
|--------|-------------|----------|-------|
| Submitted | {n} | {n} | {↑/→/↓} |
| Approved | {n} | {n} | {↑/→/↓} |
| Rejected | {n} | {n} | {↑/→/↓} |
| In Progress | {n} | {n} | {↑/→/↓} |

### Notable Changes
| Change | Status | Impact |
|--------|--------|--------|
| {change} | {status} | {impact} |

---

## Recommendations

### Immediate Actions (This Period)
| Priority | Recommendation | Rationale | Owner |
|----------|----------------|-----------|-------|
| High | {recommendation} | {rationale} | {owner} |

### Strategic Recommendations
| Recommendation | Timeline | Investment | Benefit |
|----------------|----------|------------|---------|
| {recommendation} | {timeline} | {estimate} | {benefit} |

### ADM Cycle Candidates
| Area | Driver | Recommended Scope |
|------|--------|-------------------|
| {area} | {driver} | {scope} |

---

## Appendix

### Monitoring Dashboard Links
| Dashboard | Link |
|-----------|------|
| {dashboard} | {link} |

### Data Sources
| Source | Last Updated |
|--------|--------------|
| {source} | {date} |
```

---

## ADM Cycle Trigger Template

```markdown
# ADM Cycle Trigger

**Trigger ID**: ADM-{yyyy}-{nnn}
**Date**: {date}

---

## Trigger Information

| Attribute | Value |
|-----------|-------|
| **Trigger ID** | ADM-{yyyy}-{nnn} |
| **Source Change Request** | ACR-{nnn} (if applicable) |
| **Triggered By** | {name, role} |
| **Trigger Date** | {date} |
| **Proposed Start** | {date} |

---

## Business Context

### Driver
{Why a new ADM cycle is needed}

### Strategic Alignment
{How this relates to business strategy}

### Urgency
| Urgency | Rationale |
|---------|-----------|
| {Critical/High/Medium/Low} | {explanation} |

---

## Cycle Scope

### Starting Phase
| Starting Phase | Rationale |
|----------------|-----------|
| Phase A (Vision) | {if selected, why} |
| Phase B (Business) | {if selected, why} |
| Phase E (Opportunities) | {if selected, why} |

### Domains In Scope
| Domain | In Scope | Focus |
|--------|----------|-------|
| Business Architecture | {☐/☑} | {specific focus} |
| Data Architecture | {☐/☑} | {specific focus} |
| Application Architecture | {☐/☑} | {specific focus} |
| Technology Architecture | {☐/☑} | {specific focus} |

### Out of Scope
- {what is explicitly excluded}

---

## Key Stakeholders

| Stakeholder | Role in Cycle | Involvement |
|-------------|---------------|-------------|
| {name} | {sponsor/reviewer/participant} | {F/T or P/T} |

---

## Resource Requirements

| Resource | Quantity | Duration |
|----------|----------|----------|
| Enterprise Architect | {FTEs} | {duration} |
| Domain Architects | {FTEs} | {duration} |
| Business Analysts | {FTEs} | {duration} |
| Other: {specify} | {FTEs} | {duration} |

---

## Timeline Estimate

| Phase | Duration | Target Dates |
|-------|----------|--------------|
| {starting phase} | {weeks} | {dates} |
| {next phase} | {weeks} | {dates} |
| Total Cycle | {weeks/months} | {start - end} |

---

## Expected Outcomes

### Deliverables
| Deliverable | Description |
|-------------|-------------|
| {deliverable} | {description} |

### Success Criteria
| Criterion | Measure |
|-----------|---------|
| {criterion} | {how measured} |

---

## Approval

| Approver | Role | Decision | Date |
|----------|------|----------|------|
| {name} | {role} | {Approved/Rejected} | {date} |

### Approval Notes
{Any notes or conditions from approval}

---

## Next Steps (Upon Approval)

| Step | Owner | Due Date |
|------|-------|----------|
| Assign lead architect | {name} | {date} |
| Form architecture team | {name} | {date} |
| Schedule kickoff | {name} | {date} |
| Begin {starting phase} | {name} | {date} |
```
