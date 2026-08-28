#!/bin/bash
set -euo pipefail

if [ ! -x "$HOME/.opencode/bin/opencode" ]; then
    echo "==> Installing opencode..."
    curl -fsSL https://opencode.ai/install | bash
    echo "==> opencode installed."
else
    echo "==> opencode already installed."
fi
