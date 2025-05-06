{
  user,
  # pkgs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../common.nix
    ../../modules/nixos/dlna
    ../../modules/nixos/qbittorrent-service
  ];

  fileSystems."/media" = {
    device = "/dev/disk/by-uuid/81ba0469-d0ee-4a56-8f26-960916eef6fc";
    fsType = "ext4";
    options = ["nofail"];
  };

  systemd.tmpfiles.rules = [
    "d /media 0777 ${user} users -"
  ];

  home-manager.users.${user} = {
    imports = [
      ../../modules/home-manager/helix
      ../../modules/home-manager/neovim
      ../../modules/home-manager/pkgs-lists/downloads.nix
      ../../modules/home-manager/pkgs-lists/archives.nix
    ];
  };

  boot.initrd = {
    availableKernelModules = ["e1000e"];
    network = {
      enable = true;
      ssh = {
        enable = true;
        authorizedKeys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFA0fkLNNFP4Aj+CnpbpLq/uT96TZpiKKeGGtaH+9jK+ estebanheish@gmail.com"];
        hostKeys = ["/etc/ssh/ssh_host_ed25519_key"];
      };
      postCommands = ''
        echo 'cryptsetup-askpass || echo "Unlock was successful; exiting SSH session" && exit 1' >> /root/.profile
      '';
    };
  };

  # boot.kernelPackages = pkgs.linuxPackages_latest;
  networking.hostName = "nyx";

  # services
  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = true;
    hostKeys = [
      {
        path = "/etc/ssh/ssh_host_ed25519_key";
        type = "ed25519";
      }
    ];
  };
  programs.ssh.startAgent = true;
  services.fstrim.enable = true;

  services.jellyfin = {
    enable = true;
    openFirewall = true;
  };

  # boot
  boot.supportedFilesystems = ["ntfs"];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nixpkgs.hostPlatform.system = "x86_64-linux";
}
