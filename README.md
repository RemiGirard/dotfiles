# Dotfiles - Remi Girard

Cross-platform (Ubuntu + macOS) dev environment managed with [chezmoi](https://www.chezmoi.io/).

## One-Liner Setup

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply RemiGirard
```

This will: install chezmoi, clone this repo, prompt for machine-specific settings, install all packages, and deploy all configs.

## After Install

1. Restart terminal (or `exec zsh`)
2. In tmux: `Ctrl+Space I` to install tmux plugins
3. Open `nvim` -- plugins auto-install on first launch

## What's Inside

| Tool     | Config                      | Purpose                                 |
| -------- | --------------------------- | --------------------------------------- |
| Ghostty  | `dot_config/ghostty/config` | Terminal (catppuccin, JetBrainsMono)    |
| Zsh      | `dot_zshrc`                 | Shell (zinit, autosuggestions, fzf-tab) |
| Starship | `dot_config/starship.toml`  | Prompt                                  |
| Tmux     | `dot_tmux.conf`             | Multiplexer (Ctrl+Space, vim nav, TPM)  |
| Neovim   | `dot_config/nvim/`          | Editor (LazyVim, TS/Rust/Docker)        |
| Git      | `dot_gitconfig.tmpl`        | Templated per-machine                   |

## Chezmoi Key Concepts

| Source prefix   | Meaning                             |
| --------------- | ----------------------------------- |
| `dot_`          | Becomes `.` in target               |
| `.tmpl`         | Go template (machine-specific)      |
| `run_onchange_` | Script re-runs when content changes |
| `run_once_`     | Script runs once per machine        |

```bash
chezmoi edit ~/.zshrc    # Edit source file
chezmoi diff             # Preview changes
chezmoi apply            # Deploy
chezmoi update           # git pull + apply
chezmoi cd               # cd to source dir
```

## Cross-Platform

- `dot_gitconfig.tmpl` uses chezmoi data for email/name/signingkey per machine
- `run_onchange_install-packages.sh.tmpl` uses apt on Linux, brew on macOS
- `.chezmoiexternal.toml` auto-clones TPM and lazy.nvim
- Zsh config auto-detects available tools (eza vs exa, etc.)

## Keyboard

[ZSA Voyager](https://www.zsa.io/voyager) with custom layout.

- Layout: [Oryx configurator](https://configure.zsa.io/voyager/layouts/JmOPQ)
- Firmware: `keyboard/zsa_voyager_JmOPQ_40vmR4_default-esc.bin`
- Flash tool: [Keymapp](https://www.zsa.io/flash) (download, open, drag the `.bin` file onto it)

## Cheatsheets

- [tmux](cheatsheets/tmux.md) -- Prefix `Ctrl+Space`, splits, sessions
- [nvim](cheatsheets/nvim.md) -- Leader `Space`, LSP, AI agents
- [workflow](cheatsheets/workflow.md) -- How everything connects
