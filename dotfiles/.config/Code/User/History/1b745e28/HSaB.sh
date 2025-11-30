#!/usr/bin/env bash
set -euo pipefail
# build.sh - build the Hyprland archiso
# This script validates prerequisites, prepares a local repo of packages and
# invokes mkarchiso to build an ISO using the `hyprland-releng-custom` profile.

PROFILE_DIR="hyprland-releng-custom"
WORKDIR="work"
OUTDIR="out"

reqs=(mkarchiso bsdtar xorriso repo-add pacman)
missing=()
for p in "${reqs[@]}"; do
  if ! command -v "$p" >/dev/null 2>&1; then
    missing+=($p)
  fi
done
if [ ${#missing[@]} -ne 0 ]; then
  echo "Missing required tools: ${missing[*]}" >&2
  echo "Install them on the host before running this script." >&2
  exit 1
fi

echo "Preparing build environment..."

# Optional: allow the builder to pre-fetch the dotfiles tarball to avoid network access
if [ -d dots-hyprland ]; then
  echo "Found local dots-hyprland directory; creating tarball for mkarchiso";
  tar -czf root/dots-hyprland.tar.gz -C dots-hyprland . || true
fi

echo "Make sure you have run 'sudo pacman -Sw -r /tmp/hyprland_repo <packages>' to populate a local repo,
or place a prepared repo at ${PROFILE_DIR}/airootfs/hyprland_repo. See README.md for details."

echo "Invoking mkarchiso..."
mkarchiso -v -w "$WORKDIR" -o "$OUTDIR" "$PROFILE_DIR"

echo "ISO created in $OUTDIR" 
