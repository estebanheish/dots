# https://arsmoriendy.github.io/GruvboxHSL/
rec {
  name = {
    files = "gruvbox";
    wezterm = "Gruvbox Dark (Gogh)";
    helix = "gruvbox";
  };

  bg = background_muted;
  layer = bg_soft;
  overlay = bg_1;

  text = foreground;
  text2 = foreground_muted;

  accent = green;
  accent2 = yellow;

  background = "928374";
  red = "FB4934";
  green = "B8BB26";
  yellow = "FABD2F";
  blue = "83A598";
  purple = "D3869B";
  aqua = "8EC07C";
  orange = "FE8019";
  foreground = "EBDBB2";

  background_muted = "282828";
  red_muted = "CC241DA";
  green_muted = "98971A";
  yellow_muted = "D79921";
  blue_muted = "458588";
  purple_muted = "B16286";
  aqua_muted = "689D6A";
  orange_muted = "D65D0E";
  foreground_muted = "A89984";

  fg_hard = "FBF1C7";
  fg_soft = "FBF1C7";
  fg_1 = "EBDBB2";
  fg_2 = "D5C4A1";
  fg_3 = "BDAE93";
  fg_4 = "A89984";

  bg_hard = "1D2021";
  bg_soft = "32302F";
  bg_1 = "3C3836";
  bg_2 = "504945";
  bg_3 = "665C54";
  bg_4 = "7C6F64";

  flat = true;

  menu = {
    focus = {
      fg = bg;
      bg = accent;
    };
    bg = bg;
    text = text;
    text2 = text2;
  };

  broot = {
    tree = layer;
    inherit bg accent;
  };

  bar = {
    hover = layer;
    focus = {
      fg = layer;
      bg = text;
    };
    text = text;
    inherit bg;
  };

  hyprland = {
    wall = "lake_hut.jpg";
    border = {
      active = "rgb(${accent}) rgb(${accent2}) 45deg";
      # active = "rgb(${accent})";
      inactive = "rgb(${layer})";
    };
    groupbar = {
      active = bg_4;
      inactive = bg_hard;
      inherit text;
    };
    inherit text accent accent2 layer bg;
  };

  notis = {
    bg = bg;
    border = background;
    layer = bg_1;
    hover = bg_2;
    accent = accent;
    muted = foreground_muted;
    inherit text;
  };
}
