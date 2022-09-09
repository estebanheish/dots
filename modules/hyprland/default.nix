{ config, lib, pkgs, inputs, system, ... }:
with lib;
let
  cfg = config.modules.hyprland;
in
{
  options = {
    modules.hyprland.enable = mkEnableOption "hyprland";
  };

  config = mkIf cfg.enable {

    security.pam.services.swaylock = { };
    programs.hyprland.enable = true;
    # programs.xwayland.enable = true;

    modules = {
      pipewire.enable = true;
      kanshi.enable = true;
      foot.enable = true;
      waybar.enable = true;
      qutebrowser.enable = true;
      mako.enable = true;
      mpv.enable = true;
      xdg.enable = true;
      zathura.enable = true;
      mpd.enable = true;
      bemenu.enable = true;
      scripts.enable = true;
    };

    fonts.fonts = with pkgs; [ ubuntu_font_family ];

    environment.systemPackages = with pkgs; [
      bemenu
      wev
      firefox-wayland
      grim
      slurp
      playerctl
      wl-clipboard
      imv
      xdg-utils
      swayidle
      swaylock
      bashmount
      ydotool
      ncmpcpp
      eww-wayland
      # inputs.eww.packages.${system}.eww
      inputs.hyprpaper.packages.${system}.hyprpaper
      inputs.hyprpicker.packages.${system}.hyprpicker
      socat
      # capitaine-cursors-yellow
    ];

    # themes
    # hm.gtk = {
    #   enable = true;
    #   iconTheme = {
    #     name = "Adwaita";
    #     package = pkgs.gnome.adwaita-icon-theme;
    #   };
    #   theme = {
    #     name = "Adwaita-dark";
    #     package = pkgs.gnome-themes-extra;
    #   };
    # };

    hm.xdg.configFile = {
      "wall.jpg".source = ./../../bin/pix/houseonthesideofalake.jpg;
      "swaylock/config".source = ./../../config/swaylock/config;
      "hypr" = {
        source = ./../../config/hypr;
        recursive = true;
      };
    };

    services.greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
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


