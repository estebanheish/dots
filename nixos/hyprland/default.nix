{ config, lib, pkgs, inputs, system, user, ... }:
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
    programs.hyprland.enable = true;
    home-manager.users.${user}.modules.hyprland.enable = true;

    modules = {
      scripts.enable = true;
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
          user = user;
        };
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
      # LIBVA_DRIVER_NAME = "nvidia";
      GBM_BACKEND = "nvidia-drm";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";

      # qt 
      QT_AUTO_SCREEN_SCALE_FACTOR = "1";
      QT_QPA_PLATFORM = "wayland;xcb";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      QT_QPA_PLATFORMTHEME = "qt5ct";

      SDL_VIDEODRIVER = "wayland";
      # _JAVA_AWT_WM_NONEREPARENTING = 1;
      CLUTTER_BACKEND = "wayland";
      # GDK_BACKEND = "wayland";

      # firefox vaapi
      LIBVA_DRIVER_NAME = "nvidia";
      MOZ_DISABLE_RDD_SANDBOX = "1";
      MOZ_ENABLE_WAYLAND = "1";
      EGL_PLATFORM = "wayland";
    };

  };
}


