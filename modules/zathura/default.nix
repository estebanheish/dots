{ config, lib, pkgs, ... }:
with lib;
let 
  cfg = config.modules.zathura;
in
{

  options = {
    modules.zathura.enable = mkEnableOption "zathura";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [ pkgs.zathura ];
    hm.configFile."zathura/zathurarc".source = ./../../config/zathura/zathurarc;
  };

}
