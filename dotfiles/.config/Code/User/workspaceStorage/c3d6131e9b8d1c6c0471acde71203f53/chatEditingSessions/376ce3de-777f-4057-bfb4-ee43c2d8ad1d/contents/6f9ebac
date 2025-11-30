# ╔═══════════════════════════════════════════════════════╗
# ║     FISH SHELL CONFIGURATION FOR HYPRLAND              ║
# ║         Add this to ~/.config/fish/config.fish         ║
# ╚═══════════════════════════════════════════════════════╝

# Hyprland Environment Variables
export MOZ_ENABLE_WAYLAND 1
export QT_QPA_PLATFORM wayland
export QT_QPA_PLATFORMTHEME qt6ct
export XDG_CURRENT_DESKTOP Hyprland
export XDG_SESSION_TYPE wayland
export XCURSOR_THEME Bibata-Modern-Ice
export XCURSOR_SIZE 24
export EDITOR nano
export VISUAL nano
export BROWSER firefox
export TERMINAL kitty

# Aliases for common commands
alias hypr-reload='hyprctl reload'
alias hypr-kill='hyprctl kill'
alias hypr-info='hyprctl clients'
alias hypr-workspaces='hyprctl workspaces'

# Custom function to quickly open rofi launcher
function launcher
    rofi -show drun -theme /home/ali/example\ config/.config/rofi/launcher.rasi
end

# Screenshot function
function screenshot
    ~/.config/hypr/screenshot.sh $argv
end

# Power menu function
function powermenu
    ~/.config/rofi/powermenu.sh
end

# Quick terminal resize and position
function floating-terminal
    kitty --title=floating_terminal &
end

# Show system info
function sys-info
    echo "═════════════════════════════════════"
    echo "  HYPRLAND SYSTEM INFORMATION"
    echo "═════════════════════════════════════"
    echo "Distribution: $(cat /etc/os-release | grep PRETTY_NAME | cut -d= -f2 | tr -d '\"')"
    echo "Kernel: $(uname -r)"
    echo "Uptime: $(uptime -p)"
    echo "CPU: $(grep -m1 'model name' /proc/cpuinfo | awk -F: '{print $2}' | xargs)"
    echo "RAM: $(free -h | awk 'NR==2{print $2}')"
    echo "GPU: $(lspci | grep -i 'VGA\\|3D' | cut -d: -f3 | xargs)"
    echo "═════════════════════════════════════"
end

# Greeting
echo "🔷 Welcome to Hyprland Blue Theme!"
echo "   Type 'launcher' to open app menu"
echo "   Type 'sys-info' for system details"
