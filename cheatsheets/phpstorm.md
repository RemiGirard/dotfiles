# PhpStorm + IdeaVim Cheatsheet

## Essential Shortcuts

### Search & Navigation

| Shortcut     | Action                                      |
| ------------ | ------------------------------------------- |
| `⇧⇧`         | Search Everywhere (files, classes, actions) |
| `⌘O`         | Go to class                                 |
| `⌘⇧O`        | Go to file                                  |
| `⌘⌥⇧O`       | Go to symbol                                |
| `⌘E`         | Recent files                                |
| `⌘⇧E`        | Recent locations                            |
| `⌘⇧A`        | Find action                                 |
| `⌘B`         | Go to declaration/usages                    |
| `⌘⌥B`        | Go to implementation                        |
| `⌘U`         | Go to super method                          |
| `⌘G`         | Go to line                                  |
| `⌥←/→`       | Navigate back/forward                       |
| `F2` / `⇧F2` | Next/prev error                             |

### Editing

| Shortcut | Action                           |
| -------- | -------------------------------- |
| `⌘D`     | Duplicate line                   |
| `⌘Y`     | Delete line                      |
| `⌘⇧↑/↓`  | Move line up/down                |
| `⌘⌥L`    | Reformat code                    |
| `⌘⌥I`    | Auto-indent                      |
| `⌥⏎`     | Show context actions (quick fix) |
| `⌘⌥T`    | Surround with (if/try/catch)     |
| `⌘⇧V`    | Paste from history               |

### Refactoring

| Shortcut  | Action                |
| --------- | --------------------- |
| `⇧F6`     | Rename                |
| `⌘⌥M`     | Extract method        |
| `⌘⌥V`     | Extract variable      |
| `⌘⌥F`     | Extract field         |
| `⌘⌥C`     | Extract constant      |
| `⌘⌥N`     | Inline                |
| `⌘⌥⇧T`    | Refactor this (popup) |
| `⌥Delete` | Safe delete           |

### Tool Windows

| Shortcut | Action                    |
| -------- | ------------------------- |
| `⌘1-9`   | Open tool window N        |
| `⌘0`     | Terminal                  |
| `⌥1`     | Project                   |
| `⌥7`     | Structure                 |
| `⌘⇧F12`  | Hide all windows          |
| `Esc`    | Return to editor          |
| `⌘Tab`   | Switcher (hold ⌘, arrows) |

### Git/VCS

| Shortcut | Action          |
| -------- | --------------- |
| `⌘K`     | Commit          |
| `⌘⇧K`    | Push            |
| `⌘T`     | Update project  |
| `⌘D`     | Show diff       |
| `⌥\`     | VCS quick popup |

### Debug & Run

| Shortcut | Action    |
| -------- | --------- |
| `⇧F10`   | Run       |
| `⇧F9`    | Debug     |
| `F8`     | Step over |
| `F7`     | Step into |
| `⇧F8`    | Step out  |

---

## IdeaVim (Vim Mode)

> Aligned with Neovim (LazyVim) keybindings. Plugins: surround, multiple-cursors, highlightedyank, ideajoin, which-key, NERDTree.

### Navigation (aligned with nvim LSP)

| Key         | Action                      |
| ----------- | --------------------------- |
| `gd`        | Go to declaration           |
| `gi`        | Go to implementation        |
| `gr`        | Find usages (references)    |
| `K`         | Quick docs (hover)          |
| `Ctrl+o/i`  | Navigate back/forward       |
| `H` / `L`   | Prev/next tab              |
| `]d` / `[d` | Next/prev error             |

### Search & Find (aligned with LazyVim)

| Key              | Action             |
| ---------------- | ------------------ |
| `Space Space`    | Search Everywhere  |
| `Space ff`       | Go to file         |
| `Space sg`       | Find in path       |
| `Space sr`       | Replace in path    |
| `Space ss`       | Go to symbol       |

### Code Actions (aligned with LazyVim)

| Key         | Action              |
| ----------- | ------------------- |
| `Space ca`  | Show intentions     |
| `Space cr`  | Rename element      |
| `Space cf`  | Reformat code       |
| `Space xx`  | Problems tool window|

### File Explorer & Windows

| Key         | Action              |
| ----------- | ------------------- |
| `Space e`   | Toggle NERDTree     |
| `Space wd`  | Close window        |
| `Space ws`  | Split horizontal    |
| `Space wv`  | Split vertical      |
| `Space bd`  | Close tab           |

### Git (aligned with LazyVim)

| Key         | Action                |
| ----------- | --------------------- |
| `Space gg`  | Version control panel |
| `]h` / `[h` | Next/prev change marker |

### Text Manipulation (aligned with nvim)

| Key         | Action                       |
| ----------- | ---------------------------- |
| `Space d`   | Delete without yank          |
| `Space y`   | Copy to system clipboard     |
| `Space Y`   | Copy line to system clipboard|
| `Space p`   | Paste over (keep register)   |
| `J`         | Join lines (keep cursor)     |
| `J` (visual)| Move selection down          |
| `K` (visual)| Move selection up            |

### Other

| Key         | Action              |
| ----------- | ------------------- |
| `jk` / `kj` | Exit insert mode   |
| `U`         | Redo                |
| `Space t`   | Terminal            |
| `Space qq`  | Exit                |

---

## Recommended .ideavimrc

See `~/.ideavimrc` for the full config. Key design decisions:
- **which-key** plugin enabled -- press `Space` and wait to discover commands
- **NERDTree** plugin for `Space e` file explorer
- All `Space` leader bindings match nvim (LazyVim) where possible
- `gd/gi/gr/K` match nvim LSP bindings
- `Space d` = delete without yank (same as nvim, not recent files)

---

## Tips

1. **Discover actions**: `⌘⇧A` then type any action name
2. **Key Promoter X**: Plugin that shows shortcuts when you use mouse
3. **Print keymap**: Help → Keyboard Shortcuts PDF
4. **IdeaVim cheat sheet**: `:action idea.ShowAceActionList`
5. **Conflicts**: If ⌃ shortcuts don't work, check System Settings → Keyboard → "Use F1, F2, etc. as standard function keys"
