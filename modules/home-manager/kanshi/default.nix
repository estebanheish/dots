{pkgs, ...}: {
  home.packages = [pkgs.kanshi];
  xdg.configFile."kanshi/config".source = ../../../configs/kanshi/config;
}
