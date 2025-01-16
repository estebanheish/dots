{
  user,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    inputs.nixos-hardware.nixosModules.common-cpu-amd
    inputs.nixos-hardware.nixosModules.common-gpu-amd
    inputs.nixos-hardware.nixosModules.common-pc-ssd

    ../common.nix
    ../../modules/nixos/pipewire
    ../../modules/nixos/bluetooth
    ../../modules/nixos/cosmic
    ../../modules/nixos/superlight
    ../../modules/nixos/ollama
    ../../modules/nixos/quickemu
    ../../modules/nixos/syncthing
    ../../modules/nixos/steam
    # ../../modules/nixos/ios
    # ../../modules/nixos/nix-ld
    ../../modules/nixos/hostsfile
  ];

  home-manager.users.${user} = {
    imports = [
      ../../modules/home-manager/piper
      ../../modules/home-manager/pkgs-lists/lsps.nix
      ../../modules/home-manager/pkgs-lists/downloads.nix
      ../../modules/home-manager/pkgs-lists/fancy.nix
      ../../modules/home-manager/pkgs-lists/archives.nix
    ];

    home.packages = with pkgs; [
      # helvum
      # easyeffects
      obs-studio

      tdesktop
      # vesktop
      discord-canary

      spotify
      # bitwarden
      # bitwarden-cli

      # libreoffice
      # gimp
      # inkscape

      logseq

      # rustup
      # linuxKernel.packages.linux_zen.perf

      typst
      nvtopPackages.amd

      zed-editor
      smartcat
    ];
  };

  hardware.graphics.extraPackages = [pkgs.amf]; # for ffmpeg av1_amf

  networking.hostName = "clank";

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

  # boot
  boot.supportedFilesystems = ["ntfs"];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  nixpkgs.hostPlatform.system = "x86_64-linux";
}
