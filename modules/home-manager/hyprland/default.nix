{
  pkgs,
  colors,
  profile,
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
      kooha
      imv
      xdg-utils
      swayidle
      swaylock
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

  home.file = {
    abre = {
      enable = true;
      source = ../../../bin/abre.nu;
      target = ".local/bin/abre";
    };
    backup_home = {
      enable = true;
      source = ../../../bin/backup_home.sh;
      target = ".local/bin/backup_home";
    };
    gamemode = {
      enable = true;
      source = ../../../bin/gamemode.nu;
      target = ".local/bin/gamemode";
    };
  };

  xdg.configFile =
    {
      "swaylock/config".source = ../../../configs/swaylock/config;
      "hypr/hyprland.conf".text = import ./config.nix {inherit colors profile;};
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
