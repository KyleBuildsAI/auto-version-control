# Auto Version Control Quick Reference

Copy-paste prompts for common development scenarios.

---

## Check Project Status

> Run auto version control

The AI will check git status, current branch, recent commits, version tags, and flag any issues. Use this anytime you want a quick health check.

Short versions: `run avc`, `auto version control`, `start version control`.

---

## Starting a New Feature

> I need to add [describe feature]. Create a feature branch, implement it with proper structure, commit with conventional messages, and push when done. Follow professional development practices throughout.

## Fixing a Bug

> There's a bug: [describe bug]. Create a fix branch, diagnose the root cause, fix it, verify the fix works, commit with a `fix:` message, and push.

## Starting a New Project From Scratch

> Set up a new [language/framework] project. Initialize git, create proper project structure (src, tests, config, docs), add a README, .gitignore, dependency file, and LICENSE. Make the initial commit on a feature branch, then merge to main and tag as v0.1.0.

## Cutting a Release

> The current state of main is stable. Tag it as v[X.Y.Z], create a GitHub release with release notes summarizing all changes since the last tag, and push the tag.

## Starting a Major Version

> We're ready to start v[X].0.0. Tag the current main as v[current version], create a release branch for the current major version, then start a feature branch for the new major version work.

## Code Review / Audit

> Audit this project for professional development standards. Check: git history (conventional commits?), project structure (organized?), code quality (clean?), documentation (README, comments?), dependency management, .gitignore coverage, and test coverage. Report findings and fix any issues.

## Session Handoff

> I'm ending this session. Commit all changes with appropriate conventional commit messages, push to remote, and give me a summary of what was done, what branch we're on, what the current version is, and what work remains.

## If the Agent Ignores Git

> You made changes without committing. Check git status right now, stage your changes, and commit with a proper conventional commit message. Then continue.

## If the Agent Works on Main

> You're working directly on main. Stop. Create a feature branch from the current state, switch to it, and continue your work there.

## If the Agent Bundles Too Many Changes

> That commit includes unrelated changes. Reset the last commit (soft), then re-commit the changes as separate commits grouped by logical change.

## Force a Project Audit

> Run a full project audit. Check every file for: placeholder content, debug statements, TODO comments, hardcoded secrets, missing error handling, and code style violations. Fix everything you find and commit each category of fix separately.
