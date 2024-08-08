{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ../common.nix
    inputs.raspberry-pi-nix.nixosModules.raspberry-pi

    ../../modules/nixos/hostsfile
    ../../modules/nixos/bluetooth
    ../../modules/nixos/qbittorrent-service
    ../../modules/nixos/dlna
  ];
  _module.args.theme = import ../../modules/home-manager/themes/rose_pine.nix;

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
}
