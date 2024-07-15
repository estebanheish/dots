/*
wezterm -> "nord"
helix -> "nord"
*/
rec {
  name = {
    files = "nord_dark";
    wezterm = "nord";
    helix = "nord";
  };

  bg = nord0;
  layer = nord1;

  text = nord6;
  text2 = nord5;
  muted = nord4;

  accent = nord10;
  accent2 = nord9;

  nord0 = "2e3440";
  nord1 = "3b4252";
  nord2 = "434c5e";
  nord3 = "4c566a";
  nord4 = "d8dee9";
  nord5 = "e5e9f0";
  nord6 = "eceff4";
  nord7 = "8fbcbb";
  nord8 = "88c0d0";
  nord9 = "81a1c1";
  nord10 = "5e81ac";
  nord11 = "bf616a";
  nord12 = "d08770";
  nord13 = "ebcb8b";
  nord14 = "a3be8c";
  nord15 = "b48ead";

  flat = false;

  menu = {
    focus = {
      fg = layer;
      bg = text;
    };
    bg = layer;
    text = text;
    text2 = text;
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
    wall = "ocean.jpg";
    border = {
      active = "rgb(${accent2}) rgb(${accent}) 45deg";
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
    border = accent;
    layer = nord2;
    hover = nord3;
    inherit text muted accent;
  };

  terminal = {
    custom_tab = true;
    window_frame = {
      active_titlebar_bg = "242932";
      inactive_titlebar_bg = "242932";
    };
    colors = {
      scrollbar_thumb = layer;
      tab_bar = {
        inactive_tab_edge = text2;
        active_tab = {
          bg_color = bg;
          fg_color = text;
        };
        inactive_tab = {
          bg_color = "292E38";
          fg_color = "7B879D";
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
