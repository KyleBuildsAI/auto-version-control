#!/usr/bin/env bash
# DevForge Project Audit
# Scans a project for professional development standards compliance.
# Exit codes: 0 = all clear, 1 = warnings found, 2 = critical issues found

set -uo pipefail

PROJECT_ROOT="${1:-.}"
WARNINGS=0
CRITICALS=0
TOTAL_CHECKS=0
PASSED_CHECKS=0

RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
NC='\033[0m'

pass() {
    TOTAL_CHECKS=$((TOTAL_CHECKS + 1))
    PASSED_CHECKS=$((PASSED_CHECKS + 1))
    echo -e "  ${GREEN}PASS${NC}  $1"
}

warn() {
    TOTAL_CHECKS=$((TOTAL_CHECKS + 1))
    WARNINGS=$((WARNINGS + 1))
    echo -e "  ${YELLOW}WARN${NC}  $1"
}

fail() {
    TOTAL_CHECKS=$((TOTAL_CHECKS + 1))
    CRITICALS=$((CRITICALS + 1))
    echo -e "  ${RED}FAIL${NC}  $1"
}

info() {
    echo -e "  ${CYAN}INFO${NC}  $1"
}

cd "$PROJECT_ROOT"

echo ""
echo "=== DEVFORGE PROJECT AUDIT ==="
echo "Directory: $(pwd)"
echo "Date: $(date '+%Y-%m-%d %H:%M:%S')"
echo ""

# --- Git Repository ---
echo "--- Git Repository ---"

if [ -d .git ]; then
    pass "Project is a git repository"

    BRANCH=$(git branch --show-current 2>/dev/null || echo "")
    if [ -n "$BRANCH" ]; then
        if [ "$BRANCH" = "main" ] || [ "$BRANCH" = "master" ]; then
            info "Currently on $BRANCH (OK for review, but create a branch before making changes)"
        else
            pass "Working on feature branch: $BRANCH"
        fi
    fi

    if git status --porcelain 2>/dev/null | grep -q .; then
        warn "Uncommitted changes detected"
    else
        pass "Working tree is clean"
    fi

    COMMIT_COUNT=$(git rev-list --count HEAD 2>/dev/null || echo "0")
    if [ "$COMMIT_COUNT" -gt 0 ]; then
        pass "Repository has $COMMIT_COUNT commits"

        LAST_5=$(git log --oneline -5 2>/dev/null || echo "")
        BAD_MSGS=0
        while IFS= read -r line; do
            MSG=$(echo "$line" | sed 's/^[a-f0-9]* //')
            if ! echo "$MSG" | grep -qE '^(feat|fix|refactor|docs|test|style|perf|chore|ci|build|Merge|Initial|v[0-9])'; then
                BAD_MSGS=$((BAD_MSGS + 1))
            fi
        done <<< "$LAST_5"

        if [ "$BAD_MSGS" -eq 0 ]; then
            pass "Recent commits follow conventional format"
        else
            warn "$BAD_MSGS of last 5 commits do not follow conventional commit format"
        fi
    else
        info "No commits yet"
    fi

    TAG_COUNT=$(git tag -l 'v*' 2>/dev/null | wc -l)
    if [ "$TAG_COUNT" -gt 0 ]; then
        LATEST_TAG=$(git tag -l 'v*' --sort=-v:refname 2>/dev/null | head -1)
        pass "Semantic version tags found (latest: $LATEST_TAG, total: $TAG_COUNT)"
    else
        warn "No semantic version tags (v*) found"
    fi
else
    fail "Not a git repository"
fi

echo ""

# --- Project Structure ---
echo "--- Project Structure ---"

if [ -f README.md ] || [ -f readme.md ]; then
    README_SIZE=$(wc -c < README.md 2>/dev/null || wc -c < readme.md 2>/dev/null || echo "0")
    if [ "$README_SIZE" -gt 200 ]; then
        pass "README.md exists and has content ($README_SIZE bytes)"
    else
        warn "README.md exists but is very short ($README_SIZE bytes)"
    fi
else
    fail "No README.md found"
fi

if [ -f .gitignore ]; then
    GITIGNORE_LINES=$(wc -l < .gitignore)
    pass ".gitignore exists ($GITIGNORE_LINES rules)"
else
    fail "No .gitignore found"
fi

if [ -f LICENSE ] || [ -f LICENSE.md ] || [ -f LICENCE ]; then
    pass "LICENSE file exists"
else
    warn "No LICENSE file found"
fi

DEP_FILE=""
for f in package.json requirements.txt Pipfile pyproject.toml Cargo.toml go.mod Gemfile build.gradle pom.xml composer.json; do
    if [ -f "$f" ]; then
        DEP_FILE="$f"
        break
    fi
done

if [ -n "$DEP_FILE" ]; then
    pass "Dependency file found: $DEP_FILE"
else
    warn "No dependency management file found"
fi

echo ""

# --- Code Quality ---
echo "--- Code Quality ---"

