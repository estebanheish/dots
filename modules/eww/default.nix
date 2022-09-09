{ config, pkgs, lib, ... }:
with lib;
let
  cfg = config.modules.eww;
in
{

  config = {
    modules.eww.enable = mkEnableOption "eww";
  };

  options = mkIf cfg.enable {
    environment.systemPackages = [ pkgs.eww ];
    hm.xdg.configFile."eww" = {
      source = ./../../config/eww;
      recursive = true;
    };
  };

}
