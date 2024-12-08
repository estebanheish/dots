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
        # pad = "12x7";
        dpi-aware = "yes";
      };

      mouse = {
        hide-when-typing = "yes";
      };

      # solarized dark
      cursor.color = "002b36 93a1a1";

      # colors = {
      #   background = "002b36";
      #   foreground = "839496";
      #   selection-foreground = "93a1a1";
      #   selection-background = "073642";
      #   regular0 = "073642";
      #   regular1 = "dc322f";
      #   regular2 = "859900";
      #   regular3 = "b58900";
      #   regular4 = "268bd2";
      #   regular5 = "d33682";
      #   regular6 = "2aa198";
      #   regular7 = "eee8d5";
      #   bright0 = "002b36";
      #   bright1 = "cb4b16";
      #   bright2 = "586e75";
      #   bright3 = "657b83";
      #   bright4 = "839496";
      #   bright5 = "6c71c4";
      #   bright6 = "93a1a1";
      #   bright7 = "fdf6e3";
      # };

      # rose pine
      #   colors = {
      #     background = "191724";
      #     foreground = "e0def4";
      #     regular0 = "26233a";
      #     regular1 = "eb6f92";
      #     regular2 = "31748f";
      #     regular3 = "f6c177";
      #     regular4 = "9ccfd8";
      #     regular5 = "c4a7e7";
      #     regular6 = "ebbcba";
      #     regular7 = "e0def4";
      #     bright0 = "6e6a86";
      #     bright1 = "eb6f92";
      #     bright2 = "31748f";
      #     bright3 = "f6c177";
      #     bright4 = "9ccfd8";
      #     bright5 = "c4a7e7";
      #     bright6 = "ebbcba";
      #     bright7 = "e0def4";
      #   };
      # };

      # gruvbox
      colors = {
        background = "282828";
        foreground = "ebdbb2";
        regular0 = "282828";
        regular1 = "cc241d";
        regular2 = "98971a";
        regular3 = "d79921";
        regular4 = "458588";
        regular5 = "b16286";
        regular6 = "689d6a";
        regular7 = "a89984";
        bright0 = "928374";
        bright1 = "fb4934";
        bright2 = "b8bb26";
        bright3 = "fabd2f";
        bright4 = "83a598";
        bright5 = "d3869b";
        bright6 = "8ec07c";
        bright7 = "ebdbb2";
      };
    };
  };
}
