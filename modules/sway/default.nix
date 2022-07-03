{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.modules.sway;
in
{

  options = {
    modules.sway.enable = mkEnableOption "swaywm configuration";
  };

  config = mkIf cfg.enable {

    modules = {
      xdg.enable = true;
      pipewire.enable = true;
      zathura.enable = true;
      qutebrowser.enable = true;
      mpv.enable = true;
      i3-status-rust.enable = false;
      waybar.enable = true;
      mpd.enable = true;
      foot.enable = true;
      mako.enable = true;
    };

    services.dbus.enable = true;

    programs.sway = {
      enable = true;
      wrapperFeatures.gtk = false;
    };

    fonts.fonts = with pkgs; [ ubuntu_font_family ];

    hm.home.packages = with pkgs; [
      firefox-wayland
      swaylock
      swayidle
      bemenu
      wev
      bashmount
      libnotify
      #waypipe
      wl-clipboard
      clipman
      grim
      slurp
      wf-recorder
      swappy
      pulsemixer
      pamixer
      imv
      mpc_cli
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
    users.groups.greeter = { };
    services.greetd = {
      enable = true;
      package = "greetd.tuigreet";
      restart = true;
      settings = {
        default_session = {
          command = "${lib.makeBinPath [pkgs.greetd.tuigreet] }/tuigreet --time --cmd sway";
          user = "greeter";
        };
        initial_session = {
          command = "sway";
          user = config.user.name;
        };
      };
    };
    ###

    ### themes
    #hm.gtk = {
    #  enable = true;
    #  iconTheme = {
    #    name = "ePapirus";
    #    package = pkgs.papirus-icon-theme;
    #  };
    #  theme = {
    #    name = "Adwaita-dark";
    #    package = pkgs.gnome-themes-extra;
    #  };
    #};
    #hm.qt = {
    #  enable = true;
    #  platformTheme = "gtk";
    #  style.name = "Adwaita-dark";
    #  style.package = pkgs.adwaita-qt;
    #};
    ###

    ### scripts
    environment.localBinInPath = true;
    hm.home.file.".local/bin" = {
      source = ./../../bin/scripts;
      recursive = true;
    };

    hm.xdg.configFile = {
      "sway/config".source = ./../../config/sway/config;
      "sway/config.d" = {
        source = ./../../config/sway/config.d;
        recursive = true;
      };
      "swaylock/config".source = ./../../config/swaylock/config;
    };

    hm.home.file.".wall.png".source = ./../../bin/pix/palm_tree.jpg;

  };

}
