# Workflow Cheatsheet

## Opening Terminal

Ghostty launches tmux automatically (session `main`). No manual `tmux` needed.

To start a project session instead:

```bash
ts                       # fuzzy-find a project from ~/Projects
tp ~/Projects/myapp      # create full dev layout
```

## Typical Dev Layout

```
Ctrl+Space f -> pick project -> tmux session created:
  Window 1 [editor]:  nvim
  Window 2 [server]:  pnpm dev
  Window 3 [docker]:  docker compose logs (if compose file exists)
  Window 4 [agent]:   opencode / claude
  Window 5 [term]:    general terminal
```

Switch windows: `Ctrl+Space 1-5`

## Cross-Tool Navigation

| Want to...           | Keys                                        |
| -------------------- | ------------------------------------------- |
| Switch tmux windows  | `Ctrl+Space 1/2/3`                          |
| Split pane           | `Ctrl+Space -` or `Ctrl+Space \|`           |
| Navigate everywhere  | `Ctrl+h/j/k/l`                              |
| Pull window as pane  | `Ctrl+Space @` (enter window number)        |
| Break pane to window | `Ctrl+Space !`                              |
| Find file            | `Space Space` (nvim)                        |
| Grep project         | `Space /` (nvim)                            |
| Jump to project      | `Ctrl+Space f` (tmux) or `ts` (shell)       |
| Switch session       | `Ctrl+Space s` (session picker)             |

## Agent Workflows

### OpenCode (terminal agent)

Run in tmux window 4 (agent). Configured with MCP servers (playwright, context7, grep-app).

```bash
oc    # alias for opencode
```

### Claude Code (terminal agent)

```bash
cc    # alias for claude
```

### Avante (inside nvim)

```
Select code -> Space aa  (ask AI)
Select code -> Space ae  (AI edit)
Space at                 (toggle panel)
```

### CodeCompanion (inside nvim)

```
Space ac    (chat)
Space ai    (actions: explain, fix, review)
```

## Git Workflow

| Method   | How                                              |
| -------- | ------------------------------------------------ |
| Shell    | `gs`, `ga .`, `gc -m "msg"`, `gp`               |
| Lazygit  | `lg` (shell), `Ctrl+Space g` (tmux), `Space gg` |
| Neogit   | `Space gn` (full git UI inside nvim)             |
| Diffview | `Space gd` (diff), `Space gh` (file history)    |

## Port Management

| Command         | Action                    |
| --------------- | ------------------------- |
| `ports`         | Show all listening ports  |
| `port 3000`     | Show what's on port 3000  |
| `killport 3000` | Kill process on port 3000 |

## Dotfiles (chezmoi)

```bash
cze ~/.zshrc     # chezmoi edit
czd              # chezmoi diff
cza              # chezmoi apply
czu              # chezmoi update (git pull + apply)
```

## Syncing Machines

```bash
chezmoi update    # pulls from git and applies -- that's it
```

## New Machine Setup

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply RemiGirard
```
