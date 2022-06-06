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
    hm.home.packages = [ pkgs.kanshi ];
    hm.xdg.configFile."kanshi/config".source = ./../../config/kanshi/config;
  };

}
