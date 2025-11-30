#!/usr/bin/env bash

# ╔═══════════════════════════════════════════════════════╗
# ║    HYPRLAND THEME CUSTOMIZER SCRIPT                  ║
# ║              Change theme colors easily               ║
# ╚═══════════════════════════════════════════════════════╝

set -e

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
MAGENTA='\033[0;35m'
NC='\033[0m'

# Config directory
CONFIG_DIR="$HOME/.config"

echo -e "${BLUE}╔════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║   HYPRLAND THEME CUSTOMIZER                           ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════════════════════╝${NC}"
echo ""

# Show current theme
show_current_theme() {
    echo -e "${YELLOW}Current colors:${NC}"
    PRIMARY=$(grep "col.active_border" "$CONFIG_DIR/hypr/hyprland.conf" | head -1 | grep -o 'rgb([^)]*)' | head -1)
    echo -e "  Primary: $PRIMARY"
}

# Available presets
show_presets() {
    echo -e "${BLUE}Available theme presets:${NC}"
    echo "  1. Blue (current)"
    echo "  2. Purple"
    echo "  3. Green"
    echo "  4. Red"
    echo "  5. Orange"
    echo "  6. Cyan"
    echo "  7. Custom (enter your own)"
}

# Preset configurations
apply_theme() {
    local primary=$1
    local secondary=$2
    local accent=$3
    
    echo -e "${GREEN}Applying theme...${NC}"
    
    # Update Hyprland
    sed -i "s/rgb([0-9a-f]*)/rgb($primary)/g" "$CONFIG_DIR/hypr/hyprland.conf"
    
    # Update Waybar
    sed -i "s/#[0-9a-f]\{6\}/$accent/g" "$CONFIG_DIR/waybar/style.css" 2>/dev/null || true
    
    # Update Rofi
    sed -i "s/#[0-9a-f]\{6\}/$accent/g" "$CONFIG_DIR/rofi/launcher.rasi" 2>/dev/null || true
    
    # Reload Hyprland
    hyprctl reload 2>/dev/null || echo -e "${YELLOW}Note: Reload Hyprland manually to see changes${NC}"
    
    echo -e "${GREEN}✓ Theme applied!${NC}"
}

# Main menu
show_presets
read -p "Choose theme (1-7): " choice

case $choice in
    1)
        echo -e "${BLUE}Keeping Blue theme${NC}"
        ;;
    2)
        apply_theme "8800ff" "5500aa" "#8800ff"
        echo -e "${MAGENTA}✓ Purple theme applied${NC}"
        ;;
    3)
        apply_theme "00cc00" "009900" "#00cc00"
        echo -e "${GREEN}✓ Green theme applied${NC}"
        ;;
    4)
        apply_theme "ff6464" "cc3333" "#ff6464"
        echo -e "${RED}✓ Red theme applied${NC}"
        ;;
    5)
        apply_theme "ff8800" "cc6600" "#ff8800"
        echo -e "${YELLOW}✓ Orange theme applied${NC}"
        ;;
    6)
        apply_theme "00ffcc" "00cc99" "#00ffcc"
        echo -e "${BLUE}✓ Cyan theme applied${NC}"
        ;;
    7)
        read -p "Enter primary color (hex, e.g., 0088ff): " hex_color
        hex_color=$(echo "$hex_color" | tr -d '#')
        if [[ $hex_color =~ ^[0-9a-fA-F]{6}$ ]]; then
            apply_theme "$hex_color" "$hex_color" "#$hex_color"
            echo -e "${GREEN}✓ Custom theme applied${NC}"
        else
            echo -e "${RED}✗ Invalid color format${NC}"
        fi
        ;;
    *)
        echo -e "${RED}✗ Invalid choice${NC}"
        exit 1
        ;;
esac

echo ""
echo -e "${GREEN}Done! Your Hyprland theme is now customized.${NC}"
echo -e "${YELLOW}Tip: Use 'hyprctl reload' to reload without restarting${NC}"
