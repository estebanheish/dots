{
  config,
  pkgs,
  nixos-hardware,
  ...
}: {
  imports = [
    ./hw.nix
  ];

  modules = {
    syncthing.enable = true;
  };

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
    settings.PasswordAuthentication = true;
  };
}
