#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SRC="$SCRIPT_DIR/zh-conversation-title"
DEST="$HOME/.gemini/config/plugins/zh-conversation-title"

mkdir -p "$(dirname "$DEST")"
rm -rf "$DEST"
cp -R "$SRC" "$DEST"
chmod +x "$DEST/scripts/translate_title.py"

echo "Installed zh-conversation-title to: $DEST"
