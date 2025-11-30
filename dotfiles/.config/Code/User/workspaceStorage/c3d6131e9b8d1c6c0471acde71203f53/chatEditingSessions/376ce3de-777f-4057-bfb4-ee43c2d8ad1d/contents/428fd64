# ╔═══════════════════════════════════════════════════════╗
# ║          ADVANCED HYPRLAND TIPS & TRICKS              ║
# ║              Pro-level customizations                 ║
# ╚═══════════════════════════════════════════════════════╝

## 🚀 PERFORMANCE TWEAKS

### Reduce Blur for Better FPS
```bash
# In ~/.config/hypr/hyprland.conf:
decoration {
    blur {
        size = 4
        passes = 1
        noise = 0.0
    }
}
```

### Disable Animations Entirely
```bash
animations {
    enabled = no
}
```

### VRR (Variable Refresh Rate) for Gaming
```bash
decoration {
    screen_shader = ""
}
# Then use freesync or gsync in your GPU drivers
```

## 🎮 GAMING OPTIMIZATIONS

### Create Gaming Workspace
```bash
# Add to hyprland.conf:
workspace = 9, name:Game, rounding:false

# Disable effects for gaming:
windowrulev2 = noanim, workspace:9
windowrulev2 = bordersize 0, workspace:9
windowrulev2 = fullscreen, class:^(steam_app_)$
```

### Launch Games Directly
```bash
# Create .desktop file in ~/.local/share/applications/
[Desktop Entry]
Name=Game Launcher
Exec=hyprctl dispatch workspace 9 && steam steam://run/GAME_ID
Categories=Game
```

## 🎨 ADVANCED THEMING

### Color Gradients
```bash
# In hyprland.conf, use gradients for borders:
col.active_border = rgb(0088ff) rgb(0055aa) 45deg
```

### Custom Font Rendering
```bash
# In waybar config.json:
"font-size": 14,
"font-family": "JetBrains Mono, Noto Color Emoji"
```

### Transparent Terminal
```bash
# In kitty.conf:
background_opacity = 0.8
background_blur = 5
```

## 🔐 SECURITY ENHANCEMENTS

### Auto-lock on Idle
```bash
# Add to ~/.config/hypr/hyprland.conf:
exec = swayidle -w before-sleep 'hyprlock'

# Or using xidlehook:
exec = xidlehook --not-when-fullscreen --not-when-audio \
  --timer 600 'hyprlock' ''
```

### Hide Cursor When Idle
```bash
input {
    # ... other settings ...
    mouse_warping = off  # Disable mouse jump
}

# Use unclutter for cursor hiding:
exec-once = unclutter --timeout 2
```

## 📱 MULTI-MONITOR WORKFLOWS

### Workspace per Monitor
```bash
# In hyprland.conf:
monitor = eDP-1, 1920x1080, 0x0, 1.25
monitor = HDMI-1, 3840x2160, 1920x0, 2

# Assign workspaces to monitors:
workspace = 1, monitor:eDP-1
workspace = 2, monitor:HDMI-1
workspace = 3, monitor:HDMI-1
```

### Quick Monitor Swap
```bash
# Add keybind:
bind = $mainMod ALT, R, exec, ~/.config/hypr/rotate-monitors.sh
```

## 🎯 AUTOMATION SCRIPTS

### Auto-start Applications
```bash
# Create ~/.config/hypr/autostart.sh:
#!/bin/bash
sleep 2 && firefox &
sleep 3 && discord &
sleep 1 && spotify &
```

### Workspace Auto-arrange
```bash
# Create ~/.config/hypr/autolayout.sh:
#!/bin/bash
hyprctl keyword general:layout dwindle
hyprctl keyword layout dwindle preserve_split yes
```

## 🔊 AUDIO CONFIGURATION

### PipeWire Advanced Settings
```bash
# Create ~/.config/pipewire/pipewire.conf.d/99-custom.conf:
[...]
audio.channels = 2
audio.position = [ FL FR ]
```

### Audio Equalizer
```bash
# Install: sudo pacman -S easyeffects
easyeffects  # GUI for audio EQ
```

## 🌐 NETWORK INTEGRATION

