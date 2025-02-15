{...}: {
  programs.zellij = {
    enable = true;
    settings = {
      simplified_ui = true;
      pane_frames = false;
      theme = "rose-pine";
      themes.rose-pine = {
        bg = "#403d52";
        fg = "#e0def4";
        red = "#eb6f92";
        green = "#31748f";
        blue = "#9ccfd8";
        yellow = "#f6c177";
        magenta = "#c4a7e7";
        orange = "#fe640b";
        cyan = "#ebbcba";
        black = "#26233a";
        white = "#e0def4";
      };
      default_layout = "compact";
      copy_command = "wl-copy";
      keybinds.tab = {
        "bind \"q\"" = {
          GoToTab = 1;
          SwitchToMode = "normal";
        };
        "bind \"w\"" = {
          GoToTab = 2;
          SwitchToMode = "normal";
        };
        "bind \"f\"" = {
          GoToTab = 3;
          SwitchToMode = "normal";
        };
        "bind \"p\"" = {
          GoToTab = 4;
          SwitchToMode = "normal";
        };
        "bind \"g\"" = {
          GoToTab = 5;
          SwitchToMode = "normal";
        };
      };
    };
  };
}
