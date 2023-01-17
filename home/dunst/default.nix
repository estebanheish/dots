{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.modules.dunst;
in
{

  options = {
    modules.dunst.enable = mkEnableOption "dunst";
  };

  config = mkIf cfg.enable {
    xdg.configFile."dunst/dunstrc".source = ./../../config/dunst/dunstrc;
    home.packages = [ pkgs.dunst ];
  };

}
