#!/usr/bin/env bash

# Auto Version Control Setup Wizard
# Interactive installer for all supported AI coding platforms
# Usage: ./setup.sh or curl -sSL https://raw.githubusercontent.com/KyleBuildsAI/auto-version-control/main/setup.sh | bash

set -e

VERSION="2.2.0"

# ── Color & Formatting ──────────────────────────────────────────
setup_colors() {
  if [ -t 1 ] && [ "${TERM:-}" != "dumb" ]; then
    BOLD='\033[1m'
    DIM='\033[2m'
    RESET='\033[0m'
    GREEN='\033[0;32m'
    RED='\033[0;31m'
    YELLOW='\033[0;33m'
    CYAN='\033[0;36m'
    WHITE='\033[1;37m'
    CHECK="${GREEN}✓${RESET}"
    CROSS="${RED}✗${RESET}"
    DASH="${DIM}-${RESET}"
    ARROW="${CYAN}>${RESET}"
  else
    BOLD='' DIM='' RESET='' GREEN='' RED='' YELLOW='' CYAN='' WHITE=''
    CHECK="[OK]" CROSS="[!!]" DASH="[-]" ARROW=">"
  fi
}

# ── Helper Functions ─────────────────────────────────────────────
print_banner() {
  echo ""
  echo -e "${CYAN}    +===============================================+${RESET}"
  echo -e "${CYAN}    |                                               |${RESET}"
  echo -e "${CYAN}    |${WHITE}    A U T O   V E R S I O N   C O N T R O L    ${CYAN}|${RESET}"
  echo -e "${CYAN}    |                                               |${RESET}"
  echo -e "${CYAN}    |${RESET}   Automatic Git for AI Coding Agents          ${CYAN}|${RESET}"
  echo -e "${CYAN}    |${DIM}   v${VERSION}                                      ${RESET}${CYAN}|${RESET}"
  echo -e "${CYAN}    |                                               |${RESET}"
  echo -e "${CYAN}    +===============================================+${RESET}"
  echo ""
}

print_step() {
  local step="$1" total="$2" msg="$3"
  echo -e "  ${CYAN}[${step}/${total}]${RESET}  ${BOLD}${msg}${RESET}"
  echo ""
}

print_ok()      { echo -e "    ${CHECK}  $1"; }
print_fail()    { echo -e "    ${CROSS}  $1"; }
print_warn()    { echo -e "    ${YELLOW}!${RESET}  $1"; }
print_skip()    { echo -e "    ${DASH}  $1"; }
print_info()    { echo -e "    ${ARROW}  $1"; }
print_item()    { echo -e "      ├── $1"; }
print_last()    { echo -e "      └── $1"; }

# ── Dependency Check ─────────────────────────────────────────────
check_dependencies() {
  print_step 1 5 "Checking dependencies"

  if command -v git &>/dev/null; then
    local git_ver
    git_ver=$(git --version 2>/dev/null | awk '{print $3}')
    print_ok "git ${DIM}${git_ver}${RESET}"
  else
    print_fail "git not found ${DIM}(required -- install from https://git-scm.com)${RESET}"
  fi
  echo ""
}

# ── Platform Detection ───────────────────────────────────────────
DETECTED_ANTIGRAVITY=false
DETECTED_OPENCLAW=false
DETECTED_CLAUDE=false
DETECTED_CURSOR=false
DETECTED_WINDSURF=false

detect_platforms() {
  print_step 2 5 "Detecting installed platforms"

  # Google Antigravity
  if [ -d "$HOME/.gemini" ]; then
    print_ok "Google Antigravity    ${DIM}(detected)${RESET}"
    DETECTED_ANTIGRAVITY=true
  else
    print_skip "Google Antigravity    ${DIM}(not found)${RESET}"
  fi

  # OpenClaw
  if [ -d "$HOME/.openclaw" ]; then
    print_ok "OpenClaw              ${DIM}(detected)${RESET}"
    DETECTED_OPENCLAW=true
  else
    print_skip "OpenClaw              ${DIM}(not found)${RESET}"
  fi

  # Claude Code
  if command -v claude &>/dev/null || [ -d "$HOME/.claude" ]; then
    print_ok "Claude Code           ${DIM}(detected)${RESET}"
    DETECTED_CLAUDE=true
  else
    print_skip "Claude Code           ${DIM}(not found)${RESET}"
  fi

  # Cursor
  if command -v cursor &>/dev/null || [ -d "$HOME/.cursor" ]; then
    print_ok "Cursor                ${DIM}(detected)${RESET}"
    DETECTED_CURSOR=true
  else
    print_skip "Cursor                ${DIM}(not found)${RESET}"
  fi

  # Windsurf
  if command -v windsurf &>/dev/null || [ -d "$HOME/.windsurf" ] || [ -d "$HOME/.codeium" ]; then
    print_ok "Windsurf              ${DIM}(detected)${RESET}"
    DETECTED_WINDSURF=true
  else
    print_skip "Windsurf              ${DIM}(not found)${RESET}"
  fi

  echo ""
}

