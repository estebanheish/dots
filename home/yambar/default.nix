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
    home.packages = with pkgs; [ yambar ubuntu_font_family material-design-icons ];
    xdg.configFile."yambar/config.yml".source = ./../../config/yambar/config.yml;
  };
}
