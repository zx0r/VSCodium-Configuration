  <!-- Neon Line Separator -->
<img src="https://i.imgur.com/dBaSKWF.gif" height="40" width="100%">

<!-- Header Animation -->
<div align="center">
  <img src="https://readme-typing-svg.demolab.com?font=Fira+Code&size=32&duration=2800&pause=2000&color=A277FF&center=true&vCenter=true&width=1080&lines=💮+%7C+VSCodium+Configuration+%7C+💮" alt="Typing SVG" />
</div>

<!-- Neon Line Separator  -->
<img src="https://i.imgur.com/dBaSKWF.gif" height="40" width="100%">

<!-- ![Workspace](https://raw.githubusercontent.com/zx0r/hyprdots-gentoo/main/assets/workspace.jpg)  -->

![Workspase-1](https://github.com/zx0r/VSCodium-Configuration/blob/main/.github/assets/Screen-1.jpg)
![Workspase-2](https://github.com/zx0r/VSCodium-Configuration/blob/main/.github/assets/Screen-2.jpg)
![Workspase-3](https://github.com/zx0r/VSCodium-Configuration/blob/main/.github/assets/Screen-3.jpg)

<!-- Neon Line Separator -->
<img src="https://i.imgur.com/dBaSKWF.gif" height="40" width="100%">

<div align="center">
  <a href="https://git.io/typing-svg">
    <img src="https://readme-typing-svg.demolab.com?font=Fira+Code&weight=500&size=22&pause=1000&color=FF00F6&center=true&vCenter=true&random=false&width=524&lines=%E2%8A%B9+Welcome+to+my+profile!+%CB%99%E1%B5%95%CB%99+%E2%8A%B9+" alt="Typing SVG">
  </a>
</div>

<!-- Neon Line Separator -->
<img src="https://i.imgur.com/dBaSKWF.gif" height="40" width="100%">

# 🚀 VSCodium Configuration

Welcome to the **VSCodium Configuration** repository! This project provides a curated setup for [VSCodium](https://vscodium.com/), the open-source build of Visual Studio Code. It includes:

- **Pre-configured settings**: Optimized for productivity and aesthetics.
- **Custom keybindings**: Streamlined shortcuts for faster development.
- **Curated extensions**: Essential tools for coding, debugging, and collaboration.
- **Automated setup**: A script to install extensions and apply settings.

Whether you're a beginner or a seasoned developer, this setup will help you get started with VSCodium in no time!

---
# 🛠️ Installation

### **Structure of the Repository**
```bash
vscodium-config/
├── .github/
│   └── assets/
│       ├── Screen-1.jpg
│       ├── Screen-2.jpg
│       └── Screen-3.jpg
├── LICENSE
├── README.md
├── configure-vscodium.sh
├── extensions.txt
├── keybindings.json
├── settings.json
└── transparent.css
```

###  **Quick Start**
1. Clone this repository:
```bash
   git clone https://github.com/zx0r/VSCodium-Configuration.git
   cd VSCodium-Configuration
```
2. Run the setup script:
```bash
   chmod u+x configure-vscodium.sh
   ./configure-vscodium.sh
```
3. Open VSCodium and enjoy!
```bash
# PostInstall (Manual)
# Step 1.
# Open the command palette (Ctrl/Cmd + Shift + P) and search for Preferences: Product Icon Theme
# Select Fluent Icons

# Open the command palette (Ctrl/Cmd + Shift + P) and search for Preferences: File Icon Theme
# Select Symbol Icons

# Open the command palette (Ctrl/Cmd + Shift + P) and search for Preferences: Color Theme
# Select `Activate SCARLET protocol(beta)`

# Open the command palette (Ctrl/Cmd + Shift + P) and search for Developer: Reload Window
# Click `Enter`

# Step 2. Configured Vibrance
# # ⚠️ "Your VSCode installation appears to be corrupt"
# # This extension works by editing VS Code's checksum-verified HTML files,
# which means that a warning prompt will appear after installing and enabling Vibrancy Continued.
# This warning is safe to disregard, and all changes can be reverted.
# Click on the cogwheel and select `Don't Show Again to hide it``
# Press `F1` and activate command `Reload Vibrancy`
# Restart VSCode when prompted.
# (Optional) Update your VSCode configuration settings.json to include `"terminal.integrated.gpuAcceleration": "off"`

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
```

---

## 🌟 Features

### **Pre-configured Settings**
- **Themes**: Cyberpunk 2077, Fluent Icons, and Symbol Icons.
- **Keybindings**: Custom shortcuts for common actions.
- **Editor Settings**: Optimized for readability and performance.

### **Curated Extensions**
- **Git Integration**: GitLens for enhanced Git workflows.
- **AI Assistance**: Cody AI for intelligent code completion.
- **Code Formatting**: Prettier, Black, and ESLint for clean code.
- **Language Support**: Python, JavaScript, Rust, HTML/CSS, and more.

### **Automated Setup**
- A **Bash script** (`configure-vscodium.sh`) to install extensions and apply settings.
- Step-by-step instructions for manual configuration.

---

### **Prerequisites**
- [VSCodium](https://vscodium.com/) installed on your system.
- Bash shell (Linux/macOS) or WSL (Windows).

---

## 📝 VSCodium Extensions List
```bash
# VSCodium Extensions List

## Transparent
illixion.vscode-vibrancy-continued  # Acrylic.Native method of Vibrancy Effect.

## Git
eamodio.gitlens                     # GitLens for Git integration and enhanced Git features
gitkraken.gitlens                   # Git supercharged - Enhances Git capabilities

## AI
sourcegraph.cody-ai                 # AI Coding Assistant AI-powered autocomplete and chat

## Themes
max-ss.cyberpunk                    # Color Theme CyberPunk 2077 -> `Activate SCARLET protocol(beta)`
Letgamer.Sweet-vscode-Icons         # File Icons for custom file icons in the explorer
miguelsolorio.fluent-icons          # Product Icon Theme
castrogusttavo.Symbols              # File Explorer Icons

## Code Formatting & Linting
esbenp.prettier-vscode              # Prettier for code formatting
oderwat.indent-rainbow              # Rainbow Brackets for colorful bracket matching
aaron-bond.better-comments          # Better Comments for improved comment highlighting

## Testing & Debugging
hbenl.vscode-test-explorer          # Test Explorer for running and managing tests
usernamehw.errorlens                # Error Lens for inline error highlighting

## Environment & Configuration
mikestead.dotenv                    # DotENV for .env file syntax highlighting
mrmlnc.vscode-apache                # Apache Configuration for Apache config file support
mrmlnc.vscode-duplicate             # Duplicate Action for duplicating files and directories

## API & Development Tools
rangav.vscode-thunder-client        # REST API client for VS Code
yandeu.five-server                  # Live reload for static and dynamic pages

## General Linting and Formatting
editorconfig.editorconfig           # EditorConfig for consistent coding styles
streetsidesoftware.code-spell-checker # Spell checking for code

## Python
ms-python.python                    # Python language server, linting, and debugging
ms-python.isort                     # Import sorting for Python
ms-python.black-formatter           # Auto-formatting with Black

## JavaScript/TypeScript
dbaeumer.vscode-eslint              # ESLint for JavaScript/TypeScript linting
ms-vscode.vscode-typescript-next    # TypeScript language server

## Rust
rust-lang.rust-analyzer             # Rust language server and linting

## HTML/CSS
ecmel.vscode-html-css               # HTML/CSS language server and linting
formulahendry.auto-close-tag        # Auto-close HTML tags
formulahendry.auto-rename-tag       # Auto-rename HTML tags
vincaslt.highlight-matching-tag     # Highlight Matching Tag for HTML/XML tag highlighting
bradlc.vscode-tailwindcss           # Tailwind CSS IntelliSense for Tailwind CSS

## Markdown
yzhang.markdown-all-in-one          # Markdown language server and linting
davidanson.vscode-markdownlint      # Markdown linting

## Docker
ms-azuretools.vscode-docker         # Docker language server and linting

## Shell Scripting
timonwong.shellcheck                # Shell script linting
mads-hartmann.bash-ide-vscode       # Bash language server

## SQL
mtxr.sqltools                       # SQL language server and linting
mtxr.sqltools-driver-pg             # PostgreSQL driver for SQLTools

## YAML
redhat.vscode-yaml                  # YAML language server and linting

## XML
redhat.vscode-xml                   # XML language server and linting
```

---

## 📝 License
```bash
MIT License

Copyright (c) 2024 zx0r

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

Your system is now a high-performance cyber-deck, ready to hack the matrix! 🧨

  <!-- Neon Line Separator -->
<img src="https://i.imgur.com/dBaSKWF.gif" height="40" width="100%">

<!-- Header Animation -->
<div align="center">
  <img src="https://readme-typing-svg.demolab.com?font=Fira+Code&size=32&duration=2800&pause=2000&color=A277FF&center=true&vCenter=true&width=1080&lines=💮+%7C+VSCodium+Configuration+for+Developers+%7C+💮" alt="Typing SVG" />
</div>
