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
            ./simyoga.nix
            # inputs.home-manager.nixosModules.default
          ];
        };
      nixosConfigurations.simyoga = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules = [ 
            ./simyoga.nix
            # inputs.home-manager.nixosModules.default
          ];
        };
      nixosConfigurations.simtab = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
          modules = [ 
            ./simtab.nix
            # inputs.home-manager.nixosModules.default
          ];
      };

    };
}