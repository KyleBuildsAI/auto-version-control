# Auto Version Control

Professional development workflow methodology for AI coding agents.

## Description

This skill enforces a structured development workflow that mirrors how senior developers work. It covers the full lifecycle: starting work, writing code, committing changes, managing branches, cutting releases, and handing off sessions.

## Trigger Prompt

When the user says **"run auto version control"** (or any close variation like "run avc", "auto version control", "start version control"), immediately run the full Phase 1 assessment and report the project state.

## When to Activate

Activate this skill when the user:
- Says "run auto version control" or any variation
- Asks you to build, modify, or fix any software project
- Sets up a new project from scratch
- Reviews or audits a codebase
- Manages releases or versions
- Follows professional development practices

## Phase 1: Assess

Before writing any code, assess the current state of the project.

1. Run `git status` to check for uncommitted changes
2. Run `git branch` to see which branch you are on
3. Run `git log --oneline -10` to review recent history
4. Check for a README.md, .gitignore, and dependency file
5. Identify the language, framework, and existing conventions

If there are uncommitted changes, ask the user what to do with them before proceeding.

If you are on `main` or `master`, create a feature branch before making any changes.

## Phase 2: Plan

Before implementing, outline what you will do:

1. What files will be created or modified?
2. What branch name will you use?
3. How will you verify the changes work?
4. Are there any risks or destructive actions?

Communicate this plan briefly. You do not need formal approval for small changes, but flag anything that could break existing functionality.

## Phase 3: Implement

Write the code following these standards:

- **Modularity** -- One function, one job. Keep functions short.
- **Naming** -- Variables and functions describe what they hold or do. No abbreviations unless universally understood (e.g., `url`, `id`).
- **Error handling** -- Every operation that can fail must have explicit error handling. Never swallow errors silently.
- **Style** -- Follow the language's standard style guide automatically.
- **No debris** -- Remove all `console.log`, `print()`, `debugger`, `TODO`, `FIXME`, and placeholder content before committing.

## Phase 4: Commit

After each meaningful change:

1. Stage only the files related to this logical change
2. Write a conventional commit message:
   ```
   type: short imperative description
   ```
3. Valid types: `feat`, `fix`, `refactor`, `docs`, `test`, `style`, `perf`, `chore`, `ci`, `build`
4. One logical change per commit

**Commit frequency guide:**
- Added a new file or module → commit
- Fixed a bug → commit
- Refactored a function → commit
- Updated documentation → commit
- Changed configuration → commit
- Do NOT wait until the end of a session to commit everything at once

## Phase 5: Verify

After committing:

1. Run the test suite if one exists
2. If no test suite, run the application and verify it works
3. Check `git status` to ensure no files were missed
4. Check `git log --oneline -3` to verify the commit looks correct

If verification fails, fix the issue and commit the fix before moving on.

## Phase 6: Merge and Release

When the feature is complete:

1. Push the feature branch to remote
2. Create a pull request with a clear title and summary
3. If approved (or if working solo), merge to main
4. Delete the feature branch after merging
5. If this is a milestone, tag the release:
   ```
   git tag -a v1.2.0 -m "feat: add user authentication"
   git push origin v1.2.0
   ```

**Semantic versioning rules:**
- Increment PATCH for bug fixes and minor improvements
- Increment MINOR for new features that don't break anything
- Increment MAJOR for breaking changes
- First public release starts at v1.0.0
- Pre-release development can use v0.x.x

## Phase 7: Handoff

Before ending a session:

1. Commit all remaining changes
2. Push all branches to remote
3. Provide a session summary:
   - What was accomplished
   - Current branch and version
   - What work remains
   - Any known issues or blockers

## Status Checkpoints

Output a status checkpoint every 5 commits or every 30 minutes of work:

```
=== DEV STATUS ===
Branch: feat/user-auth
Commits this session: 7
Last commit: feat: add password hashing
Tests passing: yes
Uncommitted changes: none
Next task: Add session management
==================
```

## Anti-Patterns to Avoid

- Working directly on main
- Giant commits with multiple unrelated changes
- Commit messages like "update", "fix stuff", "wip", "asdf"
- Leaving debug statements in committed code
- Hardcoding secrets or API keys
- Ignoring failing tests
- Force pushing to shared branches
- Ending a session with uncommitted or unpushed work
