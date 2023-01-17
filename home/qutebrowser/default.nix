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
    home.packages = [ pkgs.qutebrowser pkgs.ubuntu_font_family ];
    xdg.configFile."qutebrowser/config.py".source = ./../../config/qutebrowser/config.py;
    xdg.configFile."qutebrowser/quickmarks".source = ./../../config/qutebrowser/quickmarks;
  };

}
