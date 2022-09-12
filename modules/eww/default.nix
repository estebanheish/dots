{ config, pkgs, lib, ... }:
with lib;
let
  cfg = config.modules.eww;
in
{

  options = {
    modules.eww.enable = mkEnableOption "eww";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [ pkgs.eww-wayland ];
    hm.xdg.configFile."eww" = {
      source = ./../../config/eww;
      recursive = true;
    };
  };

}
