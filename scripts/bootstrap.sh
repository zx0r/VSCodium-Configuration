#!/usr/bin/env bash

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# Script Name  : configure_vscodium.sh
# Author       : zx0r
# License      : MIT License
# Contact Info : https://github.com/zx0r
# Description  : Configures VSCodium, sets Microsoft Gallery env vars, and installs extensions.
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

# --- Strict mode ---
set -euo pipefail

# Clone the repository & Run installer script
run_installer() {
  local REPO="zx0r/VSCodium-Configuration"
  local TEMP_DIR
  TEMP_DIR="$(mktemp -d)"

  if command -v gh >/dev/null && gh auth status &>/dev/null; then
    gh repo clone "$REPO" "$TEMP_DIR"
  elif command -v git >/dev/null; then
    git clone "https://github.com/$REPO.git" "$TEMP_DIR"
  else
    echo "[Error]GitHub CLI ('gh') or Git not found"
    exit 1
  fi

  # Make all scripts executable
  chmod +x "$TEMP_DIR/install.sh" "$TEMP_DIR/scripts/*.sh"

  # Run the main installer script
  "$TEMP_DIR/install.sh"
}

# --- Entry point ---
run_installer
