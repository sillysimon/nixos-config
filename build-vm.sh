#!/run/current-system/sw/bin/bash
# Script for quick building and loading the nixos config
config="default"
if [[ $1 != "" ]];
then
    config=$1
fi
sudo cp -r ./* /etc/nixos/
sudo nice -n 19 nixos-rebuild build-vm --flake /etc/nixos#$config

