# PhpStorm Keymaps

Place your PhpStorm keymap XML files here.

## Setup

1. Export your keymap from PhpStorm:
   - Settings → Keymap → Export
   - Save as `my-keymap.xml`

2. Copy to chezmoi source:
   ```bash
   mkdir -p ~/.local/share/chezmoi/keymaps
   cp ~/Downloads/my-keymap.xml ~/.local/share/chezmoi/keymaps/
   ```

3. Symlink from chezmoi:
   ```bash
   chezmoi cd
   # Create run_once_symlink.sh in the source:
   ```

4. Apply everywhere:
   ```bash
   chezmoi apply
   ```

## Example Symlink Script

Create `~/.local/share/chezmoi/run_once_symlink-phpstorm-keymap.sh`:

```bash
#!/usr/bin/env bash
set -e

KEYMAP_NAME="my-keymap.xml"

# Linux
if [[ -d "${HOME}/.config/JetBrains" ]]; then
    for dir in "${HOME}"/.config/JetBrains/PhpStorm*/keymaps; do
        ln -sf "${HOME}/.local/share/chezmoi/keymaps/${KEYMAP_NAME}" "${dir}/${KEYMAP_NAME}"
    done
fi

# macOS
if [[ -d "${HOME}/Library/Application Support/JetBrains" ]]; then
    for dir in "${HOME}"/Library/Application\ Support/JetBrains/PhpStorm*/keymaps; do
        ln -sf "${HOME}/.local/share/chezmoi/keymaps/${KEYMAP_NAME}" "${dir}/${KEYMAP_NAME}"
    done
fi
```
