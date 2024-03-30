{
  pkgs,
  colors,
  ...
}: {
  home.packages = [pkgs.ubuntu_font_family];
  services.mako = {
    enable = true;

    font = "Ubuntu Bold 16";
    backgroundColor = "#${colors.surface_container}";
    textColor = "#${colors.on_surface}";
    borderColor = "#${colors.primary}";

    padding = "20";
    margin = "0";
    width = 400;
    height = 200;
    borderSize = 3;

    defaultTimeout = 3500;
    groupBy = "category";

    extraConfig = ''
      outer-margin=20
    '';
  };
}
