#!/usr/bin/env bash

# Auto Version Control Installer (thin wrapper)
# For the full interactive wizard, run: bash setup.sh
# For flag-based installs, this script passes flags to setup.sh
#
# Usage:
#   ./install.sh                    # Interactive wizard (same as setup.sh)
#   ./install.sh --all              # Install to all detected platforms
#   ./install.sh --antigravity      # Google Antigravity only
#   ./install.sh --openclaw         # OpenClaw only
#   ./install.sh --claude           # Claude Code only
#   ./install.sh --cursor           # Cursor only
#   ./install.sh --windsurf         # Windsurf only

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
exec bash "$SCRIPT_DIR/setup.sh" "$@"
