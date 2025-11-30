#!/usr/bin/env bash

# ╔═══════════════════════════════════════════════════════╗
# ║       HYPRLAND CLIPBOARD MANAGER WITH ROFI            ║
# ║              Copy/Paste history integration           ║
# ╚═══════════════════════════════════════════════════════╝

# Requires: wl-clipboard, cliphist
# Setup: echo "bind = \$mainMod, V, exec, ~/.config/rofi/clipboard.sh" >> hyprland.conf

THEME_DIR="/home/ali/example config/.config/rofi"

# Show clipboard history
cliphist list | rofi -dmenu -theme "$THEME_DIR/launcher.rasi" -p "Clipboard" | cliphist decode | wl-copy

# Fallback if cliphist not installed
if [ $? -ne 0 ]; then
    echo "Error: cliphist not installed. Install with: sudo pacman -S cliphist"
fi
