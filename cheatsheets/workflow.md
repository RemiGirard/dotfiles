# Workflow Cheatsheet

## Opening Terminal

Ghostty launches tmux automatically (session `main`). No manual `tmux` needed.

To start a project session instead:

```bash
ts                       # fuzzy-find a Git root/worktree from ~/Projects
tp ~/Projects/myapp      # prepare a named-window project layout
```

## Typical Dev Layout

```
Ctrl+Space f -> pick Git root/worktree -> tmux session created

tp -> named windows prepared in the project directory:
  Window 1 [editor]
  Window 2 [server]
  Window 3 [docker]  (when a Compose file exists)
  Window 4 [agent]
  Window 5 [term]
```

The windows are intentionally empty: start `nvim`, the development server,
Docker, or an agent only where needed. When creating a session,
`tp --port 3001` exports `PORT=3001` so commands started in its windows inherit
it. Reattaching does not rewrite environments in existing pane shells.

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

## Node Versions

`fnm` keeps Node 22 as the machine default. Repositories can opt into another
installed version with their `.nvmrc` or `.node-version`:

```bash
fnm use          # select the version requested by the current repository
fnm install      # install that requested version when it is missing
fnm default 22   # restore the machine default
```

## Dotfiles (chezmoi)

```bash
cze ~/.zshrc     # chezmoi edit
czd              # chezmoi diff
cza              # chezmoi apply
czu              # chezmoi update (git pull + apply)
czcheck          # validate source, templates, and live status
dotfiles-check --full  # include Neovim startup validation
```

## Syncing Machines

```bash
chezmoi update    # pulls from git and applies -- that's it
```

## New Machine Setup

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply RemiGirard
```
