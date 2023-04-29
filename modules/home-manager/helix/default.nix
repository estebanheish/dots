{...}: {
  programs.helix.enable = true;
  xdg.configFile."helix" = {
    source = ../../../configs/helix;
    recursive = true;
  };
}
