#!/usr/bin/env bash

# ╔═══════════════════════════════════════════════════════╗
# ║       HYPRLAND STARTUP SCRIPT - INITIALIZATION        ║
# ║              Run on startup with Hyprland            ║
# ╚═══════════════════════════════════════════════════════╝

# Enable XDG Desktop Portal
systemctl --user start xdg-desktop-portal.service
systemctl --user start xdg-desktop-portal-hyprland.service

# Start Polkit Authentication Agent
/usr/lib/polkit-kde-authentication-agent-1 &

# Set screen lock timeout (30 minutes)
loginctl set-idle-hint false

# Network Manager
systemctl --user start NetworkManager

# Bluetooth (if available)
if command -v bluetoothctl &> /dev/null; then
    systemctl --user start bluetooth
fi

# PulseAudio/PipeWire
systemctl --user start pipewire pipewire-pulse wireplumber

# Import environment
export DBUS_SESSION_BUS_ADDRESS=unix:path=$XDG_RUNTIME_DIR/bus

# Notification daemon
dunst &

# Waybar
waybar &

# Optional: Start applications
# firefox &
# spotify &
# discord &

# Set wallpaper (if swaybg is available)
if command -v swaybg &> /dev/null; then
    swaybg -i /usr/share/backgrounds/xfce/xfce-blue.jpg -m fill &
fi

# Optional: Start a background music player
# mpd &

echo "Hyprland environment initialized successfully!"
