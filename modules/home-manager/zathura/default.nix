{
  pkgs,
  colors,
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

      default-bg = "$#{colors.black}";

      recolor-darkcolor = "#${colors.foreground}";
      recolor-lightcolor = "#${colors.background}";
    };
  };
}
