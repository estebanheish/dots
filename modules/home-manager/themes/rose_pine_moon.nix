/*
wezterm -> "Rosé Pine Moon (Gogh)"
helix -> "rose_pine_moon"
*/
rec {
  bg = base;
  layer = surface;

  text2 = subtle;

  accent = text;
  accent2 = "9ccfd8";

  base = "232136";
  surface = "2a273f";
  overlay = "393552";
  muted = "6e6a86";
  subtle = "908caa";
  text = "e0def4";
  love = "eb6f92";
  gold = "f6c177";
  rose = "ea9a97";
  pine = "3e8fb0";
  foam = "9ccfd8";
  iris = "c4a7e7";
  hl_low = "2a283e";
  hl_med = "44415a";
  hl_high = "56526e";

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
    wall = "jase_bloor.jpg";
    border = {
      active = "rgb(${iris}) rgb(${love}) 45deg";
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
    bg = layer;
    border = hl_high;
    layer = overlay;
    hover = hl_med;
    accent = text;
    inherit text muted;
  };

  terminal = {
    custom_tab = true;
    window_frame = {
      active_titlebar_bg = "191724";
      inactive_titlebar_bg = "191724";
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
