{
  pkgs,
  # config,
  ...
}: {
  home.packages = with pkgs; [
    monaspace
    wev
    imv
    satty
    grimblast
    # gpu-screen-recorder

    brightnessctl
    playerctl
    wl-clipboard
    # cliphist

    ncpamixer
    impala
    bluetuith
    # ncmpcpp

    fyi
    fuzzel
    foot
  ];

  home.pointerCursor = {
    name = "Vanilla-DMZ";
    package = pkgs.vanilla-dmz;
    hyprcursor.enable = true;
  };

  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = builtins.readFile ../../../configs/hypr/hyprland.conf;
  };

  # services
  services.hyprpolkitagent.enable = true;
  services.hyprsunset.enable = true;
  services.hypridle = {
    enable = true;
    # extraConfig = builtins.readFile ../../../configs/hypr/hypridle.conf;
  };
  programs.hyprlock = {
    enable = true;
    extraConfig = builtins.readFile ../../../configs/hypr/hyprlock.conf;
  };
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = ["~/.wall.jpg"];
      wallpaper = [", ~/.wall.jpg"];
      ipc = "off";
    };
  };
  services.cliphist.enable = true;
  services.mako.enable = true;

  xdg.configFile."hypr/hypridle.conf".source = ../../../configs/hypr/hypridle.conf;
  xdg.configFile."foot/foot.ini".source = ../../../configs/foot/foot.ini;
  xdg.configFile."fuzzel/fuzzel.ini".source = ../../../configs/fuzzel/fuzzel.ini;
  xdg.configFile."mako/config".source = ../../../configs/mako/config;

  home.sessionPath = ["$HOME/.local/bin"];
  home.file = {
    "bin" = {
      enable = true;
      source = ../../../bin;
      target = ".local/bin";
      recursive = true;
      executable = true;
    };
    ".wall.jpg".source = ../../../misc/walls/tolga-ahmetler.jpg;
  };
}
