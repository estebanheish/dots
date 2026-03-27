{
  self,
  inputs,
  config,
  ...
}: {
  flake.nixosModules.nyx = {...}: {
    imports = [
      ./_hardware-configuration.nix
      self.nixosModules.common
      self.nixosModules.dlna
      self.nixosModules.qbittorrentService
      self.nixosModules.helix
      self.nixosModules.neovim
      self.nixosModules.downloadsPkgs
      self.nixosModules.archivesPkgs
    ];

    fileSystems."/media" = {
      device = "/dev/disk/by-uuid/81ba0469-d0ee-4a56-8f26-960916eef6fc";
      fsType = "ext4";
      options = ["nofail"];
    };

    systemd.tmpfiles.rules = [
      "d /media 0777 ${config.username} users -"
    ];

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

    networking.hostName = "nyx";

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

    boot.supportedFilesystems = ["ntfs"];
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    home-manager.users.${config.username} = {
      home.stateVersion = "25.11";
    };
    system.stateVersion = "24.05";
  };

  flake.nixosConfigurations.nyx = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.nyx
    ];
  };
}
