#!/run/current-system/sw/bin/bash
# Script for quick loading and building the nixos config
sudo cp -r ./* /etc/nixos/
sudo nixos-rebuild test --flake /etc/nixos#default --dry-run

