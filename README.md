# Auto Version Control

**Automatic git version control for vibe coders.**

You prompt, the AI builds. But who's handling version control? Nobody. Your AI agent dumps everything into one commit called "update files," works directly on main, and never tags a version. One bad change and you're starting over.

Auto Version Control fixes this. You install it once into your AI coding tool, and from that point on, the AI handles all the version control for you -- branches, commits, version numbers, everything. You keep prompting like normal. You never think about git again.

---

## Table of Contents

- [What Does It Actually Do?](#what-does-it-actually-do)
- [How Does It Work Inside My AI Tool?](#how-does-it-work-inside-my-ai-tool)
- [Do I Need to Activate It Every Time?](#do-i-need-to-activate-it-every-time)
- [Install](#install)
- [How to Verify It's Working](#how-to-verify-its-working)
- [What You'll See When It's Working](#what-youll-see-when-its-working)
- [Quick Reference Prompts](#quick-reference-prompts)
- [The Audit Tool](#the-audit-tool)
- [What's a Version Number?](#whats-a-version-number)
- [What's a Conventional Commit?](#whats-a-conventional-commit)
- [FAQ](#faq)
- [Under the Hood](#under-the-hood)

---

## What Does It Actually Do?

Here's the difference in how your AI agent behaves:

| Without Auto Version Control | With Auto Version Control |
|------------------------------|--------------------------|
| All changes go straight to main | Creates a separate branch for each feature |
| Commit messages say "update" or "fix stuff" | Messages say `feat: add login page` or `fix: broken checkout button` |
| No version numbers anywhere | Tags milestones: `v1.0.0`, `v1.1.0`, `v1.2.0` |
| Can't undo a bad change | Roll back to any tagged version instantly |
| Code sits on your machine unpushed | Everything pushed to GitHub automatically |
| Debug junk left in the code | Cleaned up before every commit |
| Secrets accidentally committed | Detected and blocked |
| No README, no .gitignore, no structure | All created and maintained automatically |

---

## How Does It Work Inside My AI Tool?

This is the most important thing to understand. Auto Version Control is **not an app, not an extension, and not a plugin you launch separately.** Here's what it actually is on each platform:

### Google Antigravity

Auto Version Control installs as **a rules file + a skill**.

- **The rules file** (`GEMINI.md`) is installed to `~/.gemini/antigravity/GEMINI.md`. Antigravity reads this file and treats everything in it as instructions it must follow. The rules tell it to use branches, write proper commits, tag versions, and follow professional practices.
- **The skill** is installed to `~/.gemini/antigravity/skills/auto-version-control/`. Antigravity automatically detects skills and loads them when they match what you're asking it to do. The skill contains the step-by-step version control methodology the AI follows.

**You do not need to activate it, call it, or mention it.** Antigravity reads the rules file and loads the skill automatically every time you open any project. It just becomes part of how the AI behaves.

### Claude Code

Auto Version Control installs as **a rules file + a skill**.

- **The rules file** (`CLAUDE.md`) is installed to `~/.claude/CLAUDE.md`. Claude Code reads this file at the start of every session. Whatever is in that file becomes instructions Claude follows automatically.
- **The skill** is installed to `~/.claude/skills/auto-version-control/`. It contains the detailed workflow methodology.

**You do not need to activate it, call it, or mention it.** Claude Code reads the rules every time you start a session. It just works.

### OpenClaw

Auto Version Control installs as **a skill**.

- **The skill** is installed to `~/.openclaw/workspace/skills/auto-version-control/`. OpenClaw has a skills system where skills are loaded automatically when they match what you're asking the agent to do. The skill contains both the rules and the workflow methodology.

**You do not need to activate it, call it, or mention it.** OpenClaw detects the skill and applies it whenever you ask it to build, fix, or modify code.

---

## Do I Need to Activate It Every Time?

**No.** On all three platforms, it is completely automatic.

- **Antigravity**: Reads `GEMINI.md` and loads `.agent/skills/` every time you open the project. Always on.
- **Claude Code**: Reads `CLAUDE.md` every time you start a session. Always on.
- **OpenClaw**: Loads skills from `~/.openclaw/workspace/skills/` automatically. Always on.

You install it once. After that, you just use your AI tool normally and it handles version control behind the scenes.

### Want to check on things manually?

Just type this into your AI tool at any time:

> Run auto version control

The AI will immediately check `git status`, show you what branch you're on, list recent commits, flag any problems (uncommitted changes, working on main, no version tags), and tell you what to do next. Think of it as a health check you can run whenever you want.

Short versions that also work: `run avc`, `auto version control`, `start version control`.

---

## Install

The setup wizard detects which AI platforms you have, lets you pick where to install, and copies everything to the right places. Two steps.

### Step 1: Download

Open a terminal and paste this:

```bash
git clone https://github.com/KyleBuildsAI/auto-version-control.git
cd auto-version-control
```

> **Already downloaded it before?** Run `cd auto-version-control && git pull` to get the latest version.

> **Don't have git?** Click the green **Code** button at the top of this GitHub page, then click **Download ZIP**. Unzip it somewhere you can find it, then open a terminal inside that folder.

### Step 2: Run the setup wizard

**Mac / Linux:**

```bash
bash setup.sh
```

**Windows (you MUST use Git Bash, not PowerShell):**

```powershell
& "C:\Program Files\Git\bin\bash.exe" setup.sh
```

> **Why Git Bash on Windows?** If you type `bash` in PowerShell, Windows tries to use WSL (Windows Subsystem for Linux), which may not be set up and will give you an error like `Failed to attach disk`. Git Bash is included when you install Git for Windows and works out of the box.

> **Don't have Git for Windows?** Download it free from [git-scm.com](https://git-scm.com). The installer includes Git Bash.

### What the wizard does

You'll see something like this:

```
    +===============================================+
    |                                               |
    |    A U T O   V E R S I O N   C O N T R O L    |
    |                                               |
    |   Automatic Git for AI Coding Agents          |
    |   v2.2.1                                      |
    |                                               |
    +===============================================+

  [1/5]  Checking dependencies

    ✓  git 2.53.0

  [2/5]  Detecting installed platforms

    ✓  Google Antigravity    (detected)
    -  OpenClaw              (not found)
    ✓  Claude Code           (detected)
    -  Cursor                (not found)
    -  Windsurf              (not found)

  [3/5]  Choose where to install

    Detected platforms are pre-selected.
    Enter numbers to toggle, then press Enter to continue.

    [x] 1. Google Antigravity  (global: ~/.gemini/antigravity/skills/)
    [ ] 2. OpenClaw            (global: ~/.openclaw/workspace/skills/)
    [x] 3. Claude Code         (global: ~/.claude/skills/)
    [ ] 4. Cursor              (global: ~/.cursor/skills/)
    [ ] 5. Windsurf            (global: ~/.codeium/windsurf/skills/)

    Toggle [1-5], Enter to continue, q to quit:
```

It auto-detects your platforms and pre-selects them. Just press **Enter** to install, or type a number to toggle a platform on or off.

After it finishes, you'll see a summary confirming what was installed and where.

### That's it. You're done.

There is no step 4. The wizard handled everything. Open your project in your AI tool and start prompting. Version control is now automatic.

---

### Where does it install to?

The wizard installs globally, so it works on **every project** you open -- not just one.

| Platform | Skill installed to | Rules installed to |
|----------|-------------------|-------------------|
| **Google Antigravity** | `~/.gemini/antigravity/skills/auto-version-control/` | `~/.gemini/antigravity/GEMINI.md` |
| **OpenClaw** | `~/.openclaw/workspace/skills/auto-version-control/` | *(rules are inside the skill)* |
| **Claude Code** | `~/.claude/skills/auto-version-control/` | `~/.claude/CLAUDE.md` |
| **Cursor** | `~/.cursor/skills/auto-version-control/` | *(rules are inside the skill)* |
| **Windsurf** | `~/.codeium/windsurf/skills/auto-version-control/` | `~/.codeium/windsurf/memories/global_rules.md` |

If a rules file already exists, the wizard asks whether to append, replace, or skip -- so it won't overwrite your existing settings.

---

### Alternative: One-Line Install (Mac/Linux)

This downloads and runs the wizard automatically:

```bash
curl -sSL https://raw.githubusercontent.com/KyleBuildsAI/auto-version-control/main/setup.sh | bash
```

### Alternative: Non-Interactive Install (scripting/CI)

```bash
bash setup.sh --all                # Install to all detected platforms
bash setup.sh --antigravity        # Google Antigravity only
bash setup.sh --openclaw           # OpenClaw only
bash setup.sh --claude             # Claude Code only
bash setup.sh --cursor             # Cursor only
bash setup.sh --windsurf           # Windsurf only
```

---

## How to Verify It's Working

No matter which platform you're using, here are three quick tests:

### Test 1: Ask about the rules

Prompt your AI agent:

> What version control rules are you following?

It should describe: feature branches, conventional commits, semantic versioning, session discipline.

### Test 2: Watch for branch creation

Prompt your AI agent to make any change to your project. Before writing code, it should:

1. Run `git status`
2. Create a feature branch (something like `feat/description`)
3. Only then start writing code

If it writes code directly on `main` without branching, the rules aren't loaded.

### Test 3: Check the commit message

After the agent makes a change and commits, look at the commit message. It should look like:

```
feat: add hello world script
```

Not like:

```
update files
```

If the commits follow the `type: description` format, it's working.

---

## What You'll See When It's Working

Here's what a typical session looks like with Auto Version Control active. You type one prompt, and the AI does all of this:

**You say:** "Add a contact form to my website"

**The AI does:**
1. Runs `git status` and `git log` to check the project state
2. Creates a branch: `git checkout -b feat/contact-form`
3. Writes the HTML, CSS, and JavaScript for the contact form
4. Commits: `feat: add contact form with email validation`
5. Runs the page to verify it works
6. Pushes the branch to GitHub
7. Creates a pull request
8. Merges to main
9. Tags the release: `v1.3.0`
10. Tells you what was done and what version you're on

All you did was say "add a contact form." The AI handled the entire version control workflow.

---

## Quick Reference Prompts

Copy-paste these into your AI coding tool whenever you need them.

### Build something new

> Add [describe what you want] to my project.

### Fix a bug

> There's a bug: [describe the problem]. Fix it.

### Save a milestone

> The current version is stable. Tag it as a release.

### Check project health

> Audit this project. Check if version control, structure, and code quality are up to standard.

### End a session

> Wrap up. Commit everything, push to GitHub, and tell me what was done.

### If the agent forgets to branch

> You're working directly on main. Create a feature branch and continue there.

### If the agent forgets to commit

> You made changes without committing. Commit now with a proper message.

See `QUICKREF.md` for the full list.

---

## The Audit Tool

Auto Version Control includes a health check script you can run on any project. It scans for 15+ issues and gives you a pass/warn/fail report.

### How to run it

```bash
bash /path/to/auto-version-control/.agent/skills/auto-version-control/scripts/audit.sh /path/to/your/project
```

For example, if you cloned auto-version-control to your home folder and want to check a project called `my-app`:

```bash
bash ~/auto-version-control/.agent/skills/auto-version-control/scripts/audit.sh ~/my-app
```

### What it checks

| Check | What it means | Why it matters |
|-------|--------------|----------------|
| **Git initialized** | Is the project using version control? | Without git, you can't track changes or roll back |
| **Branch hygiene** | Are you on a branch, not main? | Working on main means one mistake breaks everything |
| **Clean working tree** | Any unsaved changes? | Unsaved changes can be lost |
| **Commit messages** | Are they descriptive? | "update" tells you nothing 3 months later |
| **Version tags** | Are milestones tagged? | Without tags, you can't roll back to a working version |
| **README** | Does the project explain itself? | Without a README, nobody knows what the project does |
| **.gitignore** | Are junk files excluded? | Without this, node_modules and build files clutter your repo |
| **LICENSE** | Is there a license? | Without a license, nobody can legally use your code |
| **Dependencies** | Are packages tracked? | Without a package.json or requirements.txt, the project won't install on another machine |
| **TODOs left in code** | Any unfinished TODO comments? | TODOs are fine during development, not in finished code |
| **Debug statements** | Any console.log or print left in? | Debug output shouldn't ship to users |
| **Hardcoded secrets** | Passwords or API keys in the code? | This is a security risk |
| **Large files** | Huge files tracked by git? | Git isn't meant for videos, datasets, or binaries |
| **.env files tracked** | Secret config files in git? | .env files contain secrets and should never be committed |

### Reading the output

The script prints a colored report:

- **PASS** (green) -- This check is good
- **WARN** (yellow) -- Something to look at, but not critical
- **FAIL** (red) -- Fix this before shipping

At the bottom, it gives you a summary with totals.

---

## What's a Version Number?

If you've never used version numbers, here's what you need to know.

Version numbers look like this: **v1.2.3**

| Part | Name | What it means | When it changes |
|------|------|--------------|-----------------|
| **1** | Major | Big, breaking changes | You redesigned the whole app, changed how it works |
| **2** | Minor | New features | You added search, added dark mode, added a page |
| **3** | Patch | Bug fixes | You fixed a typo, fixed a broken button |

**Why this matters:** If your app is at `v1.5.0` and you push a bad change, you can roll back to `v1.4.0` instantly. Without version numbers, you'd have to dig through your commit history and guess which change broke things.

Your AI agent handles version numbers automatically. You never need to decide what number to use.

---

## What's a Conventional Commit?

A "commit" is a saved snapshot of your code at a point in time, like a save point in a video game.

A "conventional commit" is a commit with a standardized message format so you can understand what changed just by reading the log.

Instead of:
```
update
fix stuff
changes
asdf
```

You get:
```
feat: add user login page
fix: checkout button not responding on mobile
docs: add install instructions to README
refactor: split payment logic into separate module
```

| Prefix | Meaning | Example |
|--------|---------|---------|
| `feat:` | New feature | `feat: add dark mode toggle` |
| `fix:` | Bug fix | `fix: form validation not working` |
| `docs:` | Documentation change | `docs: update API examples` |
| `refactor:` | Code cleanup (no behavior change) | `refactor: simplify auth logic` |
| `style:` | Formatting only | `style: fix indentation` |
| `test:` | Tests | `test: add checkout tests` |
| `chore:` | Maintenance | `chore: update dependencies` |

Your AI agent writes these automatically. You never need to think about the format.

---

## FAQ

### Do I need to know git to use this?

No. The entire point is that the AI handles git for you. You just tell it what to build or fix.

### Do I need to tell the AI to use version control?

No. Once installed, the rules are loaded automatically every time you open the project. The AI follows them without being told.

### Does it slow down my AI agent?

No. It adds maybe 2-3 seconds per task for the git operations (checking status, committing, etc.). The actual coding takes the same amount of time.

### Can I use this on an existing project?

Yes. Just install it into the project folder. The next time you open it in your AI tool, the rules kick in. It won't retroactively fix your existing commit history, but all future changes will follow proper version control.

### What if my project already has a CLAUDE.md or GEMINI.md?

Don't overwrite it. Append the Auto Version Control rules to the end of your existing file:

```bash
# For Claude Code (append to existing CLAUDE.md)
cat GEMINI.md >> /path/to/your/project/CLAUDE.md

# For Antigravity (append to existing GEMINI.md)
cat GEMINI.md >> /path/to/your/project/GEMINI.md
```

### What if I want to turn it off for one session?

Tell your AI agent: "Ignore the version control rules for this session." It will listen. But remember, you installed it for a reason -- version control protects your work.

### Does it work with private GitHub repos?

Yes. It uses whatever git remote you have configured. Public or private makes no difference.

### What AI models does it work best with?

Tested with these models (Feb 2026):

- **Claude Opus 4.6** -- Best overall. Follows rules consistently across long sessions.
- **Gemini 3.1 Pro** -- Excellent. Great with complex multi-file projects.
- **Claude Sonnet 4.6** -- Good for faster iterations on smaller projects.

It works with other models too, but larger models follow the rules more reliably.

---

## Under the Hood

<details>
<summary><strong>What files get installed and why</strong></summary>

### For Google Antigravity

| File | Where it goes | What it does |
|------|--------------|--------------|
| `GEMINI.md` | `~/.gemini/antigravity/GEMINI.md` | Rules file. Antigravity reads this and follows all instructions in it. Contains 9 rules covering git workflow, commits, versioning, code quality, structure, testing, sessions, PRs, and safety. |
| `SKILL.md` | `~/.gemini/antigravity/skills/auto-version-control/` | Skill definition. Describes a 7-phase workflow (Assess, Plan, Implement, Commit, Verify, Release, Handoff). |
| `audit.sh` | `~/.gemini/antigravity/skills/auto-version-control/scripts/` | Project health check script. Checks 15+ standards. |

### For Claude Code

| File | Where it goes | What it does |
|------|--------------|--------------|
| `CLAUDE.md` | `~/.claude/CLAUDE.md` | Rules file. Claude Code reads this at the start of every session. Same content as GEMINI.md. |
| `SKILL.md` | `~/.claude/skills/auto-version-control/` | Skill definition with the 7-phase workflow. |
| `audit.sh` | `~/.claude/skills/auto-version-control/scripts/` | Project health check script. |

### For OpenClaw

| File | Where it goes | What it does |
|------|--------------|--------------|
| `skill.md` | `~/.openclaw/workspace/skills/auto-version-control/` | Skill definition with rules and workflow. |
| `audit.sh` | `~/.openclaw/workspace/skills/auto-version-control/scripts/` | Project health check script. |

### For Cursor

| File | Where it goes | What it does |
|------|--------------|--------------|
| `SKILL.md` | `~/.cursor/skills/auto-version-control/` | Skill definition with the 7-phase workflow. |
| `audit.sh` | `~/.cursor/skills/auto-version-control/scripts/` | Project health check script. |

### For Windsurf

| File | Where it goes | What it does |
|------|--------------|--------------|
| `global_rules.md` | `~/.codeium/windsurf/memories/global_rules.md` | Rules file. Windsurf reads this for global instructions. |
| `SKILL.md` | `~/.codeium/windsurf/skills/auto-version-control/` | Skill definition with the 7-phase workflow. |
| `audit.sh` | `~/.codeium/windsurf/skills/auto-version-control/scripts/` | Project health check script. |

</details>

<details>
<summary><strong>The 9 rules the AI follows</strong></summary>

1. **Git is mandatory** -- Initialize a repo if one doesn't exist. Never work on main. Always create a feature branch.
2. **Conventional commits** -- Every commit message follows `type: description`. One logical change per commit.
3. **Semantic versioning** -- Tag releases as `vMAJOR.MINOR.PATCH`. Branch before major versions.
4. **Code quality** -- Clean, modular code. No debug statements. No TODOs. No placeholders.
5. **Project structure** -- README, .gitignore, dependency file, organized directories.
6. **Testing** -- Verify changes work before declaring done. Show proof.
7. **Session discipline** -- Check project state when starting. Commit, push, and summarize when ending.
8. **Pull requests** -- Use PRs for merges to main. Clear titles and summaries.
9. **Safety** -- Never force push to main. Never delete branches with unmerged work. Ask before destructive actions.

</details>

<details>
<summary><strong>File structure of this repo</strong></summary>

```
auto-version-control/
  README.md                          # This file
  GEMINI.md                          # Rules file (also used as CLAUDE.md, .cursorrules, etc.)
  QUICKREF.md                        # Copy-paste prompts for common scenarios
  LICENSE                            # MIT license
  setup.sh                           # Interactive setup wizard
  install.sh                         # Quick installer with flags
  .agent/                            # Antigravity integration
    skills/
      auto-version-control/
        SKILL.md                     # 7-phase workflow methodology
        scripts/
          audit.sh                   # Project health check script
  .openclaw/                         # OpenClaw integration
    skills/
      auto-version-control/
        skill.md                     # Skill definition (OpenClaw format)
        scripts/
          audit.sh                   # Same health check script
```

</details>

---

## Contributing

PRs welcome. Areas that need work:

- Language-specific audit rules (detect linting configs, test frameworks)
- Git hook installation for commit message validation
- CI/CD pipeline templates (GitHub Actions, GitLab CI)
- Changelog generation from conventional commits
- Integration with more AI coding platforms

## License

MIT
