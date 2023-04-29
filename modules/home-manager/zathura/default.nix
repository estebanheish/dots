{
  config,
  lib,
  pkgs,
  ...
}: {
  home.packages = [pkgs.zathura pkgs.ubuntu_font_family];
  xdg.configFile."zathura/zathurarc".source = ../../../configs/zathura/zathurarc;
}
