{pkgs, ...}: {
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-Dark";
      package = pkgs.gnome-themes-extra;
    };
  };

  # qt = {
  #   enable = true;
  #   platformTheme.name = "adwaita";
  #   style = {
  #     package = pkgs.adwaita-qt;
  #     name = "adwaita-dark";
  #   };
  # };
}
