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
        pad = "12x7";
        dpi-aware = "yes";
      };

      mouse = {
        hide-when-typing = "yes";
      };

      cursor = colors.terminal.cursor;
      colors = colors.terminal.colors;
    };
  };
}
