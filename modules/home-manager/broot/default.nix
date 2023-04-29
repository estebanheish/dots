{pkgs, ...}: {
  home.packages = [pkgs.broot];
  xdg.configFile."broot" = {
    source = ../../../configs/broot;
    recursive = true;
  };
}