SRC_EXTENSIONS="--include=*.py --include=*.js --include=*.ts --include=*.jsx --include=*.tsx --include=*.go --include=*.rs --include=*.java --include=*.rb --include=*.php"
EXCLUDE_DIRS="--exclude-dir=node_modules --exclude-dir=.git --exclude-dir=vendor --exclude-dir=.agent --exclude-dir=.openclaw"

TODO_COUNT=$(grep -rn $SRC_EXTENSIONS $EXCLUDE_DIRS -E '\b(TODO|FIXME|HACK|XXX)\b' . 2>/dev/null | wc -l)
TODO_COUNT=$((TODO_COUNT + 0))

if [ "$TODO_COUNT" -eq 0 ]; then
    pass "No TODO/FIXME/HACK/XXX comments found"
else
    warn "$TODO_COUNT TODO/FIXME/HACK/XXX comments found in source files"
fi

DEBUG_COUNT=$(grep -rn --include='*.py' --include='*.js' --include='*.ts' --include='*.jsx' --include='*.tsx' $EXCLUDE_DIRS --exclude-dir=test --exclude-dir=spec -E '(console\.log|print\(|debugger|pdb\.set_trace|binding\.pry|var_dump)' . 2>/dev/null | wc -l)
DEBUG_COUNT=$((DEBUG_COUNT + 0))

if [ "$DEBUG_COUNT" -eq 0 ]; then
    pass "No debug statements found in source files"
else
    warn "$DEBUG_COUNT debug statements found (console.log, print, debugger, etc.)"
fi

PLACEHOLDER_COUNT=$(grep -rni --include='*.py' --include='*.js' --include='*.ts' --include='*.jsx' --include='*.tsx' --include='*.html' $EXCLUDE_DIRS -E '(lorem ipsum|test@test\.com|example@example|John Doe|Jane Doe|foo@bar|coming soon)' . 2>/dev/null | wc -l)
PLACEHOLDER_COUNT=$((PLACEHOLDER_COUNT + 0))

if [ "$PLACEHOLDER_COUNT" -eq 0 ]; then
    pass "No placeholder content found"
else
    warn "$PLACEHOLDER_COUNT lines with placeholder content found"
fi

SECRET_COUNT=$(grep -rn $SRC_EXTENSIONS --include='*.env' $EXCLUDE_DIRS --exclude-dir=test --exclude-dir=spec -E '(password\s*=\s*["\x27][^"\x27]+|api[_-]?key\s*=\s*["\x27][^"\x27]+|secret\s*=\s*["\x27][^"\x27]+|token\s*=\s*["\x27][^"\x27]+)' . 2>/dev/null | grep -v example | wc -l)
SECRET_COUNT=$((SECRET_COUNT + 0))

if [ "$SECRET_COUNT" -eq 0 ]; then
    pass "No hardcoded secrets detected"
else
    fail "$SECRET_COUNT potential hardcoded secrets found"
fi

echo ""

# --- Large Files ---
echo "--- Large Files ---"

LARGE_FILES=0
if [ -d .git ]; then
    LARGE_FILE_LIST=$(git ls-files 2>/dev/null | while read -r f; do
        if [ -f "$f" ]; then
            SIZE=$(stat -c%s "$f" 2>/dev/null || stat -f%z "$f" 2>/dev/null || echo "0")
            if [ "$SIZE" -gt 10485760 ]; then
                echo "$f"
            fi
        fi
    done)
    LARGE_FILES=$(echo "$LARGE_FILE_LIST" | grep -c . 2>/dev/null || true)
    LARGE_FILES=$((LARGE_FILES + 0))
fi

if [ "$LARGE_FILES" -eq 0 ]; then
    pass "No large files (>10MB) tracked by git"
else
    warn "$LARGE_FILES large files (>10MB) tracked by git"
fi

ENV_TRACKED=0
if [ -d .git ]; then
    ENV_TRACKED=$(git ls-files 2>/dev/null | grep -cE '\.env$|\.env\.' 2>/dev/null || true)
    ENV_TRACKED=$((ENV_TRACKED + 0))
fi

if [ "$ENV_TRACKED" -eq 0 ]; then
    pass "No .env files tracked by git"
else
    fail ".env files are tracked by git (should be in .gitignore)"
fi

echo ""

# --- Summary ---
echo "=== AUDIT SUMMARY ==="
echo -e "  Checks run:   $TOTAL_CHECKS"
echo -e "  ${GREEN}Passed:${NC}       $PASSED_CHECKS"
echo -e "  ${YELLOW}Warnings:${NC}     $WARNINGS"
echo -e "  ${RED}Critical:${NC}     $CRITICALS"
echo ""

if [ "$CRITICALS" -gt 0 ]; then
    echo -e "  ${RED}Result: CRITICAL issues found. Fix before shipping.${NC}"
    exit 2
elif [ "$WARNINGS" -gt 0 ]; then
    echo -e "  ${YELLOW}Result: Warnings found. Review recommended.${NC}"
    exit 1
else
    echo -e "  ${GREEN}Result: All checks passed. Project meets professional standards.${NC}"
    exit 0
fi
