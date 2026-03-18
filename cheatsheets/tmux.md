# Tmux Cheatsheet

> Prefix: `Ctrl+Space` (remapped from default Ctrl+b)
> Ghostty auto-starts tmux on launch (`tmux new-session -A -s main`)

## Sessions

| Key              | Action                          |
| ---------------- | ------------------------------- |
| `prefix s`       | Session picker (fuzzy)          |
| `prefix f`       | Sessionizer: fuzzy-find project |
| `prefix P`       | Project: create full dev layout |
| `prefix S`       | Create named session (prompt)   |
| `prefix K`       | Kill current session            |
| `prefix (` / `)` | Prev/next session               |
| `prefix d`       | Detach from tmux                |

## Windows (tabs)

| Key              | Action                   |
| ---------------- | ------------------------ |
| `prefix c`       | New window (current dir) |
| `prefix ,`       | Rename window            |
| `prefix n` / `p` | Next/prev window         |
| `prefix 0-9`     | Go to window N           |
| `prefix <` / `>` | Move window left/right   |
| `prefix w`       | Window picker            |
| `prefix &`       | Close window (confirm)   |

## Panes (splits)

| Key               | Action                        |
| ----------------- | ----------------------------- |
| `prefix -`        | Split below (current dir)     |
| `prefix \|`       | Split right (current dir)     |
| `Ctrl+h/j/k/l`   | Navigate (seamless with nvim) |
| `prefix H/J/K/L`  | Resize pane by 5              |
| `prefix m`        | Toggle maximize pane          |
| `prefix x`        | Close pane                    |
| `prefix Space`    | Cycle pane layouts            |

## Pane/Window Juggling

| Key        | Action                             |
| ---------- | ---------------------------------- |
| `prefix @` | Pull window into current as a pane |
| `prefix !` | Break pane into its own window     |

## Copy Mode (vi keys)

| Key        | Action              |
| ---------- | ------------------- |
| `prefix v` | Enter copy mode     |
| `v`        | Begin selection     |
| `C-v`      | Rectangle selection |
| `y`        | Copy and exit       |
| `/` / `?`  | Search fwd/back     |

## Quick Actions

| Key        | Action                     |
| ---------- | -------------------------- |
| `prefix r` | Reload config              |
| `prefix g` | Open lazygit in new window |

## Plugins

| Plugin             | What it does                                     |
| ------------------ | ------------------------------------------------ |
| tmux-sensible      | Better defaults                                  |
| tmux-yank          | System clipboard in copy mode                    |
| tmux-resurrect     | Save: `prefix Ctrl+s`, Restore: `prefix Ctrl+r` |
| tmux-continuum     | Auto-save every 30 min, auto-restore on start    |
| vim-tmux-navigator | `Ctrl+h/j/k/l` shared with nvim                 |
| vim-tpipeline      | Nvim statusline displayed in tmux status bar     |

## Tips

1. **Ghostty opens tmux automatically** -- no need to type `tmux`
2. **`prefix f`** is the fastest way to jump between projects
3. **`prefix s`** shows all sessions -- use it to switch contexts
4. **Sessions survive terminal close** -- just reopen Ghostty
5. **`prefix @`** to pull a window as a side pane, **`prefix !`** to break it back out
