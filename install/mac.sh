# Dark mode
osascript -e 'tell application "System Events" to tell appearance preferences to set dark mode to true'

# Configure the dock
defaults write com.apple.dock orientation -string "right"
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock tilesize -int 43

# Normal (non-natural) scroll direction
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Disable click desktop to reveal it
defaults write com.apple.WindowManager EnableStandardClickToShowDesktop -bool false

# 24-hour clock
defaults write NSGlobalDomain AppleICUForce24HourTime -bool true

# Keyboard repeat speed
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Disable conflicting global keyboard shortcuts (Spotlight, Mission Control, Show Desktop, Desktop switching)
SYMHOTKEYS_PLIST="$HOME/Library/Preferences/com.apple.symbolichotkeys.plist"

disable_symbolic_hotkey() {
  local hotkey_id="$1"
  /usr/libexec/PlistBuddy -c "Delete :AppleSymbolicHotKeys:${hotkey_id}" "$SYMHOTKEYS_PLIST" >/dev/null 2>&1 || true
  /usr/libexec/PlistBuddy -c "Add :AppleSymbolicHotKeys:${hotkey_id} dict" "$SYMHOTKEYS_PLIST" >/dev/null 2>&1 || true
  /usr/libexec/PlistBuddy -c "Add :AppleSymbolicHotKeys:${hotkey_id}:enabled bool false" "$SYMHOTKEYS_PLIST" >/dev/null 2>&1 \
    || /usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:${hotkey_id}:enabled false" "$SYMHOTKEYS_PLIST" >/dev/null 2>&1
}

defaults read com.apple.symbolichotkeys AppleSymbolicHotKeys >/dev/null 2>&1 \
  || defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict

# Spotlight
disable_symbolic_hotkey 64
disable_symbolic_hotkey 65
# Mission Control / App windows / Show Desktop
disable_symbolic_hotkey 32
disable_symbolic_hotkey 33
disable_symbolic_hotkey 34
disable_symbolic_hotkey 35
disable_symbolic_hotkey 36
disable_symbolic_hotkey 37
disable_symbolic_hotkey 79
disable_symbolic_hotkey 80
disable_symbolic_hotkey 81
disable_symbolic_hotkey 82
# Switch to Desktop 1..9
disable_symbolic_hotkey 118
disable_symbolic_hotkey 119
disable_symbolic_hotkey 120
disable_symbolic_hotkey 121
disable_symbolic_hotkey 122
disable_symbolic_hotkey 123
disable_symbolic_hotkey 124
disable_symbolic_hotkey 125
disable_symbolic_hotkey 126

# Restart dock and menu bar to apply changes
killall Dock
killall ControlCenter
killall SystemUIServer
