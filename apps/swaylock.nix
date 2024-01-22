{ config, pkgs, ... }:

{
  programs.swaylock = {
    enable = true;
    settings = {
      color = "808080";
    };
  };
}
