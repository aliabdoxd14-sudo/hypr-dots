This directory is used as the user skeleton for the live user and for newly
created users in installed systems.

The end-4 hyprland dotfiles will be copied into `/etc/skel/.config` at build
time by `customize_airootfs.sh`. If you want to override the dotfiles used in
the image, place a clone or tarball next to the build script and run the build.
