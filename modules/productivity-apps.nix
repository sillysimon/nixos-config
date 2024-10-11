{ pkgs, ... }:
# in this module, productivity apps (cloud sync applications, annotation tools, editors, etc.)
# get installed
{
  environment.systemPackages = [
    pkgs.nextcloud-client
    pkgs.xournalpp
    pkgs.libreoffice-fresh
    pkgs.thunderbird
    pkgs.firefox
    pkgs.zettlr
    pkgs.kate
    pkgs.cryptomator
    pkgs.drawio
    pkgs.remmina
    pkgs.libsForQt5.kdenlive
    pkgs.localsend
];
}