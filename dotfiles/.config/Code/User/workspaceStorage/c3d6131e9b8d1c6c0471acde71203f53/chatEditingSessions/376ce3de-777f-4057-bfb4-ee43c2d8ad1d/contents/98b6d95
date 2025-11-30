#!/usr/bin/env bash

# ╔═══════════════════════════════════════════════════════╗
# ║     HYPRLAND BLUE THEME - COMPLETE SETUP SCRIPT      ║
# ║            Automated installation & setup             ║
# ╚═══════════════════════════════════════════════════════╝

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m'

# Configuration
CONFIG_SOURCE="/home/ali/example config"
CONFIG_TARGET="$HOME/.config"
BACKUP_DIR="$HOME/.config/backup_$(date +%Y%m%d_%H%M%S)"

# ASCII Banner
show_banner() {
    clear
    echo -e "${CYAN}"
    cat << "EOF"
╔═══════════════════════════════════════════════════════╗
║                                                       ║
║     🔷 HYPRLAND BLUE THEME - SETUP WIZARD 🔷        ║
║                                                       ║
║          Complete Wayland Environment Setup          ║
║                                                       ║
╚═══════════════════════════════════════════════════════╝
EOF
    echo -e "${NC}"
}

# Step functions
step_welcome() {
    echo -e "${BLUE}[1/6]${NC} ${CYAN}Welcome${NC}"
    echo ""
    echo "This wizard will install a complete Hyprland setup with:"
    echo "  • Modern Blue Theme 🔷"
    echo "  • Blur Effects ✨"
    echo "  • Optimized Performance ⚡"
    echo "  • Full Documentation 📚"
    echo ""
    read -p "Continue? [y/n] " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo -e "${RED}Setup cancelled.${NC}"
        exit 1
    fi
}

