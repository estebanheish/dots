{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.modules.kanshi;
in
{

  options = {
    modules.kanshi.enable = mkEnableOption "kanshi";
  };

  config = mkIf cfg.enable {
    hm.services.kanshi = {
      enable = true;
      extraConfig = builtins.readFile ./../../config/kanshi/config;
      systemdTarget = "graphical.target";
    };
  };

}
