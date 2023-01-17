{ config, lib, pkgs, inputs, user, ... }:
with lib;
let
  cfg = config.modules.hyprland;
in
{
  options = {
    modules.hyprland.enable = mkEnableOption "hyprland";
  };

  config = mkIf cfg.enable {

    modules = {
      kanshi.enable = true;
      foot.enable = true;
      mako.enable = true;
      mpv.enable = true;
      eww.enable = true;
      xdg.enable = true;
      zathura.enable = true;
      mpd.enable = true;
      bemenu.enable = true;
    };

    home.packages = with pkgs; [
      ubuntu_font_family
      wev
      firefox-wayland
      grim
      slurp
      playerctl
      wl-clipboard
      cliphist
      wf-recorder
      imv
      xdg-utils
      swayidle
      swaylock
      ydotool
      ncmpcpp
      pulsemixer
      # eww-wayland
      # inputs.eww.packages.${system}.eww
      # inputs.hyprpaper.packages.${system}.hyprpaper
      swaybg
      inputs.hyprpicker.packages.${system}.hyprpicker
      capitaine-cursors

      # for when used with nvidia 
      nvidia-vaapi-driver
    ];

    # themes
    gtk = {
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

    xdg.configFile = {
      # "wall.jpg".source = ./../../bin/pix/himachal.jpg;
      "swaylock/config".source = ./../../config/swaylock/config;
      "hypr" = {
        source = ./../../config/hypr;
        recursive = true;
      };
    };

  };
}


