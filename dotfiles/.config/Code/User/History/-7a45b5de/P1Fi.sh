#!/usr/bin/env bash

# ╔═══════════════════════════════════════════════════════╗
# ║           ROFI POWERMENU SCRIPT                       ║
# ║         Power Management Menu with Icons              ║
# ╚═══════════════════════════════════════════════════════╝

# Colors matching Hyprland theme
THEME_DIR="/home/ali/example config/.config/rofi"

case "$(rofi -dmenu -p "Power Menu" -theme "$THEME_DIR/powermenu.rasi" <<< $'Lock\nLogout\nReboot\nShutdown\nSuspend\nHibernate')" in
    "Lock")
        hyprlock
        ;;
    "Logout")
        hyprctl dispatch exit 0
        ;;
    "Reboot")
        systemctl reboot
        ;;
    "Shutdown")
        systemctl poweroff
        ;;
    "Suspend")
        systemctl suspend
        ;;
    "Hibernate")
        systemctl hibernate
        ;;
    *)
        exit 1
        ;;
esac
