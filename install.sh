#!/bin/zsh
set -euo pipefail

install() {
  clear
  echo
  echo " ▄██████▄    ▄▄▄▄███▄▄▄▄      ▄████████   ▄▄▄▄███▄▄▄▄      ▄████████  ▄████████
███    ███ ▄██▀▀▀███▀▀▀██▄   ███    ███ ▄██▀▀▀███▀▀▀██▄   ███    ███ ███    ███
███    ███ ███   ███   ███   ███    ███ ███   ███   ███   ███    ███ ███    █▀
███    ███ ███   ███   ███   ███    ███ ███   ███   ███   ███    ███ ███
███    ███ ███   ███   ███ ▀███████████ ███   ███   ███ ▀███████████ ███
███    ███ ███   ███   ███   ███    ███ ███   ███   ███   ███    ███ ███    █▄
███    ███ ███   ███   ███   ███    ███ ███   ███   ███   ███    ███ ███    ███
 ▀██████▀   ▀█   ███   █▀    ███    █▀   ▀█   ███   █▀    ███    █▀  ████████▀ "


  section() {
    echo -e "\n==> $1"
  }

  section "Permission needed for setup..."
  sudo echo "✓ Granted"

  backup_file_if_exists() {
    local file="$1"
    if [[ -f "$file" ]]; then
      cp "$file" "${file}.bak.$(date +%Y%m%d_%H%M%S)"
    fi
  }

  # Install all packages from Brew
  if ! command -v brew &> /dev/null; then
    section "Installing brew..."
    curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash
    eval "$(/opt/homebrew/bin/brew shellenv zsh)"
    brew install git
  fi

  # Clone
  REPO="${OMAMAC_REPO:-https://github.com/omacom-io/omamac.git}"
  INSTALLER_DIR="$(mktemp -d)"
  trap 'rm -rf "$INSTALLER_DIR"' EXIT

  section "Cloning..."
  git clone --depth 1 "$REPO" "$INSTALLER_DIR"

  section "Installing packages..."
  packages=(tmux mise nvim opencode lazygit lazydocker starship zoxide eza jq gum gh libyaml)
  for pkg in $packages; do brew install "$pkg" || true; done

  # Install Omadots
  curl -fsSL https://raw.githubusercontent.com/omacom-io/omadots/refs/heads/master/install.sh | zsh

  section "Configuring brew init..."
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>"$HOME/.config/shell/inits"
  echo "✓ Zsh"

  # Install secondary apps
  section "Installing apps..."
  casks=(aerospace karabiner-elements ghostty font-jetbrains-mono-nerd-font docker-desktop google-chrome claude-code raycast)
  for cask in $casks; do brew install --cask "$cask" || true; done

  # Install optional apps
  section "Installing optional apps..."
  selected_apps=$(gum choose --no-limit --height=11 \
    --selected="1password" --selected="dropbox" --selected="spotify" \
    --selected="signal" --selected="whatsapp" --selected="obsidian" \
    --selected="zoom" --selected="localsend" --selected="tailscale" \
    "1password" "dropbox" "spotify" "signal" "whatsapp" "obsidian" "zoom" "localsend" "lm-studio" "tailscale")
  while IFS= read -r app; do
    [[ -n "$app" ]] && brew install --cask "$app" || true
  done <<< "$selected_apps"

  # Install dev environments
  section "Installing dev environments..."
  selected_langs=$(gum choose --no-limit --height=15 \
    --selected="node" --selected="ruby" \
    "node" "ruby" "python" "go" "rust" "java" "php" "elixir" "erlang" "scala" "kotlin" "deno" "bun")
  while IFS= read -r lang; do
    [[ -n "$lang" ]] && mise use -g "$lang" || true
  done <<< "$selected_langs"

  # Omamac configs
  section "Configuring Mac..."
  mkdir -p "$HOME/.config"
  cp -Rf "$INSTALLER_DIR/config/"* "$HOME/.config/"

  mkdir -p "$HOME/.config/karabiner"
  backup_file_if_exists "$HOME/.config/karabiner/karabiner.json"
  cp "$INSTALLER_DIR/config/karabiner/karabiner.json" "$HOME/.config/karabiner/karabiner.json"

  backup_file_if_exists "$HOME/.aerospace.toml"
  cp "$INSTALLER_DIR/config/aerospace/aerospace.toml" "$HOME/.aerospace.toml"

  for dir in "$INSTALLER_DIR/config"/*/; do
    echo "✓ $(basename "$dir")"
  done

  echo "✓ ~/.aerospace.toml"
  echo "✓ ~/.config/karabiner/karabiner.json"

  # Create hush file to suppress "Last login" message
  touch "$HOME/.hushlogin"
  echo "✓ Hush login"

  . "$INSTALLER_DIR/install/mac.sh"
  echo "✓ Settings"

  # Done!
  section "Finished!"
  echo "1. Open Karabiner-Elements and ensure the Default profile is selected."
  echo "2. Grant Accessibility permissions for AeroSpace and Karabiner-Elements."
  echo "3. Disable conflicting macOS shortcuts (Spotlight, Mission Control, Desktop switching)."
  echo "4. Optionally import Raycast config from ~/.config/raycast/Raycast.rayconfig (password: 12345678)."
  echo "5. Remember to authenticate with: gh auth login"
  echo "6. Log out and back in for all keyboard hooks to apply cleanly."

  open -a "AeroSpace" || true
  open -a "Karabiner-Elements" || true
  open -a "Raycast" || true
  open -a "Ghostty" || true
  open -a "Tailscale" || true
}

# Must use a function to prevent brew installs from stealing stdin
install
