# Window Management Cheatsheet

## macOS (Rectangle)

> Config tracked in chezmoi (`run_onchange_30-configure-macos.sh.tmpl`).
> Repeated presses cycle: half -> two-thirds -> one-third.

| Action | Shortcut |
|--------|----------|
| Left Half | `⌃⌥H` |
| Bottom Half | `⌃⌥J` |
| Top Half | `⌃⌥K` |
| Right Half | `⌃⌥L` |
| Top-Left Quarter | `⌃⌥U` |
| Top-Right Quarter | `⌃⌥O` |
| Bottom-Left Quarter | `⌃⌥M` |
| Bottom-Right Quarter | `⌃⌥.` |
| Center | `⌃⌥C` |
| Maximize | `⌃⌥F` |
| Center Third | `⌃⌥⇧T` |
| Center Half | `⌃⌥⇧C` |
| Almost Maximize | `⌃⌥⇧F` |
| Next Display | `⌃⌥I` |
| Previous Display | `⌃⌥,` |
| Toggle Todo | `⌃⌥B` |
| Reflow Todo | `⌃⌥N` |

## macOS Window Switching

| Action | Shortcut |
|--------|----------|
| Switch app | `⌘Tab` |
| Switch window (same app) | `⌥Tab` (remapped from ⌘\`) |

## Screenshots (macOS + Ubuntu)

| Action | macOS | Ubuntu |
|--------|-------|--------|
| Select area and copy to clipboard | `⌃⌥S` | `Ctrl+Alt+S` |
| Capture full screen and copy to clipboard | `⌃⌥⇧S` | `Ctrl+Alt+Shift+S` |

Paste directly with `⌘V` on macOS or `Ctrl+V` on Ubuntu.

## Focus Guard (Hammerspoon)

Prevents apps from stealing focus (e.g. browser opening from dev server, Playwright).

| Action | Shortcut |
|--------|----------|
| Toggle focus guard | `⌘⌥F` |

> Config: `~/.hammerspoon/init.lua`. Requires Accessibility permission in System Settings.
> Focus guard is ON by default. Shows a notification when an app tries to steal focus.

## Ubuntu (gTile / GNOME)

gTile requires installation: `gnome-extensions install gTile@shuairan.github.io`

| Action | Shortcut |
|--------|----------|
| Left Half | `Super+←` |
| Right Half | `Super+→` |
| Top Half | `Super+↑` |
| Bottom Half | `Super+↓` |
| Top-Left Quarter | `Super+Alt+7` |
| Top-Right Quarter | `Super+Alt+9` |
| Bottom-Left Quarter | `Super+Alt+1` |
| Bottom-Right Quarter | `Super+Alt+3` |
| Center | `Super+Alt+C` |
| Maximize | `Super+↑` (when maximized) |
| Fullscreen | `Super+Alt+F` |
| Resize Mode | `Super+Enter` |

> Note: gTile shortcuts are configurable in GNOME Settings → Extensions → gTile

## Ubuntu Focus Guard

```bash
focus-guard start    # Start the daemon
focus-guard stop     # Stop it
focus-guard status   # Check if running
```

> Requires: `sudo apt install xdotool xprintidle`
> Script: `~/.local/bin/focus-guard`
