#!/bin/bash

# NOTE ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

# Author       : zx0r
# License      : MIT License
# Contact Info : https://github.com/zx0r
# Script: configure-vscodium.sh
# Description: Configures VSCodium and installs a curated list of extensions

# ━━━ configure-VsCodium ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

# PostInstall (Manual)
# Step 1.
# Open the command palette (Ctrl/Cmd + Shift + P) and search for Preferences: Product Icon Theme
# Select Fluent Icons

# Open the command palette (Ctrl/Cmd + Shift + P) and search for Preferences: Color Theme
# Select `Activate SCARLET protocol(beta)` @id:max-SS.Cyberpunk

# Open the command palette (Ctrl/Cmd + Shift + P) and search for Preferences: File Icon Theme
# Select Symbol Icons

# Open the command palette (Ctrl/Cmd + Shift + P) and search for Developer: Reload Window

# Step 2. Configured Vibrance
# # ⚠️ "Your VSCode installation appears to be corrupt"
# # This extension works by editing VS Code's checksum-verified HTML files,
# which means that a warning prompt will appear after installing and enabling Vibrancy Continued.
# This warning is safe to disregard, and all changes can be reverted.
# Click on the cogwheel and select `Don't Show Again to hide it``
# Press F1 and activate command "Reload Vibrancy."
# Restart VSCode when prompted.
# (Optional) Update your VSCode configuration to include "terminal.integrated.gpuAcceleration": "off"

# Appearance Settings VSCcodium
# $HOME/Library/Application Support/VSCodium/User/settings.json or $HOME/.config/VSCodium/User/settings.json
# "workbench.activityBar.iconClickBehavior": "focus",
# "workbench.productIconTheme": "fluent-icons",
# "workbench.colorTheme": "Default Dark+",
# "workbench.iconTheme": "symbols",
# "window.titleBarStyle": "custom",

# For Developers (Search ID APP VsCode)
# Method 1: Check the VS Code Marketplace.Go to the VS Code Marketplace https://marketplace.visualstudio.com/
# Search for the extension name (e.g., Ixion, Vibrancy Continued, Symbols Icon Theme).
# Open the extension's page -> https://marketplace.visualstudio.com/items?itemName=illixion.vscode-vibrancy-continued
# The extension ID is displayed in the URL or under the More Info section

# Source
# https://marketplace.visualstudio.com/items?itemName=miguelsolorio.symbols
# https://marketplace.visualstudio.com/items?itemName=illixion.vscode-vibrancy-continued

# Backup existing extensions folder
EXTENSIONS_DIR="$HOME/.vscode-oss/extensions"
BACKUP_DIR="$HOME/.vscode-oss/extensions_backup_$(date +%Y%m%d_%H%M%S)"

# Color definitions
# RED='\033[0;31m'
# YELLOW='\033[1;33m'
# BLUE='\033[0;34m'
# WHITE='\033[1;37m'
GREEN='\033[0;32m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Print a banner
print_banner() {
    local text="$1"
    local border="${MAGENTA}═══════════════════════════════════════════════════════════════════════${NC}"

    echo -e "${border}"
    echo -e "${GREEN}${text}${NC}"
    echo -e ""
    echo -e "${CYAN}  Author       : zx0r${NC}"
    echo -e "${CYAN}  License      : MIT License${NC}"
    echo -e "${CYAN}  Contact Info : https://github.com/zx0r${NC}"
    echo -e ""
    echo -e "${MAGENTA}                      Think Different                     ${NC}"
    echo -e "${MAGENTA}  ▸ Stay Hungry: Never be satisfied with what you know    ${NC}"
    echo -e "${MAGENTA}  ▸ Stay Foolish: Never be afraid to take risks           ${NC}"
    echo -e "${MAGENTA}  ▸ Stay Creative: Innovation distinguishes leaders       ${NC}"
    echo -e "${MAGENTA}  ▸ Stay Passionate: Love what you do                     ${NC}"
    echo -e "${MAGENTA}                                                          ${NC}"
    echo -e "${MAGENTA}   \"Your time is limited, don't waste it living someone else's life.\"   ${NC}"
    echo -e "${border}"
}

# Example usage
print_banner "Welcome to VSCodium Configuration Script"

# Backup extensions if directory exists
if [ -d "$EXTENSIONS_DIR" ]; then
  echo -e "${CYAN}Backing up existing extensions to $BACKUP_DIR...${NC}"
  mv "$EXTENSIONS_DIR" "$BACKUP_DIR"
fi

