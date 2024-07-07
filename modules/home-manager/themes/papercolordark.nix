/*
wezterm -> "Papercolor Dark (Gogh)"
helix -> "fleet_dark"
*/
rec {
  bg = "1c1c1c";
  layer = "585858";

  text = "d0d0d0";
  text2 = "d0d0d0";

  accent = "af87d7";
  accent2 = "ffaf00";

  surface = "2a273f";
  overlay = layer;
  muted = text2;

  flat = false;

  menu = {
    focus = {
      fg = bg;
      bg = text;
    };
    bg = bg;
    text = text;
    text2 = text;
  };

  bar = {
    hover = layer;
    focus = {
      fg = bg;
      bg = text;
    };
    text = text;
    inherit bg;
  };

  hyprland = {
    wall = "orange_water.jpg";
    border = {
      active = "rgb(${accent}) rgb(${accent2}) 45deg";
      # active = "rgb(${accent})";
      inactive = "rgb(${layer})";
    };
    group_border = {
      active = accent2;
      inactive = layer;
    };
    inherit text accent accent2 layer bg;
  };

  notis = {
    bg = bg;
    border = layer;
    layer = bg;
    hover = layer;
    accent = text;
    inherit text muted;
  };

  terminal = {
    custom_tab = true;
    window_frame = {
      active_titlebar_bg = "080808";
      inactive_titlebar_bg = "080808";
    };
    colors = {
      scrollbar_thumb = layer;
      tab_bar = {
        inactive_tab_edge = text2;
        active_tab = {
          bg_color = "333333";
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
