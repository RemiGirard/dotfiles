# Window Management Cheatsheet

## macOS (Rectangle)

> Config tracked in chezmoi (`run_once_configure-macos.sh.tmpl`).
> Spectacle-style shortcuts enabled. Repeated presses cycle: half → two-thirds → one-third.

| Action | Shortcut |
|--------|----------|
| Left Half | `⌃⌥←` |
| Right Half | `⌃⌥→` |
| Top Half | `⌃⌥↑` |
| Bottom Half | `⌃⌥↓` |
| Top-Left Quarter | `⌃⌥U` |
| Top-Right Quarter | `⌃⌥I` |
| Bottom-Left Quarter | `⌃⌥J` |
| Bottom-Right Quarter | `⌃⌥K` |
| Center | `⌃⌥C` |
| Maximize | `⌃⌥⏎` |
| Next Display | `⌃⌥⌘→` |
| Previous Display | `⌃⌥⌘←` |
| Toggle Todo | `⌘⌥B` |
| Reflow Todo | `⌘⌥N` |

## macOS Window Switching

| Action | Shortcut |
|--------|----------|
| Switch app | `⌘Tab` |
| Switch window (same app) | `⌥Tab` (remapped from ⌘\`) |

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
