{
  inputs,
  pkgs,
  theme,
  ...
}: {
  home.packages = [
    pkgs.eww
    inputs.eww-scripts.packages.${pkgs.system}.default
    pkgs.nerd-fonts.inconsolata
    pkgs.ubuntu_font_family
  ];

  xdg.configFile = {
    "eww/eww.yuck".source = ../../../configs/eww/eww.yuck;
    "eww/eww.scss".source = ../../../configs/eww/eww.scss;
    # "eww/scripts" = {
    #   source = ../../../configs/eww/scripts;
    #   recursive = true;
    # };
    "eww/theme.scss".text = ''
      $foreground: #${theme.foreground};
      $background: #${theme.background};
      $backgroundrgba: ${theme.backgroundrgba};
      $focus: #${theme.focus};
      $focus_background: #${theme.focus_background};
      $red: #${theme.red};
    '';
  };
}
