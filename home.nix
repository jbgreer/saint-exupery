{ config, pkgs, nix-colors, ... }:

{
  home.username = "jbgreer";
  home.homeDirectory = "/home/jbgreer";

  home.packages = with pkgs; [
    gcc
    cmake
    lua-language-server
    makeWrapper
    ninja
    pfetch
    rnix-lsp
  ];

  home.file = {
  };

  imports = [
    nix-colors.homeManagerModules.default
    ./git.nix
    ./neovim.nix
    ./zsh.nix
  ];

  programs.fzf.enable = true;

  xdg.enable = true;

  colorScheme = nix-colors.colorSchemes.gruvbox-dark-medium;

  # self-manage home-manager
  programs.home-manager.enable = true;

  # DO NOT CHANGE WITHOUT READING MANUAL
  home.stateVersion = "23.11";
}
