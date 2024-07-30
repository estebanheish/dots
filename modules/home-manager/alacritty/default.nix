{pkgs, ...}: {
  home.packages = [pkgs.alacritty pkgs.ubuntu_font_family pkgs.cascadia-code];
  xdg.configFile."alacritty/alacritty.yml".source = ../../../configs/alacritty/alacritty.yml;
}
