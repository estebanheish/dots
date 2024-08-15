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
    ../../modules/nixos/bluetooth
    ../../modules/nixos/silent-boot
    ../../modules/nixos/nvidia
    ../../modules/nixos/hyprland
    ../../modules/nixos/corne-udev
    # ../../modules/nixos/dlna
    ../../modules/nixos/superlight
    ../../modules/nixos/docker
    # ../../modules/nixos/quickemu
    # ../../modules/nixos/steam
  ];

  home-manager.users.${user} = {
    imports = [
      ../../modules/home-manager/neovim
      ../../modules/home-manager/pkgs-lists/lsps.nix
      # ../../modules/home-manager/haskell
      ../../modules/home-manager/pkgs-lists/downloads.nix
      ../../modules/home-manager/pkgs-lists/fancy.nix
      ../../modules/home-manager/pkgs-lists/archives.nix
    ];

    home.packages = with pkgs; [
      # helvum
      # easyeffects
      # obs-studio

      tdesktop
      vesktop
      # discord
      # element-desktop

      spotify
      # bitwarden
      # bitwarden-cli

      # libreoffice
      # gimp
      # inkscape

      logseq
      gnome.nautilus
      # gnome.eog

      # tor-browser-bundle-bin

      # rustup
      linuxKernel.packages.linux_zen.perf

      # typst
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
  networking.wireless.iwd.enable = true;
  # networking.firewall = {
  #   allowedTCPPorts = [
  #     22
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
