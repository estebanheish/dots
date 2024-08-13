{pkgs, ...}: {
  home.packages = with pkgs; [
    # foot
    # ubuntu_font_family
    # cascadia-code
    monaspace
    # martian-mono
  ];
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "Monaspace Neon:size=14";
        font-bold = "Monaspace Neon:size=14:style=Bold";
        font-italic = "Monaspace Neon:size=14:style=BoldItalic";
        font-bold-italic = "Monaspace Neon:size=14:style=Italic";
        pad = "12x7";
        dpi-aware = "yes";
      };

      mouse = {
        hide-when-typing = "yes";
      };

      colors = {
        background = "191724";
        foreground = "e0def4";
        regular0 = "26233a";
        regular1 = "eb6f92";
        regular2 = "31748f";
        regular3 = "f6c177";
        regular4 = "9ccfd8";
        regular5 = "c4a7e7";
        regular6 = "ebbcba";
        regular7 = "e0def4";
        bright0 = "6e6a86";
        bright1 = "eb6f92";
        bright2 = "31748f";
        bright3 = "f6c177";
        bright4 = "9ccfd8";
        bright5 = "c4a7e7";
        bright6 = "ebbcba";
        bright7 = "e0def4";
      };
    };
  };
}
