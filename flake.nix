{
  description = "jbgreer flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.11";

    nixos-hardware.url = "github:NixOS//nixos-hardware/master";

    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixos-hardware, home-manager, ... }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {

      nixosConfigurations = {
        saint-exupery = lib.nixosSystem {
	  inherit system;
	  modules = [ 
	    nixos-hardware.nixosModules.framework-13-7040-amd
	    ./configuration.nix 
	  ];
        };
      };

      homeConfigurations = {
        "jbgreer" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./home.nix ];
        };
      };

    };
}

