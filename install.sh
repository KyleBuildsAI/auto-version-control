#!/usr/bin/env bash
# DevForge Installer
# Installs DevForge rules and skills into your AI coding platform.
#
# Usage:
#   ./install.sh                               # Interactive (same as setup.sh)
#   ./install.sh --global                      # Antigravity global only
#   ./install.sh --openclaw                    # OpenClaw global only
#   ./install.sh --workspace /path/to/project  # Project workspace only
#   ./install.sh --all /path/to/project        # Everything

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
INSTALLED=0

install_antigravity_global() {
    echo "Installing Antigravity global rules..."
    DEST="$HOME/.agent"
    mkdir -p "$DEST/skills/dev-workflow/scripts"
    cp "$SCRIPT_DIR/GEMINI.md" "$HOME/GEMINI.md"
    cp "$SCRIPT_DIR/.agent/skills/dev-workflow/SKILL.md" "$DEST/skills/dev-workflow/SKILL.md"
    cp "$SCRIPT_DIR/.agent/skills/dev-workflow/scripts/audit.sh" "$DEST/skills/dev-workflow/scripts/audit.sh"
    chmod +x "$DEST/skills/dev-workflow/scripts/audit.sh"
    echo "  Installed to ~/.agent/ and ~/GEMINI.md"
    INSTALLED=$((INSTALLED + 1))
}

install_openclaw() {
    echo "Installing OpenClaw skills..."
    DEST="$HOME/.openclaw/workspace/skills/dev-forge"
    mkdir -p "$DEST/scripts"
    cp "$SCRIPT_DIR/.openclaw/skills/dev-forge/skill.md" "$DEST/skill.md"
    cp "$SCRIPT_DIR/.openclaw/skills/dev-forge/scripts/audit.sh" "$DEST/scripts/audit.sh"
    chmod +x "$DEST/scripts/audit.sh"
    echo "  Installed to ~/.openclaw/workspace/skills/dev-forge/"
    INSTALLED=$((INSTALLED + 1))
}

install_workspace() {
    local DEST="$1"
    echo "Installing to workspace: $DEST"
    mkdir -p "$DEST/.agent/skills/dev-workflow/scripts"

    cp "$SCRIPT_DIR/.agent/skills/dev-workflow/SKILL.md" "$DEST/.agent/skills/dev-workflow/SKILL.md"
    cp "$SCRIPT_DIR/.agent/skills/dev-workflow/scripts/audit.sh" "$DEST/.agent/skills/dev-workflow/scripts/audit.sh"
    chmod +x "$DEST/.agent/skills/dev-workflow/scripts/audit.sh"

    # Install rules file based on what platform files already exist
    if [ -f "$DEST/.cursorrules" ]; then
        cp "$SCRIPT_DIR/GEMINI.md" "$DEST/.cursorrules"
        echo "  Updated .cursorrules"
    elif [ -f "$DEST/.windsurfrules" ]; then
        cp "$SCRIPT_DIR/GEMINI.md" "$DEST/.windsurfrules"
        echo "  Updated .windsurfrules"
    elif [ -f "$DEST/CLAUDE.md" ]; then
        cp "$SCRIPT_DIR/GEMINI.md" "$DEST/CLAUDE.md"
        echo "  Updated CLAUDE.md"
    else
        cp "$SCRIPT_DIR/GEMINI.md" "$DEST/GEMINI.md"
        echo "  Installed GEMINI.md"
    fi

    echo "  Installed .agent/skills/dev-workflow/"
    INSTALLED=$((INSTALLED + 1))
}

# Parse arguments
if [ $# -eq 0 ]; then
    exec bash "$SCRIPT_DIR/setup.sh"
    exit 0
fi

while [ $# -gt 0 ]; do
    case "$1" in
        --global)
            install_antigravity_global
            shift
            ;;
        --openclaw)
            install_openclaw
            shift
            ;;
        --workspace)
            if [ -z "${2:-}" ]; then
                echo "Error: --workspace requires a path argument"
                exit 1
            fi
            install_workspace "$2"
            shift 2
            ;;
        --all)
            install_antigravity_global
            install_openclaw
            if [ -n "${2:-}" ]; then
                install_workspace "$2"
                shift 2
            else
                shift
            fi
            ;;
        *)
            echo "Unknown option: $1"
            echo "Usage: ./install.sh [--global] [--openclaw] [--workspace /path] [--all /path]"
            exit 1
            ;;
    esac
done

echo ""
echo "Done. $INSTALLED installation(s) completed."
