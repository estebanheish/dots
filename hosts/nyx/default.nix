{
  config,
  user,
  pkgs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  #boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nyx";

  modules = {
    pipewire.enable = true;
    hyprland.enable = true;
    silent-boot.enable = true;
    syncthing.enable = true;
    gpg.enable = true;
    nvidia.enable = true;
    vulkan.enable = true;
  };

  home-manager.users.${user}.modules = {
    languages.haskell.enable = true;
    helix = {
      enable = true;
      withLsps = true;
    };
    neovim.enable = true;
  };

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
    nodejs

    chromium
    railway
    gettext
    postgresql
    sqlite

    qemu
    quickemu
  ];

  fonts.fonts = with pkgs; [
    cascadia-code    
    iosevka
    fira-code
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
    settings.PasswordAuthentication = false;
  };
  programs.ssh.startAgent = true;

  # boot
  boot.supportedFilesystems = ["ntfs"];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
}
