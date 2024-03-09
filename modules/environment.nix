{ pkgs, ... }:
{
  #environment specific configuration (like fonts)
  environment.systemPackages = [
    #fonts
    pkgs.nerdfonts
    pkgs.corefonts
    pkgs.monaspace
    pkgs.comic-mono
    # fun programs
    pkgs.sl
    pkgs.cmatrix
    pkgs.cowsay
    pkgs.lolcat
    pkgs.fortune
    # system utilities
    pkgs.appimage-run
  ];
  #allow for dynamically linked binaries
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    # dynamic link libraries go here (not in the system packages)
  ];

  #enable AppImage support
  boot.binfmt.registrations.appimage = {
    wrapInterpreterInShell = false;
    interpreter = "${pkgs.appimage-run}/bin/appimage-run";
    recognitionType = "magic";
    offset = 0;
    mask = ''\xff\xff\xff\xff\x00\x00\x00\x00\xff\xff\xff'';
    magicOrExtension = ''\x7fELF....AI\x02'';
  };
}