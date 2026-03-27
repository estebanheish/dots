{config, ...}: {
  flake.nixosModules.corne = {pkgs, ...}: {
    home-manager.users.${config.username} = {
      home.packages = with pkgs; [
        via
        qmk
        qmk-udev-rules
        gnumake
        pkgsCross.avr.buildPackages.gcc
      ];
    };
  };
}
