{pkgs, ...}: let
  colors = {
    foreground = "f8f8f2";
    background = "1c1c1c";
    backgroundrgba = "rgba(28,28,28,0.92)";
    focus = "7aa2f7";
    focus_background = "2a2a2a";
    red = "ff6c6b";
  };
in {
  home.packages = [
    pkgs.eww
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
      $foreground: #${colors.foreground};
      $background: #${colors.background};
      $backgroundrgba: ${colors.backgroundrgba};
      $focus: #${colors.focus};
      $focus_background: #${colors.focus_background};
      $red: #${colors.red};
    '';
  };
}
