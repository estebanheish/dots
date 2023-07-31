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
    # ../../modules/nixos/syncthing
    ../../modules/nixos/hyprland
    ../../modules/nixos/corne-udev
    ../../modules/nixos/dlna
    ../../modules/nixos/superlight
    # ../../modules/nixos/android
  ];

  home-manager.users.${user} = {
    imports = [
      ../../modules/home-manager/neovim
      ../../modules/home-manager/pkgs-lists/lsps.nix
    ];

    home.packages = with pkgs; [
      tdesktop
      # discord
      # element-desktop

      spotify
      # bitwarden
      # bitwarden-cli
      qbittorrent

      libreoffice
      gimp
      inkscape

      obsidian
      gnome.nautilus

      # tor-browser-bundle-bin

      # rustup
      quickemu
    ];
  };

  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };

  boot.kernelPackages = pkgs.linuxPackages_zen;
  # boot.kernelPackages = pkgs.linuxPackages_latest;
  networking.hostName = "nyx";

  fonts.packages = with pkgs; [
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
  #     8080
  #   ];
  #   allowedUDPPorts = [
  #     1900
  #   ];
  # };

  # services
  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = false;
  };
  programs.ssh.startAgent = true;

  fileSystems."/mnt/data" = {
    device = "/dev/disk/by-label/data";
    fsType = "ext4";
    options = ["defaults" "nofail"];
  };

  # boot
  # boot.supportedFilesystems = ["ntfs"];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nixpkgs.hostPlatform.system = "x86_64-linux";
}
