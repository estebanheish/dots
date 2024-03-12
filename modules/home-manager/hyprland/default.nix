{
  pkgs,
  colors,
  profile,
  inputs,
  ...
}: {
  imports = [
    ../foot
    ../mako
    ../mpv
    ../eww
    ../xdg
    ../zathura
    ../mpd
    ../tofi
  ];

  home.packages = with pkgs;
    [
      ubuntu_font_family
      wev
      grim
      slurp
      playerctl
      wl-clipboard
      cliphist
      wf-recorder
      # kooha
      imv
      xdg-utils
      # swayidle
      # swaylock
      inputs.hypridle.packages.${pkgs.system}.default
      inputs.hyprlock.packages.${pkgs.system}.default
      ncmpcpp
      pulsemixer
      hyprpicker
      swappy
    ]
    ++ (
      if builtins.hasAttr "wall" colors
      then [hyprpaper]
      else []
    );

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
    cursorTheme = {
      name = "capitaine-cursors-white";
      package = pkgs.capitaine-cursors;
      size = 32;
    };
  };

  # adwaita dark theme
  dconf.settings."org/gnome/desktop/interface" = {"color-scheme" = "prefer-dark";};

  home.file."bin" = {
    enable = true;
    source = ../../../bin;
    target = ".local/bin";
    recursive = true;
    executable = true;
  };

  home.file.".local/share/icons/" = {
    enable = true;
    source = ./cursors;
    # target = ".local/share/icons/";
    recursive = true;
  };

  xdg.configFile =
    {
      # "swaylock/config".source = ../../../configs/swaylock/config;
      "hypr/hyprland.conf".text = import ./config.nix {inherit colors profile;};
      "hypr/hypridle.conf".text = ''
        general {
          lock_cmd = pidof hyprlock || hyprlock
          before_sleep_cmd = loginctl lock-session
          after_sleep_cmd = hyprctl dispatch dpms on
        }
        listener {
          timeout = 300
          on-timeout = loginctl lock-session
          on-timeout = wpctl set-mute @DEFAULT_AUDIO_SOURCE@ 1
        }
        listener {
          timeout = 300
          on-timeout = wpctl set-mute @DEFAULT_AUDIO_SOURCE@ 1
        }
        listener {
          timeout = 380
          on-timeout = hyprctl dispatch dpms off
          on-resume = hyprctl dispatch dpms on
        }
      '';
      "hypr/hyprlock.conf".text = ''
        background {
          monitor =
          color = rgb(0, 0, 0)
          blur_passes = 0
        }
        label {
            monitor =
            text = cmd[update:100000] echo "<b> $(date +"%A, %d, %B") </b>"
            color = rgb(cdd6f4)
            font_size = 24
            font_family = Ubuntu Regular
            position = 0, 136
            halign = center
            valign = center
        }
        label {
            monitor =
            text = cmd[update:60000] echo "<b><big> $(date +"%H:%M") </big></b>"
            color = rgb(cdd6f4)
            font_size = 88
            font_family = Ubuntu Regular
            position = 0, 16
            halign = center
            valign = center
        }
        input-field {
            monitor =
            size = 50, 50
            outline_thickness = 5
            hide_input = true
            fade_on_empty = true
            placeholder_text =
            inner_color = rgb(cdd6f4)
            position = 0, -50
            halign = center
            valign = center
        }
      '';
    }
    // (
      if builtins.hasAttr "wall" colors
      then {
        "${colors.wall}".source = ../../../misc/walls/${colors.wall};
        "hypr/hyprpaper.conf".text = ''
          preload = ~/.config/${colors.wall}
          wallpaper = ,~/.config/${colors.wall}
          ipc = off
        '';
      }
      else {}
    );
}
