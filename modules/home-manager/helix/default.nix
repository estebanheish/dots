{
  inputs,
  pkgs,
  ...
}: {
  programs.helix = {
    enable = true;
    package = inputs.helix.packages.${pkgs.system}.default;
  };
  xdg.configFile."helix" = {
    source = ../../../configs/helix;
    recursive = true;
  };
}
