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
    ../tofi
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

  home.file.abre = {
    enable = true;
    source = ../../../bin/abre.nu;
    target = ".local/bin/abre";
  };

  xdg.configFile = {
    # "wall.jpg".source = ../../../misc/walls/${colors.wall};
    "swaylock/config".source = ../../../configs/swaylock/config;
    "hypr/hyprland.conf".text = import ./config.nix {inherit colors;};
    "hypr/profile.nu".text = ''
      def main [] {
      	match (hostname) {
      	  "nyx" => {
      			hyprctl --batch "keyword input:sensitivity -1 ; keywords input:kb_variant ,"
      		}
      	}
      }
    '';
    # "hypr/hyprpaper.conf".text = ''
    #   preload = ~/.config/wall.jpg
    #   wallpaper = ,~/.config/wall.jpg
    # '';
  };
}
