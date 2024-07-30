{
  user,
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [
    inputs.nixos-hardware.nixosModules.raspberry-pi-4
    ../common.nix
  ];

  home-manager.users.${user} = {
    imports = [
    ];
  };

  # networking
  networking.hostName = "grape";
  # hardware.bluetooth.enable = true;
  # networking.wireless.iwd.enable = true;
  networking.useNetworkd = true;
  systemd.network.enable = true;
  systemd.network.wait-online.anyInterface = true;
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.eth0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlan0.useDHCP = lib.mkDefault true;

  # services
  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = true;
  };
  programs.ssh.startAgent = true;

  # external drive
  # fileSystems."/mnt/media" = {
  #   device = "/dev/disk/by-label/media";
  #   fsType = "ext4";
  #   options = ["defaults" "nofail"];
  # };

  # sd
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/44444444-4444-4444-8888-888888888888";
    fsType = "ext4";
  };

  nixpkgs.hostPlatform.system = "aarch64-linux";
  powerManagement.cpuFreqGovernor = lib.mkDefault "ondemand";
}
