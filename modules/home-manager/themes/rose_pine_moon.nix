/*
wezterm -> "Rosé Pine Moon (Gogh)"
helix -> "rose_pine_moon"
*/
rec {
  bg = "232136";
  layer = "2a273f";

  text = "e0def4";
  text2 = "6e6a86";

  accent = text;
  accent2 = "9ccfd8";

  flat = false;

  menu = {
    focus = {
      fg = layer;
      bg = text;
    };
    bg = "393552";
    text = text;
    text2 = text;
  };

  bar = {
    hover = layer;
    focus = {
      fg = text;
      bg = layer;
    };
    text = text;
    inherit bg;
  };

  hyprland = {
    wall = "jase_bloor.jpg";
    border = {
      # active = "rgb(${}) rgb(${}) 45deg";
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
