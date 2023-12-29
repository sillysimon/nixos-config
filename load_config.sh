#!/run/current-system/sw/bin/bash
# Script for quick building and loading the nixos config
config="default"
if [[ $1 != "" ]];
then
    config=$1
fi
sudo cp -r ./* /etc/nixos/
sudo nixos-rebuild switch --flake /etc/nixos#$config
