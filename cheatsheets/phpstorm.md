# PhpStorm + IdeaVim Cheatsheet

> Primary: Ubuntu/Linux defaults. macOS equivalents in parentheses.
> Custom IdeaVim mappings (managed by chezmoi) are marked with ★

## Essential Shortcuts

### Search & Navigation

| Linux | macOS | Action |
|-------|-------|--------|
| `Shift Shift` | `⇧⇧` | Search Everywhere |
| `Ctrl+N` | `⌘O` | Go to class |
| `Ctrl+Shift+N` | `⌘⇧O` | Go to file |
| `Ctrl+Alt+Shift+N` | `⌘⌥⇧O` | Go to symbol |
| `Ctrl+E` | `⌘E` | Recent files |
| `Ctrl+Shift+E` | `⌘⇧E` | Recent locations |
| `Ctrl+Shift+A` | `⌘⇧A` | Find action |
| `Ctrl+B` | `⌘B` | Go to declaration/usages |
| `Ctrl+Alt+B` | `⌘⌥B` | Go to implementation |
| `Ctrl+U` | `⌘U` | Go to super method |
| `Ctrl+G` | `⌘G` | Go to line |
| `Alt+Left/Right` | `⌥←/→` | Navigate back/forward |
| `F2` / `Shift+F2` | `F2` / `⇧F2` | Next/prev error |

### Editing

| Linux | macOS | Action |
|-------|-------|--------|
| `Ctrl+D` | `⌘D` | Duplicate line |
| `Ctrl+Y` | `⌘Y` | Delete line |
| `Ctrl+Shift+Up/Down` | `⌘⇧↑/↓` | Move line up/down |
| `Ctrl+Alt+L` | `⌘⌥L` | Reformat code |
| `Ctrl+Alt+I` | `⌘⌥I` | Auto-indent |
| `Alt+Enter` | `⌥⏎` | Show context actions (quick fix) |
| `Ctrl+Alt+T` | `⌘⌥T` | Surround with (if/try/catch) |
| `Ctrl+Shift+V` | `⌘⇧V` | Paste from history |

### Selection

| Linux | macOS | Action |
|-------|-------|--------|
| `Ctrl+W` | `⌘W` | Extend selection |
| `Ctrl+Shift+W` | `⌘⇧W` | Shrink selection |

### Refactoring

| Linux | macOS | Action |
|-------|-------|--------|
| `Shift+F6` | `⇧F6` | Rename |
| `Ctrl+Alt+M` | `⌘⌥M` | Extract method |
| `Ctrl+Alt+V` | `⌘⌥V` | Extract variable |
| `Ctrl+Alt+F` | `⌘⌥F` | Extract field |
| `Ctrl+Alt+C` | `⌘⌥C` | Extract constant |
| `Ctrl+Alt+N` | `⌘⌥N` | Inline |
| `Ctrl+Alt+Shift+T` | `⌘⌥⇧T` | Refactor this (popup) |
| `Alt+Delete` | `⌥Delete` | Safe delete |

### Tool Windows

| Linux | macOS | Action |
|-------|-------|--------|
| `Alt+1-9` | `⌘1-9` | Open tool window N |
| `Alt+F12` | `⌘0` | Terminal |
| `Alt+1` | `⌥1` | Project |
| `Alt+7` | `⌥7` | Structure |
| `Ctrl+Shift+F12` | `⌘⇧F12` | Hide all windows |
| `Esc` | `Esc` | Return to editor |
| `Ctrl+Tab` | `⌃Tab` | Switcher (hold key, arrows) |

### Git/VCS

| Linux | macOS | Action |
|-------|-------|--------|
| `Ctrl+K` | `⌘K` | Commit |
| `Ctrl+Shift+K` | `⌘⇧K` | Push |
| `Ctrl+T` | `⌘T` | Update project |
| `Ctrl+D` | `⌘D` | Show diff |
| `Alt+`` ` | `⌥\` ` | VCS quick popup |

### Debug & Run

| Linux | macOS | Action |
|-------|-------|--------|
| `Shift+F10` | `⇧F10` | Run |
| `Shift+F9` | `⇧F9` | Debug |
| `F8` | `F8` | Step over |
| `F7` | `F7` | Step into |
| `Shift+F8` | `⇧F8` | Step out |

### Code Completion

| Linux | macOS | Action |
|-------|-------|--------|
| `Ctrl+Space` | `⌃Space` | Basic completion |
| `Ctrl+Shift+Space` | `⌃⇧Space` | Smart completion |
| `Ctrl+P` | `⌘P` | Parameter info |
| `Ctrl+Q` | `⌃J` | Quick documentation |

---

## IdeaVim (Vim Mode)

### Navigation

| Key | Action |
|-----|--------|
| `h/j/k/l` | Left/down/up/right |
| `w/b` | Next/prev word |
| `gg/G` | Start/end of file |
| `0/$` | Start/end of line |
| `Ctrl+d/u` | Half page down/up |
| `{ / }` | Prev/next paragraph |
| `%` | Match bracket |

### Editing

| Key | Action |
|-----|--------|
| `i/a` | Insert before/after |
| `o/O` | New line below/above |
| `dd/yy` | Delete/yank line |
| `cc` | Change line |
| `x` | Delete char |
| `p` | Paste |
| `u/Ctrl+r` | Undo/redo |
| `ci"/ca"` | Change inside quotes |
| `ci(/ca(` | Change inside parens |
| `.` | Repeat last command |

### Visual Mode

| Key | Action |
|-----|--------|
| `v` | Enter visual |
| `V` | Visual line |
| `Ctrl+v` | Visual block |
| `>/<` | Indent/dedent |
| `y/d/x` | Yank/delete |

### Search

| Key | Action |
|-----|--------|
| `/` / `?` | Search forward/back |
| `n/N` | Next/prev match |
| `Ctrl+F` | PhpStorm Find |

---

## Custom Leader Mappings ★

| Key | Action | Source |
|-----|--------|--------|
| `Space f` | Search Everywhere | `~/.ideavimrc` |
| `Space e` | Project tool window | `~/.ideavimrc` |
| `Space t` | Terminal tool window | `~/.ideavimrc` |
| `Space g` | Git tool window | `~/.ideavimrc` |
| `Space d` | Recently changed files | `~/.ideavimrc` |
| `jj` | Exit insert mode | `~/.ideavimrc` |

---

## Managing with Chezmoi

Your configs are managed by chezmoi:

```bash
# Edit IdeaVim config
chezmoi edit ~/.ideavimrc
chezmoi apply

# See all custom mappings
chezmoi cat ~/.ideavimrc
```

---

## Tips

1. **Discover actions**: `Ctrl+Shift+A` then type any action name
2. **Key Promoter X**: Plugin that shows shortcuts when you use mouse
3. **Print keymap**: Help → Keyboard Shortcuts PDF
4. **IdeaVim actions**: `:action idea.ShowAceActionList`
5. **macOS function keys**: System Settings → Keyboard → "Use F1, F2, etc. as standard function keys"
