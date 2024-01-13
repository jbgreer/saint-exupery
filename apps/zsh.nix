{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    defaultKeymap = "viins";
    dotDir = ".config/zsh";
    enableCompletion = true;
    shellAliases = {
      l = "ls -al";
    };
  };
}
