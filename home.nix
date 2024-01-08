{ config, lib, pkgs, nix-colors, ... }:

{
  home.username = "jbgreer";
  home.homeDirectory = "/home/jbgreer";

  home.packages = with pkgs; [
    bat                     # cat substitute
    gcc                     # compiler
    cmake                   # builder
    fd                      # file display
    file                    # learn file type
    fzf                     # fast finder
    gnupg                   # encrypt/decrypt/sign/validate
    lua-language-server     # for neovime
    makeWrapper
    ninja                   # builder
    nix-zsh-completions     # zsh completions for nix
    nixpkgs-fmt             # format nix files
    pfetch
    ripgrep                 # grep
    rnix-lsp                # for neovim
    tree-sitter             # for neovim
    ripgrep                 # grep substitute
    tldr                    # better man pages
    tmux                    # terminal multiplexer
    unzip                   # uncompress files
    zellij                  # terminal multiplexer
    zip                     # compress files
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

