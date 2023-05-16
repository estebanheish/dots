{
  user,
  pkgs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    ../common.nix
    ../../modules/nixos/pipewire
    ../../modules/nixos/silent-boot
    ../../modules/nixos/nvidia
    ../../modules/nixos/syncthing
    ../../modules/nixos/hyprland
    ../../modules/nixos/corne-udev
    ../../modules/nixos/dlna
    ../../modules/nixos/android
  ];

  home-manager.users.${user} = {
    imports = [
      ../../modules/home-manager/helix
      ../../modules/home-manager/neovim
      ../../modules/home-manager/direnv
      ../../modules/home-manager/pkgs-lists/core.nix
      ../../modules/home-manager/pkgs-lists/lsps.nix
    ];

    home.packages = with pkgs; [
      tdesktop
      # discord
      # element-desktop

      # bitwarden
      # bitwarden-cli
      # qbittorrent

      # libreoffice
      # gimp
      # inkscape

      # tor-browser-bundle-bin

      # rustup
      # quickemu
    ];
  };

  boot.kernelPackages = pkgs.linuxPackages_zen;
  # boot.kernelPackages = pkgs.linuxPackages_latest;
  networking.hostName = "nyx";

  fonts.fonts = with pkgs; [
    cascadia-code
  ];

  # networking
  hardware.bluetooth.enable = true;
  #networking.wireless.iwd.enable = true;
  networking.useNetworkd = true;
  systemd.network.enable = true;
  systemd.network.wait-online.anyInterface = true;
  #systemd.network.wait-online.timeout = 5;
  # networking.firewall = {
  #   allowedTCPPorts = [
  #     8000
  #   ];
  # };

  # services
  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = false;
  };
  programs.ssh.startAgent = true;

  # boot
  # boot.supportedFilesystems = ["ntfs"];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  nixpkgs.hostPlatform.system = "x86_64-linux";
}
