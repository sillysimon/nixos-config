
{ pkgs, ... }:
{
  # Enable the KDE Desktop Environment.
  services.desktopManager.plasma6.enable = true;
  
  # Exclude Packages from KDE
  environment.plasma6.excludePackages = ([
    pkgs.libsForQt5.elisa
    pkgs.libsForQt5.khelpcenter
  ]);

  # add kde specific tweaks and extensions
  environment.systemPackages = [
    # virtual keyboard for touchscreens
    pkgs.maliit-keyboard
    # package providing sensor data for auto screen rotation 
    pkgs.iio-sensor-proxy
    pkgs.gjs
  ];
  
  #allow theme changes by enabling dconf
  programs.dconf.enable = true;
  
  #enable iio-sensors-proxy for screen rotation
  hardware.sensor.iio.enable = true;

  #add bluetooth support, may not be necessary and leaves an ugly icon in the tray
  #services.blueman.enable = true;
  
}
