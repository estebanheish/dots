{ config, pkgs, nixos-hardware, ... }:
{

  imports = [
    ./hw.nix
  ];

  networking.hostName = "grape";
  hardware.bluetooth.enable = true;
  networking.wireless.iwd.enable = true;
  networking.useNetworkd = true;
  systemd.network.enable = true;
  systemd.network.wait-online.anyInterface = true;

  # services
  services.openssh = {
    enable = true;
    passwordAuthentication = true;
  };

}

