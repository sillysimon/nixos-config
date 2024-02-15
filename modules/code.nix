# if I don't put the triple dots in there, nix gets angry
{ pkgs, ... }:
{
  #add vscode and an lsp
  environment.systemPackages = [
    pkgs.vscode
    pkgs.vscode-extensions.jnoortheen.nix-ide
    pkgs.nil
    pkgs.direnv
    ## add the rust toolchain
    pkgs.rustc
    pkgs.cargo
    pkgs.rust-analyzer
    pkgs.gcc
  ];
}