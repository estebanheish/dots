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

        regular0 = colors.normal.black;
        regular1 = colors.normal.red;
        regular2 = colors.normal.green;
        regular3 = colors.normal.yellow;
        regular4 = colors.normal.blue;
        regular5 = colors.normal.magenta;
        regular6 = colors.normal.cyan;
        regular7 = colors.normal.white;

        bright0 = colors.bright.black;
        bright1 = colors.bright.red;
        bright2 = colors.bright.green;
        bright3 = colors.bright.yellow;
        bright4 = colors.bright.blue;
        bright5 = colors.bright.magenta;
        bright6 = colors.bright.cyan;
        bright7 = colors.bright.white;
      };
    };
  };
}
