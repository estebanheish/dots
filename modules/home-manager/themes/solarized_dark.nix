/*
wezterm -> "Solarized Dark (Gogh)"
helix -> "solarized_dark"
*/
rec {
  bg = "002b36";
  layer = "073642";

  text = "93a1a1";
  text2 = "839496";

  accent = "2aa198";
  accent2 = "d33682";

  flat = false;

  menu = {
    focus = {
      fg = layer;
      bg = text2;
    };
    text = text2;
    inherit bg text2;
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
      inactive = layer;
    };
    group_border = {
      active = accent2;
      inactive = layer;
    };
    inherit text accent accent2 layer bg;
  };

  notis = {
    border = accent;
    inherit bg text;
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
