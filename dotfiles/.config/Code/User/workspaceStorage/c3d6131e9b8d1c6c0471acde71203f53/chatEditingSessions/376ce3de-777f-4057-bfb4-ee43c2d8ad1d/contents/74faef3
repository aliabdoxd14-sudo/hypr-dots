#!/usr/bin/env bash

# ╔═══════════════════════════════════════════════════════╗
# ║      HYPRLAND INSTALLATION QUICK START GUIDE          ║
# ║              Step-by-step instructions                ║
# ╚═══════════════════════════════════════════════════════╝

# Step 1: Copy configuration files
echo "Step 1: Installing configuration files..."
cp -r ~/.config/hypr ~/.config/hyprlock ~/.config/waybar ~/.config/rofi \
      ~/.config/cava ~/.config/dunst ~/.config/kitty ~/.config/

# Step 2: Make scripts executable
echo "Step 2: Setting script permissions..."
chmod +x ~/.config/hypr/*.sh
chmod +x ~/.config/rofi/*.sh

# Step 3: Create necessary directories
echo "Step 3: Creating directories..."
mkdir -p ~/Pictures/Screenshots
mkdir -p ~/Downloads
mkdir -p ~/.local/share/hyprland

# Step 4: Optional - Download wallpaper
echo "Step 4: Optional - Downloading wallpaper..."
read -p "Download wallpaper? [y/n] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    mkdir -p ~/Pictures/Wallpapers
    # You can add wget command here to download a default wallpaper
fi

# Step 5: Configure shell
echo "Step 5: Configuring shell environment..."
read -p "Configure Fish shell? [y/n] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "source ~/.config/fish/hyprland.fish" >> ~/.config/fish/config.fish
    echo "✓ Fish shell configured!"
fi

# Step 6: Done
echo ""
echo "╔════════════════════════════════════════════════════╗"
echo "║   ✓ Installation complete!                         ║"
echo "╠════════════════════════════════════════════════════╣"
echo "║ To start Hyprland:                                 ║"
echo "║   1. Logout from your current desktop             ║"
echo "║   2. Select 'Hyprland' at login screen            ║"
echo "║   3. Or run: startx hyprland (from TTY)           ║"
echo "║                                                    ║"
echo "║ First time tips:                                   ║"
echo "║   • Super key = Windows key                        ║"
echo "║   • Super + D = Open app launcher                 ║"
echo "║   • Super + ENTER = Open terminal                 ║"
echo "║   • Super + M = Exit Hyprland                     ║"
echo "║                                                    ║"
echo "║ Need help?                                         ║"
echo "║   • Read README.md for full documentation          ║"
echo "║   • Check ~/.config/hypr/hyprland.conf            ║"
echo "║   • Visit https://wiki.hyprland.org               ║"
echo "╚════════════════════════════════════════════════════╝"
