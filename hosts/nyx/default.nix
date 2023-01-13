{ config, pkgs, ... }:
{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  #boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nyx";

  modules = {
    # virtualization.enable = true;
    qemu.enable = true;
    hyprland.enable = true;
    silent-boot.enable = true;
    languages.haskell.enable = true;
    lvim.enable = true;
    syncthing.enable = true;
    gpg.enable = true;
    nvidia.enable = true;
    flutter.enable = false;
  };

  # for vscode (for copilot)
  programs.seahorse.enable = true;
  services.gnome.gnome-keyring.enable = true;
  ##

  # steam 
  # programs.steam.enable = true;
  # environment.sessionVariables = rec {
  #   STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/heis/.steam/root/compatibilitytools.d";
  # };

  environment.systemPackages = with pkgs; [
    # vulkan-validation-layers # for sway vulkan
    # vulkan-tools
    # gamescope

    tdesktop
    discord
    element-desktop

    bitwarden
    qbittorrent
    libreoffice
    gimp
    inkscape

    vscode

    gnuplot
    tor-browser-bundle-bin

    rustup
    python311
    bun

    chromium
    railway
    gettext
    postgresql
    sqlite
  ];

  # networking 
  hardware.bluetooth.enable = true;
  #networking.wireless.iwd.enable = true;
  networking.useNetworkd = true;
  systemd.network.enable = true;
  systemd.network.wait-online.anyInterface = true;
  #systemd.network.wait-online.timeout = 5;
  networking.firewall = {
    allowedTCPPorts = [
      8000
    ];
  };

  # services
  services.openssh = {
    enable = true;
    passwordAuthentication = false;
  };
  programs.ssh.startAgent = true;

  # boot
  boot.supportedFilesystems = [ "ntfs" ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
}
