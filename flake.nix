{
  description = "jbgreer flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.11";

    nixos-hardware.url = "github:NixOS//nixos-hardware/master";
  };

  outputs = { self, nixpkgs, nixos-hardware, ... }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
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
    };
}
