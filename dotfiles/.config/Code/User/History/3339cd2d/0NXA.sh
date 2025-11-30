#!/usr/bin/env bash
set -euo pipefail
# start-hyprland.sh
# Simple wrapper to launch Hyprland for the live user on tty1.

export XDG_RUNTIME_DIR="/run/user/1000"
mkdir -p "$XDG_RUNTIME_DIR"
chown 1000:100 "$XDG_RUNTIME_DIR" || true

exec runuser -l live -c 'dbus-run-session --suppress-output -- hyprland'
