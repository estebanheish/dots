{
  pkgs,
  colors,
  ...
}: {
  home.packages = with pkgs; [
    foot
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
      };

      mouse = {
        hide-when-typing = "yes";
      };

      cursor = {
        color = "${colors.background} ${colors.cursor}";
      };

      colors = {
        alpha =
          if colors.flat
          then "1"
          else "0.9";
        background = colors.terminal_background;
        foreground = colors.foreground;

        # selection-background = colors.selection_background;
        # selection-foreground = colors.selection_foreground;

        regular0 = colors.black;
        regular1 = colors.red;
        regular2 = colors.green;
        regular3 = colors.yellow;
        regular4 = colors.blue;
        regular5 = colors.magenta;
        regular6 = colors.cyan;
        regular7 = colors.white;

        bright0 = colors.bright_black;
        bright1 = colors.bright_red;
        bright2 = colors.bright_green;
        bright3 = colors.bright_yellow;
        bright4 = colors.bright_blue;
        bright5 = colors.bright_magenta;
        bright6 = colors.bright_cyan;
        bright7 = colors.bright_white;
      };
    };
  };
}
