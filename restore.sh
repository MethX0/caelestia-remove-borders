#!/usr/bin/env bash
# ==============================================================================
#  caelestia-remove-borders | restore.sh
#  Restores the default screen borders (thickness: 10, rounding: 25).
# ==============================================================================
set -euo pipefail

CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/caelestia"
SHELL_JSON="$CONFIG_DIR/shell.json"

echo "==> Restoring default borders in Caelestia Shell..."

if [[ ! -f "$SHELL_JSON" ]]; then
    echo "Error: No shell.json found at $SHELL_JSON."
    exit 1
fi

python3 - << 'EOF'
import json
import os

path = os.path.expanduser("~/.config/caelestia/shell.json")

try:
    with open(path, "r", encoding="utf-8") as f:
        data = json.load(f)
except Exception as e:
    print(f"Error reading {path}: {e}")
    exit(1)

if "border" in data:
    data["border"]["thickness"] = 10
    data["border"]["rounding"] = 25

with open(path, "w", encoding="utf-8") as f:
    json.dump(data, f, indent=4, ensure_ascii=False)
    f.write("\n")

print("==> Default border settings restored in shell.json.")
EOF

if command -v caelestia &>/dev/null; then
    echo "==> Reloading Caelestia Shell..."
    caelestia shell -d -r 2>/dev/null || caelestia shell -d 2>/dev/null || true
    echo "==> Caelestia Shell reloaded!"
fi

echo "Done! Default borders restored."
