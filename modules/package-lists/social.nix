{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.modules.packages.social;
in
{

  options = {
    modules.packages.social.enable = mkEnableOption "social packages";
  };

  config = mkIf cfg.enable {

    environment.systemPackages = with pkgs; [
      discord 
      tdesktop
    ];
    
  };

}