### Quick VPN Switch
```bash
# Add to rofi powermenu:
bind = $mainMod SHIFT, V, exec, rofi -show vpn -theme ~/.config/rofi/launcher.rasi
```

## 🖼️ WALLPAPER MANAGEMENT

### Dynamic Wallpaper Changer
```bash
# Install: sudo pacman -S swaybg
# Add to hyprland.conf:
exec-once = swaybg -i ~/Pictures/wallpaper.jpg -m fill

# Or use dynamic changer:
exec-once = ~/.config/hypr/wallpaper-daemon.sh
```

### Create Wallpaper Rotator
```bash
#!/bin/bash
# ~/.config/hypr/wallpaper-daemon.sh
while true; do
    find ~/Pictures/Wallpapers -type f | shuf | head -1 | \
    xargs -I {} swaybg -i {} -m fill &
    sleep 1800  # Change every 30 minutes
done
```

## 🎬 SCREENSHOTTING & RECORDING

### Setup Recording
```bash
# Install: sudo pacman -S wf-recorder
# Add keybind:
bind = $mainMod ALT, R, exec, wf-recorder -f ~/Videos/recording_$(date +%s).mp4

# Stop with: Ctrl+C
```

### GIF Recording
```bash
# Install: sudo pacman -S gifski wf-recorder
# Function:
record-gif() {
    wf-recorder -f temp.mkv && \
    ffmpeg -i temp.mkv -vf "fps=10,scale=1280:-1:flags=lanczos" -c:v libx264 -c:a aac output.gif
}
```

## 💾 BACKUP & SYNC

### Automatic Config Backup
```bash
# Add to ~/.bashrc or ~/.config/fish/config.fish:
alias backup-hyprland='tar -czf ~/.config/hypr/backup_$(date +%s).tar.gz ~/.config/hypr ~/.config/waybar ~/.config/rofi'
```

### Sync to Cloud
```bash
# Backup to Nextcloud/Syncthing:
exec-once = syncthing --no-browser

# Or manual sync:
rsync -av ~/.config/hypr ~/Cloud/backups/
```

## 🛠️ DEVELOPER TOOLS

### Enable Debug Mode
```bash
# Launch with debug:
Hyprland -d 2>&1 | tee ~/hyprland_debug.log

# Or enable profiling:
hyprctl debug profiling
```

### Create Custom Keybind
```bash
# Complex keybind with notification:
bind = $mainMod SHIFT, S, exec, \
    grim -g "$(slurp)" - | \
    swappy -f - && \
    notify-send "Screenshot taken!"
```

## 🎨 COLOR PALETTE EXAMPLES

### Dracula Theme Colors
```bash
col.active_border = rgb(ff79c6)    # Pink
col.inactive_border = rgb(282a36)  # Dark background
background = #282a36
foreground = #f8f8f2
```

### Nord Theme Colors
```bash
col.active_border = rgb(88c0d0)    # Frost cyan
col.inactive_border = rgb(2e3440)  # Polar night
background = #2e3440
foreground = #d8dee9
```

### Catppuccin Theme Colors
```bash
col.active_border = rgb(89dceb)    # Sky blue
col.inactive_border = rgb(313244)  # Surface0
background = #1e1e2e
foreground = #cdd6f4
```

## 🔄 INTEGRATIONS

### Calendar in Waybar
```json
"clock": {
    "format": "{:%H:%M}",
    "format-alt": "{:%Y-%m-%d}",
    "tooltip-format": "<big>{calendar}</big>"
}
```

### Media Controls in Waybar
```json
"custom/media": {
    "format": "♪ {}",
    "exec": "playerctl metadata --format '{{artist}} - {{title}}'",
    "on-click": "playerctl play-pause"
}
```

## 🎯 PRODUCTIVITY TIPS

### Window Groups
```bash
# Create window grouping keybind:
bind = $mainMod, G, togglegroup
bind = $mainMod, Tab, changegroupactive
```

### Super Zoom
```bash
# Camera zoom effect:
bind = $mainMod, Z, exec, hyprctl dispatch fullscreen 1
```

### Night Mode Toggle
```bash
# Add script for blue light filter:
exec-once = ~/.config/hypr/toggle-nightmode.sh
```

---

**Remember:** Always backup your config before trying advanced modifications!

Happy customizing! 🚀✨
