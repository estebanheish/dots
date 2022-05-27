{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.modules.alacritty;
in
{

  options = {
    modules.alacritty.enable = mkEnableOption "alacritty";
  };

  config = mkIf cfg.enable {
    hm.home.packages = [ pkgs.alacritty ];
    hm.xdg.configFile."alacritty/alacritty.yml".source = ./../../config/alacritty/alacritty.yml;
  };

}
