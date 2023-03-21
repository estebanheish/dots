{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.packages.core;
in {
  options = {
    modules.packages.corne.enable = mkEnableOption "corne packages";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      via
      qmk
      qmk-udev-rules
      gnumake
      pkgsCross.avr.buildPackages.gcc
    ];
  };
}
