{ pkgs, ...}:
{
  # this module configures multimedia apps
  environment.systemPackages = [
    pkgs.vlc
    pkgs.spotify
    pkgs.gimp
    pkgs.audacity
    pkgs.ffmpeg
    pkgs.inkscape
    # game streaming
    pkgs.moonlight-qt
  ];
}