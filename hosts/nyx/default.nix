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
  };

  environment.systemPackages = with pkgs; [
  ];
  
  # networking 
  hardware.bluetooth.enable = true;
  networking.wireless.iwd.enbale = true;
  systemd.network.enable = true;

  # services
  services.openssh.enable = true;

  # boot
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
}
