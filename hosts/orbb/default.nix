{
  user,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    inputs.nixos-hardware.nixosModules.common-cpu-amd
    inputs.nixos-hardware.nixosModules.common-pc-ssd

    ../common.nix
    ../../modules/nixos/pipewire
    ../../modules/nixos/bluetooth
    ../../modules/nixos/hyprland
    ../../modules/nixos/superlight
    ../../modules/nixos/nvidia
    ../../modules/nixos/quickemu
    ../../modules/nixos/syncthing
    ../../modules/nixos/hostsfile
    ../../modules/nixos/nix-ld
  ];

  home-manager.users.${user} = {
    imports = [
      ../../modules/home-manager/pkgs-lists/lsps.nix
      ../../modules/home-manager/pkgs-lists/downloads.nix
      ../../modules/home-manager/pkgs-lists/fancy.nix
      ../../modules/home-manager/pkgs-lists/archives.nix
      ../../modules/home-manager/zed
    ];

    home.packages = with pkgs; [
      tdesktop
      discord-canary

      spotify
      # bitwarden
      # bitwarden-cli

      # linuxKernel.packages.linux_zen.perf
      typst
      nvtopPackages.nvidia
      smartcat
    ];
  };

  networking.hostName = "orbb";

  # networking
  networking.wireless.iwd.enable = true;

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
}
