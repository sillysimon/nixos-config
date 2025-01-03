
{ pkgs, ... }:
{
  # Enable the GNOME Desktop Environment
  services.xserver.desktopManager.gnome.enable = true;

  # Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;
  
  # Exclude Packages from GNOME
  environment.gnome.excludePackages = ([
    pkgs.epiphany
    pkgs.gnome-tour
    pkgs.geary
    pkgs.gnome-text-editor
    pkgs.gnome-music
    pkgs.gnome-maps
    pkgs.gnome-weather
    pkgs.totem
  ]);

  # add gnome specific tweaks and extensions
  environment.systemPackages = [
    pkgs.gnome-tweaks
    pkgs.gnomeExtensions.dash-to-dock
    pkgs.gnomeExtensions.appindicator
    pkgs.gnomeExtensions.gsconnect
    pkgs.gnomeExtensions.desktop-cube
    pkgs.gnome-photos
    # package providing sensor data for auto screen rotation 
    pkgs.gnomeExtensions.screen-rotate
  ];
  
  #enable iio-sensors-proxy for screen rotation
  hardware.sensor.iio.enable = true;

}
