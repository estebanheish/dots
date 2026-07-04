{config, ...}: {
  flake.nixosModules.i2c = {...}: {
    hardware.i2c.enable = true;
    users.users.${config.username}.extraGroups = ["i2c"];
    home-manager.users.${config.username} = {pkgs, ...}: {
      home.packages = with pkgs; [
        ddcutil
      ];
    };
  };
}
