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
}
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

# Function to search the product.json
realpath_product_json() {
  local codium_bin codium_path

  codium_bin=$(command -v codium 2>/dev/null) || print_error "Codium binary not found. Ensure VSCodium is installed and in your PATH."
  codium_path=$(realpath "$codium_bin" 2>/dev/null || readlink -f "$codium_bin") || print_error "Could not resolve the real path of the codium binary."

  case "$OSTYPE" in
  darwin*) product_json_path=$(realpath "$(dirname "$codium_path")/../../../Resources/app/product.json") ;;
  linux-gnu*) product_json_path=$(realpath "$(dirname "$codium_path")/../../resources/app/product.json") ;;
  msys* | cygwin* | win32*) product_json_path=$(realpath "$(dirname "$codium_path")/../../resources/app/product.json") ;;
  *) print_error "Unsupported operating system: $OSTYPE" ;;
  esac
  echo "$product_json_path"
}
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

# Function: Install GitHub Copilot extensions
install_copilot_exstensions() {
  print_info "Installing GitHub Copilot extensions..."
  codium --install-extension GitHub.copilot --force || print_error "Failed to install GitHub.copilot."
  codium --install-extension GitHub.copilot-chat --force || print_error "Failed to install GitHub.copilot-chat."
  print_success "GitiHub Copilot extensions installed successfully."
}
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

# Key feature for full functionality of  GitHub.copilot and GitHub.copilot-chat on VSCodium
update_product_json() {
  local product_json=$1

  [[ -f "$product_json" ]] || print_error "product.json not found at $product_json."

  # Apply updates to product.json using jq
  jq 'del(.extensionEnabledApiProposals["GitHub.copilot"], .extensionEnabledApiProposals["GitHub.copilot-nightly"])' \
    "$product_json" >"${product_json}.tmp" && mv "${product_json}.tmp" "$product_json"

  jq '.extensionEnabledApiProposals += {
    "GitHub.copilot": ["interactive", "inlineCompletions", "inlineCompletionsNew", "inlineCompletionsAdditions", "textDocumentNotebook", "terminalDataWriteEvent"],
    "GitHub.copilot-nightly": ["interactive", "inlineCompletions", "inlineCompletionsNew", "inlineCompletionsAdditions", "textDocumentNotebook", "terminalDataWriteEvent"]
  }' "$product_json" >"${product_json}.tmp" && mv "${product_json}.tmp" "$product_json"

  jq '.extensionKind += {
    "GitHub.copilot": ["ui", "workspace"],
    "GitHub.copilot-chat": ["ui", "workspace"]
  }' "$product_json" >"${product_json}.tmp" && mv "${product_json}.tmp" "$product_json"

  jq '.extensionVirtualWorkspacesSupport += {
    "GitHub.copilot": { "default": true },
    "GitHub.copilot-chat": { "default": true }
  }' "$product_json" >"${product_json}.tmp" && mv "${product_json}.tmp" "$product_json"

  jq 'to_entries
  | reduce .[] as $item (
      [];
      if $item.key == "commit" then
        . + [
          {
            key: "defaultChatAgent",
            value: {
              extensionId: "GitHub.copilot",
              chatExtensionId: "GitHub.copilot-chat",
              documentationUrl: "https://aka.ms/github-copilot-overview",
              termsStatementUrl: "https://aka.ms/github-copilot-terms-statement",
              privacyStatementUrl: "https://aka.ms/github-copilot-privacy-statement",
              skusDocumentationUrl: "https://aka.ms/github-copilot-plans",
              publicCodeMatchesUrl: "https://aka.ms/github-copilot-match-public-code",
              manageSettingsUrl: "https://aka.ms/github-copilot-settings",
              managePlanUrl: "https://aka.ms/github-copilot-manage-plan",
              upgradePlanUrl: "https://aka.ms/github-copilot-upgrade-plan",
              providerId: "github",
              providerName: "GitHub",
              enterpriseProviderId: "github-enterprise",
              enterpriseProviderName: "GHE.com",
              providerUriSetting: "github-enterprise.uri",
              providerScopes: [
                ["user:email"],
                ["read:user"],
                ["read:user", "user:email", "repo", "workflow"]
              ],
              entitlementUrl: "https://api.github.com/copilot_internal/user",
              entitlementSignupLimitedUrl: "https://api.github.com/copilot_internal/subscribe_limited_user",
              chatQuotaExceededContext: "github.copilot.chat.quotaExceeded",
              completionsQuotaExceededContext: "github.copilot.completions.quotaExceeded",
              walkthroughCommand: "github.copilot.open.walkthrough",
              completionsMenuCommand: "github.copilot.toggleStatusMenu",
              completionsRefreshTokenCommand: "github.copilot.signIn",
              chatRefreshTokenCommand: "github.copilot.refreshToken",
              completionsAdvancedSetting: "github.copilot.advanced",
              completionsEnablementSetting: "github.copilot.enable",
              nextEditSuggestionsSetting: "github.copilot.nextEditSuggestions.enabled"
            }
          },
          $item
        ]
      else
        . + [$item]
      end
    )
  | from_entries' "$product_json" >"${product_json}.tmp" && mv "${product_json}.tmp" "$product_json"

  print_success "GitHub.copilot and GitHub.copilot-chat setup completed"
}

# Function: Provide instruction for GitHub login
prompt_github_login() {
  print_header "GitHub Login Required"
  print_info "To activate GitHub Copilot:"
  print_info "1. Launch VSCodium"
  print_info "2. Click on the GitHub Copilot icon in the sidebar"
  print_info "3. Log in with your GitHub account when prompted"
  print_info "4. Verify your Copilot subscription status"

  read -rp "Would you like to launch VSCodium now? (y/n): " LAUNCH_VSCODIUM
  if [[ $LAUNCH_VSCODIUM == "y" || $LAUNCH_VSCODIUM == "Y" ]]; then
    codium &
  fi
}
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

# Run the main function
main() {
  local product_json_path
  product_json_path=$(realpath_product_json)

  configure_gallery_vscodium
  install_copilot_exstensions
  update_product_json "$product_json_path"
  # prompt_github_login
}
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

main
