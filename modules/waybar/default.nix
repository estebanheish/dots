{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.modules.waybar;
in
{

  options = {
    modules.waybar.enable = mkEnableOption "waybar";
  };

  config = mkIf cfg.enable {
    hm.programs.waybar.enable = true;
    hm.xdg.configFile."waybar" = { source = ./../../config/waybar; recursive = true; };
  };

}
