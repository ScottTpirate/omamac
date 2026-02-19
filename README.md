# Omamac

Omamac is a keyboard-centric macOS setup inspired by [Omarchy](https://omarchy.org/). It keeps the same terminal-first philosophy and Omadots shell foundation, but uses a native macOS stack:

- `AeroSpace` for tiling/workspaces
- `Karabiner-Elements` for key translation (Super-like behavior on Mac keyboards)
- `Raycast` for launcher/workflow actions

## Install

```bash
git clone https://github.com/omacom-io/omamac.git
cd omamac
./install.sh
```

`install.sh` honors `OMAMAC_REPO` if you want to point at your own fork:

```bash
OMAMAC_REPO="https://github.com/<you>/omamac.git" ./install.sh
```

## What it sets up

- **Window Management**: AeroSpace, Karabiner-Elements, Raycast
- **Terminal**: Ghostty, Tmux
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
| `Cmd + F` | Fullscreen |
| `Cmd + Tab` | Next workspace |
| `Cmd + Shift + Tab` | Previous workspace |
| `Cmd + Ctrl + Tab` | Back-and-forth workspace |
| `Cmd + 1..0` | Jump to workspace |
| `Cmd + Shift + 1..0` | Move window to workspace |
| `Cmd + Ctrl + 1..0` | Move window to workspace and follow |
| `Cmd + = / -` | Resize width |
| `Cmd + Shift + = / -` | Resize height |
| `Cmd + Ctrl + H / L` | Focus monitor left/right |
| `Cmd + Ctrl + Shift + H / L` | Move window to monitor left/right |

### App launching (AeroSpace)

| Hotkey | Action |
|--------|--------|
| `Cmd + Space` | Raycast |
| `Cmd + Enter` | Ghostty |
| `Cmd + Shift + B` | Google Chrome |
| `Cmd + Shift + F` | Finder |
| `Cmd + Shift + N` | Ghostty + Neovim |
| `Cmd + Shift + D` | Ghostty + LazyDocker |
| `Cmd + Shift + A` | ChatGPT |
| `Cmd + Shift + O` | Obsidian |
| `Cmd + Shift + M` | Spotify |
| `Cmd + Shift + /` | 1Password |
| `Cmd + Shift + G` | Signal |
| `Cmd + Shift + Option + G` | WhatsApp |

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

## Post-install checklist

1. Open `Karabiner-Elements` and confirm `Default profile` is selected.
2. Grant Accessibility permissions for `AeroSpace` and `Karabiner-Elements`.
3. Disable conflicting macOS shortcuts (Spotlight, Mission Control, Desktop switching).
4. Optionally import `~/.config/raycast/Raycast.rayconfig` (password: `12345678`).
5. Log out and back in once.
