#!/usr/bin/env bash
set -euo pipefail
# install_end4_dotfiles.sh
# Usage: run as root to copy baked dotfiles into a target root (e.g., / or /mnt)
# This script is installed both in the live image and within installed systems by
# the installer. It supports an optional argument: target root path (default "/").

TARGET_ROOT="${1:-/}"

echo "Installing end-4 hyprland dotfiles into ${TARGET_ROOT}"

SRC="/usr/share/hyprland-dotfiles"
if [ ! -d "${SRC}" ]; then
  echo "No baked dotfiles found at ${SRC}. Aborting." >&2
  exit 1
fi

# Copy into /etc/skel so future users get them
mkdir -p "${TARGET_ROOT}/etc/skel"
cp -a "${SRC}/.config" "${TARGET_ROOT}/etc/skel/" 2>/dev/null || true

# Copy wallpapers/icons into /usr/share
if [ -d "${SRC}/wallpapers" ]; then
  mkdir -p "${TARGET_ROOT}/usr/share/hyprland-wallpapers"
  cp -a "${SRC}/wallpapers" "${TARGET_ROOT}/usr/share/hyprland-wallpapers/"
fi

# If run inside a chroot for a specific user, copy dotfiles into that user's home
if [ -n "${SUDO_USER:-}" ]; then
  TARGET_USER_HOME="$((getent passwd "${SUDO_USER}" | cut -d: -f6) ?: /home/${SUDO_USER})"
  if [ -d "${TARGET_USER_HOME}" ]; then
    mkdir -p "${TARGET_USER_HOME}/.config"
    cp -a "${SRC}/.config" "${TARGET_USER_HOME}/.config/" 2>/dev/null || true
    chown -R "${SUDO_USER}:" "${TARGET_USER_HOME}/.config" || true
  fi
fi

echo "Dotfiles installation complete."
