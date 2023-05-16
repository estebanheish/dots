{
  pkgs,
  inputs,
  colors,
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
    ../bemenu
  ];

  home.packages = with pkgs; [
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
    # inputs.hyprpaper.packages.${pkgs.system}.hyprpaper
    # hyprpaper
    swaybg
    inputs.hyprpicker.packages.${pkgs.system}.hyprpicker
    capitaine-cursors
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
    # "wall.jpg".source = ../../../misc/walls/${colors.wall};
    "swaylock/config".source = ../../../configs/swaylock/config;
    "hypr/hyprland.conf".text = import ./config.nix {inherit colors;};
    # "hypr/hyprpaper.conf".text = ''
    #   preload = ~/.config/wall.jpg
    #   wallpaper = ,~/.config/wall.jpg
    # '';
  };
}
