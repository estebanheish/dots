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
    hm.home.packages = with pkgs; [ material-design-icons ];
    hm.xdg.configFile."waybar" = { source = ./../../config/waybar; recursive = true; };
  };

}
