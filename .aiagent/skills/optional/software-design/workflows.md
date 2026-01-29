# Software Design Workflows

Step-by-step procedures for design tasks.

---

## Designing a New Feature

### 1. Understand Requirements

- [ ] What problem does this solve?
- [ ] Who are the users/consumers?
- [ ] What are the inputs and outputs?
- [ ] What are the constraints (performance, security, compatibility)?
- [ ] What are the edge cases?

### 2. Explore Existing Code

- [ ] What related functionality exists?
- [ ] What patterns are already used in the codebase?
- [ ] What can be reused or extended?
- [ ] What constraints does existing architecture impose?

### 3. Design the Solution

1. **Start with the interface** - What will consumers see?
2. **Define data structures** - What data flows through?
3. **Identify responsibilities** - What does each component do?
4. **Plan for errors** - What can go wrong?
5. **Consider testing** - How will this be verified?

### 4. Validate the Design

- [ ] Does it solve the stated problem?
- [ ] Is it consistent with existing patterns?
- [ ] Is it testable?
- [ ] Is it simpler than alternatives?
- [ ] Can it evolve if requirements change?

### 5. Document Decisions

- Record key decisions and rationale
- Note rejected alternatives and why
- Identify assumptions and risks

---

## Evaluating Design Alternatives

### 1. Define Evaluation Criteria

Common criteria:
- **Simplicity** - How easy to understand?
- **Maintainability** - How easy to modify?
- **Testability** - How easy to verify?
- **Performance** - Does it meet requirements?
- **Extensibility** - Can it grow?
- **Consistency** - Does it fit existing patterns?

### 2. Score Each Alternative

| Criterion | Weight | Option A | Option B | Option C |
|-----------|--------|----------|----------|----------|
| Simplicity | 3 | 4 | 3 | 2 |
| Maintainability | 3 | 3 | 4 | 2 |
| Performance | 2 | 2 | 3 | 5 |
| **Weighted Total** | | 27 | 29 | 23 |

### 3. Consider Trade-offs

- What are you gaining with each option?
- What are you sacrificing?
- Which trade-offs align with project priorities?

### 4. Make and Document Decision

- State the chosen option
- Explain why it was selected
- Document what was rejected and why

---

## Refactoring Workflow

### 1. Preparation

- [ ] Understand current behavior completely
- [ ] Ensure adequate test coverage
- [ ] Create safety net (tests, backups)
- [ ] Get buy-in if changes are significant

### 2. Identify Targets

Common refactoring targets:
- Long methods (> 20 lines)
- Large classes (> 200 lines)
- Duplicated code
- Complex conditionals
- Feature envy (method uses other class's data)
- Data clumps (same group of data in many places)

### 3. Plan Changes

1. Break work into small, safe steps
2. Each step should leave code working
3. Run tests after each step
4. Commit after each successful step

### 4. Execute Refactoring

Common refactoring operations:
- **Extract Method** - Pull code into new method
- **Extract Class** - Split large class
- **Rename** - Improve clarity
- **Move Method** - Better location
- **Inline** - Remove unnecessary indirection
- **Replace Conditional with Polymorphism**

### 5. Verify

- [ ] All tests still pass
- [ ] Behavior unchanged
- [ ] Code is cleaner/clearer
- [ ] No new issues introduced

---

## Code Review (Design Focus)

### Review Checklist

**Structure**
- [ ] Is responsibility clear and focused?
- [ ] Are abstractions at the right level?
- [ ] Is coupling minimized?
- [ ] Is cohesion maximized?

**Patterns**
- [ ] Are design patterns used appropriately?
- [ ] Is the code consistent with existing patterns?
- [ ] Are there any anti-patterns?

**Simplicity**
- [ ] Is this the simplest solution?
- [ ] Is there unnecessary complexity?
- [ ] Could anything be removed?

**Future-Proofing**
- [ ] Is it easy to modify?
- [ ] Are extension points sensible?
- [ ] Are assumptions documented?

### Giving Design Feedback

1. **Be specific** - Point to exact code
2. **Explain why** - Not just what's wrong
3. **Suggest alternatives** - Offer solutions
4. **Prioritize** - Distinguish must-fix from nice-to-have
5. **Be respectful** - Critique code, not people

---

## Architecture Decision Records (ADR)

### When to Write an ADR

- Significant technical decisions
- Choices between alternatives
- Decisions that affect multiple components
- Non-obvious decisions that need explanation

### ADR Process

1. **Identify** - Recognize a decision is needed
2. **Research** - Explore alternatives
3. **Discuss** - Get team input
4. **Decide** - Make the call
5. **Document** - Write the ADR
6. **Communicate** - Share with stakeholders

See [templates.md](templates.md) for ADR template.

---

## Legacy Code Approach

### 1. Understand Before Changing

- Read the code thoroughly
- Trace execution paths
- Identify dependencies
- Find existing tests (if any)

### 2. Create Safety Net

- Write characterization tests (capture current behavior)
- Test at boundaries first
- Document discovered behavior

### 3. Make Small, Safe Changes

- One change at a time
- Run tests frequently
- Keep changes reversible

### 4. Gradually Improve

- Don't try to fix everything at once
- Leave code better than you found it
- Prioritize high-traffic areas
