{
  pkgs,
  # theme,
  ...
}: {
  home.packages = with pkgs; [ubuntu_font_family];

  programs.zathura = {
    enable = true;
    options = {
      font = "Ubuntu Bold 13";
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
