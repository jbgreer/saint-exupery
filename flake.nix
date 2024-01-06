{
  desccription = "jbgreer flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.11";
  };

  outputs = { self, nixpkgs, ... }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
    in {
      nixosConfigurations = {
        saint-exupery = lib.nixosSystem {
	  inherit system;
	  modules = [ ./configuration.nix ];
        };
      };
    };
}
