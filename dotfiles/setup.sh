#!/usr/bin/env bash

# Required packages (both repo + AUR if needed)
packages=(
  hyprland
  waybar
  hyprlock
  hyprpaper
  kitty
  dunst
  cava
  btop
  thunar
  rofi
)

echo "Checking for yay..."

# Check if yay is installed
if ! command -v yay &>/dev/null; then
    echo "yay not found. Installing yay..."

    # Install dependencies for building yay
    sudo pacman -S --needed --noconfirm base-devel git

    # Clone yay
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    cd /tmp/yay || exit
    makepkg -si --noconfirm
    cd - >/dev/null || exit
else
    echo "yay is already installed."
fi

echo ""
echo "Checking required packages..."

missing=()

# Check if each package exists from either pacman or yay
for pkg in "${packages[@]}"; do
    if ! pacman -Qi "$pkg" &>/dev/null && ! yay -Qi "$pkg" &>/dev/null; then
        missing+=("$pkg")
    fi
done

# Install missing packages
if [ ${#missing[@]} -ne 0 ]; then
    echo "Installing missing packages: ${missing[*]}"
    yay -S --noconfirm "${missing[@]}"
else
    echo "All packages already installed."
fi

echo ""
echo "Copying configuration files..."

if [ -d "./.config" ]; then
    mkdir -p "$HOME/.config"
    cp -r ./.config/* "$HOME/.config/"
else
    echo "Error: .config folder not found."
fi

echo ""
echo "Copying wallpaper..."

mkdir -p "$HOME/Pictures"
if [ -f "./wallpaper.png" ]; then
    cp ./wallpaper.png "$HOME/Pictures/"
else
    echo "Error: wallpaper.png not found."
fi

echo ""
read -p "Do you want to restart now? (y/n): " answer

if [[ "$answer" == "y" || "$answer" == "Y" ]]; then
    echo "Restarting..."
    systemctl reboot
else
    echo "No restart."
fi
