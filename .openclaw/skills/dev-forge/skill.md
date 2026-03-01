# Dev Forge

## Description

Enforces professional development workflow on any software project. Ensures proper git branching, conventional commits, semantic versioning, clean code standards, and structured project organization.

## Activation

Activate when the user asks to build, modify, fix, audit, or release any software project.

## Workflow

### 1. Assess
- Check `git status`, current branch, and recent commit history
- If not a git repo, initialize one
- If on main, create a feature branch before making changes

### 2. Implement
- Write clean, modular code following language conventions
- Handle errors explicitly, never silently
- No debug statements, TODOs, or placeholders in finished code

### 3. Commit
- One logical change per commit
- Use conventional commit format: `type: description`
- Types: feat, fix, refactor, docs, test, style, perf, chore, ci, build

### 4. Verify
- Run tests after every change
- Show proof that changes work
- Fix regressions before moving on

### 5. Release
- Tag milestones with semantic versioning (vMAJOR.MINOR.PATCH)
- Create pull requests for merges to main
- Push before ending a session

### 6. Handoff
- Commit and push all work
- Summarize: what was done, current state, remaining work

## Audit Script

Run the project audit to check compliance:

```bash
bash scripts/audit.sh /path/to/project
```

## Anti-Patterns

- Working directly on main
- Giant commits mixing unrelated changes
- Vague commit messages ("update", "fix stuff", "wip")
- Debug statements in committed code
- Hardcoded secrets
- Unpushed work at session end
