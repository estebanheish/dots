{ config, pkgs, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  boot.kernelPackages = pkgs.linuxPackages_zen;

  networking.hostName = "nyx";

  modules = {
    sway.enable = true;
    packages.social.enable = true;
  };

  environment.systemPackages = with pkgs; [
  ];
  
  # networking 
  hardware.bluetooth.enable = true;
  #networking.wireless.iwd.enable = true;
  #systemd.network.enable = true;
  networking.networkmanager.enable = true;

  # services
  services.openssh.enable = true;

  # boot
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
}
