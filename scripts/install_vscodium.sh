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

# --- Load dependencies ---
source ./formatter.sh

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# Function to back up VSCodium config if applicable
backup_vscodium_config() {
  local config_dir backup_dir
  config_dir="$HOME/Library/Application Support/VSCodium/User"
  backup_dir="$HOME/VSCodium_User.BAK.$(date +%Y%m%d_%H%M%S)"

  if [[ -d "$config_dir" ]]; then
    cp -a "$config_dir" "$backup_dir"
    print_success "Backing up VSCodium config to $backup_dir"
  fi
}
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

# Install on macOS via Homebrew
install_mac() {
  # Ensure Homebrew and Xcode CLT are available
  command -v brew &>/dev/null || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  xcode-select -p &>/dev/null || xcode-select --install || true

  # Backup VSCodium config once
  backup_vscodium_config

  # Install dependencies ("gh" "jq" "vscodium")
  for app in "$@"; do
    if [[ "$app" == "vscodium" ]]; then

      brew uninstall --cask "$app" &>/dev/null || true
      brew install --cask --appdir="$HOME/Applications" "$app" || print_error "Couldn't install $app"

      # Fix sign VSCodium
      codesign --force --deep --sign - "$HOME/Applications/VSCodium.app"
      print_success "$app installed to $HOME/Applications"
    else
      if ! command -v "$app" &>/dev/null; then
        brew install "$app" || print_error "Couldn't install $app"
      fi
    fi
  done
}
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

# Install on Linux using detected package manager
install_linux() {
  # Detect and assign the first available package manager
  for cmd in apt dnf yum nix yay aura snap zypper flatpak emerge; do
    if command -v "$cmd" &>/dev/null; then
      package_manager="$cmd"
      break
    fi
  done

  case $package_manager in
  yay) yay -S "$app" ;;
  aura) sudo aura -A "$app" ;;
  emerge) sudo emerge -av "$app" ;;
  nix) nix-env -iA nixpkgs."$app" ;;
  snap) snap install "$app" --classic ;;
  flatpak) flatpak install flathub "$app" ;;
  apt)
    if [[ "$app" == "vscodium" ]]; then
      wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | gpg --dearmor | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg
      echo 'deb [arch=amd64,arm64 signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg] https://download.vscodium.com/debs vscodium main' | sudo tee /etc/apt/sources.list.d/vscodium.list
      sudo apt update && sudo apt install -y codium
    else
      sudo apt install -y "$app" || print_error "Couldn't install $app"
    fi
    ;;
  dnf)
    sudo rpmkeys --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg
    printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=download.vscodium.com\nbaseurl=https://download.vscodium.com/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg\nmetadata_expire=1h" | sudo tee -a /etc/yum.repos.d/vscodium.repo
    sudo dnf install -y "$app" || print_error "Couldn't install $app"
    ;;
  zypper)
    sudo rpmkeys --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg
    printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=gitlab.com_paulcarroty_vscodium_repo\nbaseurl=https://download.vscodium.com/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg\nmetadata_expire=1h" | sudo tee -a /etc/zypp/repos.d/vscodium.repo
    sudo zypper in "$app" || print_error "Couldn't install $app"
    ;;
  *)
    print_error "Unsupported package manager"
    ;;
  esac
  print_success "$app installed"
}
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

# Install on Windows using Chocolatey, Winget, or Scoop
install_windows() {
  # Detect and assign the first available package manager
  for cmd in choco winget scoop; do
    if command -v "$cmd" &>/dev/null; then
      package_manager="$cmd"
      break
    fi
  done

  # If no package manager is found, print error and exit
  if [[ -z "$package_manager" ]]; then
    print_error "Windows Package Manager (choco, winget, or scoop) not found."
  fi

  # Install with the detected package manager
  case "$package_manager" in
  choco) choco install -y "$app" ;;
  winget) winget install "$app" ;;
  scoop) scoop bucket add extras && scoop install "$app" ;;
  *) print_error "Unsupported package manager" ;;
  esac
  print_success "$app installed"
}
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

# Main installation logic
main() {
  local dependencies=("gh" "jq" "vscodium")

  print_info "Installing dependencies: ${dependencies[*]}"
  case "$(uname -s)" in
  Darwin) install_mac "${dependencies[@]}" ;;
  Linux) install_linux "${dependencies[@]}" ;;
  MINGW* | MSYS* | CYGWIN*) install_windows "${dependencies[@]}" ;;
  *) print_error "Unsupported OS: $(uname -s)" ;;
  esac
}
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

main "$@"
