
{ pkgs, ... }:
{
  # Enable the KDE Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
  
  # Exclude Packages from GNOME
  environment.gnome.excludePackages = ([
    pkgs.libsForQt5.elisa
  ]);

  # add gnome specific tweaks and extensions
  environment.systemPackages = [
  ];
  
}
