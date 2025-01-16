{pkgs, ...}: {
  home.packages = [pkgs.helix];
  xdg.configFile."helix" = {
    source = ../../../configs/helix;
    recursive = true;
  };
}
