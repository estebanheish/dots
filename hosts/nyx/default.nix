{ config, pkgs, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  boot.kernelPackages = pkgs.linuxPackages_zen;

  networking.hostName = "nyx";

  modules.sway.enable = true;

  environment.systemPackages = with pkgs; [
  ];
  
  hardware.bluetooth.enable = true;
  networking.wireless.enbale = true;
  networking.networkmanager.enable = true;

  # services
  services.openssh.enable = true;

  # boot
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/vda";
}
