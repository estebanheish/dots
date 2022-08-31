{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.modules.river;
in
{
  options = {
    modules.river.enable = mkEnableOption "river";
  };

  config = mkIf cfg.enable {

    hardware.opengl.enable = true;
    security.polkit.enable = true;
    security.pam.services.swaylock = { };
    # programs.dconf.enable = true;
    # programs.xwayland.enable = true;

    xdg.portal = {
      enable = true;
      wlr.enable = true;
    };

    modules = {
      pipewire.enable = true;
      kanshi.enable = true;
      foot.enable = true;
      yambar.enable = true;
      qutebrowser.enable = true;
      mako.enable = true;
      mpv.enable = true;
      xdg.enable = true;
      zathura.enable = true;
      mpd.enable = true;
    };

    fonts.fonts = with pkgs; [ ubuntu_font_family ];

    environment.systemPackages = with pkgs; [
      river
      rivercarro
      bemenu
      wev
      firefox-wayland
      wlr-randr
      grim
      slurp
      playerctl
      wl-clipboard
      imv
      swaybg
      xdg-utils
      swayidle
      swaylock
      bashmount
      ydotool
      capitaine-cursors-yellow
    ];

    # themes
    hm.gtk = {
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

    environment.sessionVariables = {
      XKB_DEFAULT_LAYOUT = "us(colemak)";
    };

    hm.xdg.configFile = {
      "river" = {
        source = ./../../config/river;
        recursive = true;
      };
      "wall".source = ./../../bin/pix/moon.jpg;
      "swaylock/config".source = ./../../config/swaylock/config;
    };

    services.greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd river";
          user = "greeter";
        };
        initial_session = {
          command = "river";
          user = config.user.name;
        };
      };
    };

  };
}


