
{ pkgs, ... }:
{
  # Exclude Packages from GNOME
  environment.gnome.excludePackages = ([
    pkgs.gnome.epiphany
    pkgs.gnome-tour
    pkgs.gnome.geary
    pkgs.gnome-text-editor
    pkgs.gnome.gnome-music
    pkgs.gnome.gnome-maps
    pkgs.gnome.gnome-weather
  ]);

  # add gnome specific tweaks and extensions
  environment.systemPackages = [
    pkgs.gnome.gnome-tweaks
    pkgs.gnomeExtensions.dash-to-dock
  ];
  
}
