# Workflow Cheatsheet

## Daily Startup

```bash
tmux new -s myproject     # or: tmux a -t myproject
# Window 1: nvim .
# Ctrl+Space c -> Window 2: pnpm dev
# Ctrl+Space c -> Window 3: opencode or claude
```

## Cross-Tool Navigation

| Want to...          | Keys                                       |
| ------------------- | ------------------------------------------ |
| Switch tmux windows | `Ctrl+Space 1/2/3`                         |
| Split pane          | `Ctrl+Space -` or `Ctrl+Space \|`          |
| Navigate everywhere | `Ctrl+h/j/k/l`                             |
| Find file           | `Space Space` (nvim)                       |
| Grep project        | `Space /` (nvim)                           |
| Lazygit             | `Ctrl+Space g` (tmux) or `Space gg` (nvim) |

## Agent Workflows

```
Window 1: nvim        <-- Ctrl+Space 1
Window 2: dev server  <-- Ctrl+Space 2
Window 3: opencode    <-- Ctrl+Space 3
```

In nvim: `Space aa` (Avante ask), `Space ae` (Avante edit), `Space ac` (CodeCompanion chat)

## Dotfiles (chezmoi)

```bash
chezmoi edit ~/.zshrc   # Edit source, not target
chezmoi diff            # Preview changes
chezmoi apply           # Deploy to $HOME
chezmoi update          # Pull git + apply
chezmoi cd              # cd to source dir
```

## Syncing Machines

```bash
chezmoi cd
git add -A && git commit -m "update" && git push
# Other machine:
chezmoi update
```

## New Machine Setup

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply RemiGirard
```
