{ config, lib, pkgs, ... }:
with lib;
let 
  cfg = config.modules.lf;
in
{

  options = {
    modules.lf.enable = mkEnableOption "lf";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [ pkgs.lf ];
    environment.etc."lf/lfrc".source = ./../../config/lf/lfrc; # root
    hm.configFile."lf/lfrc".source = ./../../config/lf/lfrc;
  };

}
