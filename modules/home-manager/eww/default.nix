{
  inputs,
  pkgs,
  ...
}: {
  programs.eww = {
    enable = true;
    package = pkgs.eww-wayland;
    configDir = ../../../configs/eww;
  };

  home.packages = [
    inputs.eww-scripts.packages.${pkgs.system}.default
  ];
}
