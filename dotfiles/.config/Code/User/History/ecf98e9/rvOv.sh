#!/usr/bin/env bash
set -euo pipefail
# This script is executed by mkarchiso while building the image. It runs
# inside the airootfs chroot. We use it to create the `live` user (UID 1000),
# bake in the end-4 dotfiles and enable services.

echo "==> customize_airootfs: creating live user and installing dotfiles"

# Create wheel group if it doesn't exist
getent group wheel >/dev/null || groupadd -r wheel

# Create user 'live' with UID 1000 (if not exists)
if ! id -u live >/dev/null 2>&1; then
  useradd -m -u 1000 -G wheel -s /bin/bash live
  passwd -d live || true
fi

# Ensure sudoers for wheel group
if ! grep -q "^%wheel ALL=(ALL) ALL" /etc/sudoers 2>/dev/null; then
  echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
fi

# Clone end-4 dotfiles into /usr/share/hyprland-dotfiles and copy to /etc/skel
DOTS_REPO="https://github.com/end-4/dots-hyprland"
DEST_SHARE="/usr/share/hyprland-dotfiles"
SKEL_DIR="/etc/skel"

if [ -d "${DEST_SHARE}" ]; then
  rm -rf "${DEST_SHARE}"
fi

echo "==> Cloning dotfiles from ${DOTS_REPO} (build-time)"
if command -v git >/dev/null 2>&1; then
  git clone --depth 1 "${DOTS_REPO}" "${DEST_SHARE}" || true
fi

# If clone failed (no network), allow builder to have pre-fetched tarball next to build script
if [ ! -d "${DEST_SHARE}" ] && [ -f "/root/dots-hyprland.tar.gz" ]; then
  mkdir -p "${DEST_SHARE}"
  tar -xzf /root/dots-hyprland.tar.gz -C "${DEST_SHARE}"
fi

if [ -d "${DEST_SHARE}" ]; then
  mkdir -p "${SKEL_DIR}/.config"
  cp -a "${DEST_SHARE}/.config" "${SKEL_DIR}/" 2>/dev/null || true
  cp -a "${DEST_SHARE}/wallpapers" "/usr/share/hyprland-wallpapers" 2>/dev/null || true
  chown -R 1000:100 "${SKEL_DIR}/.config" || true
fi

# Install helper scripts into /usr/local/bin in the image
cp -a /usr/local/bin/install_end4_dotfiles.sh /usr/local/bin/install_end4_dotfiles.sh || true
cp -a /usr/local/bin/hyprland-offline-installer /usr/local/bin/hyprland-offline-installer || true
chmod +x /usr/local/bin/install_end4_dotfiles.sh /usr/local/bin/hyprland-offline-installer || true

# Enable systemd services by creating symlinks in the proper wants directories
mkdir -p /etc/systemd/system/graphical.target.wants
mkdir -p /etc/systemd/system/multi-user.target.wants
if [ -f /usr/lib/systemd/system/hyprland-live.service ]; then
  ln -sf /usr/lib/systemd/system/hyprland-live.service /etc/systemd/system/graphical.target.wants/hyprland-live.service
fi
if [ -f /usr/lib/systemd/system/hyprland-installer.service ]; then
  ln -sf /usr/lib/systemd/system/hyprland-installer.service /etc/systemd/system/multi-user.target.wants/hyprland-installer.service
fi

echo "==> customize_airootfs finished"
