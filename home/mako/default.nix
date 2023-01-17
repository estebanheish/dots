{ config, pkgs, lib, ... }:
with lib;
let
  cfg = config.modules.mako;
in
{

  options = {
    modules.mako.enable = mkEnableOption "mako";
  };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.mako pkgs.ubuntu_font_family ];
    xdg.configFile."mako/config".source = ./../../config/mako/config;
  };

}
