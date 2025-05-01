#!/usr/bin/env bash

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# Script Name  : configure_vscodium.sh
# Author       : zx0r
# License      : MIT License
# Contact Info : https://github.com/zx0r
# Description  : Automates the configuration of VSCodium, sets Microsoft Gallery
#                environment variables, and installs essential extensions.
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

# --- Strict mode: Fail on errors, unset variables, and pipe failures ---
set -euo pipefail

# --- Constants ---
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)" # Absolute path to the script directory

# --- Source dependencies ---
source "${SCRIPT_DIR}/scripts/formatter.sh"
# source "${SCRIPT_DIR}/src/codeboost_color.sh"

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

main() {

  # Clear terminal (top of screen)
  clear

  # print_success "Welcome to ZeroTrustCodium: Secure and Automated IDE Setup"
  print_start_banner

  print_header "Step 1: Installing and Configuring VSCodium..."
  # "${SCRIPT_DIR}/scripts/install_vscodium.sh"
  # "${SCRIPT_DIR}/scripts/configure_vscodium.sh"

  print_header "Step 2: Installing Extensions..."
  # "${SCRIPT_DIR}/scripts/install_extensions.sh"
  # "${SCRIPT_DIR}/scripts/install_copilot.sh"

  print_end_banner

  # "${SCRIPT_DIR}/scripts/run_vscodium.sh"

  # Completion message
  print_success "VSCodium setup and configuration completed!"
}

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

# Invoke the main function
main "$@"
