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
    # programs.xwayland.enable = true;
    # programs.hyprland.enable = true;

    programs.hyprland = {
      enable = true;
      package = inputs.hyprland.packages."x86_64-linux".hyprland.override {
        wlroots = inputs.hyprland.packages."x86_64-linux".wlroots-hyprland.overrideAttrs (old: {
          nvidiaPatches = true;
          patches =
            (old.patches or [ ])
            ++ [
              ./preferred_format.diff
            ];
        });
      };
    };

    modules = {
      pipewire.enable = true;
      kanshi.enable = true;
      foot.enable = true;
      waybar.enable = true;
      # qutebrowser.enable = true;
      mako.enable = true;
      mpv.enable = true;
      xdg.enable = true;
      zathura.enable = true;
      mpd.enable = true;
      bemenu.enable = true;
      scripts.enable = true;
      eww.enable = true;
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
      cliphist
      wf-recorder
      imv
      xdg-utils
      swayidle
      swaylock
      bashmount
      ydotool
      ncmpcpp
      # eww-wayland
      # inputs.eww.packages.${system}.eww
      inputs.hyprpaper.packages.${system}.hyprpaper
      inputs.hyprpicker.packages.${system}.hyprpicker
      capitaine-cursors
      socat

      # for when used with nvidia 
      libva
      nvidia-vaapi-driver
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

    hm.xdg.configFile = {
      "wall.jpg".source = ./../../bin/pix/tolga-ahmetler.jpg;
      "swaylock/config".source = ./../../config/swaylock/config;
      "hypr" = {
        source = ./../../config/hypr;
        recursive = true;
      };
    };

    environment.sessionVariables = {
      # theming 
      # GTK_THEME = "";
      # XCURSOR_THEME = "capitaine-cursors-white";
      # XCURSOR_SIZE = "42";

      # xdg
      XDG_SESSION_TYPE = "wayland";
      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_DESKTOP = "Hyprland";

      # wlroots
      WLR_NO_HARDWARE_CURSORS = "1";

      # nvidia 
      LIBVA_DRIVER_NAME = "nvidia";
      GBM_BACKEND = "nvidia-drm";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";

      # qt 
      QT_AUTO_SCREEN_SCALE_FACTOR = "1";
      QT_QPA_PLATFORM = "wayland;xcb";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      QT_QPA_PLATFORMTHEME = "qt5ct";

      # toolkit backend variables
      SDL_VIDEODRIVER = "wayland";
      # _JAVA_AWT_WM_NONEREPARENTING = 1;
      CLUTTER_BACKEND = "wayland";
      # GDK_BACKEND = "wayland";
    };

    services.greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
          user = "greeter";
        };
        initial_session = {
          command = "Hyprland";
          user = config.user.name;
        };
      };
    };

  };
}


