# Auto Version Control

**Automatic git version control for vibe coders.**

You prompt, the AI builds. But who's handling version control? Nobody. Your AI agent dumps everything into one commit called "update files," works directly on main, and never tags a version. One bad change and you're starting over.

Auto Version Control fixes this. You install it once into your AI coding tool, and from that point on, the AI handles all the version control for you -- branches, commits, version numbers, everything. You keep prompting like normal. You never think about git again.

---

## Table of Contents

- [What Does It Actually Do?](#what-does-it-actually-do)
- [How Does It Work Inside My AI Tool?](#how-does-it-work-inside-my-ai-tool)
- [Do I Need to Activate It Every Time?](#do-i-need-to-activate-it-every-time)
- [Install for Google Antigravity](#install-for-google-antigravity)
- [Install for Claude Code](#install-for-claude-code)
- [Install for OpenClaw](#install-for-openclaw)
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

- **The rules file** (`GEMINI.md`) is a text file placed in your project folder. When you open a project in Antigravity, it reads this file first and treats everything in it as instructions it must follow. Auto Version Control's rules tell it to use branches, write proper commits, tag versions, and follow professional practices.
- **The skill** (`.agent/skills/dev-workflow/`) is a folder inside your project. Antigravity automatically detects skills and loads them when they match what you're asking it to do. The dev-workflow skill contains the step-by-step methodology the AI follows (check project state, create branch, commit, verify, merge, tag, push).

**You do not need to activate it, call it, or mention it.** Antigravity reads the rules file and loads the skill automatically when you open the project. Every time. It just becomes part of how the AI behaves in that project.

### Claude Code

Auto Version Control installs as **a rules file** (`CLAUDE.md`).

- Claude Code reads a file called `CLAUDE.md` from your project folder at the start of every session. Whatever is in that file becomes instructions that Claude follows automatically.
- Auto Version Control's `CLAUDE.md` tells Claude to use feature branches, write conventional commits, tag versions, push before ending, and maintain project structure.

**You do not need to activate it, call it, or mention it.** Claude Code reads `CLAUDE.md` every time you start a session in that project. It just works.

### OpenClaw

Auto Version Control installs as **a skill**.

- OpenClaw has a skills system. Skills live in `~/.openclaw/workspace/skills/` and are loaded automatically when they match what you're asking the agent to do.
- The `auto-version-control` skill tells the agent how to handle git workflow, commits, versioning, and project structure.

**You do not need to activate it, call it, or mention it.** OpenClaw detects the skill and applies it whenever you ask it to build, fix, or modify code.

---

## Do I Need to Activate It Every Time?

**No.** On all three platforms, it is completely automatic.

- **Antigravity**: Reads `GEMINI.md` and loads `.agent/skills/` every time you open the project. Always on.
- **Claude Code**: Reads `CLAUDE.md` every time you start a session. Always on.
- **OpenClaw**: Loads skills from `~/.openclaw/workspace/skills/` automatically. Always on.

You install it once. After that, you just use your AI tool normally and it handles version control behind the scenes.

---

## Install for Google Antigravity

### What you need before starting

- Google Antigravity installed on your computer
- A terminal (see the table below if you don't know how to open one)

| OS | How to open a terminal |
|----|----------------------|
| **Windows** | Press `Win + R`, type `cmd`, press Enter. Or search "Terminal" in the Start menu. |
| **Mac** | Press `Cmd + Space`, type `Terminal`, press Enter. |
| **Linux** | Press `Ctrl + Alt + T`. |

### Step 1: Download Auto Version Control

Open your terminal and paste this command:

```bash
git clone https://github.com/KyleBuildsAI/auto-version-control.git
```

Press Enter. You'll see it download. When it's done, you'll have a folder called `auto-version-control`.

> **Don't have git?** Click the green **Code** button at the top of this GitHub page, then click **Download ZIP**. Unzip it somewhere you can find it.

### Step 2: Go into the folder

```bash
cd auto-version-control
```

### Step 3: Pick how you want to install

You have two choices:

**Option A: Install for one specific project (recommended if you're working on one thing)**

This puts the version control rules inside one project folder. It only affects that project.

```bash
bash install.sh --workspace /path/to/your/project
```

Replace `/path/to/your/project` with the actual path to your project folder. For example:

```bash
bash install.sh --workspace ~/my-app
```

This copies two things into your project:
1. `GEMINI.md` -- the rules file Antigravity reads automatically
2. `.agent/skills/dev-workflow/` -- the skill Antigravity loads automatically

**Option B: Install globally (affects all projects on this machine)**

```bash
bash install.sh --global
```

This copies the rules to `~/GEMINI.md` and the skill to `~/.agent/skills/dev-workflow/`. Antigravity will use these rules on every project you open.

### Step 4: Verify it worked

Open your project in Antigravity and type this prompt:

> What rules are you following for version control? List the git workflow rules you see in your instructions.

The AI should respond by describing the version control rules: using feature branches, conventional commits, semantic versioning, etc. If it looks confused or says it doesn't have any special rules, the install didn't work -- double check that `GEMINI.md` exists in your project folder (or home folder for global install).

### Step 5: Test it for real

Still in Antigravity, try this prompt:

> Create a simple hello world script in Python. Follow your version control rules.

Watch what it does. It should:
1. Check `git status` first
2. Create a feature branch (like `feat/hello-world`)
3. Write the code
4. Commit with a message like `feat: add hello world script`
5. Offer to merge to main and tag a version

If it does all of that without you asking, Auto Version Control is working.

---

## Install for Claude Code

### What you need before starting

- Claude Code installed (`claude` command works in your terminal)
- A project folder you want to use it in

### Step 1: Download Auto Version Control

Open your terminal and paste:

```bash
git clone https://github.com/KyleBuildsAI/auto-version-control.git
```

### Step 2: Go into the folder

```bash
cd auto-version-control
```

### Step 3: Copy the rules file into your project

Claude Code reads a file called `CLAUDE.md` from your project folder. Copy the rules file there:

```bash
cp GEMINI.md /path/to/your/project/CLAUDE.md
```

Replace `/path/to/your/project` with your actual project path. For example:

```bash
cp GEMINI.md ~/my-app/CLAUDE.md
```

That's it. That one file is all Claude Code needs.

> **Important:** If your project already has a `CLAUDE.md`, you don't want to overwrite it. Instead, append the rules to the end of your existing file:
> ```bash
> cat GEMINI.md >> ~/my-app/CLAUDE.md
> ```

### Step 4: Verify it worked

Open your project folder in Claude Code:

```bash
cd ~/my-app
claude
```

Then type this prompt:

> What version control rules are you following? List them.

Claude should describe the rules: feature branches, conventional commits, semantic versioning, session discipline, etc. If it doesn't know what you're talking about, check that `CLAUDE.md` exists in the project root.

### Step 5: Test it for real

Try this prompt in Claude Code:

> Create a simple hello world script in Python. Follow your version control rules.

Watch for:
1. It checks `git status` first
2. It creates a feature branch
3. It writes the code
4. It commits with a conventional message like `feat: add hello world script`
5. It offers to merge and tag a version

If it does this automatically, it's working.

---

## Install for OpenClaw

### What you need before starting

- OpenClaw installed and running
- Access to your OpenClaw workspace folder (usually `~/.openclaw/workspace/`)

### Step 1: Download Auto Version Control

Open your terminal and paste:

```bash
git clone https://github.com/KyleBuildsAI/auto-version-control.git
```

### Step 2: Go into the folder

```bash
cd auto-version-control
```

### Step 3: Install the OpenClaw skill

```bash
bash install.sh --openclaw
```

This copies the skill to `~/.openclaw/workspace/skills/auto-version-control/`. OpenClaw will automatically detect and load it.

**Or copy manually if you prefer:**

```bash
mkdir -p ~/.openclaw/workspace/skills/auto-version-control/scripts
cp .openclaw/skills/auto-version-control/skill.md ~/.openclaw/workspace/skills/auto-version-control/skill.md
cp .openclaw/skills/auto-version-control/scripts/audit.sh ~/.openclaw/workspace/skills/auto-version-control/scripts/audit.sh
chmod +x ~/.openclaw/workspace/skills/auto-version-control/scripts/audit.sh
```

### Step 4: Verify the files are in place

Run this command to confirm the skill was installed:

```bash
ls -la ~/.openclaw/workspace/skills/auto-version-control/
```

You should see:

```
skill.md
scripts/
```

And inside scripts:

```bash
ls ~/.openclaw/workspace/skills/auto-version-control/scripts/
```

Should show:

```
audit.sh
```

If both files are there, the install is complete.

### Step 5: Test it for real

Ask your OpenClaw agent to build something:

> Build me a simple Python hello world project with proper version control.

Watch for:
1. It initializes a git repo
2. It creates a feature branch
3. It writes the code
4. It commits with a conventional message
5. It merges and tags a version

If it does this, the skill is loaded and working.

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
bash /path/to/auto-version-control/.agent/skills/dev-workflow/scripts/audit.sh /path/to/your/project
```

For example, if you cloned auto-version-control to your home folder and want to check a project called `my-app`:

```bash
bash ~/auto-version-control/.agent/skills/dev-workflow/scripts/audit.sh ~/my-app
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
| `GEMINI.md` | Your project root (or `~/`) | Rules file. Antigravity reads this first and follows all instructions in it. Contains 9 rules covering git workflow, commits, versioning, code quality, structure, testing, sessions, PRs, and safety. |
| `.agent/skills/dev-workflow/SKILL.md` | Your project root (or `~/.agent/`) | Skill definition. Describes a 7-phase workflow (Assess, Plan, Implement, Commit, Verify, Release, Handoff) that the AI follows step by step. |
| `.agent/skills/dev-workflow/scripts/audit.sh` | Same as above | Standalone audit script. Checks your project against 15+ standards. |

### For Claude Code

| File | Where it goes | What it does |
|------|--------------|--------------|
| `CLAUDE.md` | Your project root | Rules file. Claude Code reads this at the start of every session and follows all instructions in it. Same content as GEMINI.md. |

### For OpenClaw

| File | Where it goes | What it does |
|------|--------------|--------------|
| `skill.md` | `~/.openclaw/workspace/skills/auto-version-control/` | Skill definition. OpenClaw detects and loads this when you ask it to build, fix, or modify code. |
| `scripts/audit.sh` | Same as above | Standalone audit script. |

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
      dev-workflow/
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
