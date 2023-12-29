{
  # Flake from https://github.com/vimjoyer/flake-starter-config
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";

    # home-manager = {
    #   url = "github:nix-community/home-manager";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
    
      nixosConfigurations.default = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules = [ 
            ./gnome.nix
            # inputs.home-manager.nixosModules.default
          ];
        };
      nixosConfigurations.kde = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules = [ 
            ./kde.nix
            # inputs.home-manager.nixosModules.default
          ];
        };
      nixosConfigurations.combo = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules = [ 
            ./combo.nix
            # inputs.home-manager.nixosModules.default
          ];
        };

    };
}