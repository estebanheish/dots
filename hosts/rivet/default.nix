{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ../common.nix
    inputs.raspberry-pi-nix.nixosModules.raspberry-pi

    ../../modules/nixos/hostsfile
    ../../modules/nixos/qbittorrent-service
  ];

  console.keyMap = "colemak";

  environment.systemPackages = with pkgs; [
    raspberrypi-eeprom
  ];

  networking = {
    hostName = "rivet";
    useDHCP = false;
    interfaces = {
      wlan0.useDHCP = true;
      end0.useDHCP = true;
    };
    wireless.iwd.enable = true;
  };

  hardware = {
    bluetooth.enable = true;
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
