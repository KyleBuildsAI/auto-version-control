# Auto Version Control

**Automatic git version control for vibe coders.**

You're building with AI. You're prompting, iterating, shipping. You shouldn't have to stop and think about git branches, commit messages, version numbers, or any of that. But without version control, one bad change can wipe out hours of work, and your project history is a mess of "update" and "fix stuff" commits that tell you nothing.

Auto Version Control fixes this. Install it once, and your AI coding agent handles all the version control for you -- automatically. It creates branches, writes proper commit messages, tags versions, and keeps your project history clean and professional. You never have to think about it.

---

## What Problem Does This Solve?

If you're vibe coding (building software by prompting an AI agent), your agent probably does this:

- Dumps all changes into one giant commit called "update files"
- Works directly on the main branch (so one mistake breaks everything)
- Never creates version tags (so you can't go back to a working version)
- Leaves your project with no usable history

**With Auto Version Control installed, your agent does this instead:**

- Creates a separate branch for each feature or fix (so main always works)
- Commits after every meaningful change with a clear message describing what happened
- Tags milestone versions (`v1.0.0`, `v1.1.0`, `v1.2.0`) so you can always roll back
- Pushes everything to GitHub before ending a session (so nothing is lost)

You don't need to understand git. The AI handles it.

---

## How It Works

Once installed, Auto Version Control gives your AI agent a set of rules it follows automatically. You just keep prompting normally. Behind the scenes, the agent:

1. **Checks the project state** before making any changes
2. **Creates a branch** so your working code stays safe on main
3. **Writes your code** like it normally would
4. **Commits each change** with a message like `feat: add login page` or `fix: broken checkout button`
5. **Tests that it works** before moving on
6. **Merges back to main** when the feature is done
7. **Tags a version number** at milestones so you can always go back
8. **Pushes to GitHub** so nothing is lost

You don't need to tell it to do any of this. It just does it.

---

## What It Does For You

| Without Auto Version Control | With Auto Version Control |
|------------------------------|--------------------------|
| Everything on one branch | Feature branches keep main safe |
| Commit messages say "update" | Messages say exactly what changed |
| No version numbers | Automatic `v1.0.0`, `v1.1.0`, etc. |
| Can't undo a bad change easily | Roll back to any tagged version |
| Unpushed code sitting on your machine | Everything pushed to GitHub automatically |
| Debug junk left in your code | Cleaned up before every commit |
| Secrets accidentally committed | Secrets detected and blocked |
| No project structure | README, .gitignore, and dependencies managed |

---

## Supported Platforms

Auto Version Control works with all major AI coding tools:

| Platform | Supported |
|----------|-----------|
| **Google Antigravity** | Yes |
| **OpenClaw** | Yes (native skill included) |
| **Claude Code** | Yes |
| **Cursor** | Yes |
| **Windsurf** | Yes |

The setup wizard detects which ones you have and installs automatically.

---

## Tested AI Models

Works best with these models (Feb 2026):

- **Claude Opus 4.6** -- Best. Follows version control rules consistently, even in long sessions.
- **Gemini 3.1 Pro** -- Excellent. Great with multi-file projects.
- **Claude Sonnet 4.6** -- Good for faster iterations on smaller projects.

---

## Install

### Quick Setup (recommended -- no experience needed)

**Step 1: Open a terminal**

Not sure how? Here's how on each operating system:

| OS | How to open a terminal |
|----|----------------------|
| **Windows** | Press `Win + R`, type `cmd`, press Enter. Or search "Terminal" in the Start menu. |
| **Mac** | Press `Cmd + Space`, type `Terminal`, press Enter. |
| **Linux** | Press `Ctrl + Alt + T`. |

**Step 2: Download Auto Version Control**

Copy and paste this entire line into your terminal and press Enter:

```bash
git clone https://github.com/KyleBuildsAI/auto-version-control.git
```

This downloads Auto Version Control to a folder on your computer.

**Step 3: Go into the folder and run the setup wizard**

Copy and paste these lines one at a time:

```bash
cd auto-version-control
```
```bash
bash setup.sh
```

That's it. The setup wizard will walk you through the rest:
1. It detects which AI platforms you have installed
2. It lets you choose where to install
3. It copies everything to the right places automatically
4. It shows you what to do next when it's done

> **Don't have git installed?** You can also download it as a ZIP file. Click the green **Code** button at the top of this page, then **Download ZIP**. Unzip it, open a terminal inside the folder, and run `bash setup.sh`.

---

### Alternative: One-Line Install

If you're comfortable with the terminal, this single command downloads and runs the setup wizard automatically:

```bash
curl -sSL https://raw.githubusercontent.com/KyleBuildsAI/auto-version-control/main/setup.sh | bash
```

---

<details>
<summary><strong>Advanced Install (for scripting and automation)</strong></summary>

The `install.sh` script supports flags for direct installation:

```bash
./install.sh                               # Interactive (same as setup.sh)
./install.sh --global                      # Antigravity global only
./install.sh --openclaw                    # OpenClaw skills only
./install.sh --workspace /path/to/project  # Single project only
./install.sh --all /path/to/project        # Everything
```

</details>

<details>
<summary><strong>Manual Install (copy files yourself)</strong></summary>

If you prefer to copy files manually instead of using the setup wizard:

```bash
# For Antigravity
cp -r .agent/ /path/to/your/project/.agent/
cp GEMINI.md /path/to/your/project/GEMINI.md

# For OpenClaw
cp -r .openclaw/skills/auto-version-control/ ~/.openclaw/workspace/skills/auto-version-control/

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

After installing, just use your AI coding agent normally. Auto Version Control works in the background. You don't need to change how you prompt.

But if you want to be specific, here are some prompts you can copy and paste:

### Start a New Project

> Build me a [describe your app]. Set it up properly with version control from the start.

### Build a Feature

> Add [describe feature] to my project.

That's it. The agent will create a branch, build it, commit, test, merge, and version tag automatically.

### Fix a Bug

> There's a bug: [describe the problem]. Fix it.

The agent will create a fix branch, find the root cause, fix it, verify it works, and commit with a proper message.

### Save a Milestone

> The current version is stable. Tag it as a release.

### Check Your Project's Health

> Audit this project. Check if the version control, project structure, and code quality are up to professional standards.

### End a Session

> Wrap up. Make sure everything is committed, pushed, and summarized.

See `QUICKREF.md` for more prompts.

---

## The Audit Tool

Auto Version Control includes a standalone script that checks any project against professional standards. Think of it as a health check for your project.

### How to run it

```bash
bash .agent/skills/dev-workflow/scripts/audit.sh /path/to/your/project
```

### What it checks

| Check | What it means |
|-------|--------------|
| **Git initialized** | Is your project using version control at all? |
| **Branch hygiene** | Are you working on a branch (not directly on main)? |
| **Clean working tree** | Do you have unsaved changes sitting around? |
| **Commit messages** | Are they descriptive, or just "update" and "fix"? |
| **Version tags** | Are milestones tagged so you can roll back? |
| **README** | Does your project explain what it does? |
| **.gitignore** | Are junk files being kept out of version control? |
| **LICENSE** | Is there a license? |
| **Dependencies** | Are packages tracked properly? |
| **Leftover TODOs** | Any unfinished TODO/FIXME comments in the code? |
| **Debug statements** | Any console.log or print statements left in? |
| **Hardcoded secrets** | Any passwords or API keys sitting in the code? |
| **Large files** | Any huge files that shouldn't be in git? |
| **.env files** | Are secret config files accidentally tracked? |

It gives you a simple pass/warn/fail report.

---

## What's a Version Number?

If you're new to this, here's the short version.

Version numbers look like this: **v1.2.3**

| Part | What it means | Example |
|------|--------------|---------|
| **v1** (major) | Big changes that break old behavior | Redesigned the whole app |
| **.2** (minor) | New features that don't break anything | Added a search feature |
| **.3** (patch) | Small fixes | Fixed a typo, fixed a button |

Your AI agent handles this automatically. When it finishes a feature, it bumps the minor number. When it fixes a bug, it bumps the patch number. When something big changes, it bumps the major number.

This means you can always go back to any previous version if something breaks.

---

## What's a Conventional Commit?

When your AI agent saves a change, it writes a message that starts with a type:

| Type | When it's used | Example message |
|------|---------------|-----------------|
| `feat:` | New feature added | `feat: add dark mode toggle` |
| `fix:` | Bug fixed | `fix: login button not responding on mobile` |
| `refactor:` | Code reorganized (no behavior change) | `refactor: split utils into separate modules` |
| `docs:` | Documentation updated | `docs: add install instructions to README` |
| `style:` | Formatting/appearance change | `style: fix indentation in main.py` |
| `test:` | Tests added or updated | `test: add unit tests for auth module` |
| `chore:` | Maintenance (config, dependencies) | `chore: update package versions` |

This makes it easy to look at a project's history and understand exactly what happened and when.

---

## OpenClaw Integration

If you use OpenClaw, Auto Version Control includes a native skill that installs automatically:

- **auto-version-control** -- Handles all version control during any task

The setup wizard handles this. You can also install manually:

```bash
./install.sh --openclaw
```

---

## Under the Hood

<details>
<summary><strong>How it works technically</strong></summary>

Auto Version Control has three layers:

### Layer 1: Rules (GEMINI.md)

A rules file that overrides your AI agent's default behavior. It contains 9 rules covering git workflow, commit format, semantic versioning, code quality, project structure, testing, session discipline, pull requests, and safety. The agent reads these rules and follows them on every action.

### Layer 2: Skill (dev-workflow)

A detailed 7-phase workflow methodology:

1. **Assess** -- Check git status, current branch, recent commits
2. **Plan** -- Decide what to change, create a feature branch
3. **Implement** -- Write clean code following conventions
4. **Commit** -- One logical change per commit, conventional format
5. **Verify** -- Run tests, prove it works
6. **Merge and Release** -- PR, merge to main, tag version, push
7. **Handoff** -- Commit all work, push, summarize session

### Layer 3: Audit Script (audit.sh)

A bash script that checks 15+ standards covering git practices, project structure, code quality, and security. Runs on any project regardless of language.

</details>

<details>
<summary><strong>File structure</strong></summary>

```
auto-version-control/
  README.md                          # This file
  GEMINI.md                          # Rules that make the AI follow version control
  QUICKREF.md                        # Copy-paste prompts for common scenarios
  LICENSE                            # MIT license
  setup.sh                           # Interactive setup wizard (start here)
  install.sh                         # Quick/advanced installer
  .agent/                            # Antigravity skills
    skills/
      dev-workflow/
        SKILL.md                     # 7-phase version control workflow
        scripts/
          audit.sh                   # Project health check script
  .openclaw/                         # OpenClaw skills
    skills/
      auto-version-control/
        skill.md                     # Version control workflow (OpenClaw format)
        scripts/
          audit.sh                   # Same health check script
```

</details>

---

## Contributing

PRs welcome. Areas that need work:

- Language-specific audit rules (linting config detection, test framework detection)
- Git hook installation for commit message validation
- CI/CD pipeline templates (GitHub Actions, GitLab CI)
- Changelog generation from conventional commits
- Integration with more AI coding platforms

## License

MIT
