{ config, pkgs, ... }:

{
  home.username = "jbgreer";
  home.homeDirectory = "/home/jbgreer";

  # DO NOT CHANGE WITHOUT READING MANUAL
  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    pfetch
    #neovim
    #zsh
  ];

  home.file = {
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # set neovim as default editor
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  programs.zsh = {
    enable = true;
  };

  programs.home-manager.enable = true;
}
