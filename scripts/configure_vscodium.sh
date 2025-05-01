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

# --- Source dependencies ---
source ./formatter.sh

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

# --- Global variables ---
REPO="zx0r/VSCodium-Configuration"
TEMP_DIR="$(mktemp -d)"
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

# --- Resolve platform-specific config path ---
resolve_config_dir() {
  print_info "Detecting OS and VSCodium config path"
  case "$(uname -s)" in
  Darwin) CONFIG_DIR="$HOME/Library/Application Support/VSCodium/User" ;;
  Linux) CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/VSCodium/User" ;;
  *) print_error "Unsupported OS: $(uname -s)" ;;
  esac
  mkdir -p "$CONFIG_DIR"
  print_success "Using config directory: $CONFIG_DIR"
}
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

# --- Clone configuration repo ---
clone_repo() {
  print_info "Cloning configuration repository"
  gh repo clone "$REPO" "$TEMP_DIR" || print_error "GitHub clone failed"
}
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

# --- Copy configuration files ---
apply_configs() {
  local files=(settings.json keybindings.json extensions.json)
  local source_dir="$TEMP_DIR/User"

  for file in "${files[@]}"; do
    local src="$source_dir/$file"
    local dest="$CONFIG_DIR/$file"

    if [[ -f "$dest" ]]; then
      cp -p "$dest" "$dest.bak.$(date +%Y%m%d_%H%M%S)"
      print_success "Backup of $file saved to $dest.bak.$(date +%Y%m%d_%H%M%S)"
    fi

    if [[ -f "$src" ]]; then
      cp -f "$src" "$dest"
      print_success "$file installed"
    else
      print_warn "$file not found in repository"
    fi
  done
}
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

# --- Main function ---
main() {
  resolve_config_dir
  clone_repo
  apply_configs
  print_success "VSCodium configuration completed"
}
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

# Run
main
