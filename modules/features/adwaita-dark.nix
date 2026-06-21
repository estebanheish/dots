{config, ...}: {
  flake.nixosModules.adwaita-dark = {
    home-manager.users.${config.username} = {pkgs, ...}: {
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
        gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
        gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
      };

      qt = {
        enable = true;
        platformTheme.name = "adwaita";
        style = {
          name = "adwaita-dark";
          package = pkgs.adwaita-qt;
        };
      };
    };
  };
}
