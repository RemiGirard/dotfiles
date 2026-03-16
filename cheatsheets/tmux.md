# Tmux Cheatsheet

> Prefix: `Ctrl+Space` (remapped from default Ctrl+b)

## Sessions

| Key              | Action               |
| ---------------- | -------------------- |
| `tmux new -s X`  | New session named X  |
| `tmux a -t X`    | Attach to session X  |
| `prefix d`       | Detach               |
| `prefix S`       | Create named session |
| `prefix K`       | Kill session         |
| `prefix (` / `)` | Prev/next session    |
| `prefix s`       | Session picker       |

## Windows (tabs)

| Key              | Action                   |
| ---------------- | ------------------------ |
| `prefix c`       | New window (current dir) |
| `prefix ,`       | Rename window            |
| `prefix n` / `p` | Next/prev window         |
| `prefix 0-9`     | Go to window N           |
| `prefix <` / `>` | Move window left/right   |

## Panes (splits)

| Key               | Action                        |
| ----------------- | ----------------------------- |
| `prefix -`        | Split below                   |
| `prefix \|`       | Split right                   |
| `Ctrl+h/j/k/l`    | Navigate (works in nvim too!) |
| `prefix H/J/K/L`  | Resize                        |
| `prefix m`        | Toggle maximize               |
| `prefix x`        | Close pane                    |

## Copy Mode

| Key        | Action          |
| ---------- | --------------- |
| `prefix v` | Enter copy mode |
| `v`        | Start selection |
| `y`        | Copy            |
| `/` / `?`  | Search          |

## Quick Actions

| Key              | Action                   |
| ---------------- | ------------------------ |
| `prefix r`       | Reload config            |
| `prefix g`       | Open lazygit             |
| `prefix I`       | Install plugins (TPM)    |
| `prefix U`       | Update plugins           |
| `prefix Ctrl+s`  | Save session (resurrect) |
| `prefix Ctrl+r`  | Restore session          |

## Beginner Tips

1. Start: `tmux` -> `prefix c` (new window) -> `prefix -` (split)
2. Mental model: Sessions > Windows > Panes
3. Sessions persist: `prefix d` detach, `tmux a` reattach
