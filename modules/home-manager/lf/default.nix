{pkgs, ...}: {
  home.packages = [pkgs.lf];
  # environment.etc."lf/lfrc".source = ./../../config/lf/lfrc; # root
  xdg.configFile."lf/lfrc".source = ../../../configs/lf/lfrc;
}
