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
      ./_disko-sdcard.nix

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
  };

  flake.nixosConfigurations.wololo = inputs.nixos-raspberrypi.lib.nixosSystemFull {
    modules = [
      self.nixosModules.wololo
    ];
  };
}
