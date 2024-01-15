{ config, pkgs, ... }:

{
  programs.rofi = {
    enable = true;
    theme = "solarized";
    font = "Fira Code 12";
  };
}
