{...}: {
  flake.nixosModules.bluetooth = {...}: {
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          Experimental = true;
          FastConnectable = true;
          ReconnectAttempts = 0;
          ReconnectIntervals = 0;
        };
        Policy = {
          AutoEnable = true;
        };
      };
    };
  };
}
