# French Accents Cheatsheet (Compose Key)

> **Same sequences on both macOS and Ubuntu.** Press Right Alt, then type the two-key sequence.

## How to use

1. Press **Right Alt** (and release)
2. Type the accent character (`'`, `` ` ``, `^`, `"`, `,`)
3. Type the letter

Example: Right Alt → `'` → `e` = **é**

## Common French Accents

| Sequence | Result | Name |
|----------|--------|------|
| `' e` | é | e accent aigu |
| `' E` | É | E accent aigu |
| `` ` e`` | è | e accent grave |
| `` ` a`` | à | a accent grave |
| `` ` u`` | ù | u accent grave |
| `^ e` | ê | e accent circonflexe |
| `^ a` | â | a accent circonflexe |
| `^ i` | î | i accent circonflexe |
| `^ o` | ô | o accent circonflexe |
| `^ u` | û | u accent circonflexe |
| `" e` | ë | e tréma |
| `" i` | ï | i tréma |
| `" u` | ü | u tréma |
| `, c` | ç | c cédille |
| `, C` | Ç | C cédille |
| `o e` | œ | o-e lié |

## Other Useful Characters

| Sequence | Result | Name |
|----------|--------|------|
| `< <` | « | guillemet ouvrant |
| `> >` | » | guillemet fermant |
| `~ n` | ñ | n tilde |
| `s s` | ß | eszett |
| `e u` | € | euro |
| `! !` | ¡ | exclamation inversée |
| `? ?` | ¿ | interrogation inversée |

## Platform Setup

### macOS
Handled by Hammerspoon (`~/.hammerspoon/init.lua`). No additional setup needed.
Compose mode shows a small alert "Compose ⌨" and auto-cancels after 3 seconds.

### Ubuntu
Built-in. Set Right Alt as Compose key:
```bash
# GNOME
gsettings set org.gnome.desktop.input-sources xkb-options "['compose:ralt']"

# Or via GUI: Settings → Keyboard → Compose Key → Right Alt
```

## Tips

- Compose mode is **one-shot**: it deactivates after producing one character
- If you need multiple accents in a row, press Right Alt again for each one
- Uppercase: use the uppercase letter in the sequence (`' E` = É)
- The accent key is always typed first, then the letter
