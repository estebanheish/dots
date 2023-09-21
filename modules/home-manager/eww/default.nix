{
  inputs,
  pkgs,
  colors,
  ...
}: {
  home.packages = [
    pkgs.eww-wayland
    inputs.eww-scripts.packages.${pkgs.system}.default
    pkgs.inconsolata-nerdfont
    pkgs.ubuntu_font_family
  ];

  xdg.configFile = {
    "eww/eww.yuck".source = ../../../configs/eww/eww.yuck;
    "eww/eww.scss".source = ../../../configs/eww/eww.scss;
    # "eww/scripts" = {
    #   source = ../../../configs/eww/scripts;
    #   recursive = true;
    # };
    "eww/colors.scss".text = ''
      $foreground: #${colors.foreground};
      $background: #${colors.background};
      $backgroundrgba: ${colors.backgroundrgba};
      $focus: #${colors.focus};
      $focus_background: #${colors.focus_background};
      $red: #${colors.red};
    '';
  };
}
