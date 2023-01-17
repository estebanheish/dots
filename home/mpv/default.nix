{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.modules.mpv;
in
{

  options = {
    modules.mpv.enable = mkEnableOption "mpv";
  };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.mpv ];
    xdg.configFile."mpv/scripts" = { source = ./../../config/mpv/scripts; recursive = true; };
    xdg.configFile."mpv/mpv.conf".source = ./../../config/mpv/mpv.conf;
  };

}
