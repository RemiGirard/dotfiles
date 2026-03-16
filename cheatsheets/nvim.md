# Neovim (LazyVim) Cheatsheet

> Leader: `Space` -- press and wait to see all commands via which-key

## Survival (Week 1)

| Key                    | Action              |
| ---------------------- | ------------------- |
| `i` / `Esc` (or `jk`)  | Insert / Normal     |
| `Space w`              | Save                |
| `:q`                   | Quit                |
| `u` / `U`              | Undo / Redo         |
| `Space`                | **Show all cmds**   |

## Navigation

| Key           | Action                    |
| ------------- | ------------------------- |
| `h/j/k/l`     | Move                      |
| `w/b`         | Next/prev word            |
| `0` / `$`     | Start/end of line         |
| `gg` / `G`    | Top/bottom                |
| `Ctrl+d/u`    | Scroll down/up (centered) |
| `Space Space` | Find files                |
| `Space /`     | Grep project              |
| `Space ,`     | Switch buffer             |
| `Space e`     | File explorer             |

## Harpoon

| Key         | Action       |
| ----------- | ------------ |
| `Space ha`  | Add file     |
| `Space hh`  | Menu         |
| `Space 1-5` | Jump to file |

## Editing

| Key                | Action                     |
| ------------------ | -------------------------- |
| `dd` / `yy` / `p`  | Delete / copy / paste line |
| `ciw`              | Change word                |
| `ci"`              | Change inside quotes       |
| `V J/K`            | Move line up/down          |
| `.`                | Repeat last action         |
| `ysiw"`            | Surround word with "       |
| `ds"`              | Delete surrounding "       |
| `cs"'`             | Change " to '              |

## LSP

| Key         | Action               |
| ----------- | -------------------- |
| `gd`        | Go to definition     |
| `gr`        | References           |
| `K`         | Hover docs           |
| `Space ca`  | Code action          |
| `Space cr`  | Rename               |
| `]d` / `[d` | Next/prev diagnostic |

## Git

| Key         | Action         |
| ----------- | -------------- |
| `Space gg`  | Lazygit        |
| `Space gb`  | Blame line     |
| `]h` / `[h` | Next/prev hunk |

## AI Agents

| Key        | Action                 |
| ---------- | ---------------------- |
| `Space aa` | Avante: Ask AI         |
| `Space ae` | Avante: Edit           |
| `Space at` | Avante: Toggle         |
| `Space ac` | CodeCompanion: Chat    |
| `Space ai` | CodeCompanion: Actions |

## Learning Path

- **Week 1**: `i`/`Esc`, `hjkl`, `Space Space`, `Space /`, `:w`/`:q`
- **Week 2**: `w/b`, `dd/yy/p`, visual mode, `ciw`, `di"`
- **Week 3**: surround, LSP (`gd`, `gr`, `K`), git
- **Week 4**: harpoon, macros, multi-cursor, AI agents
