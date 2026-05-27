{
  self,
  config,
  inputs,
  ...
}: {
  flake.nixosModules.wololo = {pkgs, ...}: {
    imports = with inputs.nixos-raspberrypi.nixosModules; [
      raspberry-pi-5.base
      raspberry-pi-5.page-size-16k
      raspberry-pi-5.bluetooth

      inputs.home-manager-rpi.nixosModules.home-manager
      inputs.disko-rpi.nixosModules.disko
      ./_disko-nvme.nix

      self.nixosModules.common
      # self.nixosModules.shell
      # self.nixosModules.corePkgs
      # self.nixosModules.downloadsPkgs
      # self.nixosModules.archivesPkgs
      self.nixosModules.nh
    ];

    environment.systemPackages = with pkgs; [
      raspberrypi-eeprom
    ];

    # external usb HDD
    # systemd.tmpfiles.rules = [
    #   "d /mnt/data 0755 ${config.username} users - -"
    # ];
    # fileSystems."/mnt/data" = {
    #   device = "/dev/disk/by-uuid/1676deb4-b5d6-4b86-b210-57993ed20bf9";
    #   fsType = "ext4";
    #   options = [
    #     "nofail"
    #     "x-systemd.automount"
    #     "x-systemd.idle-timeout=10min"
    #     "defaults"
    #     "users"
    #     "noatime"
    #   ];
    # };

    # boot.loader.raspberryPi.enable = true;
    boot.loader.raspberry-pi.bootloader = "kernel";

    networking = {
      hostName = "wololo";
      useDHCP = false;
      interfaces = {
        wlan0.useDHCP = true;
        end0.useDHCP = true;
      };
      wireless.iwd.enable = true;
    };

    services.openssh = {
      enable = true;
      # settings.PasswordAuthentication = false;
    };

    system.stateVersion = "25.11";
    home-manager.users.${config.username}.home.stateVersion = "25.11";

    users.groups.data = {};
    users.users.${config.username}.extraGroups = ["data"];

    systemd.tmpfiles.rules = [
      "d /data             2775 ${config.username} data - -"
      "d /data/downloads   2775 ${config.username} data - -"
      "d /data/movies      2775 ${config.username} data - -"
      "d /data/tvshows     2775 ${config.username} data - -"
      "d /data/audiobooks  2775 ${config.username} data - -"
      "d /data/podcasts  2775 ${config.username} data - -"
    ];

    services.audiobookshelf = {
      enable = true;
      port = 1778;
      host = "0.0.0.0";
      openFirewall = true;
      group = "data";
    };

    services.qbittorrent = {
      enable = true;
      openFirewall = true;
      group = "data";
    };

    users.users.minidlna.extraGroups = ["media"];
    services.minidlna = {
      enable = true;
      openFirewall = true;
      settings = {
        friendly_name = "wololo minidlna";
        inotify = "yes";
        media_dir = [
          "V,/data/movies"
          "V,/data/tvshows"
        ];
      };
    };
  };

  flake.nixosConfigurations.wololo = inputs.nixos-raspberrypi.lib.nixosSystemFull {
    modules = [
      self.nixosModules.wololo
    ];
  };
}
