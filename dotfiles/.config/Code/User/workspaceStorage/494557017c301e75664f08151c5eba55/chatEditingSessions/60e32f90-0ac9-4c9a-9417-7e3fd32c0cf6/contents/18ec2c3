# hyprland-releng-custom (archiso profile)

This folder is an archiso profile that builds a Hyprland-based live ISO.

Structure (key files):

- `packages.x86_64`: package list included in the image.
- `pacman.conf`: pacman configuration template enabling the local `hyprland_iso` repo.
- `airootfs/`: files and scripts baked into the live image.
  - `root/customize_airootfs.sh`: executed by mkarchiso to create the `live` user and bake dotfiles.
  - `usr/local/bin/install_end4_dotfiles.sh`: script to copy baked dotfiles into a target root.
  - `usr/local/bin/hyprland-offline-installer`: the interactive installer (dialog-based).
  - `usr/local/bin/start-hyprland.sh`: wrapper to launch Hyprland for the `live` user.
  - `usr/lib/systemd/system/hyprland-live.service`: autostart Hyprland in live session.
  - `usr/lib/systemd/system/hyprland-installer.service`: oneshot installer service.
  - `etc/systemd/system/getty@tty1.service.d/autologin.conf`: autologin configuration.

Build instructions (host):

1. Install build prerequisites on the host:

```fish
sudo pacman -S --needed archiso mkinitcpio xorriso bsdtar repo-tools grub efibootmgr
```

2. Optionally prefetch dotfiles locally:

```fish
# (optional) clone a local copy to avoid network during mkarchiso
git clone https://github.com/end-4/dots-hyprland dots-hyprland
```

3. Prepare an offline repository of packages (recommended):

You can populate a directory `hyprland_repo` with all required `.pkg.tar.zst`
files and a repo database created with `repo-add`. The installer expects this
to be available on the ISO at `/hyprland_repo`.

Example to download packages to a temp cache:

```fish
mkdir -p /tmp/hyprland_repo
# Use pacman -Sw to download packages to cache (host must have internet)
cat hyprland-releng-custom/packages.x86_64 | xargs -r -n1 sudo pacman -Sw --cachedir /tmp/hyprland_repo
repo-add /tmp/hyprland_repo/hyprland.db.tar.gz /tmp/hyprland_repo/*.pkg.tar.zst
```

Then copy `/tmp/hyprland_repo` into `hyprland-releng-custom/airootfs/hyprland_repo` before building.

4. Build the ISO:

```fish
./build.sh
```

Customization:
- To change the package list, edit `packages.x86_64`.
- To update baked dotfiles, put a `dots-hyprland` directory next to `build.sh` or allow network access during the build so `git clone` in `customize_airootfs.sh` can fetch them.

Auto-login and installer:
- `getty@tty1.service.d/autologin.conf` enables autologin of the `live` user.
- `hyprland-installer.service` is enabled in the live image (via `customize_airootfs.sh`) and will run the `hyprland-offline-installer` once on the live system.

Notes & troubleshooting:
- If you need to force offline-only behavior for building, prefetch the dotfiles tarball `root/dots-hyprland.tar.gz` and the `hyprland_repo` directory before running `mkarchiso`.
- The installer uses `dialog` and `nmcli` (NetworkManager). Ensure these packages are installed in the profile.
