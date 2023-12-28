
{ pkgs, ... }:
{
  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;
  
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
