{ config, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    #package = pkgs.alacritty;
    settings = {
      env.TERM = "xterm-256color";
      window-padding = {
        x = 10;
        y = 10;
      };
      window-decorations = "none";
      window.opacity = 0.7;
      scrolling.history = 1000;
      font = {
        normal = {
          family = "Fira Code";
          style = "Regular";
        };
        bold = {
          family = "Fira Code";
          style = "Bold";
        };
        italic = {
          family = "Fira Code";
          style = "Italic";
        };
        size = 14;
      };
    };
  };
}
