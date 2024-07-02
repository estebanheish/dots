{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ../common.nix
    inputs.raspberry-pi-nix.nixosModules.raspberry-pi
  ];

  console.keyMap = "colemak";

  environment.systemPackages = with pkgs; [
    raspberrypi-eeprom
  ];

  networking.hostName = "rivet";
  networking.wireless.iwd.enable = true;
  systemd.network.enable = true;
  systemd.network.wait-online.enable = false;

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
    # settings.PasswordAuthentication = false;
  };

  nixpkgs.hostPlatform = "aarch64-linux";
}
