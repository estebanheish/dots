{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.modules.broot;
in
{

  options = {
    modules.broot.enable = mkEnableOption "broot";
  };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.broot ];
    xdg.configFile."broot" = {
      source = ./../../config/broot;
      recursive = true;
    };
  };

}
