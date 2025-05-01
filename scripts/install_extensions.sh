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

# Function: Configure Microsoft Gallery for VSCodium
configure_gallery_vscodium() {
  export VSCODE_GALLERY_SERVICE_URL="https://marketplace.visualstudio.com/_apis/public/gallery"
  export VSCODE_GALLERY_CACHE_URL="https://vscode.blob.core.windows.net/gallery/index"
  export VSCODE_GALLERY_ITEM_URL="https://marketplace.visualstudio.com/items"
  print_success "Microsoft Gallery configured successfully"
}
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

# Function to install Codium extensions from extensions.json
install_codium_extensions() {
  local EXTENSIONS_FILE="../.vscode-oss/extensions.json"

  # Check if the file exists
  if [[ ! -f $EXTENSIONS_FILE ]]; then
    echo "File not found: $EXTENSIONS_FILE"
    exit 1
  fi

  echo "📦 Installing extensions from $EXTENSIONS_FILE"
  jq -r '.recommendations[]' "$EXTENSIONS_FILE" | while read -r extension; do
    if codium --install-extension "$extension"; then
      print_success "Installed $extension."
    else
      print_warn "Fail install $extension."
    fi

  done
}

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# Main function
main() {
  configure_gallery_vscodium
  install_codium_extensions
  print_success "VSCodium configuration and extensions installation completed."
}

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

# Execute script
main
