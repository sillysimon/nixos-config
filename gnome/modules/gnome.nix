
{ config, pkgs, ... }:
{
  environment.gnome.excludePackages = (with pkgs; [
    pkgs.gnome.epiphany
    pkgs.gnome-tour
    pkgs.gnome.geary
    pkgs.gnome-text-editor
    pkgs.gnome.gnome-music
    pkgs.gnome.gnome-maps
    pkgs.gnome.gnome-weather
  ]);
}
