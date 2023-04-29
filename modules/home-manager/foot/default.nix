{pkgs, ...}: {
  xdg.configFile."foot/foot.ini".source = ../../../configs/foot/foot.ini;
  home.packages = [pkgs.foot pkgs.ubuntu_font_family pkgs.cascadia-code];
}
