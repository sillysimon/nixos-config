
{ pkgs, ... }:
{
  # Enable the KDE Desktop Environment.
  services.xserver.desktopManager.plasma5.enable = true;
  
  # Exclude Packages from KDE
  environment.plasma5.excludePackages = ([
    pkgs.libsForQt5.elisa
    pkgs.libsForQt5.khelpcenter
  ]);

  # add kde specific tweaks and extensions
  environment.systemPackages = [
    pkgs.maliit-keyboard
  ];
  
  #allow theme changes by enabling dconf
  programs.dconf.enable = true;

  #add bluetooth support
  #services.blueman.enable = true;
  
}
