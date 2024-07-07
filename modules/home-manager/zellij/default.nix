{...}: {
  programs.zellij = {
    enable = true;
    settings = {
      simplified_ui = true;
      pane_frames = false;
      # theme = "nord";
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
