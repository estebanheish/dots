/*
wezterm -> "Solarized Dark (Gogh)"
helix -> "solarized_dark"
*/
rec {
  name = {
    files = "solarized_dark";
    wezterm = "Solarized Dark - Patched";
    helix = "solarized_dark";
  };

  bg = base03;
  layer = base02;

  text = base0;
  text2 = base1;

  accent = green;
  accent2 = blue;

  base03 = "002b36";
  base02 = "073642";
  base01 = "586e75";
  base00 = "657b83";
  base0 = "839496";
  base1 = "93a1a1";
  base2 = "eee8d5";
  base3 = "fdf6e3";
  yellow = "b58900";
  orange = "cb4b16";
  red = "dc322f";
  magenta = "d33682";
  violet = "6c71c4";
  blue = "268bd2";
  cyan = "2aa198";
  green = "859900";

  flat = true;

  menu = {
    focus = {
      fg = layer;
      bg = text2;
    };
    text = text2;
    inherit bg text2;
  };

  broot = {
    tree = layer;
    inherit bg accent;
  };

  bar = {
    hover = layer;
    focus = {
      fg = layer;
      bg = text2;
    };
    text = text2;
    inherit bg;
  };

  hyprland = {
    wall = "solarized_vertical.jpg";
    border = {
      # active = "rgb(${accent}) rgb(${accent2}) 45deg";
      active = "rgb(${accent})";
      inactive = "rgb(${layer})";
    };
    groupbar = {
      active = accent2;
      inactive = layer;
      inherit text;
    };
    inherit text accent accent2 layer bg;
  };

  notis = {
    border = base01;
    hover = "094453";
    muted = base01;
    text = text;
    inherit bg layer accent;
  };

  terminal = {
    custom_tab = true;
    window_frame = {
      active_titlebar_bg = bg;
      inactive_titlebar_bg = bg;
    };
    colors = {
      scrollbar_thumb = layer;
      tab_bar = {
        inactive_tab_edge = text2;
        active_tab = {
          bg_color = layer;
          fg_color = text;
        };
        inactive_tab = {
          bg_color = bg;
          fg_color = text2;
        };
        inactive_tab_hover = {
          bg_color = layer;
          fg_color = text2;
        };
        new_tab = {
          bg_color = bg;
          fg_color = text2;
        };
        new_tab_hover = {
          bg_color = layer;
          fg_color = text2;
        };
      };
    };
  };
}
