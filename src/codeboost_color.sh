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

if [ -x "$(command -v tput)" ]; then
  bold="$(tput bold)"
  blue="$(tput setaf 4)"
  cyan="$(tput setaf 6)"
  magenta="$(tput setaf 5)"
  green="$(tput setaf 2)"
  yellow="$(tput setaf 3)"
  red="$(tput setaf 1)"
  bright_green="$(tput setaf 10)"
  reset="$(tput sgr0)"
fi

art="${bold}
${green} a88888b.              dP         888888ba                           dP${reset}
${green}d8     88              88         88     8b                          88${reset}
${yellow}88       .d8888b..d888b88.d8888b.a88aaaa8P'.d8888b..d8888b..d8888b.d8888P${reset}
${red}88       88    8888    8888ooood8 88    8b.88    8888    88Y8ooooo.  88${reset}
${cyan}Y8.   .8888.  .8888.  .8888.  ... 88    .8888.  .8888.  .88      88  88${reset}
${blue} Y88888P  88888P  88888P8 88888P  88888888P 88888P  88888P  88888P   dP${reset}
${reset}${yellow}                       Copyright (c) 2025 zx0r. All rights reserved.${reset} ${blue}dP${reset}"

# Execute the main function
echo "$art"
