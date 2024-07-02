{
  user,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix

    ../common.nix
    ../../modules/nixos/pipewire
    ../../modules/nixos/hyprland
    ../../modules/nixos/superlight
    ../../modules/nixos/distrobox
    ../../modules/nixos/ollama
    ../../modules/nixos/quickemu
    ../../modules/nixos/nh
  ];

  home-manager.users.${user} = {
    imports = [
      ../../modules/home-manager/neovim
      ../../modules/home-manager/piper
      ../../modules/home-manager/pkgs-lists/lsps.nix
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

      spotify
      # bitwarden
      # bitwarden-cli

      # libreoffice
      # gimp
      # inkscape

      logseq

      # rustup
      linuxKernel.packages.linux_zen.perf

      typst
      nvtopPackages.amd
    ];
  };

  networking.hostName = "clank";

  fonts.packages = with pkgs; [
    # cascadia-code
    ubuntu_font_family
    martian-mono
  ];

  # networking
  hardware.bluetooth.enable = true;
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

  # boot
  boot.supportedFilesystems = ["ntfs"];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nixpkgs.hostPlatform.system = "x86_64-linux";
}
