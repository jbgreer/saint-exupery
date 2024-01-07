# configuration_bootstrap.nix
{ config, pkgs, lib, ... }: {
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader settings
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.enable = true;
  boot.supportedFilesystems = [ "btrfs" "ntfs" "fat32" ];
  hardware.enableAllFirmware = true;

  # TODO set hostname
  networking.hostName = "saint-exupery";
  networking.networkmanager.enable = true;

  # TODO set locale and timezone
  i18n.defaultLocale = "en_US.utf8";
  time.timeZone = "America/Chicago";

  # TODO set username
  users.users.jbgreer = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ ];
    shell = pkgs.zsh;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # system-wide packages
  environment = {
    shells = with pkgs; [ 
      bash
      zsh
    ];
    systemPackages = with pkgs; [
      curl
      cryptsetup
      git
      home-manager
      wget
      vim
      zsh
    ];
  };

  # must enable here because it is available system wide
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  
  # WARNING! Be careful when changing.
  system.stateVersion = "23.11";

  # Enable use of flakes
  nix.settings.experimental-features = "nix-command flakes";
}
