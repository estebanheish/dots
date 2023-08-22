{
  pkgs,
  inputs,
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
      # hyprpaper
      swaybg
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
    game_monitors = {
      enable = true;
      source = ../../../bin/game_monitors.nu;
      target = ".local/bin/game_monitors";
    };
  };

  xdg.configFile = {
    # "${colors.wall}".source = ../../../misc/walls/${colors.wall};
    "swaylock/config".source = ../../../configs/swaylock/config;
    "hypr/hyprland.conf".text = import ./config.nix {inherit colors profile;};
    # "hypr/hyprpaper.conf".text = ''
    #   preload = ~/.config/${colors.wall}
    #   wallpaper = ,~/.config/${colors.wall}
    # '';
  };
}
