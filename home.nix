{ config, pkgs, ... }:

{
  home.username = "jbgreer";
  home.homeDirectory = "/home/jbgreer";

  home.packages = with pkgs; [
    pfetch
  ];

  home.file = {
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  imports = [
    ./zsh.nix
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  xdg.enable = true;

  # self-manage home-manager
  programs.home-manager.enable = true;

  # DO NOT CHANGE WITHOUT READING MANUAL
  home.stateVersion = "23.11";
}
