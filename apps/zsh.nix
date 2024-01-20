{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    defaultKeymap = "viins";
    dotDir = ".config/zsh";
    enableCompletion = true;
    shellAliases = {
      l = "ls -al";
      vim = "nvim";
    };
    loginExtra = ''
      # start hyprland only on 1st console
      [ -z  "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ] && [ $(tty) = "/dev/tty1" ] && exec Hyprland
    '';
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}
