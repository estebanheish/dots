{
  pkgs,
  colors,
  ...
}: {
  home.packages = with pkgs; [
    # foot
    # ubuntu_font_family
    # cascadia-code
    martian-mono
  ];
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "Martian Mono Std Md:size=12:style=Semibold";
        font-bold = "Martian Mono Std Md:size=12:style=Bold";
        font-italic = "Martian Mono Std Md:size=12:style=Italic";
        font-bold-italic = "Martian Mono Std Md:size=12:style=BoldItalic";
        pad = "15x15";
        dpi-aware = "yes";
      };

      mouse = {
        hide-when-typing = "yes";
      };

      cursor = {
        color = "${colors.on_primary} ${colors.primary}";
      };

      colors = {
        alpha =
          if colors.flat
          then "1"
          else colors.alpha;
        background = colors.background;
        foreground = colors.on_surface;

        # selection-background = colors.selection_background;
        # selection-foreground = colors.selection_foreground;

        regular0 = "01060E";
        regular1 = "EA6C73";
        regular2 = "91B362";
        regular3 = "F9AF4F";
        regular4 = "53BDFA";
        regular5 = "FAE994";
        regular6 = "90E1C6";
        regular7 = "C7C7C7";

        bright0 = "686868";
        bright1 = "F07178";
        bright2 = "C2D94C";
        bright3 = "FFB454";
        bright4 = "59C2FF";
        bright5 = "FFEE99";
        bright6 = "95E6CB";
        bright7 = "FFFFFF";
      };
    };
  };
}