# List of extensions to install
EXTENSIONS=(

      # Git
      "eamodio.gitlens"  # GitLens for Git integration and enhanced Git features
     # "GitHub.copilot"

      # AI
      "sourcegraph.cody-ai"  # AI Coding Assistant AI-powered autocomplete and chat

      # Transparent
      "illixion.vscode-vibrancy-continued"  # Acrylic.Native method of Vibrancy Effect.

      # Themes
      "Endormi.2077-theme" # Endormi.2077-theme Color Theme CyberPunk 2077
      "max-ss.cyberpunk"  # Color Theme CyberPunk -> `Activate SCARLET protocol(beta)`
      "Letgamer.Sweet-vscode-Icons"  # File Icons for custom file icons in the explorer
      "miguelsolorio.fluent-icons"  # Product Icon Theme
      "castrogusttavo.Symbols"  # File Explorer Icons

      # Code Formatting & Linting
      "esbenp.prettier-vscode"  # Prettier for code formatting
      "oderwat.indent-rainbow"  # Rainbow Brackets for colorful bracket matching
      "aaron-bond.better-comments"  # Better Comments for improved comment highlighting

      # Testing & Debugging
      "hbenl.vscode-test-explorer"  # Test Explorer for running and managing tests
      "usernamehw.errorlens"  # Error Lens for inline error highlighting

      # Environment & Configuration
      "mikestead.dotenv"  # DotENV for .env file syntax highlighting
      "mrmlnc.vscode-apache"  # Apache Configuration for Apache config file support
      "mrmlnc.vscode-duplicate"  # Duplicate Action for duplicating files and directories

      # API & Development Tools
      "rangav.vscode-thunder-client"  # REST API client for VS Code
      "yandeu.five-server"  # Live reload for static and dynamic pages

      # General Linting and Formatting
      "editorconfig.editorconfig"  # EditorConfig for consistent coding styles
      "streetsidesoftware.code-spell-checker"  # Spell checking for code

      # Python
      "ms-toolsai.jupyter"
      "ms-python.python"  # Python language server, linting, and debugging
      "ms-python.isort"  # Import sorting for Python
      "ms-python.black-formatter"  # Auto-formatting with Black

      # JavaScript/TypeScript
      "dbaeumer.vscode-eslint"  # ESLint for JavaScript/TypeScript linting
      "ms-vscode.vscode-typescript-next"  # TypeScript language server

      # Rust
      "rust-lang.rust-analyzer"  # Rust language server and linting

      # HTML/CSS
      "ecmel.vscode-html-css"  # HTML/CSS language server and linting
      "formulahendry.auto-close-tag"  # Auto-close HTML tags
      "formulahendry.auto-rename-tag"  # Auto-rename HTML tags
      "vincaslt.highlight-matching-tag"  # Highlight Matching Tag for HTML/XML tag highlighting
      "bradlc.vscode-tailwindcss"  # Tailwind CSS IntelliSense for Tailwind CSS

      # Markdown
      "yzhang.markdown-all-in-one"  # Markdown language server and linting
      "davidanson.vscode-markdownlint"  # Markdown linting

      # Docker
      "ms-azuretools.vscode-docker"  # Docker language server and linting

      # Shell Scripting
      "timonwong.shellcheck"  # Shell script linting
      "mads-hartmann.bash-ide-vscode"  # Bash language server

      # SQL
      "mtxr.sqltools"  # SQL language server and linting
      "mtxr.sqltools-driver-pg"  # PostgreSQL driver for SQLTools

      # YAML
      "redhat.vscode-yaml"  # YAML language server and linting

      # XML
      "redhat.vscode-xml"  # XML language server and linting
)

# Install extensions
for EXTENSION in "${EXTENSIONS[@]}"; do
  echo -e "${CYAN}Installing $EXTENSION...${NC}"
  codium --install-extension "$EXTENSION"
done

# Step 1: Instructions for Command Palette
echo -e "${CYAN}\n\nStep 1. Open the Command Palette (Ctrl/Cmd + Shift + P) and:${NC}"
echo -e "${CYAN}   - Search for 'Preferences: Product Icon Theme' and select 'Fluent Icons'${NC}"
echo -e "${CYAN}   - Search for 'Preferences: File Icon Theme' and select 'Symbol Icons'${NC}"
echo -e "${CYAN}   - Search for 'Preferences: Color Theme' and select 'Activate SCARLET protocol(beta)'${NC}"

# Step 2: Handling Vibrancy Continued warning
echo -e "${CYAN}\nStep 2: Handling Vibrancy Continued warning...${NC}"
echo -e "${CYAN} Your VSCode installation appears to be corrupt${NC}"
echo -e "${CYAN}This warning is safe to disregard.\nClick on the cogwheel and select 'Don'\''t Show Again' to hide it.${NC}"
echo -e "${CYAN}Press F1 and activate the command 'Reload Vibrancy.'${NC}"
echo -e "${CYAN}Restart VSCodium when prompted.${NC}"

# Step 3: Reload VSCodium
echo -e "${CYAN}\nStep 3. Reload VSCodium to apply all changes.${NC}"

# Completion message
echo -e "${GREEN}\nVSCodium configuration and extension installation complete!${NC}"
echo -e "${CYAN}═══════════════════════════════════════════════════════════════════════${NC}"