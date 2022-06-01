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
    hm.xdg.configFile."qutebrowser/config.py".source = ./../../config/qutebrowser/config.py;
    hm.xdg.configFile."qutebrowser/quickmarks".source = ./../../config/qutebrowser/quickmarks;
  };

}
