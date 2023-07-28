{
  config,
  pkgs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    ../common.nix
    ../../modules/nixos/hyprland
    ../../modules/nixos/pipewire
    ../../modules/nixos/silent-boot
  ];

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "lemon";

  environment.systemPackages = with pkgs; [
    # tdesktop
    # discord

    # rustup
    # transmission
  ];

  # printing
  services.printing.enable = true;
  services.avahi.enable = true;
  services.avahi.nssmdns = true;
  services.avahi.openFirewall = true;

  # scanner
  hardware.sane.enable = true;
  hardware.sane.extraBackends = [ pkgs.sane-airscan ];

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
    passwordAuthentication = true;
  };
  programs.ssh.startAgent = true;

  # boot
  boot.supportedFilesystems = ["ntfs"];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  nixpkgs.hostPlatform.system = "x86_64-linux";
}