# ── Interactive Menu ─────────────────────────────────────────────
SEL_ANTIGRAVITY=false
SEL_OPENCLAW=false
SEL_CLAUDE=false
SEL_CURSOR=false
SEL_WINDSURF=false

show_menu() {
  # Pre-select all detected platforms
  SEL_ANTIGRAVITY=$DETECTED_ANTIGRAVITY
  SEL_OPENCLAW=$DETECTED_OPENCLAW
  SEL_CLAUDE=$DETECTED_CLAUDE
  SEL_CURSOR=$DETECTED_CURSOR
  SEL_WINDSURF=$DETECTED_WINDSURF

  print_step 3 5 "Choose where to install"

  echo -e "    Detected platforms are pre-selected."
  echo -e "    Enter numbers to toggle, then press ${BOLD}Enter${RESET} to continue."
  echo ""

  while true; do
    local mark_a="[ ]" mark_o="[ ]" mark_c="[ ]" mark_u="[ ]" mark_w="[ ]"
    $SEL_ANTIGRAVITY && mark_a="${GREEN}[x]${RESET}"
    $SEL_OPENCLAW    && mark_o="${GREEN}[x]${RESET}"
    $SEL_CLAUDE      && mark_c="${GREEN}[x]${RESET}"
    $SEL_CURSOR      && mark_u="${GREEN}[x]${RESET}"
    $SEL_WINDSURF    && mark_w="${GREEN}[x]${RESET}"

    echo -e "    ${mark_a} 1. Google Antigravity  ${DIM}(global: ~/.gemini/antigravity/skills/)${RESET}\033[K"
    echo -e "    ${mark_o} 2. OpenClaw            ${DIM}(global: ~/.openclaw/workspace/skills/)${RESET}\033[K"
    echo -e "    ${mark_c} 3. Claude Code         ${DIM}(global: ~/.claude/skills/)${RESET}\033[K"
    echo -e "    ${mark_u} 4. Cursor              ${DIM}(global: ~/.cursor/skills/)${RESET}\033[K"
    echo -e "    ${mark_w} 5. Windsurf            ${DIM}(global: ~/.codeium/windsurf/skills/)${RESET}\033[K"
    echo ""

    read -p "    Toggle [1-5], Enter to continue, q to quit: " choice

    case "$choice" in
      1) $SEL_ANTIGRAVITY && SEL_ANTIGRAVITY=false || SEL_ANTIGRAVITY=true ;;
      2) $SEL_OPENCLAW && SEL_OPENCLAW=false || SEL_OPENCLAW=true ;;
      3) $SEL_CLAUDE && SEL_CLAUDE=false || SEL_CLAUDE=true ;;
      4) $SEL_CURSOR && SEL_CURSOR=false || SEL_CURSOR=true ;;
      5) $SEL_WINDSURF && SEL_WINDSURF=false || SEL_WINDSURF=true ;;
      q|Q) echo ""; echo "  Cancelled."; echo ""; exit 0 ;;
      "") break ;;
      *) ;;
    esac

    # Move cursor up to redraw menu (5 options + 1 blank + 1 prompt = 7 lines)
    printf '\033[7A'
  done

  echo ""
}

# ── Installation Functions ───────────────────────────────────────
INSTALLED_COUNT=0

install_rules_file() {
  local rules_file="$1"
  local rules_name="$2"

  if [ -f "$rules_file" ] && [ -s "$rules_file" ]; then
    if [ -t 0 ]; then
      echo ""
      echo -e "      ${YELLOW}!${RESET} ${rules_name} already exists at ${DIM}${rules_file}${RESET}"
      echo "        1) Append (Recommended)  2) Replace  3) Skip"
      read -p "        Choice [1/2/3]: " rc
      case $rc in
        1|"") echo "" >> "$rules_file"; cat "$SCRIPT_DIR/GEMINI.md" >> "$rules_file"; print_last "Rules appended                        ${CHECK}" ;;
        2) cp "$SCRIPT_DIR/GEMINI.md" "$rules_file"; print_last "Rules replaced                        ${CHECK}" ;;
        *) print_last "Rules skipped                         ${DASH}" ;;
      esac
    else
      echo "" >> "$rules_file"
      cat "$SCRIPT_DIR/GEMINI.md" >> "$rules_file"
      print_last "Rules appended                        ${CHECK}"
    fi
  else
    mkdir -p "$(dirname "$rules_file")"
    cp "$SCRIPT_DIR/GEMINI.md" "$rules_file"
    print_last "Rules installed                       ${CHECK}"
  fi
}

