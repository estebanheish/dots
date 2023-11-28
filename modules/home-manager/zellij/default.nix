{...}: {
  programs.zellij = {
    enable = true;
    settings = {
      simplified_ui = true;
      pane_frames = false;
      theme = "nord";
      default_layout = "compact";
      copy_command = "Wl-copy";
    };
  };
}
