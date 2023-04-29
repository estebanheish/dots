{
  pkgs,
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
    ../bemenu
  ];

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
    kooha
    imv
    xdg-utils
    swayidle
    swaylock
    ncmpcpp
    pulsemixer
    # eww-wayland
    # inputs.eww.packages.${pkgs.system}.eww
    # inputs.hyprpaper.packages.${pkgs.system}.hyprpaper
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
    # "wall.jpg".source = ./../../bin/pix/himachal.jpg;
    "swaylock/config".source = ../../../configs/swaylock/config;
    "hypr" = {
      source = ../../../configs/hypr;
      recursive = true;
    };
  };
}