do_install_antigravity() {
  local skills_dir="$HOME/.gemini/antigravity/skills"

  echo -e "    ${BOLD}Installing to Antigravity...${RESET}"

  mkdir -p "$skills_dir/auto-version-control/scripts"

  cp "$SCRIPT_DIR/.agent/skills/auto-version-control/SKILL.md" "$skills_dir/auto-version-control/SKILL.md"
  print_item "Copying version control skill...      ${CHECK}"

  cp "$SCRIPT_DIR/.agent/skills/auto-version-control/scripts/audit.sh" "$skills_dir/auto-version-control/scripts/audit.sh"
  chmod +x "$skills_dir/auto-version-control/scripts/audit.sh"
  print_item "Copying audit script...               ${CHECK}"

  install_rules_file "$HOME/.gemini/antigravity/GEMINI.md" "GEMINI.md"

  INSTALLED_COUNT=$((INSTALLED_COUNT + 1))
  echo ""
}

do_install_openclaw() {
  local skills_dir="$HOME/.openclaw/workspace/skills"

  echo -e "    ${BOLD}Installing to OpenClaw...${RESET}"

  mkdir -p "$skills_dir/auto-version-control/scripts"

  cp "$SCRIPT_DIR/.openclaw/skills/auto-version-control/skill.md" "$skills_dir/auto-version-control/skill.md"
  print_item "Copying version control skill...      ${CHECK}"

  cp "$SCRIPT_DIR/.openclaw/skills/auto-version-control/scripts/audit.sh" "$skills_dir/auto-version-control/scripts/audit.sh"
  chmod +x "$skills_dir/auto-version-control/scripts/audit.sh"
  print_last "Copying audit script...               ${CHECK}"

  INSTALLED_COUNT=$((INSTALLED_COUNT + 1))
  echo ""
}

do_install_claude() {
  local skills_dir="$HOME/.claude/skills"

  echo -e "    ${BOLD}Installing to Claude Code...${RESET}"

  mkdir -p "$skills_dir/auto-version-control/scripts"

  cp "$SCRIPT_DIR/.agent/skills/auto-version-control/SKILL.md" "$skills_dir/auto-version-control/SKILL.md"
  print_item "Copying version control skill...      ${CHECK}"

  cp "$SCRIPT_DIR/.agent/skills/auto-version-control/scripts/audit.sh" "$skills_dir/auto-version-control/scripts/audit.sh"
  chmod +x "$skills_dir/auto-version-control/scripts/audit.sh"
  print_item "Copying audit script...               ${CHECK}"

  install_rules_file "$HOME/.claude/CLAUDE.md" "CLAUDE.md"

  INSTALLED_COUNT=$((INSTALLED_COUNT + 1))
  echo ""
}

do_install_cursor() {
  local skills_dir="$HOME/.cursor/skills"

  echo -e "    ${BOLD}Installing to Cursor...${RESET}"

  mkdir -p "$skills_dir/auto-version-control/scripts"

  cp "$SCRIPT_DIR/.agent/skills/auto-version-control/SKILL.md" "$skills_dir/auto-version-control/SKILL.md"
  print_item "Copying version control skill...      ${CHECK}"

  cp "$SCRIPT_DIR/.agent/skills/auto-version-control/scripts/audit.sh" "$skills_dir/auto-version-control/scripts/audit.sh"
  chmod +x "$skills_dir/auto-version-control/scripts/audit.sh"
  print_last "Copying audit script...               ${CHECK}"

  INSTALLED_COUNT=$((INSTALLED_COUNT + 1))
  echo ""
}

