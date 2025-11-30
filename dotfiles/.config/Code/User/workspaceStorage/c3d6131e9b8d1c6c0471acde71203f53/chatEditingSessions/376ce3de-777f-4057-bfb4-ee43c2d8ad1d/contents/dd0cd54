# ╔═══════════════════════════════════════════════════════╗
# ║          HYPRLAND QUICK REFERENCE GUIDE               ║
# ║             Common Commands & Keybinds                ║
# ╚═══════════════════════════════════════════════════════╝

## ⌨️ KEYBOARD SHORTCUTS

### Window Management
```
Super + Q         Close window
Super + F         Fullscreen
Super + T         Toggle floating
Super + P         Pseudo tile
Super + J         Toggle split

Super + H/J/K/L   Navigate (Vim keys)
Super + Shift + H/J/K/L  Move window
Super + Ctrl + H/J/K/L   Resize window
```

### Workspaces
```
Super + 1-5       Go to workspace 1-5
Super + Shift + 1-5  Move window to workspace
Super + Tab       Next workspace
Super + Shift+Tab Previous workspace
```

### Applications
```
Super + Return    Terminal (Kitty)
Super + D         App launcher
Super + X         Run menu
Super + V         Clipboard history
Super + Print     Screenshot (full)
Super + Shift+P   Screenshot (area)
```

### Audio & Display
```
XF86AudioRaiseVolume   Increase volume 5%
XF86AudioLowerVolume   Decrease volume 5%
XF86AudioMute          Toggle mute
XF86MonBrightnessUp    Increase brightness
XF86MonBrightnessDown  Decrease brightness
```

## 🖱️ MOUSE ACTIONS

```
Super + LMB (drag)    Move window
Super + RMB (drag)    Resize window
Scroll wheel          Zoom (in some apps)
```

## 💻 TERMINAL COMMANDS

### Hyprland Control
```bash
hyprctl reload                    # Reload config
hyprctl dispatch exit             # Exit Hyprland
hyprctl clients                   # List open windows
hyprctl workspaces                # Show workspaces
hyprctl monitors                  # Show monitors
hyprctl binds                      # Show keybinds
hyprctl keyword                   # Set variable
```

### Configuration
```bash
nano ~/.config/hypr/hyprland.conf
nano ~/.config/waybar/config
nano ~/.config/rofi/launcher.rasi
```

### Monitoring
```bash
hyprctl debug profiling            # Performance stats
journalctl --user -u hyprland      # View logs
```

### File Management
```bash
ls ~/.config/hypr/                 # List Hyprland configs
cat ~/.config/hypr/hyprland.conf   # View main config
grep "bind = " ~/.config/hypr/hyprland.conf  # List keybinds
```

## 🎨 THEME CUSTOMIZATION

### Color Variables
- Primary: `#0088ff` (Cyan Blue)
- Dark: `#0055aa` (Deep Blue)
- Light: `#00d9ff` (Light Cyan)
- Background: `#050510` (Almost Black)

### Where to Change Colors

**Hyprland (Windows)**
```bash
~/.config/hypr/hyprland.conf
  col.active_border = rgb(0088ff)
  col.inactive_border = rgb(1a1a2e)
```

**Waybar (Top Bar)**
```bash
~/.config/waybar/style.css
  @bg0: #050510;
  @accent: #0088ff;
```

**Rofi (Launcher)**
```bash
~/.config/rofi/launcher.rasi
  accent: #0088ff;
```

**Terminal (Kitty)**
```bash
~/.config/kitty/kitty.conf
  color4 #0088ff
  background #050510
```

## 🔧 CONFIG FILE LOCATIONS

```
Hyprland main       ~/.config/hypr/hyprland.conf
Hyprlock           ~/.config/hyprlock/hyprlock.conf
Waybar             ~/.config/waybar/config
Waybar styles      ~/.config/waybar/style.css
Rofi launcher      ~/.config/rofi/launcher.rasi
Rofi powermenu     ~/.config/rofi/powermenu.rasi
Cava               ~/.config/cava/config
Dunst              ~/.config/dunst/dunstrc
Kitty              ~/.config/kitty/kitty.conf
```

## 📊 USEFUL ONE-LINERS

```bash
# Restart Hyprland
hyprctl reload

# List all windows
hyprctl clients | grep "class:"

# Get monitor info
hyprctl monitors | grep "Monitor"

# Set wallpaper
swaybg -i ~/wallpaper.jpg -m fill &

# Start floating terminal
kitty --title=floating_terminal &

# Screenshot and copy to clipboard
grim - | wl-copy

# Show battery info
cat /sys/class/power_supply/BAT0/capacity

# Check GPU acceleration
glxinfo | grep "direct rendering"

# List Hyprland versions
hyprctl version

# Enable GPU stats overlay
hyprctl debug profiling
```

## 🎯 WORKFLOW TIPS

### Development
1. Open VSCode: Super + D → search "code"
2. Open Terminal: Super + Return
3. Split windows: Super + J to toggle split
4. Use workspaces: Super+1 for dev, Super+2 for docs

### Gaming
1. Go to workspace 9: Super+9
2. Launch game
3. Full screen: Super+F
4. Back to normal: Super+F

### Multimedia
1. Open Spotify: Super+D → "spotify"
2. Floating window: Super+T
3. Keep on workspace 4: Files → Window Rules

### Multi-Monitor Setup
```bash
# Check monitors
hyprctl monitors

# Config in hyprland.conf
monitor = eDP-1, 1920x1080, 0x0, 1
monitor = HDMI-1, 1920x1080, 1920x0, 1
```

## 🆘 EMERGENCY COMMANDS

```bash
# Kill stuck application
pkill -9 app_name

# Emergency exit Hyprland
Super+M or hyprctl dispatch exit

# Restart Waybar
pkill waybar; waybar &

# Reload config without exiting
hyprctl reload

# Check system logs
journalctl --user -n 50

# Create backup
tar -czf backup.tar.gz ~/.config/hypr ~/.config/waybar ~/.config/rofi
```

---

**Pro Tip:** Save this file as a quick reference in your home directory!
