#!/bin/bash
set -euo pipefail

DEST="$HOME/.local/share/grep_app_mcp"

if [ ! -d "$DEST" ]; then
    echo "==> Installing grep_app MCP server..."
    git clone https://github.com/ai-tools-all/grep_app_mcp.git "$DEST"
    cd "$DEST"
    npm install
    npm run build
    echo "==> grep_app MCP installed."
else
    echo "==> grep_app MCP already installed."
fi
