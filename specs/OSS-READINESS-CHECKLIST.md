# Open-Source Readiness Checklist

> **Purpose:** Go/no-go checklist before making the repository public.
> **Status:** Draft
> **Last updated:** 2026-02-08

---

## How to Use

- **Must** = Blocking. Do not go public without these.
- **Should** = Expected by the community. Missing these invites friction and distrust.
- **Nice** = Differentiators. Do these to stand out.

---

## 1. Legal & Licensing (Must)

- [ ] `LICENSE` file exists in repo root with full license text — [OSS-6]
- [ ] README license section matches the LICENSE file
- [ ] No third-party content included without compatible license
- [ ] No proprietary company names, internal URLs, or private references in any file
- [ ] `.claude/settings.local.json` contains no hardcoded personal paths — [O8]

## 2. Core Documentation (Must)

- [ ] `README.md` clearly explains what the project is and who it's for
- [ ] `README.md` has a "How It Works" section explaining the mental model as engine — [OSS-3]
- [ ] `README.md` has Quick Start instructions that work from a clean clone
- [ ] `README.md` links to contributing guide, license, and changelog
- [ ] `AGENTS.md` entry point works for agents arriving via submodule

## 3. Contribution Process (Must)

- [ ] `CONTRIBUTING.md` exists covering: — [OSS-4]
  - [ ] How to build a new skill (directory structure, required files, registration)
  - [ ] How to adjust the mental model (override vs. profile vs. default change)
  - [ ] How to modify existing skills (what's welcome, backwards compatibility)
  - [ ] Pull request conventions (branch naming, commit format, description)
  - [ ] Review process and response time expectations
- [ ] `CODE_OF_CONDUCT.md` exists (Contributor Covenant or equivalent)

## 4. Security & Bug Reporting (Must)

- [ ] `SECURITY.md` exists with: — [OSS-5]
  - [ ] Private disclosure process (email or GitHub security advisories)
  - [ ] Scope definition (what counts as a security issue)
  - [ ] Response timeline commitment
- [ ] GitHub Issues are enabled
- [ ] Issue templates exist for bug reports — [OSS-8]

## 5. Extensibility — Mental Model (Should)

- [ ] Override mechanism is documented and working — [OSS-1]
  - [ ] `templates/architecture-thinking.override.template.md` exists
  - [ ] AGENTS.md reading order includes override step
  - [ ] At least one example override exists (or is demonstrated in example project)
- [ ] CONTRIBUTING.md explains when to override vs. propose a default change

## 6. Versioning & History (Should)

- [ ] `CHANGELOG.md` exists with backfilled history — [OSS-7]
- [ ] Versioning policy is defined (semver: major/minor/patch criteria)
- [ ] Git tags exist for at least the current version
- [ ] Version number in AGENTS.md matches the latest tag

## 7. GitHub Infrastructure (Should)

- [ ] `.github/ISSUE_TEMPLATE/bug_report.md` exists — [OSS-8]
- [ ] `.github/ISSUE_TEMPLATE/feature_request.md` exists
- [ ] `.github/ISSUE_TEMPLATE/new_skill_proposal.md` exists
- [ ] `.github/PULL_REQUEST_TEMPLATE.md` exists (for the toolkit itself)
- [ ] CI pipeline validates PRs: — [OSS-8]
  - [ ] Markdown linting (markdownlint)
  - [ ] YAML validation (manifest.yaml)
  - [ ] Internal link checking
  - [ ] Skill file structure validation (README.md + workflows.md minimum)
- [ ] Repository description and topics set on GitHub
- [ ] GitHub Discussions or Issues enabled for community Q&A

## 8. Code Hygiene (Should)

- [ ] No hardcoded absolute paths anywhere — [O8]
- [ ] No duplicate content across files — [O1]
- [ ] No contradictory status claims — [O12]
- [ ] `.gitignore` covers OS files (`.DS_Store`), editor files (`.vscode/`, `.idea/`), and generated outputs
- [ ] All internal cross-references/links are valid
- [ ] All skills have required files (README.md, workflows.md at minimum)
- [ ] `skills/manifest.yaml` matches actual directory structure

## 9. Example Project (Nice)

- [ ] Example project exists and is linked from README — [OSS-9]
  - [ ] `.ai-toolkit/` submodule is wired up
  - [ ] `AGENTS.md` and `CONTEXT.md` are populated
  - [ ] `architecture-thinking.local.md` demonstrates the override mechanism
  - [ ] Pre-generated analysis outputs are committed
  - [ ] "Try It Yourself" section with copy-paste prompts
- [ ] Example project has its own LICENSE file

## 10. Community Readiness (Nice)

- [ ] Social preview image / repo banner
- [ ] Badges in README (license, CI status, version)
- [ ] A short demo GIF or screenshot in README
- [ ] Mental model full swap profiles seeded — [OSS-2]

---

## Go / No-Go Decision

| Category | Status | Blocking? |
|----------|--------|-----------|
| Legal & Licensing | ⬜ Not started | **Yes** |
| Core Documentation | ⬜ Not started | **Yes** |
| Contribution Process | ⬜ Not started | **Yes** |
| Security & Bug Reporting | ⬜ Not started | **Yes** |
| Extensibility — Mental Model | ⬜ Not started | No (but strongly recommended) |
| Versioning & History | ⬜ Not started | No |
| GitHub Infrastructure | ⬜ Not started | No |
| Code Hygiene | 🟡 Partial (audiences tagged, some dedup done) | No |
| Example Project | ⬜ Not started | No |
| Community Readiness | ⬜ Not started | No |

**Minimum viable open-source:** Categories 1-4 all green.

**Recommended launch:** Categories 1-7 all green + example project.

---

## References

- Detailed specs for each item: [ROADMAP-TRACKER.md](ROADMAP-TRACKER.md) §Open-Source Readiness
- Token baseline and optimization: [TOKEN-BASELINE.md](TOKEN-BASELINE.md)
