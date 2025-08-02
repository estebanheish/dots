{
  user,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t480s
    inputs.nixos-hardware.nixosModules.common-pc-ssd

    ../common.nix
    ../../modules/nixos/pipewire
    ../../modules/nixos/bluetooth
    ../../modules/nixos/syncthing
    ../../modules/nixos/hyprland
    # ../../modules/nixos/hostsfile
  ];

  home-manager.users.${user} = {
    imports = [
      ../../modules/home-manager/pkgs-lists/lsps.nix
      ../../modules/home-manager/pkgs-lists/downloads.nix
      ../../modules/home-manager/pkgs-lists/fancy.nix
      ../../modules/home-manager/pkgs-lists/archives.nix
    ];

    home.packages = with pkgs; [
      acpi

      tdesktop
      # vesktop
      discord-canary

      spotify
      # bitwarden
      # bitwarden-cli

      # logseq
      typst
    ];
  };

  networking.hostName = "rivet";
  console.keyMap = "colemak";

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

  nixpkgs.hostPlatform.system = "x86_64-linux";
  system.stateVersion = "24.05";
}
