# Tech Stack Decisions Skill

Frameworks and practices for making technology choices.

## Principles

### 1. Boring Technology is Good

- Proven technologies have known failure modes
- New/shiny often means unknown problems
- Innovation tokens are limited - spend wisely
- Default to well-established solutions

### 2. Right Tool for the Job

- No technology is universally best
- Context determines appropriate choice
- Consider team expertise and ecosystem
- Avoid resume-driven development

### 3. Total Cost of Ownership

Consider the full picture:
- Initial development time
- Learning curve for team
- Maintenance burden
- Operational complexity
- Hiring/training costs
- Migration costs later

### 4. Reversibility

- Prefer decisions that can be changed
- Minimize lock-in where practical
- Use abstractions at integration points
- Document escape routes

## Evaluation Framework

### Must-Have vs Nice-to-Have

**Must-Have (Non-negotiable)**
- Security requirements
- Compliance requirements
- Performance minimums
- Integration requirements

**Nice-to-Have (Trade-offs)**
- Developer experience
- Community size
- Documentation quality
- Future roadmap

### Weighted Scoring

| Criterion | Weight | Description |
|-----------|--------|-------------|
| Functionality | 25% | Does it solve the problem? |
| Maturity | 20% | Proven in production? |
| Team Fit | 20% | Team experience/learning curve? |
| Ecosystem | 15% | Libraries, tools, community? |
| Performance | 10% | Meets requirements? |
| Cost | 10% | Licensing, infrastructure? |

## Technology Categories

### Languages

**Consider:**
- Type system (static vs dynamic)
- Runtime performance needs
- Ecosystem and libraries
- Team expertise
- Hiring market

### Frameworks

**Consider:**
- Problem fit (don't use a hammer for screws)
- Opinionation level (convention vs configuration)
- Learning curve
- Community activity
- Long-term maintenance

### Databases

**Consider:**
- Data model fit (relational, document, graph, etc.)
- Scale requirements
- Consistency requirements
- Query patterns
- Operational complexity

### Infrastructure

**Consider:**
- Team expertise
- Vendor lock-in
- Cost at scale
- Compliance requirements
- Multi-cloud strategy

## Red Flags

### Technology Red Flags
- No production users
- Single maintainer
- Inactive repository
- Poor documentation
- Breaking changes frequently
- No migration path from alternatives

### Decision Process Red Flags
- "Everyone is using it"
- "It's the newest thing"
- "I want to learn it"
- No evaluation of alternatives
- No consideration of team skills
- Ignoring operational costs

## When to Adopt New Technology

### Good Reasons
- Solves a problem existing tools can't
- Significantly reduces complexity
- Team has evaluated and agreed
- Migration path is clear
- Risk is contained (can revert)

### Bad Reasons
- It's popular/trending
- Resume building
- Boredom with current stack
- "Because Google/Facebook uses it"
- Fear of missing out

## Migration Considerations

### Before Migrating
- Document current pain points
- Quantify benefits of new technology
- Plan migration path
- Identify rollback strategy
- Get stakeholder buy-in

### Migration Strategies
- **Strangler Fig**: Gradually replace components
- **Big Bang**: Replace all at once (risky)
- **Parallel Run**: Run both simultaneously
- **Feature Flag**: Toggle between implementations

### After Migrating
- Document lessons learned
- Update team knowledge
- Remove old code completely
- Update monitoring/alerting
