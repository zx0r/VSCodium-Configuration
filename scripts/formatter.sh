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

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

bold="$(tput bold)"
reset="$(tput sgr0)"
red="$(tput setaf 1)"
green="$(tput setaf 2)"
yellow="$(tput setaf 3)"
blue="$(tput setaf 4)"
magenta="$(tput setaf 5)"
cyan="$(tput setaf 6)"

# Line separator
line="${blue}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${reset}"

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

# --- Output helpers ---
print_success() { echo -e "${green}[SUCCESS]${reset} ${green}$*${reset}"; }
print_info() { echo -e "${blue}[INFO]${reset} ${yellow}$*${reset}"; }
print_warn() { echo -e "${yellow}[WARN]${reset} ${yellow}$*${reset}"; }
print_error() {
  echo -e "${_RED}[FAIL]${reset} ${_RED}$*${reset}" >&2i
  exit 1
}
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

# --- Header section ---
print_header() {
  local title="$1"
  echo -e "\n${line}\n${cyan}▶ $title${reset}\n${line}"
}
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

print_start_banner() {
  echo -e ""
  echo -e "$line"

  cat <<EOF
${bold}
${green}   a88888b.              dP         888888ba                           dP${reset}
${green}  d8     88              88         88     8b                          88${reset}
${yellow}  88       .d8888b..d888b88.d8888b.a88aaaa8P'.d8888b..d8888b..d8888b.d8888P${reset}
${red}  88       88    8888    8888ooood8 88    8b.88    8888    88Y8ooooo.  88${reset}
${cyan}  Y8.   .8888.  .8888.  .8888.  ... 88    .8888.  .8888.  .88      88  88${reset}
${blue}   Y88888P  88888P  88888P8 88888P  88888888P 88888P  88888P  88888P   dP${reset}
${yellow}                     Copyright (c) 2025 zx0r. All rights reserved.     ${blue}dP${reset}

${yellow}  Author       : zx0r${reset}
${yellow}  License      : MIT License${reset}
${yellow}  Contact Info : https://github.com/zx0r${reset}

${red}                      Think Different                     ${reset}
${magenta}  ▸ Stay Hungry: Never be satisfied with what you know    ${reset}
${magenta}  ▸ Stay Foolish: Never be afraid to take risks           ${reset}
${magenta}  ▸ Stay Creative: Innovation distinguishes leaders       ${reset}
${magenta}  ▸ Stay Passionate: Love what you do                     ${reset}

${red}   "Your time is limited, don't waste it living someone else's life."   ${reset}
EOF

  echo -e "$line"
  echo -e ""
}
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

# Print a banner
print_end_banner() {
  echo -e "${line}"
  echo -e ""
  echo -e "${green} ▸ Step 1: Handling Vibrancy Continued warning...${reset}"
  echo -e "${yellow}   Your VSCode installation appears to be corrupt${reset}"
  echo -e "${yellow}   This warning is safe to disregard.${reset}"
  echo -e "${yellow}   To hide it click and select 'Don't Show Again'${reset}"
  echo -e "${yellow}   Press F1 and activate the command 'Enable Vibrancy'${reset}"
  echo -e "${yellow}   Restart VSCodium when prompted.\n${reset}"

  echo -e "${green} ▸ Step 2: Activate GitHub Copilot:${reset}"
  echo -e "${yellow}   1. Launch VSCodium${reset}"
  echo -e "${yellow}   2. Click on the GitHub Copilot icon in the panel${reset}"
  echo -e "${yellow}   3. Log in with your GitHub account when prompted${reset}"
  echo -e "${yellow}   Verify your Copilot subscription status${reset}"
  echo -e "${yellow}   Restart VSCodium when prompted.\n${reset}"

  echo -e "${green} ▸ Step 3. Reload VSCodium to apply all changes.${reset}"
  echo -e ""
  echo -e "${line}"
}
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
