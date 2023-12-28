{ pkgs, ... }:
{
  #environment specific configuration (like fonts)
  environment.systemPackages = [
    pkgs.nerdfonts
    pkgs.corefonts
    pkgs.monaspace
    pkgs.comic-mono
  ];
}