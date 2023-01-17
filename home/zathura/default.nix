{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.zathura;
in {
  options = {
    modules.zathura.enable = mkEnableOption "zathura";
  };

  config = mkIf cfg.enable {
    home.packages = [pkgs.zathura pkgs.ubuntu_font_family];
    xdg.configFile."zathura/zathurarc".source = ./../../config/zathura/zathurarc;
  };
}