step_dependencies() {
    echo -e "${BLUE}[2/6]${NC} ${CYAN}Checking Dependencies${NC}"
    echo ""
    
    local missing_deps=()
    local required_apps=("hyprland" "waybar" "rofi" "dunst" "kitty" "cava")
    
    for app in "${required_apps[@]}"; do
        if ! command -v "$app" &> /dev/null; then
            missing_deps+=("$app")
        fi
    done
    
    if [ ${#missing_deps[@]} -eq 0 ]; then
        echo -e "${GREEN}✓${NC} All dependencies are installed!"
    else
        echo -e "${YELLOW}⚠${NC} Missing applications: ${missing_deps[*]}"
        read -p "Install now? [y/n] " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            if command -v pacman &> /dev/null; then
                sudo pacman -S --noconfirm "${missing_deps[@]}"
            elif command -v apt &> /dev/null; then
                sudo apt install -y "${missing_deps[@]}"
            elif command -v dnf &> /dev/null; then
                sudo dnf install -y "${missing_deps[@]}"
            fi
        fi
    fi
    echo ""
}

step_backup() {
    echo -e "${BLUE}[3/6]${NC} ${CYAN}Backup Existing Configuration${NC}"
    echo ""
    
    if [ -d "$HOME/.config/hypr" ] || [ -d "$HOME/.config/waybar" ]; then
        echo -e "${YELLOW}⚠${NC} Existing configurations found."
        read -p "Create backup? [y/n] " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            mkdir -p "$BACKUP_DIR"
            cp -r "$HOME/.config/hypr" "$BACKUP_DIR/" 2>/dev/null || true
            cp -r "$HOME/.config/waybar" "$BACKUP_DIR/" 2>/dev/null || true
            cp -r "$HOME/.config/rofi" "$BACKUP_DIR/" 2>/dev/null || true
            echo -e "${GREEN}✓${NC} Backup created at: $BACKUP_DIR"
        fi
    else
        echo -e "${GREEN}✓${NC} No existing configuration to backup"
    fi
    echo ""
}

step_copy_config() {
    echo -e "${BLUE}[4/6]${NC} ${CYAN}Copy Configuration Files${NC}"
    echo ""
    
    # Check if source exists
    if [ ! -d "$CONFIG_SOURCE/.config" ]; then
        echo -e "${RED}✗${NC} Configuration source not found!"
        exit 1
    fi
    
    # Create directories
    mkdir -p "$CONFIG_TARGET"/{hypr,hyprlock,waybar,rofi,cava,dunst,kitty,fish}
    
    # Copy files
    echo "Copying configuration files..."
    cp -r "$CONFIG_SOURCE/.config/hypr"/* "$CONFIG_TARGET/hypr/" 2>/dev/null || true
    cp -r "$CONFIG_SOURCE/.config/hyprlock"/* "$CONFIG_TARGET/hyprlock/" 2>/dev/null || true
    cp -r "$CONFIG_SOURCE/.config/waybar"/* "$CONFIG_TARGET/waybar/" 2>/dev/null || true
    cp -r "$CONFIG_SOURCE/.config/rofi"/* "$CONFIG_TARGET/rofi/" 2>/dev/null || true
    cp -r "$CONFIG_SOURCE/.config/cava"/* "$CONFIG_TARGET/cava/" 2>/dev/null || true
    cp -r "$CONFIG_SOURCE/.config/dunst"/* "$CONFIG_TARGET/dunst/" 2>/dev/null || true
    cp -r "$CONFIG_SOURCE/.config/kitty"/* "$CONFIG_TARGET/kitty/" 2>/dev/null || true
    
    # Set permissions
    chmod +x "$CONFIG_TARGET/hypr"/*.sh 2>/dev/null || true
    chmod +x "$CONFIG_TARGET/rofi"/*.sh 2>/dev/null || true
    
    # Create screenshot directory
    mkdir -p "$HOME/Pictures/Screenshots"
    
    echo -e "${GREEN}✓${NC} Configuration files copied successfully"
    echo ""
}

step_environment() {
    echo -e "${BLUE}[5/6]${NC} ${CYAN}Configure Environment${NC}"
    echo ""
    
    local shell_config="$HOME/.bashrc"
    
    # Detect shell
    if [ -f "$HOME/.config/fish/config.fish" ]; then
        shell_config="$HOME/.config/fish/config.fish"
    elif [ -f "$HOME/.zshrc" ]; then
        shell_config="$HOME/.zshrc"
    fi
    
    # Add environment variables if not already present
    if ! grep -q "HYPRLAND_CONFIG" "$shell_config" 2>/dev/null; then
        {
            echo ""
            echo "# Hyprland Environment Variables"
            echo "export MOZ_ENABLE_WAYLAND=1"
            echo "export QT_QPA_PLATFORM=wayland"
            echo "export XDG_CURRENT_DESKTOP=Hyprland"
            echo "export XDG_SESSION_TYPE=wayland"
            echo "export HYPRLAND_CONFIG=$CONFIG_TARGET/hypr"
        } >> "$shell_config"
        echo -e "${GREEN}✓${NC} Environment variables configured"
    else
        echo -e "${GREEN}✓${NC} Environment already configured"
    fi
    echo ""
}

step_final() {
    echo -e "${BLUE}[6/6]${NC} ${CYAN}Installation Complete!${NC}"
    echo ""
    echo -e "${MAGENTA}╔═════════════════════════════════════════════════════╗${NC}"
    echo -e "${MAGENTA}║${NC}  🎉 Hyprland Blue Theme is ready to use!         ${MAGENTA}║${NC}"
    echo -e "${MAGENTA}╠═════════════════════════════════════════════════════╣${NC}"
    echo ""
    echo "  📚 Documentation:"
    echo "     • README.md - Complete guide"
    echo "     • QUICK_REFERENCE.md - Quick commands"
    echo "     • TROUBLESHOOTING.md - Common issues"
    echo "     • ADVANCED_TIPS.md - Pro tips"
    echo ""
    echo "  🚀 Next Steps:"
    echo "     1. Logout from your current session"
    echo "     2. Select 'Hyprland' at login screen"
    echo "     3. Press Super+D to open app launcher"
    echo "     4. Press Super+Enter to open terminal"
    echo ""
    echo "  ⌨️ Quick Keys:"
    echo "     Super+D       → App launcher"
    echo "     Super+Enter   → Terminal"
    echo "     Super+Q       → Close window"
    echo "     Super+F       → Fullscreen"
    echo "     Super+1-5     → Workspaces"
    echo ""
    echo "  💾 Backup Location:"
    if [ -d "$BACKUP_DIR" ]; then
        echo "     $BACKUP_DIR"
    else
        echo "     (No backup created)"
    fi
    echo ""
    echo -e "${MAGENTA}╚═════════════════════════════════════════════════════╝${NC}"
    echo ""
    
    read -p "Open documentation? [y/n] " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        if command -v xdg-open &> /dev/null; then
            xdg-open "$CONFIG_SOURCE/README.md" &
        elif command -v less &> /dev/null; then
            less "$CONFIG_SOURCE/README.md"
        else
            cat "$CONFIG_SOURCE/README.md"
        fi
    fi
}

# Main execution
main() {
    show_banner
    
    step_welcome
    step_dependencies
    step_backup
    step_copy_config
    step_environment
    step_final
    
    echo -e "${GREEN}Setup completed successfully! 🚀${NC}"
    echo ""
    exit 0
}

# Run main
main "$@"
