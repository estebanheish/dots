{
  self,
  config,
  inputs,
  ...
}: {
  flake.nixosModules.wololo = {pkgs, ...}: {
    imports = [
      self.nixosModules.common
      inputs.raspberry-pi-nix.nixosModules.raspberry-pi

      self.nixosModules.hostsfile
      self.nixosModules.bluetooth
      self.nixosModules.qbittorrentService
      self.nixosModules.dlna
    ];

    console.keyMap = "colemak";

    environment.systemPackages = with pkgs; [
      raspberrypi-eeprom
    ];

    networking = {
      hostName = "wololo";
      useDHCP = false;
      interfaces = {
        wlan0.useDHCP = true;
        end0.useDHCP = true;
      };
      wireless.iwd.enable = true;
    };

    raspberry-pi-nix.board = "bcm2712";

    hardware = {
      raspberry-pi = {
        config = {
          all = {
            base-dt-params = {
              krnbt = {
                enable = true;
                value = "on";
              };
            };
          };
        };
      };
    };

    services.openssh = {
      enable = true;
      settings.PasswordAuthentication = false;
    };

    nixpkgs.hostPlatform = "aarch64-linux";
    system.stateVersion = "24.05";
    home-manager.users.${config.username}.home.stateVersion = "25.11";
  };

  flake.nixosConfigurations.wololo = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.wololo
    ];
  };
}
