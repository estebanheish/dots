{pkgs, ...}: {
  programs.nushell = {
    enable = true;
    package = pkgs.nushell;
  };

  xdg.configFile."nushell" = {
    source = ../../../configs/nushell;
    recursive = true;
  };
}
