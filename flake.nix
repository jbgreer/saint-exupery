{
  description = "jbgreer flake";

  nixConfig = {
    experimental-features = ["nix-command" "flakes"];

    substituters = [
      "https://cache.nixos.org"
    ];

    extra-substituters = [
      "https://nix-community.cachix.org"
    ];

    extra-trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.11";

    unstable.url = "nixpkgs/nixos-unstable";

    nixos-hardware.url = "github:NixOS//nixos-hardware/master";

    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";

    nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = { self, nixpkgs, unstable, nixos-hardware, home-manager, hyprland, nix-colors, ... } @ inputs :
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {

      nixosConfigurations = {
        saint-exupery = lib.nixosSystem {
          specialArgs = {
            inherit system;
            inherit inputs; 
        };
        modules = [
          nixos-hardware.nixosModules.framework-13-7040-amd
          ./hosts/saint-exupery/configuration.nix
        ];
        };
      };

      homeConfigurations = {
        "jbgreer" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = {
            inherit nix-colors;
            inherit unstable;
          };
          modules = [ ./users/jbgreer.nix ];
        };
      };

    };
}

