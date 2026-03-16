#!/bin/bash
set -euo pipefail

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
    echo "==> Installing zinit..."
    mkdir -p "$(dirname "$ZINIT_HOME")"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
    echo "==> zinit installed!"
fi

# Bootstrap zinit plugins so they're ready on first zsh launch
if [ -x "$(command -v zsh)" ] && [ ! -d "${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/plugins/zsh-users---zsh-syntax-highlighting" ]; then
    echo "==> Downloading zsh plugins via zinit..."
    zsh -ic 'exit' 2>/dev/null || true
    echo "==> Zsh plugins ready!"
fi
