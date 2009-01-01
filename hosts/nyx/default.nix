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
    # ../../modules/nixos/silent-boot
    ../../modules/nixos/nvidia
    ../../modules/nixos/corne-udev
    ../../modules/nixos/cosmic
  ];

  home-manager.users.${user} = {
    imports = [
      ../../modules/home-manager/helix
      ../../modules/home-manager/neovim
      ../../modules/home-manager/pkgs-lists/downloads.nix
      ../../modules/home-manager/pkgs-lists/fancy.nix
      ../../modules/home-manager/pkgs-lists/archives.nix
    ];

    home.packages = with pkgs; [
      # helvum
      # easyeffects
      # obs-studio
      qbittorrent

      tdesktop
      # vesktop
      discord-canary
      # element-desktop

      spotify
      # bitwarden
      # bitwarden-cli

      # libreoffice
      # gimp
      # inkscape

      # logseq
      # gnome.eog

      # tor-browser-bundle-bin

      # rustup
      # linuxKernel.packages.linux_zen.perf

      # typst
    ];
  };

  # boot.kernelPackages = pkgs.linuxPackages_latest;
  networking.hostName = "nyx";

  # services
  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = true;
  };
  programs.ssh.startAgent = true;
  services.fstrim.enable = true;

  # boot
  boot.supportedFilesystems = ["ntfs"];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nixpkgs.hostPlatform.system = "x86_64-linux";
}
