# DevForge

**Make your AI coding agent develop like a senior engineer.**

You know the problem: you ask an AI agent to build something. It writes the code, dumps everything in one commit with the message "update files," pushes straight to main, and calls it done. No branches. No version tags. No structure. You end up cleaning up the mess yourself.

DevForge fixes this. It's a drop-in add-on that forces your AI coding agent to follow professional development practices automatically: feature branches, conventional commits, semantic versioning, clean code, proper project structure, and disciplined sessions. The agent does it all without being asked.

---

## How It Works (The Short Version)

Once installed, DevForge makes your AI agent follow this workflow on every task:

```
ASSESS --> PLAN --> IMPLEMENT --> COMMIT --> VERIFY --> RELEASE
```

1. **Assess** -- The agent checks git status, current branch, and recent history before touching anything
2. **Plan** -- It decides what to change and creates a feature branch
3. **Implement** -- It writes clean, modular code following language conventions
4. **Commit** -- After each logical change, it commits with a conventional message (`feat:`, `fix:`, `refactor:`, etc.)
5. **Verify** -- It runs tests and proves the changes work
6. **Release** -- When a milestone is reached, it tags the version and pushes

No more "updated stuff" commits. No more everything-on-main chaos.

---

## What Does DevForge Enforce?

| Category | What the agent does automatically |
|----------|----------------------------------|
| **Git branching** | Creates feature branches (`feat/`, `fix/`, `refactor/`). Never commits directly to main. |
| **Conventional commits** | Every commit follows the format: `type: description`. One logical change per commit. |
| **Semantic versioning** | Tags milestones with `vMAJOR.MINOR.PATCH`. Branches before major versions. |
| **Code quality** | Removes debug statements, TODOs, placeholders. Follows language style guides. Handles errors explicitly. |
| **Project structure** | Ensures README, .gitignore, dependency file, and organized directories exist. |
| **Secret safety** | Never hardcodes API keys or passwords. Keeps .env out of git. |
| **Large files** | Keeps binaries, models, datasets, and videos out of git. |
| **Session discipline** | Checks project state when starting. Commits, pushes, and summarizes when ending. |
| **Pull requests** | Creates PRs with clear titles and summaries for merges to main. |

---

## What Platforms Does It Work With?

DevForge works with all major AI coding platforms:

| Platform | Supported |
|----------|-----------|
| **Google Antigravity** | Yes |
| **OpenClaw** | Yes (native skill included) |
| **Claude Code** | Yes |
| **Cursor** | Yes |
| **Windsurf** | Yes |

The setup wizard handles the differences between platforms automatically.

---

## What AI Models Work Best?

Tested with these models (Feb 2026):

- **Claude Opus 4.6** -- Best overall. Follows the rules consistently across long sessions.
- **Gemini 3.1 Pro** -- Excellent. Handles complex multi-file refactors well.
- **Claude Sonnet 4.6** -- Good for faster iterations on smaller projects.

DevForge works the same way regardless of which model you're using.

---

## Install

### Quick Setup (recommended)

**Step 1: Open a terminal**

| OS | How to open a terminal |
|----|----------------------|
| **Windows** | Press `Win + R`, type `cmd`, press Enter. Or search "Terminal" in the Start menu. |
| **Mac** | Press `Cmd + Space`, type `Terminal`, press Enter. |
| **Linux** | Press `Ctrl + Alt + T`. |

**Step 2: Download DevForge**

```bash
git clone https://github.com/KyleBuildsAI/dev-forge.git
```

**Step 3: Run the setup wizard**

```bash
cd dev-forge
bash setup.sh
```

The wizard will:
1. Detect which AI platforms you have installed
2. Let you choose where to install (global, workspace, or both)
3. Copy the rules and skills to the right locations
4. Show you what to do next

> **Don't have git?** Click the green **Code** button at the top of this page, then **Download ZIP**. Unzip it, open a terminal inside the folder, and run `bash setup.sh`.

---

### Alternative: One-Line Install

```bash
curl -sSL https://raw.githubusercontent.com/KyleBuildsAI/dev-forge/main/setup.sh | bash
```

---

<details>
<summary><strong>Advanced Install (flags for scripting)</strong></summary>

```bash
./install.sh --global                      # Antigravity global only
./install.sh --openclaw                    # OpenClaw skills only
./install.sh --workspace /path/to/project  # Single project only
./install.sh --all /path/to/project        # Everything
```

</details>

<details>
<summary><strong>Manual Install (copy files yourself)</strong></summary>

```bash
# For Antigravity
cp -r .agent/ /path/to/your/project/.agent/
cp GEMINI.md /path/to/your/project/GEMINI.md

# For OpenClaw
cp -r .openclaw/skills/dev-forge/ ~/.openclaw/workspace/skills/dev-forge/

# For Claude Code
cp -r .agent/ /path/to/your/project/.agent/
cp GEMINI.md /path/to/your/project/CLAUDE.md

# For Cursor
cp -r .agent/ /path/to/your/project/.agent/
cp GEMINI.md /path/to/your/project/.cursorrules

# For Windsurf
cp -r .agent/ /path/to/your/project/.agent/
cp GEMINI.md /path/to/your/project/.windsurfrules
```

