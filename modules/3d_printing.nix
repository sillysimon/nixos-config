{ pkgs, ... }:
# this module is all about packages related to 3d-printing
{
  hardware.spacenavd.enable = true;

  environment.systemPackages = [
    pkgs.blender
    pkgs.freecad
    pkgs.spacenavd
    # no cura because old version :(
];
}