{inputs, ...}: {
  imports = [
    ../common.nix
    inputs.raspberry-pi-nix.nixosModules.raspberry-pi
  ];

  console.keyMap = "colemak";

  networking = {
    hostName = "rivet";
    useDHCP = false;
    interfaces = {wlan0.useDHCP = true;};
    useNetworkd = true;
    wireless.iwd.enable = true;
  };
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
            dtparam = {
              enable = true;
              value = "pciex1";
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
