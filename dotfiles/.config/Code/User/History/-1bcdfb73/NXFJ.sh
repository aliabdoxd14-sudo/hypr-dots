#!/usr/bin/env bash

# ╔═══════════════════════════════════════════════════════╗
# ║     SCREENSHOT SCRIPT WITH SWAPPY INTEGRATION         ║
# ║               Capture & Annotate Screens              ║
# ╚═══════════════════════════════════════════════════════╝

# Requires: grim, slurp, swappy
# Keybinds in hyprland.conf:
# bind = $mainMod, PRINT, exec, ~/.config/hypr/screenshot.sh
# bind = $mainMod SHIFT, PRINT, exec, ~/.config/hypr/screenshot.sh --area

SCREENSHOT_DIR="$HOME/Pictures/Screenshots"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
FILENAME="screenshot_$TIMESTAMP.png"

# Create directory if it doesn't exist
mkdir -p "$SCREENSHOT_DIR"

case "$1" in
    --area)
        # Screenshot selected area
        grim -g "$(slurp)" - | swappy -f - -o "$SCREENSHOT_DIR/$FILENAME"
        ;;
    --window)
        # Screenshot active window
        WINDOW_POS=$(hyprctl activewindow -j | jq -r '.at')
        WINDOW_SIZE=$(hyprctl activewindow -j | jq -r '.size')
        grim -g "$WINDOW_POS $WINDOW_SIZE" - | swappy -f - -o "$SCREENSHOT_DIR/$FILENAME"
        ;;
    *)
        # Full screenshot
        grim - | swappy -f - -o "$SCREENSHOT_DIR/$FILENAME"
        ;;
esac

if [ -f "$SCREENSHOT_DIR/$FILENAME" ]; then
    echo "Screenshot saved: $SCREENSHOT_DIR/$FILENAME"
    notify-send "Screenshot saved" "$FILENAME" -i camera
fi
