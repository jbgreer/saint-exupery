{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    package = pkgs.gitAndTools.gitFull;
    userName = "James B. Greer";
    userEmail = "jbgreer@gmail.com";
    aliases = {
      co = "checkout";
      undo = "reset HEAD~1 --mixed";
      amend = "commit -a --amend";
    };
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
    };
  };
}
