{ config, pkgs, ... }:
{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  boot.kernelPackages = pkgs.linuxPackages_zen;

  networking.hostName = "nyx";

  modules = {
    virtualization.enable = true;
    silent-boot.enable = true;
    sway.enable = true;
    packages.social.enable = true;
    languages.haskell.enable = true;
  };

  environment.systemPackages = with pkgs; [

    # lunarvim
    nodejs
    rustup
    python
    gnumake
    gcc

    # lsps
    rust-analyzer
    sumneko-lua-language-server

    black # python formater

    qbittorrent
  ];

  # networking 
  hardware.bluetooth.enable = true;
  #networking.wireless.iwd.enable = true;
  networking.useNetworkd = true;
  systemd.network.enable = true;
  systemd.network.wait-online.anyInterface = true;
  #systemd.network.wait-online.timeout = 5;

  # services
  services.openssh.enable = true;

  # boot
  boot.supportedFilesystems = [ "ntfs" ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
}
