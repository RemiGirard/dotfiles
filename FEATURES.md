# Features Reference

Exhaustive list of everything installed, configured, and customized in this dotfiles setup.

Each section lists the **config file** responsible, every setting, plugin, keybinding, and alias.

---

## Table of Contents

- [1. Chezmoi (Dotfile Manager)](#1-chezmoi-dotfile-manager)
- [2. Ghostty (Terminal Emulator)](#2-ghostty-terminal-emulator)
- [3. Tmux (Terminal Multiplexer)](#3-tmux-terminal-multiplexer)
- [4. Zsh (Shell)](#4-zsh-shell)
- [5. Starship (Prompt)](#5-starship-prompt)
- [6. Git](#6-git)
- [7. Neovim (Editor)](#7-neovim-editor)
- [8. CLI Tools](#8-cli-tools)
- [9. Cross-Cutting Concerns](#9-cross-cutting-concerns)

---

## 1. Chezmoi (Dotfile Manager)

**Config files:**
- `.chezmoi.toml.tmpl` -- prompts for email, name, signing key on first init; sets `sourceDir` to `~/dotfiles`
- `.chezmoidata/packages.yaml` -- declarative package list for Linux and macOS
- `.chezmoiexternal.toml` -- external git repos auto-cloned by chezmoi
- `.chezmoiignore` -- files in source that should NOT be deployed to `$HOME`
- `run_onchange_install-packages.sh.tmpl` -- re-runs when `packages.yaml` changes (sha256 hash)
- `run_once_install-zinit.sh` -- runs once per machine to install zinit

### External Dependencies (auto-cloned)

| Target Path | Source | Refresh |
| --- | --- | --- |
| `~/.tmux/plugins/tpm` | `tmux-plugins/tpm` | Every 168h (1 week) |
| `~/.local/share/nvim/lazy/lazy.nvim` | `folke/lazy.nvim` (stable branch) | Every 168h (1 week) |

### Ignored (not deployed to $HOME)

- `README.md`
- `FEATURES.md`
- `cheatsheets/`
- `keyboard/`

---

## 2. Ghostty (Terminal Emulator)

**Config file:** `dot_config/ghostty/config` -> `~/.config/ghostty/config`

### Font

| Setting | Value |
| --- | --- |
| font-family | JetBrainsMono Nerd Font |
| font-size | 14 |
| font-thicken | true |
| adjust-cell-height | 20% |

### Theme

| Setting | Value |
| --- | --- |
| theme | catppuccin-mocha |
| background-opacity | 0.95 |
| background-blur-radius | 20 |
| minimum-contrast | 1.1 |

### Window

| Setting | Value |
| --- | --- |
| window-padding-x | 8 |
| window-padding-y | 4 |
| window-decoration | auto |
| window-theme | ghostty |
| maximize | true |
| confirm-close-surface | false |
| quit-after-last-window-closed | true |

### Cursor & Input

| Setting | Value |
| --- | --- |
| cursor-style | bar |
| cursor-style-blink | true |
| mouse-hide-while-typing | true |
| copy-on-select | clipboard |
| clipboard-paste-protection | false |

### Shell & Integration

| Setting                       | Value               |
| ----------------------------- | ------------------- |
| command                       | /usr/bin/zsh        |
| shell-integration             | zsh                 |
| shell-integration-features    | cursor, sudo, title |

### Keybindings

| Binding | Action |
| --- | --- |
| `Super+T` | New tab |
| `Super+W` | Close surface |
| `Super+Shift+[` | Previous tab |
| `Super+Shift+]` | Next tab |
| `Super+=` | Increase font size |
| `Super+-` | Decrease font size |
| `Super+0` | Reset font size |

---

## 3. Tmux (Terminal Multiplexer)

**Config file:** `dot_tmux.conf` -> `~/.tmux.conf`

### General Settings

| Setting | Value | Why |
| --- | --- | --- |
| default-terminal | `tmux-256color` | True color support |
| terminal-overrides | `xterm-256color:RGB` + undercurl | Colors + wavy underlines for diagnostics |
| mouse | on | Scroll, click, resize with mouse |
| history-limit | 50000 | Large scrollback buffer |
| base-index | 1 | Windows start at 1 (not 0) |
| pane-base-index | 1 | Panes start at 1 |
| renumber-windows | on | No gaps when closing windows |
| set-clipboard | on | System clipboard support |
| escape-time | 0 | No delay after Esc (critical for nvim) |
| focus-events | on | Nvim auto-reload on focus |
| status-interval | 5 | Refresh status bar every 5s |
| detach-on-destroy | off | Switch to other session instead of detaching |
| mode-keys | vi | Vi keys in copy mode |

### Prefix

`Ctrl+Space` (remapped from default `Ctrl+b`). `Ctrl+Space Ctrl+Space` sends literal Ctrl+Space.

### Custom Keybindings

All bindings below are prefixed with `Ctrl+Space` unless noted.

#### Window Management

| Key | Action |
| --- | --- |
| `c` | New window (inherits current directory) |
| `-` | Split pane below (inherits current directory) |
| `\|` | Split pane right (inherits current directory) |
| `<` | Move window left (repeatable) |
| `>` | Move window right (repeatable) |

#### Pane Navigation

| Key | Action |
| --- | --- |
| `h` | Select pane left |
| `j` | Select pane down |
| `k` | Select pane up |
| `l` | Select pane right |

#### Pane Resizing

| Key | Action |
| --- | --- |
| `H` | Resize left by 5 (repeatable) |
| `J` | Resize down by 5 (repeatable) |
| `K` | Resize up by 5 (repeatable) |
| `L` | Resize right by 5 (repeatable) |
| `m` | Toggle maximize current pane (repeatable) |

#### Copy Mode

| Key | Action |
| --- | --- |
| `v` | Enter copy mode |
| `v` (in copy mode) | Begin selection |
| `C-v` (in copy mode) | Toggle rectangle selection |
| `y` (in copy mode) | Copy selection and exit copy mode |

#### Quick Actions

| Key | Action |
| --- | --- |
| `r` | Reload tmux config (displays confirmation) |
| `S` | Prompt to create/attach a named session |
| `K` | Kill current session (with confirmation) |
| `g` | Open lazygit in a new window |
| `(` | Switch to previous session (repeatable) |
| `)` | Switch to next session (repeatable) |

### Theme: Catppuccin Mocha (hand-coded)

| Element | Color |
| --- | --- |
| Status bar background | `#1e1e2e` (base) |
| Status bar foreground | `#cdd6f4` (text) |
| Status left | `#89b4fa` (blue) bg -- session name with ` ` icon |
| Status right | `#45475a` (surface) hostname + `#a6e3a1` (green) clock |
| Inactive window tab | `#45475a` (surface) bg |
| Active window tab | `#f9e2af` (yellow) bg, bold |
| Pane border | `#45475a` (surface) |
| Active pane border | `#89b4fa` (blue) |
| Message | `#f9e2af` (yellow) bg, dark fg, bold |

### Plugins (via TPM)

| Plugin | Purpose |
| --- | --- |
| `tmux-plugins/tpm` | Plugin manager itself |
| `tmux-plugins/tmux-sensible` | Sensible default settings |
| `tmux-plugins/tmux-yank` | Copy to system clipboard in copy mode |
| `tmux-plugins/tmux-resurrect` | Save/restore sessions across tmux restarts |
| `tmux-plugins/tmux-continuum` | Auto-save sessions every 10 min; auto-restore on tmux start |
| `christoomey/vim-tmux-navigator` | `Ctrl+h/j/k/l` navigation shared with nvim |

### Plugin Settings

| Setting | Value |
| --- | --- |
| resurrect-capture-pane-contents | on |
| continuum-restore | on |
| continuum-save-interval | 10 (minutes) |

---

## 4. Zsh (Shell)

**Config file:** `dot_zshrc` -> `~/.zshrc`

### Plugin Manager: Zinit

Installed by `run_once_install-zinit.sh` from `zdharma-continuum/zinit`.

| Plugin | What it does |
| --- | --- |
| `zsh-users/zsh-syntax-highlighting` | Colors commands as you type (green = valid, red = error) |
| `zsh-users/zsh-autosuggestions` | Ghost text suggestions (strategy: history then completion fallback). Right arrow to accept |
| `zsh-users/zsh-completions` | Additional completion definitions for common tools |
| `Aloxaf/fzf-tab` | Replaces default tab-completion menu with fzf fuzzy search |

### Plugin Load Order (critical)

1. `zsh-completions` -- adds completion definitions to fpath
2. `compinit` -- initializes the completion system
3. `fzf-tab` -- replaces completion menu with fzf (must be after compinit)
4. `zsh-syntax-highlighting` + `zsh-autosuggestions` -- any order

### Completion Settings

| Setting | Effect |
| --- | --- |
| Case-insensitive matching | `m:{a-z}={A-Za-z}` |
| Colored completions | Uses `LS_COLORS` |
| No default menu | Disabled (fzf-tab replaces it) |
| cd preview | Shows directory contents in fzf when completing `cd` |
| zoxide preview | Shows directory contents when completing `z` |

### History

| Setting | Value |
| --- | --- |
| HISTSIZE | 10000 |
| HISTFILE | `~/.zsh_history` |
| SAVEHIST | 10000 |
| Dedup | Erase all duplicates |
| Shared | Shared across all sessions |
| Private | Commands starting with space are not saved |

### Key Bindings

| Binding | Action |
| --- | --- |
| Mode | Emacs (`bindkey -e`) -- Ctrl+A/E etc. work |
| `Ctrl+P` | History search backward |
| `Ctrl+N` | History search forward |
| `Up arrow` | History search backward (filtered) |
| `Down arrow` | History search forward (filtered) |

### Environment Variables

| Variable | Value |
| --- | --- |
| `EDITOR` | nvim |
| `VISUAL` | nvim |
| `LANG` | en_US.UTF-8 |
| `XDG_CONFIG_HOME` | `$HOME/.config` |
| `XDG_DATA_HOME` | `$HOME/.local/share` |
| `XDG_CACHE_HOME` | `$HOME/.cache` |
| `NVM_DIR` | `$HOME/.nvm` |
| `BUN_INSTALL` | `$HOME/.bun` |
| `PNPM_HOME` | `$HOME/.local/share/pnpm` |

### PATH Additions

- `$HOME/.local/bin`
- `$HOME/.cargo/bin`
- `$HOME/.bun/bin`
- `$BUN_INSTALL/bin`
- `$PNPM_HOME`

All deduplicated via `typeset -U path`.

### All Aliases

#### Navigation

| Alias | Command |
| --- | --- |
| `..` | `cd ..` |
| `...` | `cd ../..` |
| `....` | `cd ../../..` |

#### File Listing (eza, fallback to exa)

| Alias | Command |
| --- | --- |
| `ls` | `eza --icons=always` |
| `ll` | `eza -la --icons=always --git` |
| `lt` | `eza -la --icons=always --tree --level=2` |
| `l` | `eza -la --icons=always` |

#### Git

| Alias | Command |
| --- | --- |
| `g` | `git` |
| `gs` | `git status -sb` |
| `ga` | `git add` |
| `gc` | `git commit` |
| `gp` | `git push` |
| `gl` | `git log --oneline --graph --all -20` |
| `gd` | `git diff` |
| `gco` | `git checkout` |
| `gcb` | `git checkout -b` |
| `gpl` | `git pull --rebase` |
| `lg` | `lazygit` |

#### Docker

| Alias | Command |
| --- | --- |
| `dc` | `docker compose` |
| `dcu` | `docker compose up -d` |
| `dcd` | `docker compose down` |
| `dcl` | `docker compose logs -f` |
| `dps` | `docker ps --format 'table {{.Names}}\t{{.Status}}\t{{.Ports}}'` |

#### Dev Tools

| Alias | Command |
| --- | --- |
| `r` | `pnpm run` |
| `v` | `nvim` |
| `vim` | `nvim` |
| `oc` | `opencode` |
| `cc` | `claude` |

#### Config Editing (via chezmoi)

| Alias | Command |
| --- | --- |
| `zshrc` | `chezmoi edit ~/.zshrc` |
| `tmuxrc` | `chezmoi edit ~/.tmux.conf` |
| `vimrc` | `chezmoi edit ~/.config/nvim/init.lua` |

#### Chezmoi

| Alias | Command |
| --- | --- |
| `cz` | `chezmoi` |
| `cza` | `chezmoi apply` |
| `cze` | `chezmoi edit` |
| `czd` | `chezmoi diff` |
| `czu` | `chezmoi update` |

#### Zoxide

| Alias | Command |
| --- | --- |
| `cd` | `z` (zoxide replaces built-in cd) |

### FZF Integration

| Setting | Value |
| --- | --- |
| Theme | Catppuccin Mocha (full color mapping) |
| Default command | `fd --type f --hidden --follow --exclude .git` |
| `Ctrl+T` command | Same as default (find files) |
| `Ctrl+R` | Fuzzy history search (via fzf key-bindings.zsh) |
| Layout | Border, reverse, 40% height |

### NVM (Lazy-loaded)

Functions `nvm`, `node`, `npm`, `npx` are stub wrappers. On first call, they unset themselves, source `$NVM_DIR/nvm.sh`, then run the real command. This avoids 200-400ms shell startup penalty.

### Starship Prompt

Loaded last via `eval "$(starship init zsh)"`.

---

## 5. Starship (Prompt)

**Config file:** `dot_config/starship.toml` -> `~/.config/starship.toml`

### Left Prompt Format

```
directory git_branch git_status nodejs rust docker_context cmd_duration
> (or < in vim mode)
```

### Right Prompt

```
HH:MM (dimmed)
```

### Module Configuration

| Module | Symbol | Style | Details |
| --- | --- | --- | --- |
| **character** | `>` success / `>` error / `<` vim | bold green / bold red / bold blue | Changes color on command failure |
| **directory** | -- | bold blue | Truncates to 3 segments, `.../` separator |
| **git_branch** | ` ` | bold purple | Shows remote branch if different |
| **git_status** | -- | bold red | `?` untracked, `!` modified, `+` staged, `x` deleted, `up/down` ahead/behind, `div` diverged |
| **nodejs** | `node ` | bold green | Detects `package.json`, `.node-version` |
| **rust** | `rs ` | bold red | Detects Cargo.toml |
| **docker_context** | `docker ` | blue bold | Only shows when docker files present |
| **cmd_duration** | -- | bold yellow | Shows when command takes > 3 seconds |
| **time** | -- | dimmed white | Always visible, `HH:MM` format |

---

## 6. Git

**Config file:** `dot_gitconfig.tmpl` -> `~/.gitconfig` (templated per-machine)

### Templated Values (set per machine via chezmoi)

| Field | Source |
| --- | --- |
| `user.email` | `{{ .email }}` from `.chezmoi.toml` |
| `user.name` | `{{ .name }}` from `.chezmoi.toml` |
| `user.signingkey` | `{{ .signingkey }}` (conditional, only if set) |

### Signing (conditional on signingkey being set)

| Setting          | Value | Why                            |
| ---------------- | ----- | ------------------------------ |
| `commit.gpgsign` | true  | Auto-sign all commits          |
| `tag.gpgsign`    | true  | Auto-sign all tags             |

### Core Settings

| Setting | Value | Why |
| --- | --- | --- |
| `gpg.format` | ssh | Sign commits with SSH key |
| `init.defaultBranch` | main | New repos use `main` |
| `core.autocrlf` | input | Normalize line endings on commit |
| `core.editor` | nvim | Git opens nvim for commit messages |
| `core.pager` | delta | All diffs use delta |
| `pull.rebase` | true | Pull with rebase (no merge commits) |
| `push.autoSetupRemote` | true | Auto-set upstream on first push |
| `push.default` | current | Push current branch only |
| `fetch.prune` | true | Auto-clean deleted remote branches |
| `rebase.autoStash` | true | Auto-stash before rebase |

### Delta (Diff Viewer)

| Setting | Value |
| --- | --- |
| navigate | true (use `n`/`N` to jump between files) |
| side-by-side | true |
| line-numbers | true |
| syntax-theme | Catppuccin Mocha |
| interactive.diffFilter | `delta --color-only` |

### Merge & Diff Tools

| Setting | Value |
| --- | --- |
| merge.conflictstyle | diff3 (shows base + both sides) |
| merge.tool | nvim |
| mergetool cmd | `nvim -d $LOCAL $REMOTE $MERGED -c 'wincmd J'` |
| diff.tool | nvim |
| difftool cmd | `nvim -d $LOCAL $REMOTE` |
| diff.colorMoved | default |

### Git Aliases

| Alias | Expands to |
| --- | --- |
| `git st` | `status -sb` |
| `git co` | `checkout` |
| `git cb` | `checkout -b` |
| `git cm` | `commit -m` |
| `git ca` | `commit --amend` |
| `git ps` | `push` |
| `git pl` | `pull --rebase` |
| `git lg` | `log --oneline --graph --all -20` |
| `git undo` | `reset --soft HEAD~1` |
| `git wip` | Add all + commit "wip: work in progress" |
| `git cleanup` | Delete all merged branches (except main/master) |

---

## 7. Neovim (Editor)

**Config files:**
- `dot_config/nvim/init.lua` -> `~/.config/nvim/init.lua`
- `dot_config/nvim/lua/config/options.lua`
- `dot_config/nvim/lua/config/keymaps.lua`
- `dot_config/nvim/lua/config/autocmds.lua`
- `dot_config/nvim/lua/plugins/colorscheme.lua`
- `dot_config/nvim/lua/plugins/editor.lua`
- `dot_config/nvim/lua/plugins/agent.lua`
- `dot_config/nvim/lua/plugins/ui.lua`

### Distribution: LazyVim

LazyVim provides dozens of plugins out of the box (telescope, neo-tree, lualine, bufferline, which-key, gitsigns, mason, conform, nvim-lint, nvim-cmp, treesitter, etc.). The files below are **customizations on top of LazyVim defaults**.

### Leader Keys

| Key | Role |
| --- | --- |
| `Space` | Leader |
| `\` | Local leader |

### LazyVim Extras Enabled

**File:** `dot_config/nvim/init.lua`

| Extra | What it adds |
| --- | --- |
| `lang.typescript` | ts_ls LSP, treesitter highlighting, tsx support |
| `lang.json` | JSON LSP with SchemaStore validation |
| `lang.rust` | rust-analyzer LSP, crates.nvim for Cargo.toml |
| `lang.yaml` | YAML LSP with schema support |
| `lang.docker` | Dockerfile LSP, docker-compose support |
| `lang.markdown` | Markdown preview, render-markdown.nvim, linting |
| `lang.tailwind` | Tailwind CSS LSP, color hints in completions |
| `formatting.prettier` | Prettier formatter via conform.nvim (JS/TS/CSS/JSON/MD) |
| `linting.eslint` | ESLint diagnostics via nvim-lint |
| `editor.mini-files` | `Space E` opens mini.files file browser |
| `formatting.biome` | Biome formatter/linter (activates only with `biome.json`) |
| `ai.copilot` | GitHub Copilot inline completions |

### Editor Options

**File:** `dot_config/nvim/lua/config/options.lua`

| Option | Value | Why |
| --- | --- | --- |
| `relativenumber` | true | See distance for vim motions (5j, 12k) |
| `scrolloff` | 8 | Keep 8 lines visible above/below cursor |
| `sidescrolloff` | 8 | Keep 8 columns visible left/right |
| `cursorline` | true | Highlight current line |
| `termguicolors` | true | True color support |
| `signcolumn` | "yes" | Always show sign column (no layout shift) |
| `colorcolumn` | "100" | Vertical guide at column 100 |
| `tabstop` | 2 | Tab = 2 spaces |
| `shiftwidth` | 2 | Indent = 2 spaces |
| `expandtab` | true | Spaces, not tabs |
| `smartindent` | true | Auto-indent new lines |
| `wrap` | false | No line wrapping |
| `linebreak` | true | If wrap were on, break at word boundaries |
| `ignorecase` | true | Case-insensitive search |
| `smartcase` | true | ...unless you type uppercase |
| `undofile` | true | Persistent undo across sessions |
| `undolevels` | 10000 | 10k undo steps |
| `updatetime` | 200 | Faster CursorHold events (200ms) |
| `swapfile` | false | No .swp files |
| `backup` | false | No backup files |
| `clipboard` | "unnamedplus" | Yank/paste uses system clipboard |
| `splitbelow` | true | Horizontal splits open below |
| `splitright` | true | Vertical splits open right |
| `splitkeep` | "screen" | Keep screen position when splitting |

### Custom Keymaps

**File:** `dot_config/nvim/lua/config/keymaps.lua`

#### Mode Legend: `n` = normal, `i` = insert, `v` = visual, `x` = visual+select, `t` = terminal

| Mode | Key | Action |
| --- | --- | --- |
| n | `;` | Enter command mode (no Shift needed) |
| i | `jk` | Exit insert mode |
| i | `kj` | Exit insert mode |
| n | `J` | Join lines, cursor stays in place |
| n | `Ctrl+d` | Scroll down half page + center cursor |
| n | `Ctrl+u` | Scroll up half page + center cursor |
| n | `n` | Next search match + center |
| n | `N` | Prev search match + center |
| v | `J` | Move selected lines down |
| v | `K` | Move selected lines up |
| x | `Space p` | Paste over selection without losing clipboard |
| n,v | `Space y` | Yank to system clipboard |
| n | `Space Y` | Yank line to system clipboard |
| n,v | `Space d` | Delete to void register (no clipboard) |
| n | `Space w` | Save file |
| n | `Space qq` | Quit all |
| n | `U` | Redo (replaces default U which is "undo line") |
| n | `]q` | Next quickfix item + center |
| n | `[q` | Previous quickfix item + center |
| n | `Space sr` | Search/replace word under cursor (whole file, case-sensitive) |
| t | `Esc Esc` | Exit terminal mode to normal mode |

### Autocmds

**File:** `dot_config/nvim/lua/config/autocmds.lua`

| Event | What it does |
| --- | --- |
| `TextYankPost` | Briefly highlights yanked text (200ms, IncSearch color) |
| `BufWritePre` | Strips trailing whitespace from every line on save |
| `BufReadPost` | Restores cursor to last edited position when opening a file (skips gitcommit) |
| `BufWritePre` | Creates parent directories automatically if they don't exist |

### Plugin: Catppuccin Colorscheme

**File:** `dot_config/nvim/lua/plugins/colorscheme.lua`

| Setting | Value |
| --- | --- |
| Theme | catppuccin, flavour "mocha" |
| Transparent background | true |
| Integrations enabled | cmp, gitsigns, mason, mini, native_lsp (with undercurl underlines for errors/hints/warnings/info), notify, nvimtree, telescope, treesitter, which_key |

### Plugin: Editor Enhancements

**File:** `dot_config/nvim/lua/plugins/editor.lua`

| Plugin | Purpose | Keybindings |
| --- | --- | --- |
| `christoomey/vim-tmux-navigator` | Seamless navigation between tmux panes and nvim splits | `Ctrl+h` left, `Ctrl+j` down, `Ctrl+k` up, `Ctrl+l` right |
| `kylechui/nvim-surround` | Add, change, delete surrounding characters | `ysiw"` surround word with `"`, `ds"` delete surrounding `"`, `cs"'` change `"` to `'` |
| `folke/trouble.nvim` | Better diagnostics list with signs | LazyVim default bindings |
| `mbbill/undotree` | Visual undo history tree | `Space U` toggle |
| `mg979/vim-visual-multi` | Multiple cursors | `Ctrl+n` select word + add cursor, repeat to add more, `n/N` skip/back, `q` remove cursor |
| `ThePrimeagen/harpoon` (v2) | Bookmark files for instant switching | `Space ha` add file, `Space hh` toggle menu, `Space 1` file 1, `Space 2` file 2, `Space 3` file 3, `Space 4` file 4, `Space 5` file 5 |

### Plugin: AI / Agent Integration

**File:** `dot_config/nvim/lua/plugins/agent.lua`

| Plugin | Purpose | Provider | Keybindings |
| --- | --- | --- | --- |
| `yetone/avante.nvim` | In-editor AI assistant (like Cursor) | `providers.claude` (claude-sonnet-4-20250514, 8192 max tokens via `extra_request_body`) | `Space aa` ask AI, `Space ae` AI edit selection, `Space ar` refresh, `Space at` toggle panel |
| `olimorris/codecompanion.nvim` | AI chat and inline actions | Anthropic (chat + inline) | `Space ac` toggle chat (n,v), `Space ai` actions menu (n,v) |

#### Avante Dependencies (auto-installed)

| Dependency | Purpose |
| --- | --- |
| nvim-treesitter | Code parsing |
| dressing.nvim | Better UI for inputs/selects |
| plenary.nvim | Lua utilities |
| nui.nvim | UI components |
| nvim-web-devicons | File type icons |
| img-clip.nvim | Image paste support (no base64 embed) |
| render-markdown.nvim | Renders markdown in Avante chat buffers |

### Plugin: UI Enhancements

**File:** `dot_config/nvim/lua/plugins/ui.lua`

| Plugin                   | Purpose          | Details                                                                                                      |
| ------------------------ | ---------------- | ------------------------------------------------------------------------------------------------------------ |
| `karb94/neoscroll.nvim`  | Smooth scrolling | Animates `Ctrl+u`, `Ctrl+d`, `Ctrl+b`, `Ctrl+f`, `zt`, `zz`, `zb`; hides cursor during scroll; stops at EOF  |

### Lazy.nvim Settings

| Setting | Value |
| --- | --- |
| defaults.lazy | false (plugins load at startup unless they specify otherwise) |
| defaults.version | false (always use latest commit) |
| checker.enabled | true (auto-check for plugin updates) |
| Disabled builtin plugins | gzip, tarPlugin, tohtml, tutor, zipPlugin |

---

## 8. CLI Tools

**Config files:**
- `.chezmoidata/packages.yaml` -- package list
- `run_onchange_install-packages.sh.tmpl` -- install script

On Linux, most tools are installed from **GitHub releases** (not apt) to get the latest versions. On macOS, Homebrew handles everything.

### Installed on All Platforms

| Tool | Replaces | How it's used in this setup |
| --- | --- | --- |
| `chezmoi` | stow, dotbot | Manages all dotfiles |
| `zsh` | bash | Default shell |
| `tmux` | screen | Terminal multiplexer |
| `nvim` (0.10+) | vim | Editor, upgraded to latest stable |
| `ripgrep` (`rg`) | `grep` | Used by nvim telescope and fzf |
| `fzf` | `Ctrl+R` history | Shell history, file finder, fzf-tab completion |
| `fd` (`fdfind` on Ubuntu) | `find` | Used by fzf `Ctrl+T` and nvim telescope |
| `bat` (`batcat` on Ubuntu) | `cat` | Syntax-highlighted file viewer |
| `eza` | `ls` | All ls/ll/lt/l aliases |
| `zoxide` | `cd` | Smart directory jumper, replaces `cd` |
| `delta` | `git diff` | Side-by-side diffs with syntax highlighting |
| `lazygit` | `git` CLI | TUI for git (`lg`, `prefix g`, `Space gg`) |
| `starship` | shell prompt | Cross-shell prompt |
| `jq` | -- | JSON processor |
| `tree` | -- | Directory tree viewer |
| `luarocks` | -- | Lua package manager (nvim plugin builds) |

### Linux Only (via apt)

| Package | Purpose |
| --- | --- |
| `build-essential` | C/C++ compiler (needed for nvim plugin builds) |
| `cmake` | Build system (needed for avante.nvim) |
| `python3` + `pip` + `venv` | Python runtime and tools |
| `xclip` | X11 clipboard integration |
| `wl-clipboard` | Wayland clipboard integration |
| JetBrainsMono Nerd Font | Patched font with icons (installed to `~/.local/share/fonts`) |

### macOS Only (via Homebrew)

| Package | Purpose |
| --- | --- |
| `node` | Node.js runtime |
| `rustup` | Rust toolchain installer |
| `ghostty` (cask) | Terminal emulator |
| `font-jetbrains-mono-nerd-font` (cask) | Nerd Font |

---

## 9. Cross-Cutting Concerns

### Unified Theme: Catppuccin Mocha

The same color palette is applied in every tool:

| Tool | Where configured |
| --- | --- |
| Ghostty | `dot_config/ghostty/config` -- `theme = catppuccin-mocha` |
| Tmux | `dot_tmux.conf` -- hand-coded Catppuccin hex colors in status bar |
| Neovim | `lua/plugins/colorscheme.lua` -- `catppuccin/nvim` with flavour `mocha` |
| FZF | `dot_zshrc` -- `FZF_DEFAULT_OPTS` color variables |
| Git delta | `dot_gitconfig.tmpl` -- `syntax-theme = Catppuccin Mocha` |

### Unified Font: JetBrainsMono Nerd Font

| Tool | Where configured |
| --- | --- |
| Ghostty | `dot_config/ghostty/config` -- `font-family = JetBrainsMono Nerd Font` |
| Terminal | Installed via install script to `~/.local/share/fonts` (Linux) or Homebrew cask (macOS) |
| Neovim | Uses terminal font; Nerd Font icons used by nvim-web-devicons, neo-tree, telescope, lualine, etc. |
| eza | Uses Nerd Font icons via `--icons=always` |
| Starship | Uses Nerd Font symbols for git branch icon ` ` |

### Tmux <-> Neovim Seamless Navigation

`vim-tmux-navigator` is installed on **both sides**:

| Side | Where |
| --- | --- |
| Tmux plugin | `dot_tmux.conf` -- `set -g @plugin 'christoomey/vim-tmux-navigator'` |
| Nvim plugin | `lua/plugins/editor.lua` -- `christoomey/vim-tmux-navigator` |

Result: `Ctrl+h/j/k/l` moves between tmux panes and nvim splits transparently. You never need to think about which tool owns the pane.

### Three Ways to Use Git

| Method | Where | When to use |
| --- | --- | --- |
| Shell aliases | `dot_zshrc` -- `gs`, `ga`, `gc`, `gp`, `gl`, etc. | Quick one-liners |
| Lazygit | `dot_zshrc` -- `lg` alias, `dot_tmux.conf` -- `prefix g`, nvim -- `Space gg` | Interactive staging, rebasing, complex operations |
| Nvim gitsigns | LazyVim built-in | `]h`/`[h` navigate hunks, `Space gs` stage hunk, `Space gb` blame |

### Three Ways to Use AI

| Method | Where | When to use |
| --- | --- | --- |
| Avante (nvim) | `lua/plugins/agent.lua` | Ask about code, edit selections in-editor |
| CodeCompanion (nvim) | `lua/plugins/agent.lua` | Chat, explain, review via actions menu |
| OpenCode / Claude (terminal) | `dot_zshrc` -- `oc`/`cc` aliases, run in tmux window | Full agent sessions alongside editor |

### Cross-Platform Strategy

| Concern | How it's handled |
| --- | --- |
| Package installation | `run_onchange_install-packages.sh.tmpl` uses `{{ if eq .chezmoi.os "linux" }}` for apt, `{{ if eq .chezmoi.os "darwin" }}` for brew |
| Git signing key | `dot_gitconfig.tmpl` uses `{{ .signingkey }}` -- different path per machine |
| Tool detection | `dot_zshrc` checks `command -v` before using eza, zoxide, fzf, starship, zinit |
| Source directory | `.chezmoi.toml.tmpl` sets `sourceDir` to `~/dotfiles` via `{{ joinPath .chezmoi.homeDir "dotfiles" }}` |
| Font installation | Linux: downloaded to `~/.local/share/fonts`; macOS: Homebrew cask |
