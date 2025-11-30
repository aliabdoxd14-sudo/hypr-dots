# ╔═══════════════════════════════════════════════════════╗
# ║    TROUBLESHOOTING & COMMON ISSUES GUIDE              ║
# ║              Quick Solutions Reference                ║
# ╚═══════════════════════════════════════════════════════╝

## 🐛 COMMON ISSUES AND SOLUTIONS

### 1. Black Screen on Startup
**Problem:** Screen stays black after selecting Hyprland
**Solution:**
```bash
# Try starting from TTY without Display Manager
VT-1: Ctrl+Alt+F1
$ Hyprland

# Or check logs:
journalctl -xe --user -u hyprland
```

### 2. Blur Effects Not Working
**Problem:** Blur is disabled or not visible
**Solution:**
```bash
# Check GPU acceleration:
glxinfo | grep "direct rendering"

# In hyprland.conf, ensure:
decoration {
    blur = true
    blur_size = 8
    blur_passes = 3
}

# For NVIDIA cards, may need additional drivers
nvidia-settings # adjust settings
```

### 3. Waybar Not Appearing
**Problem:** Top bar is missing
**Solution:**
```bash
# Restart waybar manually:
pkill waybar
waybar &

# Check for errors:
waybar -l debug 2>&1 | head -20

# Verify config syntax:
waybar --version
```

### 4. Keyboard Layout Not Working
**Problem:** Keyboard input is wrong language/layout
**Solution:**
```bash
# In hyprland.conf, set:
input {
    kb_layout = us,ar          # Multiple layouts
    kb_variant = dvorak        # Optional variant
    kb_options = grp:alt_shift_toggle  # Layout switch
}

# Or use:
setxkbmap -layout us,ar -option "grp:alt_shift_toggle"
```

### 5. Rofi Theme Issues
**Problem:** Rofi looks wrong or has wrong colors
**Solution:**
```bash
# Test rofi directly:
rofi -show drun -theme /path/to/launcher.rasi

# Check theme file syntax:
rofi -dump-theme

# Verify the theme path exists
ls -la ~/.config/rofi/launcher.rasi
```

### 6. Slow Performance
**Problem:** System feels sluggish, low FPS
**Solution:**
```bash
# Reduce blur:
blur_size = 4
blur_passes = 1

# Disable animations:
animations = false

# Check GPU usage:
gpu-load              # AMD
nvidia-smi           # NVIDIA

# Reduce monitor refresh rate
monitor = HDMI-1, 1920x1080, 0x0, 1, 60Hz
```

### 7. Monitor Not Detected
**Problem:** External monitor not showing
**Solution:**
```bash
# List connected monitors:
hyprctl monitors

# Or use:
xrandr
wlr-randr

# Manual configuration in hyprland.conf:
monitor = HDMI-1, 1920x1080, 1080x0, 1
monitor = eDP-1, 1920x1080, 0x1080, 1
```

### 8. Audio Not Working
**Problem:** No sound output, speakers muted
**Solution:**
```bash
# Check audio setup:
pactl list short sinks
wpctl status

# Unmute:
wpctl set-mute @DEFAULT_AUDIO_SINK@ 0

# Set default sink:
wpctl set-default-sink <sink_number>
```

### 9. Screen Lock Not Working
**Problem:** hyprlock crashes or doesn't lock
**Solution:**
```bash
# Test hyprlock directly:
hyprlock --debug

# Check configuration:
hyprctl reload

# Ensure fonts are installed:
fc-list | grep "JetBrains\|Noto"

# Reinstall hyprlock:
sudo pacman -S hyprlock --force
```

### 10. Rofi Launcher Not Opening
**Problem:** Super+D doesn't work
**Solution:**
```bash
# Check if rofi is installed:
which rofi

# Test manually:
rofi -show drun -theme ~/.config/rofi/launcher.rasi

# Verify keybind in hyprland.conf:
bind = $mainMod, D, exec, rofi -show drun -theme ~/.config/rofi/launcher.rasi
```

### 11. Terminal Freezes
**Problem:** Kitty becomes unresponsive
**Solution:**
```bash
# Reduce blur:
# In kitty.conf:
background_blur = 3  # Reduce from 5

# Check terminal processes:
ps aux | grep kitty

# Reinstall:
sudo pacman -S kitty
```

### 12. Notification Daemon Not Working
**Problem:** Dunst not showing notifications
**Solution:**
```bash
# Check if dunst is running:
pgrep dunst

# Start manually:
dunst &

# Test notification:
notify-send "Test" "Hello World"

# Check config:
dunstctl is-paused
dunstctl set-paused false
```

## 📊 PERFORMANCE MONITORING

### Check System Load
```bash
# Real-time monitoring
watch -n 0.5 'cat /proc/loadavg'

# Per-process monitoring
htop
```

### Check GPU Usage
```bash
# AMD
radeontop -l

# NVIDIA
watch nvidia-smi

# Intel
sudo intel_gpu_top
```

### Monitor Hyprland
```bash
# Check active windows
hyprctl clients

# Monitor performance
hyprctl debug profiling

# List keybinds
hyprctl binds
```

## 🔧 CONFIGURATION VALIDATION

### Test Configuration
```bash
# Validate hyprland.conf
hyprctl syntax

# Reload after changes
hyprctl reload

# Check for errors
journalctl --user -u hyprland -n 20
```

### Backup Before Changes
```bash
# Automatic backup
~/.config/hypr/backup.sh backup

# Restore if needed
~/.config/hypr/backup.sh restore hyprland_20240115_143022.tar.gz
```

## 🆘 GET HELP

### Useful Resources
- 📖 Hyprland Wiki: https://wiki.hyprland.org
- 💬 Discord: Hyprland Community Server
- 🐛 GitHub Issues: https://github.com/hyprwm/Hyprland/issues
- 👥 Reddit: r/hyprland

### Debug Information
```bash
# Collect debug info
hyprctl version
hyprctl config
journalctl --user -u hyprland -n 50 > ~/hyprland_debug.log

# Share with community for help
cat ~/hyprland_debug.log
```

---

**Remember:** Most issues are resolved by:
1. Reloading: `hyprctl reload`
2. Restarting: `exit` then `Hyprland`
3. Checking logs: `journalctl --user`
4. Reading documentation: `hyprctl help`
