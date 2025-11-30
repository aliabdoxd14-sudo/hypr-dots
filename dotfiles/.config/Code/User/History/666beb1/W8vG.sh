#!/usr/bin/env bash

# ╔═══════════════════════════════════════════════════════╗
# ║    HYPRLAND CONFIGURATION BACKUP & RESTORE SCRIPT    ║
# ║              For configuration management             ║
# ╚═══════════════════════════════════════════════════════╝

BACKUP_DIR="$HOME/.config/hypr/backups"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

# Create backup directory
mkdir -p "$BACKUP_DIR"

case "$1" in
    backup)
        echo "Creating backup of Hyprland configuration..."
        tar -czf "$BACKUP_DIR/hyprland_$TIMESTAMP.tar.gz" \
            ~/.config/hypr \
            ~/.config/hyprlock \
            ~/.config/waybar \
            ~/.config/rofi \
            ~/.config/cava \
            ~/.config/dunst \
            ~/.config/kitty
        echo "✓ Backup created: $BACKUP_DIR/hyprland_$TIMESTAMP.tar.gz"
        ;;
        
    restore)
        if [ -z "$2" ]; then
            echo "Available backups:"
            ls -lh "$BACKUP_DIR"/*.tar.gz | awk '{print $NF}'
            read -p "Enter backup filename to restore: " BACKUP_FILE
        else
            BACKUP_FILE="$2"
        fi
        
        if [ -f "$BACKUP_DIR/$BACKUP_FILE" ]; then
            echo "Restoring configuration from $BACKUP_FILE..."
            tar -xzf "$BACKUP_DIR/$BACKUP_FILE" -C ~
            echo "✓ Configuration restored!"
        else
            echo "✗ Backup file not found"
            exit 1
        fi
        ;;
        
    list)
        echo "Available backups:"
        ls -lh "$BACKUP_DIR"/*.tar.gz 2>/dev/null || echo "No backups found"
        ;;
        
    clean)
        read -p "Delete all backups? [y/n] " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            rm -rf "$BACKUP_DIR"/*
            echo "✓ Backups deleted"
        fi
        ;;
        
    *)
        echo "Hyprland Configuration Backup Manager"
        echo ""
        echo "Usage: $0 {backup|restore|list|clean} [backup-file]"
        echo ""
        echo "Commands:"
        echo "  backup              Create a backup"
        echo "  restore [file]      Restore from backup"
        echo "  list                List all backups"
        echo "  clean               Delete all backups"
        exit 1
        ;;
esac
