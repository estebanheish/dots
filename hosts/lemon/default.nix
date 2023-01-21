{
  config,
  pkgs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "lemon";

  modules = {
    pipewire.enable = true;
    hyprland.enable = true;
    silent-boot.enable = true;
  };

  environment.systemPackages = with pkgs; [
    # tdesktop
    # discord

    # rustup
    # transmission
  ];

  # networking
  hardware.bluetooth.enable = true;
  networking.wireless.iwd.enable = true;
  networking.useNetworkd = true;
  systemd.network.enable = true;
  systemd.network.wait-online.anyInterface = true;
  #systemd.network.wait-online.timeout = 5;

  # services
  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = true;
  };
  programs.ssh.startAgent = true;

  # boot
  boot.supportedFilesystems = ["ntfs"];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
}
