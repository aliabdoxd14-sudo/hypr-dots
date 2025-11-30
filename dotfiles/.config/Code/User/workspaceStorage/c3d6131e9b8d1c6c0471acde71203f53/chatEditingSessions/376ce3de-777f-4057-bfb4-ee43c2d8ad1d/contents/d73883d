#!/usr/bin/env bash

# ╔═══════════════════════════════════════════════════════╗
# ║       HYPRLAND INSTALLATION & SETUP SCRIPT            ║
# ║            Automatic Configuration Setup              ║
# ╚═══════════════════════════════════════════════════════╝

set -e

echo "╔═══════════════════════════════════════════════════════╗"
echo "║   HYPRLAND BLUE THEME - AUTOMATIC SETUP SCRIPT       ║"
echo "╚═══════════════════════════════════════════════════════╝"
echo ""

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Detect package manager
if command -v pacman &> /dev/null; then
    PM="pacman"
    INSTALL="sudo pacman -S --noconfirm"
elif command -v apt &> /dev/null; then
    PM="apt"
    INSTALL="sudo apt install -y"
elif command -v dnf &> /dev/null; then
    PM="dnf"
    INSTALL="sudo dnf install -y"
else
    echo -e "${RED}✗ Unsupported package manager${NC}"
    exit 1
fi

echo -e "${BLUE}[*]${NC} Detected package manager: ${YELLOW}$PM${NC}"
echo ""

# Install dependencies
echo -e "${BLUE}[*]${NC} Installing dependencies..."
$INSTALL hyprland hyprlock waybar rofi dunst kitty cava \
    brightnessctl pulseaudio-utils grim slurp swappy \
    wl-clipboard cliphist jq

# Optional: Install recommended applications
echo ""
read -p "Install recommended applications? (Firefox, Nautilus, VLC) [y/n] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    $INSTALL firefox nautilus vlc
fi

# Create necessary directories
echo ""
echo -e "${BLUE}[*]${NC} Creating configuration directories..."
mkdir -p ~/.config/{hypr,hyprlock,waybar,rofi,cava,dunst,kitty}
mkdir -p ~/Pictures/Screenshots

# Set permissions
echo -e "${BLUE}[*]${NC} Setting permissions..."
chmod +x ~/.config/hypr/start.sh 2>/dev/null || true
chmod +x ~/.config/hypr/screenshot.sh 2>/dev/null || true
chmod +x ~/.config/rofi/powermenu.sh 2>/dev/null || true
chmod +x ~/.config/rofi/clipboard.sh 2>/dev/null || true

# Download optional themes/icons
echo ""
read -p "Download Papirus icon theme and Bibata cursor? [y/n] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    $INSTALL papirus-icon-theme bibata-cursor-theme
fi

# Configure environment
echo ""
echo -e "${BLUE}[*]${NC} Configuring environment variables..."
{
    echo ""
    echo "# Hyprland Environment"
    echo "export MOZ_ENABLE_WAYLAND=1"
    echo "export QT_QPA_PLATFORM=wayland"
    echo "export XDG_CURRENT_DESKTOP=Hyprland"
    echo "export XDG_SESSION_TYPE=wayland"
} >> ~/.bashrc 2>/dev/null || true

echo ""
echo -e "${GREEN}✓ Setup completed!${NC}"
echo ""
echo "📝 Next steps:"
echo "  1. Review ~/.config/hypr/hyprland.conf"
echo "  2. Start Hyprland from TTY: ${YELLOW}Hyprland${NC}"
echo "  3. Use Super+D to open application launcher"
echo "  4. Use Super+ENTER to open terminal"
echo ""
echo "📖 Documentation: See ${YELLOW}README.md${NC} for full details"
echo ""
echo -e "${BLUE}Happy hacking! 🚀${NC}"
