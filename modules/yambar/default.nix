{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.modules.yambar;
in
{

  options = {
    modules.yambar.enable = mkEnableOption "yambar";
  };

  config = mkIf cfg.enable {
    hm.home.packages = [ pkgs.yambar ];
    hm.xdg.configFile."yambar/config.yml".source = ./../../config/yambar/config.yml;
  };
}
