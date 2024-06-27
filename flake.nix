{
  description = "Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs:
    let
      system = "x86_64-linux";
    in {
      formatter = nixpkgs.legacyPackages.${system}.nixpkgs-fmt;

      # NixOS
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs outputs;};
          modules = [
            ./hosts/nixos/configuration.nix
          ];
        };
      };

      # Home-Manager (Standalone)
      homeConfigurations = {
        paul = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${system};
          extraSpecialArgs = {inherit inputs outputs;};
          modules = [
            ./modules/nixos/home.nix
          ];
        };
      };
    };
}

