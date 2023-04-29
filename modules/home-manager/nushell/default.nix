{pkgs, ...}: {
  home.packages = with pkgs; [
    nushell
  ];

  xdg.configFile."nushell" = {
    source = ../../../configs/nushell;
    recursive = true;
  };
}
