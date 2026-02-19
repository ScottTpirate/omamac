# Omamac

Omamac is a keyboard-centric macOS setup inspired by [Omarchy](https://omarchy.org/). It keeps the same terminal-first philosophy and Omadots shell foundation, but uses a native macOS stack:

- `AeroSpace` for tiling/workspaces
- `Karabiner-Elements` for key translation (Super-like behavior on Mac keyboards)
- `Raycast` for launcher/workflow actions
- `Alacritty` + `tmux` for terminal workflow

## Install

```bash
git clone https://github.com/omacom-io/omamac.git
cd omamac
./install.sh
```

`install.sh` honors:

- `OMAMAC_REPO` to install from a fork
- `OMADOTS_REF` to pin/change the Omadots revision

```bash
OMAMAC_REPO="https://github.com/<you>/omamac.git" ./install.sh
```

## What it sets up

- **Window Management**: AeroSpace, Karabiner-Elements, Raycast
- **Terminal**: Alacritty, Tmux
- **Shell**: Starship prompt, fzf, eza, zoxide
- **Editors**: nvim, opencode, claude-code
- **Dev tools**: mise (Ruby, Node.js), Docker, lazygit, lazydocker
- **Apps**: 1Password, Obsidian, Google Chrome, Dropbox, Spotify, Signal, WhatsApp
- **Networking**: Tailscale
- **Git**: Helpful aliases and config

## Super key model (Omarchy-like)

The bundled Karabiner profile swaps **Left Command** and **Left Option**. With that enabled:

- physical `Cmd` behaves like Omarchy `Super`
- physical `Option` behaves like macOS `Cmd`

If you disable that swap, use `Option` for AeroSpace bindings instead of `Cmd`.

## Hotkeys

### Window + Workspace (AeroSpace)

| Hotkey | Action |
|--------|--------|
| `Cmd + Arrow` | Focus window by direction |
| `Cmd + Shift + Arrow` | Swap with window by direction |
| `Cmd + W` | Close window |
| `Cmd + T` | Toggle floating/tiling |
| `Cmd + O` | Minimize focused window |
| `Cmd + F` | Fullscreen |
| `Cmd + Tab` | Next workspace |
| `Cmd + Shift + Tab` | Previous workspace |
| `Cmd + Ctrl + Tab` | Back-and-forth workspace |
| `Cmd + 1..0` | Jump to workspace |
| `Cmd + Shift + 1..0` | Move window to workspace |
| `Cmd + Ctrl + 1..0` | Move window to workspace and follow |
| `Cmd + S` | Focus scratchpad workspace |
| `Cmd + Option + S` | Move window to scratchpad workspace |
| `Cmd + = / -` | Resize width |
| `Cmd + Shift + = / -` | Resize height |
| `Cmd + Ctrl + H / L` | Focus monitor left/right |
| `Cmd + Ctrl + Shift + H / L` | Move window to monitor left/right |
| `Cmd + Shift + Option + ← / →` | Move workspace to monitor |

### App launching (AeroSpace)

| Hotkey | Action |
|--------|--------|
| `Cmd + Space` | Raycast launcher |
| `Cmd + Option + Space` | Raycast control menu surrogate |
| `Cmd + Enter` | Alacritty |
| `Cmd + Shift + B` | Google Chrome |
| `Cmd + Shift + Option + B` | Chrome incognito |
| `Cmd + Shift + F` | Finder |
| `Cmd + Shift + N` | Alacritty + Neovim |
| `Cmd + Shift + D` | Alacritty + LazyDocker |
| `Cmd + Shift + A` | ChatGPT |
| `Cmd + Shift + O` | Obsidian |
| `Cmd + Shift + M` | Spotify |
| `Cmd + Shift + /` | 1Password |
| `Cmd + Shift + G` | Signal |
| `Cmd + Shift + Option + G` | WhatsApp |

### System + capture (macOS approximations)

| Hotkey | Action |
|--------|--------|
| `Cmd + Esc` | Lock screen/pause session |
| `Cmd + Option + L` | Lock screen |
| `Cmd + Ctrl + A` | Audio MIDI Setup |
| `Cmd + Ctrl + B` | Bluetooth settings |
| `Cmd + Ctrl + W` | Wi-Fi settings |
| `Cmd + Ctrl + S` | LocalSend |
| `Cmd + Ctrl + T` | Activity Monitor |
| `Cmd + Option + Shift + 4` | Interactive screenshot to clipboard |
| `Cmd + Option + Shift + 5` | Screenshot app |
| `Cmd + Option + Shift + 6` | QuickTime Player |
| `Cmd + Option + Shift + 7` | Digital Color Meter |
| `Cmd + Ctrl + V` | Raycast clipboard history |

### Clipboard compatibility (Karabiner)

| Hotkey | Action |
|--------|--------|
| `Ctrl + C/V/X/Z/A` | Remapped to `Cmd + C/V/X/Z/A` |
| `Ctrl + Shift + Z` | Remapped to `Cmd + Shift + Z` |
| `Right Cmd + <key>` | Bypass remapping for edge cases |

### Terminal (Tmux)

You launch tmux with `t` in a new terminal.

**Prefix key:** `Ctrl + Space` (secondary: `Ctrl + b`)

| Hotkey | Action |
|--------|--------|
| `Ctrl + Cmd + PageUp` | Split horizontally |
| `Ctrl + Cmd + PageDown` | Split vertically |
| `Ctrl + Cmd + End` | Kill pane |
| `Ctrl + Cmd + Arrow` | Focus pane by direction |
| `Ctrl + Cmd + Shift + Arrow` | Resize pane by direction |
| `Ctrl + Shift + Home` | New window |
| `Ctrl + Shift + End` | Kill window |
| `Ctrl + Shift + PageUp/Down` | Next/previous window |
| `Ctrl + Cmd + Shift + Home` | New session |
| `Ctrl + Cmd + Shift + End` | Kill session |
| `Ctrl + Space q` | Reload tmux config |

## Tmux config path

Omadots installs tmux config to `~/.config/tmux/tmux.conf`. Modern tmux reads this location natively, so no `~/.tmux.conf` symlink is required.

## Post-install checklist

1. Open `Karabiner-Elements` and confirm `Default profile` is selected.
2. Grant Accessibility permissions for `AeroSpace` and `Karabiner-Elements`.
3. Confirm conflicting macOS shortcuts are disabled (Spotlight, Mission Control, Desktop switching).
4. Optionally import `~/.config/raycast/Raycast.rayconfig` (password: `12345678`).
5. Log out and back in once.
