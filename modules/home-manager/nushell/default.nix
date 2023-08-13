{pkgs, ...}: {

  programs.nushell = {
    enable = true;
    package = pkgs.nushellFull;
  };

  xdg.configFile."nushell" = {
    source = ../../../configs/nushell;
    recursive = true;
  };
}
