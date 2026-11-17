#!/usr/bin/env bash
# ==============================================================================
#  caelestia-remove-borders | install.sh
#  Removes the screen border frame from Caelestia Shell, keeping only the sidebar.
# ==============================================================================
set -euo pipefail

CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/caelestia"
SHELL_JSON="$CONFIG_DIR/shell.json"
BACKUP_FILE="$SHELL_JSON.bak.$(date +%Y%m%d_%H%M%S)"

echo "==> Configuring Caelestia Shell to remove screen borders..."

if [[ ! -d "$CONFIG_DIR" ]]; then
    mkdir -p "$CONFIG_DIR"
fi

if [[ -f "$SHELL_JSON" ]]; then
    echo "==> Creating backup of shell.json at: $BACKUP_FILE"
    cp "$SHELL_JSON" "$BACKUP_FILE"
else
    echo "{}" > "$SHELL_JSON"
fi

# Update shell.json with border.thickness = 0 and border.rounding = 0
python3 - << 'EOF'
import json
import os
import sys

path = os.path.expanduser("~/.config/caelestia/shell.json")

try:
    with open(path, "r", encoding="utf-8") as f:
        data = json.load(f)
except Exception:
    data = {}

if "border" not in data or not isinstance(data["border"], dict):
    data["border"] = {}

data["border"]["thickness"] = 0
data["border"]["rounding"] = 0

with open(path, "w", encoding="utf-8") as f:
    json.dump(data, f, indent=4, ensure_ascii=False)
    f.write("\n")

print("==> Successfully updated shell.json with borderless settings.")
EOF

# Restart Caelestia Shell if command is available and shell is running
if command -v caelestia &>/dev/null; then
    echo "==> Reloading Caelestia Shell..."
    caelestia shell -d -r 2>/dev/null || caelestia shell -d 2>/dev/null || true
    echo "==> Caelestia Shell reloaded!"
else
    echo "==> Note: Run 'caelestia shell -d -r' or restart your session to see the changes."
fi

echo ""
echo "Done! Screen borders have been removed, leaving only the sidebar."
