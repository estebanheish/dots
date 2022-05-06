{ config, lib, pkgs, ... }:
with lib;
let 
  cfg = config.modules.qutebrowser;
in
{

  options = {
    modules.qutebrowser.enable = mkEnableOption "qutebrowser";
  };

  config = mkIf cfg.enable {
    hm.home.packages = [ pkgs.qutebrowser ];
    hm.configFile."qutebrowser" = { source = ./../../config/qutebrowser; recursive = true; };
  };

}
