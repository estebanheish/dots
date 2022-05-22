{ config, pkgs, nixos-hardware, ... }:
{

  imports = [
    ./hw.nix
    nixos-hardware.nixosModules.raspberry-pi-4
  ];

  networking.hostName = "grape";
  hardware.bluetooth.enable = true;
  networking.wireless.iwd.enable = true;
  networking.useNetworkd = true;
  systemd.networkd.enable = true;
  systemd.network.wait-online.anyInferface = true;

  # service 
  service.openssh.enable = true;

  boot.loader.rasbberryPi = {
    enable = true;
    version = 4;
  };

}

