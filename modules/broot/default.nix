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
    environment.systemPackages = [ pkgs.broot ];
    hm.xdg.configFile."broot" = {
      source = ./../../config/broot;
      recursive = true;
    };
  };

}
