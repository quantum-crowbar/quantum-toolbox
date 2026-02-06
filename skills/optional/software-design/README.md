# Software Design Skill

Principles and practices for designing maintainable, scalable software.

## Core Principles

### SOLID Principles

**S - Single Responsibility Principle**
- A class/module should have one, and only one, reason to change
- Keeps code focused and easier to understand
- Makes testing straightforward

**O - Open/Closed Principle**
- Software entities should be open for extension, closed for modification
- Add new behavior without changing existing code
- Use abstractions and polymorphism

**L - Liskov Substitution Principle**
- Derived classes must be substitutable for their base classes
- Subtypes must honor the contracts of their parent types
- Avoid surprising behavior in inheritance hierarchies

**I - Interface Segregation Principle**
- Clients should not depend on interfaces they don't use
- Many specific interfaces are better than one general interface
- Reduces coupling and improves cohesion

**D - Dependency Inversion Principle**
- High-level modules should not depend on low-level modules
- Both should depend on abstractions
- Abstractions should not depend on details

### DRY (Don't Repeat Yourself)

- Every piece of knowledge should have a single representation
- Duplication is a sign of missing abstraction
- **But**: Avoid premature abstraction - some duplication is acceptable

### KISS (Keep It Simple, Stupid)

- Simplest solution that works is usually the best
- Complexity should be justified by requirements
- Readable code > clever code

### YAGNI (You Aren't Gonna Need It)

- Don't implement features until they're needed
- Avoid speculative generality
- Build for today's requirements, not imagined futures

## Design Patterns

### Creational Patterns

| Pattern | Use When |
|---------|----------|
| Factory | Creating objects without specifying exact class |
| Builder | Constructing complex objects step by step |
| Singleton | Ensuring single instance (use sparingly) |
| Prototype | Cloning existing objects |

### Structural Patterns

| Pattern | Use When |
|---------|----------|
| Adapter | Making incompatible interfaces work together |
| Decorator | Adding behavior without modifying classes |
| Facade | Simplifying complex subsystems |
| Composite | Treating individual and group objects uniformly |

### Behavioral Patterns

| Pattern | Use When |
|---------|----------|
| Observer | Notifying objects of state changes |
| Strategy | Selecting algorithms at runtime |
| Command | Encapsulating requests as objects |
| State | Changing behavior based on state |

## Architectural Patterns

### Layered Architecture

```
┌─────────────────────┐
│   Presentation      │  UI, API endpoints
├─────────────────────┤
│   Application       │  Use cases, orchestration
├─────────────────────┤
│   Domain            │  Business logic, entities
├─────────────────────┤
│   Infrastructure    │  Database, external services
└─────────────────────┘
```

### Clean Architecture

- Dependencies point inward (toward business logic)
- Inner layers don't know about outer layers
- Business rules independent of frameworks

### Hexagonal Architecture (Ports & Adapters)

- Core business logic at center
- Ports define interfaces
- Adapters implement external integrations

## Code Organization

### Cohesion

- Related code should be grouped together
- High cohesion = focused, single-purpose modules
- Low cohesion = scattered, unfocused modules

### Coupling

- Minimize dependencies between modules
- Loose coupling = changes don't ripple
- Tight coupling = changes cascade through system

### Separation of Concerns

- Each module addresses a distinct concern
- UI separate from business logic
- Business logic separate from persistence

## Decision Making

### When to Refactor

- Code smells accumulating
- Before adding new features to messy code
- After getting tests in place
- When understanding is difficult

### When NOT to Refactor

- Working code without tests
- Under time pressure (add tech debt ticket instead)
- "Just because" - needs clear benefit
- If it would break public APIs

### Abstractions

**Create an abstraction when:**
- Same pattern appears 3+ times (Rule of Three)
- Change is likely in that area
- Testing requires mocking

**Avoid abstraction when:**
- Only one implementation exists or is likely
- Added complexity outweighs benefits
- The abstraction leaks details
