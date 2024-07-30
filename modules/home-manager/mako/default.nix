{
  pkgs,
  theme,
  ...
}:
with theme.notis; {
  home.packages = [pkgs.ubuntu_font_family];
  services.mako = {
    enable = true;

    font = "Ubuntu Bold 16";
    backgroundColor = "#${bg}";
    textColor = "#${text}";
    borderColor = "#${border}";

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
