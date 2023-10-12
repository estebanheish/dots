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
    ../../modules/nixos/hyprland
    ../../modules/nixos/corne-udev
    ../../modules/nixos/dlna
    ../../modules/nixos/superlight
    # ../../modules/nixos/steam
  ];

  home-manager.users.${user} = {
    imports = [
      ../../modules/home-manager/neovim
      ../../modules/home-manager/pkgs-lists/lsps.nix
      ../../modules/home-manager/haskell
    ];

    home.packages = with pkgs; [
      helvum
      easyeffects
      obs-studio

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
      # gnome.eog

      # tor-browser-bundle-bin

      # rustup
      quickemu
    ];
  };

  boot.kernelPackages = pkgs.linuxPackages_zen;
  networking.hostName = "nyx";

  fonts.packages = with pkgs; [
    # cascadia-code
    ubuntu_font_family
    martian-mono
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
  services.fstrim.enable = true;

  fileSystems."/mnt/data" = {
    device = "/dev/disk/by-label/data";
    fsType = "ext4";
    options = ["defaults" "nofail"];
  };

  # boot
  boot.supportedFilesystems = ["ntfs"];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nixpkgs.hostPlatform.system = "x86_64-linux";
}
