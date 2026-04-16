# Neovim (LazyVim) Cheatsheet

> Leader: `Space` -- press and wait to see all commands via which-key

## Survival (Week 1)

| Key            | Action              |
| -------------- | ------------------- |
| `i` / `Esc`    | Insert / Normal     |
| `jk` or `kj`   | Exit insert mode    |
| `;`            | Command mode (no :) |
| `Ctrl+s`       | Save                |
| `:q`           | Quit                |
| `u` / `U`      | Undo / Redo         |
| `Space`        | **Show all cmds**   |

## Navigation

| Key           | Action                    |
| ------------- | ------------------------- |
| `h/j/k/l`    | Move                      |
| `w/b`         | Next/prev word            |
| `0` / `$`     | Start/end of line         |
| `gg` / `G`    | Top/bottom                |
| `Ctrl+d/u`    | Scroll down/up (smooth, 10 lines) |
| `Space Space` | Find files                |
| `Space /`     | Grep project              |
| `Space ,`     | Switch buffer             |
| `Space e`     | File explorer (neo-tree)  |
| `Space E`     | Mini-files explorer       |

## Harpoon (Quick File Marks)

| Key         | Action       |
| ----------- | ------------ |
| `Space ha`  | Add file     |
| `Space hh`  | Menu         |
| `Space 1-5` | Jump to file |

## Editing

| Key                | Action                     |
| ------------------ | -------------------------- |
| `dd` / `yy` / `p` | Delete / copy / paste line |
| `ciw`              | Change word                |
| `ci"`              | Change inside quotes       |
| `J` (visual)       | Move selection down        |
| `K` (visual)       | Move selection up          |
| `.`                | Repeat last action         |

## Clipboard

| Key       | Action                               |
| --------- | ------------------------------------ |
| `Space y` | Copy to system clipboard             |
| `Space Y` | Copy line to system clipboard        |
| `Space d` | Delete without yanking               |
| `Space p` | Paste over selection (keep register) |

## Surround (nvim-surround)

| Key     | Action               |
| ------- | -------------------- |
| `ysiw"` | Surround word with " |
| `ds"`   | Delete surrounding " |
| `cs"'`  | Change " to '        |

## Multi-Cursor (vim-visual-multi)

| Key       | Action                    |
| --------- | ------------------------- |
| `Ctrl+n`  | Select word, add cursor   |
| `Ctrl+n`  | (repeat) Add more cursors |
| `n` / `N` | Skip / go back            |
| `q`       | Remove current cursor     |

## LSP

| Key         | Action               |
| ----------- | -------------------- |
| `gd`        | Go to definition     |
| `gr`        | References           |
| `K`         | Hover docs           |
| `Space ca`  | Code action          |
| `Space cr`  | Rename               |
| `]d` / `[d` | Next/prev diagnostic |
| `Space xx`  | Trouble: diagnostics |

## Search & Replace

| Key        | Action                     |
| ---------- | -------------------------- |
| `/pattern` | Search forward             |
| `n` / `N`  | Next/prev match (centered) |
| `Space sr` | Replace word under cursor  |

## Git

| Key         | Action                       |
| ----------- | ---------------------------- |
| `Space gg`  | Lazygit (full TUI)           |
| `Space gn`  | Neogit (git UI inside nvim)  |
| `Space gd`  | Diffview (side-by-side diff) |
| `Space gh`  | File history (diffview)      |
| `Space gb`  | Blame current line           |
| `]h` / `[h` | Next/prev git hunk          |

## AI Agents

| Key        | Action                 |
| ---------- | ---------------------- |
| `Space aa` | Avante: Ask AI         |
| `Space ae` | Avante: Edit           |
| `Space at` | Avante: Toggle         |
| `Space ac` | CodeCompanion: Chat    |
| `Space ai` | CodeCompanion: Actions |

## Windows & Terminal

| Key             | Action                    |
| --------------- | ------------------------- |
| `Ctrl+h/j/k/l` | Navigate splits (+ tmux)  |
| `H` / `L`       | Prev/next buffer         |
| `Space bd`      | Close buffer              |
| `Space wd`      | Close window              |
| `Space ws`      | Split horizontal          |
| `Space wv`      | Split vertical            |
| `Space ft`      | Float terminal            |
| `Esc Esc`       | Exit terminal mode        |
| `Space qq`      | Quit all                  |

## Chezmoi

| Key         | Action                  |
| ----------- | ----------------------- |
| `Space cz`  | Browse chezmoi files    |

> chezmoi.nvim auto-applies changes on save when editing managed files.

## Inc-Rename / Dial / Yanky

| Key         | Action                            |
| ----------- | --------------------------------- |
| `Space cr`  | Inc-rename (inline preview)       |
| `Ctrl+a/x`  | Increment/decrement (dial.nvim)  |
| `p` (after yank) | Yanky paste (cycle with `<C-p>`/`<C-n>`) |

## Other

| Key         | Action                |
| ----------- | --------------------- |
| `Space U`   | Toggle undo tree      |
| `]q` / `[q` | Next/prev quickfix   |
| `Space l`   | Lazy plugin manager   |
| `Space cm`  | Mason (LSP installer) |

## Automatic Behaviors

- ESLint auto-fix on save (JS/TS files)
- Trailing whitespace stripped on save
- Cursor restored to last position on file open
- Parent directories auto-created on save
- Yank text briefly highlights

## Learning Path

- **Week 1**: `i`/`Esc`, `hjkl`, `Space Space`, `Space /`, `Ctrl+s`/`:q`
- **Week 2**: `w/b`, `dd/yy/p`, visual mode, `ciw`, `di"`, surround
- **Week 3**: LSP (`gd`, `gr`, `K`), git (`Space gg`, `Space gn`), harpoon
- **Week 4**: multi-cursor, macros (`q`), AI agents, diffview, chezmoi (`Space cz`)
