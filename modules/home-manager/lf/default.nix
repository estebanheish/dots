{pkgs, ...}: {
  home.packages = with pkgs; [
    lf
    rsync # paste with progress
    gnutar
    unzip
    p7zip
    chafa
  ];
  # environment.etc."lf/lfrc".source = ./../../config/lf/lfrc; # root
  xdg.configFile."lf/lfrc".source = ../../../configs/lf/lfrc;
  xdg.configFile."lf/previewer" = {
    source = ../../../configs/lf/previewer;
    executable = true;
  };
}
