#!/usr/bin/env bash
# Automatically dump Brewfile to this repository directory

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BREWFILE_PATH="$SCRIPT_DIR/Brewfile"

# Dynamically locate brew (works across macOS Apple Silicon, macOS Intel, and Linux)
if command -v brew >/dev/null 2>&1; then
  BREW_CMD="$(command -v brew)"
elif [ -f "/opt/homebrew/bin/brew" ]; then
  BREW_CMD="/opt/homebrew/bin/brew"
elif [ -f "/home/linuxbrew/.linuxbrew/bin/brew" ]; then
  BREW_CMD="/home/linuxbrew/.linuxbrew/bin/brew"
elif [ -f "/usr/local/bin/brew" ]; then
  BREW_CMD="/usr/local/bin/brew"
else
  exit 1
fi

"$BREW_CMD" bundle dump --force --file="$BREWFILE_PATH"