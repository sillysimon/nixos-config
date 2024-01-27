#!/run/current-system/sw/bin/bash
sudo nix flake update /etc/nixos/
./load_config.sh
