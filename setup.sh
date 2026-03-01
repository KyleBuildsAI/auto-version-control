#!/usr/bin/env bash
# Auto Version Control Setup Wizard
# Interactive installer for automatic version control rules.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo ""
echo "======================================="
echo "  Auto Version Control Setup Wizard"
echo "======================================="
echo ""
echo "Auto Version Control makes your AI coding agent handle"
echo "git branching, commits, and version numbers for you"
echo "automatically. You just keep prompting -- it handles the rest."
echo ""

# Detect available platforms
PLATFORMS=()
echo "Detecting installed platforms..."

if command -v antigravity &>/dev/null || [ -d "$HOME/.agent" ]; then
    echo "  Found: Google Antigravity"
    PLATFORMS+=("antigravity")
fi

if [ -d "$HOME/.openclaw" ] || command -v openclaw &>/dev/null; then
    echo "  Found: OpenClaw"
    PLATFORMS+=("openclaw")
fi

if command -v claude &>/dev/null; then
    echo "  Found: Claude Code"
    PLATFORMS+=("claude")
fi

if command -v cursor &>/dev/null || [ -d "$HOME/.cursor" ]; then
    echo "  Found: Cursor"
    PLATFORMS+=("cursor")
fi

if [ ${#PLATFORMS[@]} -eq 0 ]; then
    echo "  No platforms auto-detected (that's OK, you can still install manually)."
fi

echo ""

# Ask what to install
echo "What would you like to install?"
echo ""
echo "  1) Global rules (applies to all projects on this machine)"
echo "  2) Workspace install (applies to one specific project)"
echo "  3) OpenClaw skills"
echo "  4) Everything (global + OpenClaw + a workspace)"
echo "  5) Cancel"
echo ""

read -rp "Choose [1-5]: " CHOICE

case "$CHOICE" in
    1)
        bash "$SCRIPT_DIR/install.sh" --global
        ;;
    2)
        read -rp "Path to your project: " PROJECT_PATH
        PROJECT_PATH="${PROJECT_PATH/#\~/$HOME}"
        if [ ! -d "$PROJECT_PATH" ]; then
            echo "Error: Directory does not exist: $PROJECT_PATH"
            exit 1
        fi
        bash "$SCRIPT_DIR/install.sh" --workspace "$PROJECT_PATH"
        ;;
    3)
        bash "$SCRIPT_DIR/install.sh" --openclaw
        ;;
    4)
        read -rp "Path to your project (or press Enter to skip workspace): " PROJECT_PATH
        if [ -n "$PROJECT_PATH" ]; then
            PROJECT_PATH="${PROJECT_PATH/#\~/$HOME}"
            bash "$SCRIPT_DIR/install.sh" --all "$PROJECT_PATH"
        else
            bash "$SCRIPT_DIR/install.sh" --global
            bash "$SCRIPT_DIR/install.sh" --openclaw
        fi
        ;;
    5)
        echo "Cancelled."
        exit 0
        ;;
    *)
        echo "Invalid choice."
        exit 1
        ;;
esac

echo ""
echo "======================================="
echo "  Setup Complete"
echo "======================================="
echo ""
echo "Next steps:"
echo "  1. Open your project in your AI coding agent"
echo "  2. Start coding -- the agent will handle version control"
echo "     automatically (branches, commits, version tags)"
echo "  3. Use the prompts in QUICKREF.md if the agent needs a nudge"
echo ""
echo "To check a project's health:"
echo "  bash $SCRIPT_DIR/.agent/skills/dev-workflow/scripts/audit.sh /path/to/project"
echo ""