do_install_windsurf() {
  local skills_dir="$HOME/.codeium/windsurf/skills"

  echo -e "    ${BOLD}Installing to Windsurf...${RESET}"

  mkdir -p "$skills_dir/auto-version-control/scripts"

  cp "$SCRIPT_DIR/.agent/skills/auto-version-control/SKILL.md" "$skills_dir/auto-version-control/SKILL.md"
  print_item "Copying version control skill...      ${CHECK}"

  cp "$SCRIPT_DIR/.agent/skills/auto-version-control/scripts/audit.sh" "$skills_dir/auto-version-control/scripts/audit.sh"
  chmod +x "$skills_dir/auto-version-control/scripts/audit.sh"
  print_item "Copying audit script...               ${CHECK}"

  install_rules_file "$HOME/.codeium/windsurf/memories/global_rules.md" "global_rules.md"

  INSTALLED_COUNT=$((INSTALLED_COUNT + 1))
  echo ""
}

run_installations() {
  print_step 4 5 "Installing"

  $SEL_ANTIGRAVITY && do_install_antigravity
  $SEL_OPENCLAW    && do_install_openclaw
  $SEL_CLAUDE      && do_install_claude
  $SEL_CURSOR      && do_install_cursor
  $SEL_WINDSURF    && do_install_windsurf

  if [ "$INSTALLED_COUNT" -eq 0 ]; then
    echo -e "    ${YELLOW}No platforms selected. Nothing installed.${RESET}"
    echo ""
  fi
}

# ── Completion Summary ───────────────────────────────────────────
print_summary() {
  print_step 5 5 "Setup complete!"

  local stat_a stat_o stat_c stat_u stat_w
  $SEL_ANTIGRAVITY && stat_a="${CHECK}  Antigravity    skill + rules" || stat_a="${DASH}  Antigravity    skipped"
  $SEL_OPENCLAW    && stat_o="${CHECK}  OpenClaw       skill + audit" || stat_o="${DASH}  OpenClaw       skipped"
  $SEL_CLAUDE      && stat_c="${CHECK}  Claude Code    skill + rules" || stat_c="${DASH}  Claude Code    skipped"
  $SEL_CURSOR      && stat_u="${CHECK}  Cursor         skill + audit" || stat_u="${DASH}  Cursor         skipped"
  $SEL_WINDSURF    && stat_w="${CHECK}  Windsurf       skill + rules" || stat_w="${DASH}  Windsurf       skipped"

  echo -e "    ${CYAN}+===============================================+${RESET}"
  echo -e "    ${CYAN}|${RESET}           ${BOLD}Installation Summary${RESET}                ${CYAN}|${RESET}"
  echo -e "    ${CYAN}+===============================================+${RESET}"
  echo ""
  echo -e "    ${stat_a}"
  echo -e "    ${stat_o}"
  echo -e "    ${stat_c}"
  echo -e "    ${stat_u}"
  echo -e "    ${stat_w}"
  echo ""
  echo -e "    ${BOLD}What happens now:${RESET}"
  echo -e "    ${DIM}--------------------------------------------${RESET}"
  echo "    Nothing! That's the whole point."
  echo "    Open your project in your AI coding tool"
  echo "    and start prompting. Version control is"
  echo "    now handled automatically."
  echo ""
  echo -e "    ${BOLD}Test it with this prompt:${RESET}"
  echo -e "    ${DIM}\"Create a hello world script in Python.\"${RESET}"
  echo ""
  echo -e "    The AI should create a branch, write the code,"
  echo -e "    commit with a message like ${DIM}feat: add hello world${RESET},"
  echo -e "    and offer to merge and tag a version."
  echo ""
  echo -e "    ${BOLD}Run a project health check manually:${RESET}"
  if $SEL_ANTIGRAVITY; then
    echo -e "      ${DIM}bash ~/.gemini/antigravity/skills/auto-version-control/scripts/audit.sh /path/to/project${RESET}"
  elif $SEL_OPENCLAW; then
    echo -e "      ${DIM}bash ~/.openclaw/workspace/skills/auto-version-control/scripts/audit.sh /path/to/project${RESET}"
  elif $SEL_CLAUDE; then
    echo -e "      ${DIM}bash ~/.claude/skills/auto-version-control/scripts/audit.sh /path/to/project${RESET}"
  elif $SEL_CURSOR; then
    echo -e "      ${DIM}bash ~/.cursor/skills/auto-version-control/scripts/audit.sh /path/to/project${RESET}"
  elif $SEL_WINDSURF; then
    echo -e "      ${DIM}bash ~/.codeium/windsurf/skills/auto-version-control/scripts/audit.sh /path/to/project${RESET}"
  fi
  echo ""
  echo -e "    ${DIM}Docs: https://github.com/KyleBuildsAI/auto-version-control${RESET}"
  echo ""
}

