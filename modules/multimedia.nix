{ pkgs, ...}:
{
  # this module configures multimedia apps
  environment.systemPackages = [
    pkgs.vlc
    pkgs.spotify
    pkgs.gimp
    pkgs.audacity
  ];
}