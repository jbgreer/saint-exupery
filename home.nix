{ config, pkgs, ... }:

{
  home.username = "jbgreer";
  home.homeDirectory = "/home/jbgreer";

  # DO NOT CHANGE WITHOUT READING MANUAL
  home.stateVersion = "23.11";

  home.packages = [
  ];

  home.file = {
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