# ── Source Resolution ────────────────────────────────────────────
resolve_source() {
  if [ -f "${BASH_SOURCE[0]:-}" ]; then
    SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    if [ -d "$SCRIPT_DIR/.agent/skills" ] && [ -f "$SCRIPT_DIR/GEMINI.md" ]; then
      return 0
    fi
  fi

  # Running from pipe or files missing -- clone to temp
  echo -e "  ${DIM}Downloading Auto Version Control...${RESET}"
  TEMP_DIR=$(mktemp -d 2>/dev/null || mktemp -d -t 'autovc')
  SCRIPT_DIR="$TEMP_DIR/auto-version-control"
  git clone --depth 1 --quiet https://github.com/KyleBuildsAI/auto-version-control.git "$SCRIPT_DIR" 2>/dev/null
  CLEANUP_TEMP=true
  echo -e "  ${CHECK} Downloaded"
  echo ""
}

cleanup() {
  if [ "${CLEANUP_TEMP:-false}" = true ] && [ -n "${TEMP_DIR:-}" ]; then
    rm -rf "$TEMP_DIR"
  fi
}
trap cleanup EXIT

# ── Non-Interactive Mode (CLI flags) ─────────────────────────────
parse_flags() {
  INTERACTIVE=true
  FLAG_ALL=false

  while [[ $# -gt 0 ]]; do
    case $1 in
      --all) FLAG_ALL=true; INTERACTIVE=false; shift ;;
      --antigravity) SEL_ANTIGRAVITY=true; INTERACTIVE=false; shift ;;
      --openclaw) SEL_OPENCLAW=true; INTERACTIVE=false; shift ;;
      --claude) SEL_CLAUDE=true; INTERACTIVE=false; shift ;;
      --cursor) SEL_CURSOR=true; INTERACTIVE=false; shift ;;
      --windsurf) SEL_WINDSURF=true; INTERACTIVE=false; shift ;;
      --help)
        echo ""
        echo "  Auto Version Control Setup v${VERSION}"
        echo ""
        echo "  Usage: ./setup.sh [OPTIONS]"
        echo ""
        echo "  Interactive (default):"
        echo "    ./setup.sh              Launch the setup wizard"
        echo ""
        echo "  Non-interactive:"
        echo "    --all                   Install to all detected platforms"
        echo "    --antigravity           Install to Google Antigravity"
        echo "    --openclaw              Install to OpenClaw"
        echo "    --claude                Install to Claude Code"
        echo "    --cursor                Install to Cursor"
        echo "    --windsurf              Install to Windsurf"
        echo ""
        echo "  One-liner install:"
        echo "    curl -sSL https://raw.githubusercontent.com/KyleBuildsAI/auto-version-control/main/setup.sh | bash"
        echo ""
        exit 0
        ;;
      *) shift ;;
    esac
  done

  if $FLAG_ALL; then
    SEL_ANTIGRAVITY=$DETECTED_ANTIGRAVITY
    SEL_OPENCLAW=$DETECTED_OPENCLAW
    SEL_CLAUDE=$DETECTED_CLAUDE
    SEL_CURSOR=$DETECTED_CURSOR
    SEL_WINDSURF=$DETECTED_WINDSURF
  fi

  # If piped (no TTY), default to all detected
  if ! [ -t 0 ]; then
    INTERACTIVE=false
    if ! $SEL_ANTIGRAVITY && ! $SEL_OPENCLAW && ! $SEL_CLAUDE && ! $SEL_CURSOR && ! $SEL_WINDSURF; then
      SEL_ANTIGRAVITY=$DETECTED_ANTIGRAVITY
      SEL_OPENCLAW=$DETECTED_OPENCLAW
      SEL_CLAUDE=$DETECTED_CLAUDE
      SEL_CURSOR=$DETECTED_CURSOR
      SEL_WINDSURF=$DETECTED_WINDSURF
    fi
  fi
}

# ── Main ─────────────────────────────────────────────────────────
main() {
  setup_colors
  print_banner
  resolve_source
  check_dependencies
  detect_platforms
  parse_flags "$@"

  if $INTERACTIVE; then
    show_menu
  else
    print_step 3 5 "Selected platforms"
    $SEL_ANTIGRAVITY && print_ok "Google Antigravity"
    $SEL_OPENCLAW    && print_ok "OpenClaw"
    $SEL_CLAUDE      && print_ok "Claude Code"
    $SEL_CURSOR      && print_ok "Cursor"
    $SEL_WINDSURF    && print_ok "Windsurf"
    echo ""
  fi

  run_installations
  print_summary
}

main "$@"
