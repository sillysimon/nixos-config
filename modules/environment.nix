{ pkgs, ... }:
{
  #environment specific configuration (like fonts)
  environment.systemPackages = [
    pkgs.nerdfonts
    pkgs.corefonts
    pkgs.monaspace
    pkgs.comic-mono
    pkgs.sl
    pkgs.cmatrix
    pkgs.cowsay
    pkgs.lolcat
    pkgs.fortune
  ];
  #allow for dynamically linked binaries
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    # dynamic libraries go here (not in the system packages)
  ];
}