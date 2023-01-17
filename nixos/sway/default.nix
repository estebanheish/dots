{
  config,
  lib,
  pkgs,
  user,
  ...
}:
with lib; let
  cfg = config.modules.sway;
in {
  options = {
    modules.sway.enable = mkEnableOption "swaywm configuration";
  };

  config = mkIf cfg.enable {
    modules = {
      pipewire.enable = true;
    };

    home-manager.users.${user}.modules = {
      xdg.enable = true;
      zathura.enable = true;
      qutebrowser.enable = true;
      mpv.enable = true;
      i3-status-rust.enable = false;
      waybar.enable = false;
      mpd.enable = true;
      foot.enable = true;
      mako.enable = true;
    };

    services.dbus.enable = true;

    programs.sway = {
      enable = true;
      wrapperFeatures.gtk = false;
    };

    fonts.fonts = with pkgs; [ubuntu_font_family];

    home-manager.users.${user}.home.packages = with pkgs; [
      firefox-wayland
      swaylock
      swayidle
      bemenu
      wev
      bashmount
      libnotify
      #waypipe
      ydotool
      wl-clipboard
      clipman
      grim
      slurp
      wf-recorder
      swappy
      pulsemixer
      pamixer
      imv
      xdg-utils
      pass-wayland
    ];

    xdg.portal = {
      enable = true;
      wlr.enable = true;
      gtkUsePortal = false;
    };

    ### greeter
    users.users.greeter.group = "greeter";
    users.groups.greeter = {};
    services.greetd = {
      enable = true;
      package = "greetd.tuigreet";
      restart = true;
      settings = {
        default_session = {
          command = "${lib.makeBinPath [pkgs.greetd.tuigreet]}/tuigreet --time --cmd sway";
          user = "greeter";
        };
        initial_session = {
          command = "sway";
          user = user;
        };
      };
    };
    ###

    ### themes
    home-manager.users.${user}.gtk = {
      enable = true;
      iconTheme = {
        name = "Adwaita";
        package = pkgs.gnome.adwaita-icon-theme;
      };
      theme = {
        name = "Adwaita-dark";
        package = pkgs.gnome-themes-extra;
      };
    };
    #hm.qt = {
    #  enable = true;
    #  platformTheme = "gtk";
    #  style.name = "adwaita-dark";
    #  style.package = pkgs.adwaita-qt;
    #};
    ###

    ### scripts
    environment.localBinInPath = true;
    home-manager.users.${user}.home.file.".local/bin" = {
      source = ./../../bin/scripts;
      recursive = true;
    };

    home-manager.users.${user}.xdg.configFile = {
      "sway/config".source = ./../../config/sway/config;
      "sway/config.d" = {
        source = ./../../config/sway/config.d;
        recursive = true;
      };
      "swaylock/config".source = ./../../config/swaylock/config;
    };

    home-manager.users.${user}.home.file.".wall.png".source = ./../../bin/pix/red_moon.jpg;
  };
}
