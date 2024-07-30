{...}: {
  programs.tmux = {
    enable = true;
    escapeTime = 0;
    keyMode = "vi";
    mouse = true;
  };
}
