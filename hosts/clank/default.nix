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
    ../../modules/nixos/niri
    # ../../modules/nixos/superlight
    ../../modules/nixos/ollama
    ../../modules/nixos/docker
    ../../modules/nixos/quickemu
    ../../modules/nixos/syncthing
    ../../modules/nixos/steam
    ../../modules/nixos/weylus
    # ../../modules/nixos/ios
    ../../modules/nixos/nix-ld
    # ../../modules/nixos/hostsfile
  ];

  hardware.firmware = [
    (pkgs.linux-firmware.overrideAttrs (old: {
      version = "20251111";
      src = pkgs.fetchurl {
        # https://www.kernel.org/pub/linux/kernel/firmware/
        url = "https://www.kernel.org/pub/linux/kernel/firmware/linux-firmware-20251111.tar.gz";
        # > nix-prefetch-url https://www.kernel.org/pub/linux/kernel/firmware/linux-firmware-20251111.tar.gz
        sha256 = "0rp2ah8drcnl7fh9vbawa8p8c9lhvn1d8zkl48ckj20vba0maz2g";
      };
    }))
  ];

  home-manager.users.${user} = {
    imports = [
      ../../modules/home-manager/piper
      ../../modules/home-manager/pkgs-lists/lsps.nix
      ../../modules/home-manager/pkgs-lists/downloads.nix
      ../../modules/home-manager/pkgs-lists/fancy.nix
      ../../modules/home-manager/pkgs-lists/archives.nix
      ../../modules/home-manager/zed
    ];

    home.packages = with pkgs; [
      # helvum
      # easyeffects
      obs-studio

      telegram-desktop
      # vesktop
      # discord

      spotify
      bitwarden-desktop
      # bitwarden-cli

      # libreoffice
      # gimp
      # inkscape

      # logseq

      # rustup
      # linuxKernel.packages.linux_zen.perf

      typst
      nvtopPackages.amd

      smartcat
    ];
  };

  boot.binfmt.emulatedSystems = ["aarch64-linux"];

  # hardware.graphics.extraPackages = [pkgs.amf]; # for ffmpeg av1_amf

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
  # programs.ssh.startAgent = true;

  # boot
  boot.supportedFilesystems = ["ntfs"];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # boot.kernelPackages = pkgs.linuxPackages_latest;

  nixpkgs.hostPlatform.system = "x86_64-linux";
  system.stateVersion = "24.05";

  dots.niri.profile = "dms";
}
