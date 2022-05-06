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
    hm.home.packages = [ pkgs.mpv ];
    hm.xdg.configFile."mpv/scripts" = { source = ./../../config/mpv/scripts; recursive = true; };
  };

}
