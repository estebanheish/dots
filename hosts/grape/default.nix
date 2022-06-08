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

  # external drive
  fileSystems."/home/${config.user.name}/data" = { 
    device = "/dev/disk/by-label/data";
    fsType = "btrfs";
  };

  # services
  services.openssh = {
    enable = true;
    passwordAuthentication = true;
  };

  services = {
    syncthing = {
      enable = true;
      user = "heis";
      dataDir = "/home/${config.user.name}/data";    # Default folder for new synced folders
    };
  };

}

