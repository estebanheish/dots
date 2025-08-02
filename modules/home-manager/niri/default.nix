{
  pkgs,
  config,
  lib,
  ...
}: let
  myLib = import ../../../lib {inherit lib config;};
in {
  imports = [
    ../librewolf
    ../mpv
    ../adwaita-dark
  ];

  home.packages = with pkgs; [
    monaspace
    wev
    imv
    satty

    brightnessctl
    playerctl
    wl-clipboard
    swaybg

    blueman

    ncpamixer
    impala
    # ncmpcpp

    fyi
    rofi-wayland
    foot
  ];

  services.mako.enable = true;
  services.swayidle = {
    enable = true;
    timeouts = [
      {
        timeout = 600;
        command = "${pkgs.niri}/bin/niri msg action power-off-monitors";
      }
      {
        timeout = 650;
        command = "${pkgs.swaylock}/bin/swaylock -f";
      }
    ];
    events = [
      {
        event = "before-sleep";
        command = "${pkgs.swaylock}/bin/swaylock -f";
      }
    ];
  };

  programs.swaylock.enable = true;
  services.polkit-gnome.enable = true;
  services.cliphist.enable = true;

  xdg.configFile = myLib.mkRecSymCfg ["niri" "mako" "foot" "swaylock" "rofi"];

  home.file = {
    "bin" = {
      enable = true;
      source = ../../../bin;
      target = ".local/bin";
      recursive = true;
      executable = true;
    };
    ".wall.jpg".source = ../../../misc/walls/moon.jpg;
  };
}
