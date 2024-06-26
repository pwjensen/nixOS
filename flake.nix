{

  description = "Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs:
    let
      inherit (self) outputs;
      systems = [
        "aarch64-linux"
        "x86_64-linux"
        "i686-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];
      forAllSystems = nixpkgs.lib.genAttrs systems;
    in {
      #packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});
      formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

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

      # Darwin (macOS)
      darwinConfigurations = {
        paul = nix-darwin.lib.darwinSystem {
          extraSpecialArgs = {inherit inputs outputs;};
          modules = [
            mac-app-util.darwinModules.default
            {
              imports = [
                ./hosts/darwin/configuration.nix
                ./hosts/darwin/software.nix
              ];
              _module.args.self = self;
            }
            home-manager.darwinModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              users.users.paul = {
                home = "/Users/paul";
              };
              home-manager.users.paul = {
                imports = [
                  mac-app-util.homeManagerModules.default
                  ./hosts/darwin/home.nix
                ];
              };
            }
          ];
        };
      };
    };
}

