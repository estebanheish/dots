{ pkgs, config, lib, ... }:
with lib;
let
  cfg = config.modules.gnome;
in
{
  options = {
    modules.gnome.enable = mkEnableOption "gnome";
  };

  config = mkIf cfg.enable {
    services.xserver.enable = true;
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;
  };
}
