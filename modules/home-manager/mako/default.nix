{pkgs, ...}: {
  home.packages = [pkgs.mako pkgs.ubuntu_font_family];
  xdg.configFile."mako/config".source = ../../../configs/mako/config;
}
