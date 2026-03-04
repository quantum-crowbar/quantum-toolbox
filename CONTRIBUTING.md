# Contributing

> **Audience:** Humans (contributor guide)

Thank you for your interest in contributing to the AI Agent Toolbox. This guide covers how to add skills, adjust the mental model, and submit changes.

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [Ways to Contribute](#ways-to-contribute)
- [Building a New Skill](#building-a-new-skill)
- [Modifying the Mental Model](#modifying-the-mental-model)
- [Modifying Existing Skills](#modifying-existing-skills)
- [Pull Request Process](#pull-request-process)
- [Commit Conventions](#commit-conventions)
- [Review Process](#review-process)

---

## Code of Conduct

This project follows the [Contributor Covenant Code of Conduct](CODE_OF_CONDUCT.md). By participating, you agree to uphold it.

---

## Ways to Contribute

| Contribution | Difficulty | Impact |
|-------------|-----------|--------|
| Fix a typo or broken link | Easy | Low |
| Improve an existing skill's examples | Easy | Medium |
| Report a bug or suggest a feature | Easy | Medium |
| Add a new skill | Medium | High |
| Propose a mental model change | Medium | High |
| Contribute an architecture-thinking profile | Hard | High |

---

## Building a New Skill

### 1. Propose First

Open a **New Skill Proposal** issue before writing anything. Include:
- What the skill does
- Who would use it
- How it relates to existing skills
- Approximate token cost (target: under 20K tokens for the full skill)

### 2. Directory Structure

Create your skill in `skills/optional/<skill-name>/`:

```
skills/optional/<skill-name>/
├── README.md       # Required — guidelines and principles
├── workflows.md    # Required — step-by-step procedures
├── examples.md     # Recommended — concrete case studies
├── templates.md    # Recommended — reusable document formats
└── checklist.md    # Optional — quick reference for reviews
```

### 3. Naming Conventions

- Use `kebab-case` for directory names
- Keep names concise but descriptive (e.g., `api-design`, not `best-practices`)
- Avoid generic names (`misc`, `stuff`, `utils`)

### 4. File Requirements

**README.md** (required):
- Start with `# Skill Name` heading
- Add `> **Audience:** AI Agents` tag
- Explain the skill's purpose and when to use it
- List principles and guidelines

**workflows.md** (required):
- Step-by-step procedures the agent follows
- Clear entry and exit conditions
- Error handling / what to do when stuck

### 5. Register the Skill

Add your skill to both:

1. **`skills/manifest.yaml`** — machine-readable metadata:
   ```yaml
   - name: your-skill
     tier: optional
     path: optional/your-skill/
     description: One-line description
     dependencies: []
     invocations:
       - "Trigger phrase"
     status: complete
   ```

2. **`skills/_index.md`** — human-readable catalog (add a row to the Optional Skills table)

### 6. Token Budget

Measure your skill's token footprint:
```bash
find skills/optional/your-skill -name "*.md" -exec wc -c {} + | tail -1 | awk '{print int(($1+3)/4)}'
```

Target: **under 20K tokens** for the full skill package. If larger, consider splitting into a base skill + advanced skill.

---

## Modifying the Mental Model

The mental model (`core/architecture-thinking.md`) is the engine that drives all skills. Changes here affect everything, so they're reviewed carefully.

### Three Levels of Change

| Level | What | How | Review Bar |
|-------|------|-----|-----------|
| **Project override** | Customize for your project | Create `architecture-thinking.local.md` in your project root | No review needed — it's your project |
| **Default change** | Improve the shared default | PR to `core/architecture-thinking.md` | High — must benefit most users |
| **New profile** | Alternative worldview | Add to `core/architecture-thinking/profiles/` | Medium — must be coherent and complete |

### When to Change the Default

Propose a change to the default mental model when:
- A concept is **universally applicable** (not industry-specific)
- The current guidance is **incorrect or misleading**
- A section is **missing** that most architects would expect
- An improvement has been **validated in practice**

### When to Create a Profile Instead

Create a new profile when:
- Your thinking model is **fundamentally different** (not just tweaked)
- It serves a **specific audience** (startups, regulated industries, platform teams)
- It would **conflict** with the default if merged in

### Proposing a Mental Model Change

1. Open an issue explaining what you want to change and why
2. Reference evidence or industry standards supporting the change
3. Explain the impact on existing skills (which skills behave differently?)
4. Submit a PR with the change

---

## Modifying Existing Skills

### What's Welcome

- Fixing errors in examples or templates
- Improving clarity of workflows
- Adding missing edge cases to checklists
- Updating references to current standards

### What Needs Discussion First

- Changing a skill's workflow structure (open an issue)
- Adding new output formats (may affect adapters)
- Changing skill dependencies
- Renaming invocation triggers

### Backwards Compatibility

- Don't rename or remove template sections that users may reference
- Don't change invocation phrases without updating `manifest.yaml` and `_index.md`
- If you must make a breaking change, document it clearly in your PR

---

## Pull Request Process

### Branch Naming

```
<type>/<short-description>

Examples:
  feat/api-design-skill
  fix/broken-links-togaf
  docs/improve-synthesis-examples
```

### PR Description

Use this format:

```markdown
## Summary
- What this PR does (1-3 bullets)

## Type of Change
- [ ] New skill
- [ ] Skill improvement
- [ ] Mental model change
- [ ] Bug fix
- [ ] Documentation

## Checklist
- [ ] I've read CONTRIBUTING.md
- [ ] New/modified skills have README.md and workflows.md
- [ ] manifest.yaml and _index.md are updated (if adding a skill)
- [ ] Internal links are valid
- [ ] Token budget is within limits (< 20K per skill)
```

### Before Submitting

1. Verify all internal links work
2. Check that `manifest.yaml` is valid YAML
3. Ensure new skills have at least README.md + workflows.md
4. Measure token cost if adding significant content

---

## Commit Conventions

Follow the [Conventional Commits](https://www.conventionalcommits.org/) format documented in [templates/COMMIT.md](templates/COMMIT.md):

```
<type>(<scope>): <subject>
```

Common types for this repo:
- `feat(skill)`: New skill or skill feature
- `fix(skill)`: Fix in a skill's content
- `docs(core)`: Core documentation changes
- `refactor(core)`: Restructuring without content change
- `feat(mental-model)`: Mental model changes

---

## Review Process

### What Maintainers Look For

1. **Accuracy** — Is the content correct and well-sourced?
2. **Consistency** — Does it follow existing patterns and conventions?
3. **Token efficiency** — Is it concise without losing clarity?
4. **Audience clarity** — Is the file tagged for agents, humans, or both?
5. **Integration** — Does it play well with existing skills?

### Response Timeline

- **Initial response**: Within 1 week
- **Review feedback**: Within 2 weeks
- **Merge decision**: After all feedback is addressed

### Getting Help

- Open an issue for questions about contribution scope
- Tag `@maintainers` in your PR if you need guidance
- Check existing skills for patterns and conventions to follow
