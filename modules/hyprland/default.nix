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
      socat
      # capitaine-cursors-yellow

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
      "wall.jpg".source = ./../../bin/pix/sies-kranen.jpg;
      "swaylock/config".source = ./../../config/swaylock/config;
      "hypr" = {
        source = ./../../config/hypr;
        recursive = true;
      };
    };

    environment.sessionVariables = {
      XDG_SESSION_TYPE = "wayland";
      WLR_NO_HARDWARE_CURSORS = "1";
      LIBVA_DRIVER_NAME = "nvidia";
      GBM_BACKEND = "nvidia-drm";
      GLX_VENDOR_LIBRARY_NAME = "nvidia";
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


