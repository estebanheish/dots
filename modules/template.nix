{ config, lib, pkgs, ... }:
with lib;
let 
  cfg = config.modules.placeholder;
in
{

  options = {
    modules.placeholder.enable = mkEnableOption "placeholder";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [ pkgs.placeholder ];
    hm.configFile."placeholder".source = ./../../config/placeholder;
  };

}
