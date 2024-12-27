{
  pkgs,
  # theme,
  ...
}: {
  home.packages = with pkgs; [monaspace];

  programs.zathura = {
    enable = true;
    options = {
      font = "Monaspace Xenon 14";
      recolor = "true";
      render-loading = "true";
      statusbar-home-tilde = "true";
      selection-clipboard = "clipboard";

      # default-bg = "#${theme.black}";

      # recolor-darkcolor = "#${theme.foreground}";
      # recolor-lightcolor = "#${theme.background}";
    };
  };
}
