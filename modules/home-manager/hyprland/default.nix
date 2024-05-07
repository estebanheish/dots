{
  pkgs,
  theme,
  profile,
  # inputs,
  ...
}: {
  imports = [
    ../foot
    ../wezterm
    ../mako
    ../mpv
    ../ironbar
    ../xdg
    ../zathura
    ../mpd
    ../tofi
    ../firefox
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
      # wf-recorder
      # kooha
      imv
      xdg-utils
      # swayidle
      # swaylock
      # inputs.hypridle.packages.${pkgs.system}.default
      # inputs.hyprlock.packages.${pkgs.system}.default
      hypridle
      hyprlock
      ncmpcpp
      pulsemixer
      hyprpicker
    ]
    ++ (
      if builtins.hasAttr "wall" theme.hyprland
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
      "hypr/hyprland.conf".text = import ./config.nix {inherit theme profile;};
      "hypr/hypridle.conf".text = ''
        general {
          lock_cmd = pidof hyprlock || hyprlock
          before_sleep_cmd = loginctl lock-session
          after_sleep_cmd = hyprctl dispatch dpms on
        }
        listener {
          timeout = 300
          on-timeout = loginctl lock-session
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
          color = rgb(${theme.hyprland.bg})
          blur_passes = 0
        }
        label {
            monitor =
            text = cmd[update:100000] echo "<b> $(date +"%A, %d, %B") </b>"
            color = rgb(${theme.hyprland.text})
            font_size = 24
            font_family = Ubuntu Regular
            position = 0, 136
            halign = center
            valign = center
        }
        label {
            monitor =
            text = cmd[update:60000] echo "<b><big> $(date +"%H:%M") </big></b>"
            color = rgb(${theme.hyprland.text})
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
            inner_color = rgb(${theme.hyprland.text})
            position = 0, -50
            halign = center
            valign = center
        }
      '';
    }
    // (
      if builtins.hasAttr "wall" theme.hyprland
      then {
        "${theme.hyprland.wall}".source = ../../../misc/walls/${theme.hyprland.wall};
        "hypr/hyprpaper.conf".text = ''
          preload = ~/.config/${theme.hyprland.wall}
          wallpaper = ,~/.config/${theme.hyprland.wall}
          ipc = off
        '';
      }
      else {}
    );
}
