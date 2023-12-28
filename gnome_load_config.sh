#!/run/current-system/sw/bin/bash
# Script for quick loading and building the nixos config
sudo cp -r gnome/* /etc/nixos/
sudo nixos-rebuild switch

