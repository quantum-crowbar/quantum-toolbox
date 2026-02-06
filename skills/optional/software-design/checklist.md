# Software Design Checklist

Quick reference checklists for design reviews and decisions.

---

## Design Review Checklist

### Clarity
- [ ] Is the purpose clear?
- [ ] Are responsibilities well-defined?
- [ ] Is the naming meaningful?
- [ ] Is the design documented?

### Simplicity
- [ ] Is this the simplest solution?
- [ ] Can anything be removed?
- [ ] Are there unnecessary abstractions?
- [ ] Is complexity justified?

### SOLID Principles
- [ ] Single Responsibility: One reason to change?
- [ ] Open/Closed: Extensible without modification?
- [ ] Liskov Substitution: Subtypes substitutable?
- [ ] Interface Segregation: No unused dependencies?
- [ ] Dependency Inversion: Depends on abstractions?

### Coupling & Cohesion
- [ ] Is coupling minimized?
- [ ] Is cohesion maximized?
- [ ] Are dependencies explicit?
- [ ] Can components be tested in isolation?

### Error Handling
- [ ] Are failure modes identified?
- [ ] Are errors handled gracefully?
- [ ] Are error messages helpful?
- [ ] Is recovery possible where appropriate?

### Extensibility
- [ ] Can this evolve with requirements?
- [ ] Are extension points sensible?
- [ ] Is backwards compatibility considered?

---

## New Feature Design Checklist

### Before Starting
- [ ] Requirements understood?
- [ ] Constraints identified?
- [ ] Existing patterns reviewed?
- [ ] Stakeholders consulted?

### During Design
- [ ] Multiple approaches considered?
- [ ] Trade-offs documented?
- [ ] Edge cases addressed?
- [ ] Error scenarios planned?

### Before Implementation
- [ ] Design reviewed?
- [ ] Testing strategy defined?
- [ ] Dependencies identified?
- [ ] Risks assessed?

---

## Refactoring Checklist

### Preparation
- [ ] Current behavior understood?
- [ ] Tests in place?
- [ ] Change scope defined?
- [ ] Rollback plan ready?

### Execution
- [ ] Small steps taken?
- [ ] Tests run after each step?
- [ ] Commits made frequently?
- [ ] No behavior changes?

### Verification
- [ ] All tests pass?
- [ ] Code cleaner?
- [ ] No regressions?
- [ ] Documentation updated?

---

## API Design Checklist

### Usability
- [ ] Is it intuitive?
- [ ] Is it consistent with existing APIs?
- [ ] Are defaults sensible?
- [ ] Is it hard to misuse?

### Completeness
- [ ] Does it cover all use cases?
- [ ] Are errors well-defined?
- [ ] Is versioning considered?
- [ ] Is documentation adequate?

### Performance
- [ ] Is it efficient?
- [ ] Does it support pagination?
- [ ] Can it be cached?
- [ ] Are there rate limits?

---

## Code Smell Quick Reference

### Method Level
- [ ] Too long (> 20 lines)?
- [ ] Too many parameters (> 3)?
- [ ] Deep nesting (> 3 levels)?
- [ ] Complex conditionals?
- [ ] Feature envy?

### Class Level
- [ ] Too large (> 200 lines)?
- [ ] Too many responsibilities?
- [ ] God class?
- [ ] Data class (only getters/setters)?
- [ ] Refused bequest?

### System Level
- [ ] Duplicated code?
- [ ] Parallel inheritance hierarchies?
- [ ] Shotgun surgery (changes everywhere)?
- [ ] Divergent change (many reasons to change)?

---

## Pattern Selection Guide

### Need to create objects?
- **Simple creation**: Factory Method
- **Complex creation**: Builder
- **Family of objects**: Abstract Factory
- **Copy existing**: Prototype

### Need to add behavior?
- **Without changing class**: Decorator
- **Based on state**: State
- **Select at runtime**: Strategy
- **Compose behaviors**: Chain of Responsibility

### Need to simplify?
- **Complex subsystem**: Facade
- **Incompatible interfaces**: Adapter
- **Tree structures**: Composite

### Need to communicate?
- **Notify of changes**: Observer
- **Queue operations**: Command
- **Decouple**: Mediator

---

## Architecture Decision Criteria

| Criterion | Questions to Ask |
|-----------|------------------|
| **Simplicity** | Is it easy to understand? Explain? |
| **Maintainability** | Is it easy to change? Debug? |
| **Testability** | Is it easy to test? Mock? |
| **Performance** | Does it meet requirements? Scale? |
| **Security** | Are there vulnerabilities? |
| **Cost** | Development time? Infrastructure? |
| **Risk** | What can go wrong? Recovery? |

---

## Red Flags in Design

Watch out for:

- "We might need this later" (YAGNI violation)
- "Just in case" abstractions
- More than 3 levels of inheritance
- Circular dependencies
- God objects/classes
- Singletons everywhere
- Stringly-typed code
- Premature optimization
- Copy-paste with modifications
- Comments explaining "what" instead of "why"
