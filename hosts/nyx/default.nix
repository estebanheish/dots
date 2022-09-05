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
    virtualization.enable = true;
    # sway.enable = true;
    river.enable = true;
    silent-boot.enable = true;
    languages.haskell.enable = true;
    lvim.enable = true;
    syncthing.enable = true;
    gpg.enable = true;
  };

  # for vscode (for copilot)
  programs.seahorse.enable = true;
  services.gnome.gnome-keyring.enable = true;
  ##

  # sway with nvidia and vulkan renderer
  # services.xserver.videoDrivers = [ "nvidia" ];
  # hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;
  # hardware.opengl.enable = true;
  # hardware.nvidia.modesetting.enable = true;
  # hardware.nvidia.nvidiaSettings = true;
  # hardware.opengl.driSupport = true;
  ##

  environment.systemPackages = with pkgs; [
    # vulkan-validation-layers # for sway vulkan
    # vulkan-tools

    tdesktop
    discord
    element-desktop

    gimp

    rustup
    bitwarden
  ];

  # networking 
  hardware.bluetooth.enable = true;
  #networking.wireless.iwd.enable = true;
  networking.useNetworkd = true;
  systemd.network.enable = true;
  systemd.network.wait-online.anyInterface = true;
  #systemd.network.wait-online.timeout = 5;

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
