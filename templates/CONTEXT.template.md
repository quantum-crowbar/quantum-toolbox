# Project CONTEXT.md Template

> **Instructions**: Copy this file to your project root as `CONTEXT.md` and customize all sections.
> Remove all `<!-- instruction -->` comments after customizing.
> Update this file frequently as the project evolves.

---

# Development Context

Current project context and state information for AI agents.

> **Skill-first rule**: Before starting any task, check `.quantum-toolbox/skills/_index.md` for a skill that covers the work. Load and follow the matching skill — it encodes the preferred approach, templates, and quality bar.

## Project Overview

<!-- Brief description of what this project is -->

**Name:** <!-- Project name -->

**Description:** <!-- 1-2 sentence description of the project -->

**Goals:**
<!-- List 3-5 primary goals of the project -->
- <!-- Goal 1 -->
- <!-- Goal 2 -->
- <!-- Goal 3 -->

## Tech Stack

<!-- List all major technologies used -->

| Category | Technology |
|----------|------------|
| Language | <!-- e.g., TypeScript, Python, Go --> |
| Framework | <!-- e.g., Next.js, Django, Gin --> |
| Database | <!-- e.g., PostgreSQL, MongoDB --> |
| Testing | <!-- e.g., Jest, Pytest, Go test --> |
| CI/CD | <!-- e.g., GitHub Actions, GitLab CI --> |
| Hosting | <!-- e.g., Vercel, AWS, GCP --> |

## Current State

**Version:** <!-- e.g., 1.0.0 or "pre-release" -->

**Status:** <!-- e.g., "Active development", "Maintenance mode", "Beta" -->

### Implemented

<!-- List completed features/components -->
- <!-- Feature 1 -->
- <!-- Feature 2 -->

### In Progress

<!-- List features currently being worked on -->
- <!-- Feature being developed -->

### Planned

<!-- List upcoming features (optional) -->
- <!-- Planned feature -->

## Key Components

<!-- Map of important files/directories and their purposes -->

| Path | Purpose |
|------|---------|
| <!-- /src/api --> | <!-- API routes --> |
| <!-- /src/components --> | <!-- React components --> |
| <!-- /src/lib --> | <!-- Shared utilities --> |

## Known Issues

<!-- List known bugs or technical debt -->
<!-- Use "None currently" if no known issues -->

- <!-- Issue 1: description and any workarounds -->

## Dependencies

### Production

<!-- List key production dependencies -->
| Package | Version | Purpose |
|---------|---------|---------|
| <!-- package --> | <!-- ^1.0.0 --> | <!-- Why it's needed --> |

### Development

<!-- List key dev dependencies -->
| Package | Version | Purpose |
|---------|---------|---------|
| <!-- package --> | <!-- ^1.0.0 --> | <!-- Why it's needed --> |

## Environment Setup

### Prerequisites

<!-- What needs to be installed before setup -->
- <!-- Node.js >= 18 -->
- <!-- Docker (optional) -->

### Local Development

<!-- Step-by-step setup instructions -->

1. Clone the repository:
   ```bash
   git clone <!-- repo-url -->
   cd <!-- project-name -->
   ```

2. Install dependencies:
   ```bash
   <!-- npm install / pip install -r requirements.txt / etc. -->
   ```

3. Set up environment variables:
   ```bash
   cp .env.example .env
   # Edit .env with your values
   ```

4. Run the development server:
   ```bash
   <!-- npm run dev / python manage.py runserver / etc. -->
   ```

### Running Tests

```bash
<!-- npm test / pytest / go test ./... / etc. -->
```

## Architecture Notes

<!-- Optional: Add any important architectural decisions or patterns -->

### Design Patterns Used

<!-- e.g., Repository pattern, Factory pattern, etc. -->

### Important Conventions

<!-- e.g., "All database access goes through the /src/db module" -->

---

## Update Log

<!-- Track major context updates -->

| Date | Changes |
|------|---------|
| <!-- YYYY-MM-DD --> | <!-- Initial context created --> |
