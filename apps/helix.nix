{ config, pkgs, ... }:

{
  programs.helix = {
    enable = true;
    settings = {
      theme = "onedark";
    };
    languages.language = [{
      name = "nix";
      auto-format = true;
      formatter.command = "${pkgs.nixfmt}/bin/nix fmt";
    }];
  };
}
