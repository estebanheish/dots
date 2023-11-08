{...}: {
  programs.zellij = {
    enable = true;
    settings = {
      simplified_ui = true;
      pane_frames = false;
      theme = "solarized-dark";
      default_layout = "compact";
      copy_command = "Wl-copy";
    };
  };
}
