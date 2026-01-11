{
  pkgs,
  config,
  lib,
  ...
}: let
  l = import ../lib {inherit config;};
  inherit (l) linkFile;
in {
  home.packages = with pkgs; [
    foot
    monaspace
  ];
  xdg.configFile = {
    "foot/foot.ini".source = linkFile "foot/foot.ini";
    "foot/theme.ini" = lib.mkDefault {
      source = linkFile "foot/themes/github_dark.ini";
    };
  };
}
