{pkgs, ...}: {
  home.packages = [pkgs.mpv];
  xdg.configFile."mpv/scripts" = {
    source = ../../../configs/mpv/scripts;
    recursive = true;
  };
  xdg.configFile."mpv/mpv.conf".source = ../../../configs/mpv/mpv.conf;
  xdg.configFile."mpv/input.conf".source = ../../../configs/mpv/input.conf;
}
