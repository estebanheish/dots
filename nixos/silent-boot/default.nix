{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.silent-boot;
in {
  options = {
    modules.silent-boot.enable = mkEnableOption "silent-boot";
  };

  config = mkIf cfg.enable {
    boot = {
      initrd.verbose = false;
      consoleLogLevel = 0;
      kernelParams = ["quiet" "udev.log_priority=3"];
    };
  };
}
