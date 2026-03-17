#!/bin/bash
# install.sh - Install ghost-writer for any supported agent
set -e

REPO_URL="https://github.com/OneSpiral/ghost-writer.git"

detect_agent() {
    if [ -d "$HOME/.claude" ]; then echo "claude"; return; fi
    if [ -d "$HOME/.codex" ]; then echo "codex"; return; fi
    if [ -d "$HOME/.pi/agent" ]; then echo "pi"; return; fi
    if [ -d "$HOME/.opencode" ]; then echo "opencode"; return; fi
    echo "claude" # default
}

AGENT="${1:-$(detect_agent)}"

case "$AGENT" in
    claude)  SKILL_DIR="$HOME/.claude/skills/ghost-writer" ;;
    codex)   SKILL_DIR="$HOME/.codex/skills/ghost-writer" ;;
    pi)      SKILL_DIR="$HOME/.pi/agent/skills/ghost-writer" ;;
    opencode) SKILL_DIR="$HOME/.opencode/skills/ghost-writer" ;;
    *)       echo "Usage: $0 [claude|codex|pi|opencode]"; exit 1 ;;
esac

echo "Installing ghost-writer for $AGENT..."

# Clone or update
if [ -d "$SKILL_DIR/.git" ]; then
    cd "$SKILL_DIR" && git pull --quiet
    echo "✅ Updated ghost-writer"
else
    rm -rf "$SKILL_DIR"
    git clone --depth 1 "$REPO_URL" "$SKILL_DIR"
    echo "✅ Installed ghost-writer"
fi

echo ""
echo "Location: $SKILL_DIR"
echo ""
echo "Commands:"
echo "  /analyze  — Build a 24-dimension style profile from writing samples"
echo "  /write    — Generate new content in an analyzed author's voice"
echo "  /compare  — Compare two authors' styles side-by-side"