</details>

---

## How to Use It

After installing, open your project in your AI coding agent and work normally. DevForge rules activate automatically. Here are prompts for specific scenarios.

### Start a New Project

> Set up a new [Python/Node/Go/Rust] project from scratch. Follow professional development practices: initialize git, create proper structure, add README, .gitignore, and dependency file. Make the initial commit on a feature branch, merge to main, and tag as v0.1.0.

### Build a Feature

> Add [describe feature]. Use a feature branch, commit after each logical change with conventional messages, verify everything works, and push when done.

### Fix a Bug

> There's a bug: [describe it]. Create a fix branch, find the root cause, fix it, prove the fix works, and commit with a fix: message.

### Cut a Release

> Tag the current state as v[X.Y.Z] and create a GitHub release with notes summarizing changes since the last tag.

### Audit a Project

> Run a full audit of this project. Check git history, project structure, code quality, and development standards. Report findings and fix any issues.

### End a Session

> Wrap up this session. Commit all changes, push to remote, and give me a summary of what was done, what branch we're on, and what's left.

See `QUICKREF.md` for more prompts.

---

## Project Audit

DevForge includes a standalone audit script that checks any project against professional standards.

### Run it manually

```bash
bash .agent/skills/dev-workflow/scripts/audit.sh /path/to/project
```

### What it checks

| Check | What it looks for |
|-------|-------------------|
| Git repository | Is the project initialized with git? |
| Branch hygiene | Are you on a feature branch (not main)? |
| Clean tree | Any uncommitted changes? |
| Conventional commits | Do recent commits follow the format? |
| Version tags | Are there semantic version tags? |
| README | Does it exist and have content? |
| .gitignore | Is it present? |
| LICENSE | Is there a license file? |
| Dependencies | Is there a package.json, requirements.txt, etc.? |
| TODOs | Any TODO/FIXME/HACK comments left in source? |
| Debug statements | Any console.log, print, debugger left in? |
| Placeholders | Any lorem ipsum, test@test.com, John Doe? |
| Secrets | Any hardcoded passwords, API keys, tokens? |
| Large files | Any files over 10MB tracked by git? |
| .env tracking | Are .env files committed (they shouldn't be)? |

Exit codes: `0` = all clear, `1` = warnings found, `2` = critical issues found.

---

## OpenClaw Integration

If you use OpenClaw, DevForge includes a native skill that installs automatically:

- **dev-forge** -- The core development workflow skill

The setup wizard handles OpenClaw installation. You can also install manually:

```bash
./install.sh --openclaw
```

---

## Under the Hood

<details>
<summary><strong>How DevForge works technically</strong></summary>

DevForge has three layers:

### Layer 1: Rules (GEMINI.md)

A rules file that overrides the agent's default behavior. Key enforcements:

- Must check git status before starting work
- Must work on feature branches, never main
- Must commit with conventional messages after each logical change
- Must tag releases with semantic versioning
- Must push and summarize before ending a session
- Must follow language style conventions
- Must remove debug statements and placeholders before committing

### Layer 2: Skill (dev-workflow)

A detailed methodology the agent loads that defines a 7-phase workflow:

1. **Assess** -- Check project state and git history
2. **Plan** -- Decide what to change and create a branch
3. **Implement** -- Write clean, modular code
4. **Commit** -- Conventional commits, one change per commit
5. **Verify** -- Run tests, prove it works
6. **Merge and Release** -- PR, merge, tag, push
7. **Handoff** -- Commit, push, summarize

### Layer 3: Audit Script (audit.sh)

A bash script that scans any project for 15+ checks covering git practices, project structure, code quality, and security. Outputs a pass/warn/fail report with a summary.

</details>

<details>
<summary><strong>File structure</strong></summary>

```
dev-forge/
  README.md                          # This file
  GEMINI.md                          # Rules enforcing professional dev practices
  QUICKREF.md                        # Copy-paste prompts for common scenarios
  LICENSE                            # MIT license
  setup.sh                           # Interactive setup wizard
  install.sh                         # Quick/advanced installer
  .agent/                            # Antigravity skills
    skills/
      dev-workflow/
        SKILL.md                     # Core dev workflow methodology (7 phases)
        scripts/
          audit.sh                   # Project standards audit script
  .openclaw/                         # OpenClaw skills
    skills/
      dev-forge/
        skill.md                     # Dev workflow (OpenClaw format)
        scripts/
          audit.sh                   # Same audit script
```

</details>

---

## Contributing

PRs welcome. Areas that need work:

- Language-specific audit rules (linting config detection, test framework detection)
- Git hook installation for commit message validation
- CI/CD pipeline templates (GitHub Actions, GitLab CI)
- Monorepo support (workspace-aware branching and versioning)
- Changelog generation from conventional commits
- Integration with more AI coding platforms

## License

MIT
