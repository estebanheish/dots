{ config, pkgs, ... }:
{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  #boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nyx";

  modules = {
    virtualization.enable = true;
    sway.enable = true;
    silent-boot.enable = true;
    languages.haskell.enable = true;
    lvim.enable = true;
    syncthing.enable = true;
    gpg.enable = true;
  };

  # for vscode (for copilot)
  programs.seahorse.enable = true;
  services.gnome.gnome-keyring.enable = true;
  ##

  environment.systemPackages = with pkgs; [
    tdesktop
    discord

    rustup
    transmission
  ];

  # networking 
  hardware.bluetooth.enable = true;
  #networking.wireless.iwd.enable = true;
  networking.useNetworkd = true;
  systemd.network.enable = true;
  systemd.network.wait-online.anyInterface = true;
  #systemd.network.wait-online.timeout = 5;

  # services
  services.openssh = {
    enable = true;
    passwordAuthentication = false;
  };
  programs.ssh.startAgent = true;

  # boot
  boot.supportedFilesystems = [ "ntfs" ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
}
