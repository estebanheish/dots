{
  pkgs,
  config,
  ...
}: {
  home.packages = with pkgs; [
    monaspace
    # wev
    # imv
    # satty
    # gpu-screen-recorder

    hypridle
    hyprlock
    hyprpaper
    # hyprpicker

    brightnessctl
    playerctl
    wl-clipboard
    cliphist

    ncpamixer
    impala
    bluetuith
    # ncmpcpp

    fyi
    fuzzel
    foot
    mako

    # wf-recorder
    # kooha
    # xdg-utils
  ];

  services.hyprpolkitagent.enable = true;
  # wayland.windowManager.hyprland = {
  #   enable = true;
  #   systemd.enable = true;
  #   xwayland.enable = false;
  # };

  xdg.configFile = builtins.listToAttrs (map (name: {
    name = name;
    # value = {
    #   source = ../../../configs/${name};
    #   recursive = true;
    # };
    value = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dots/configs/${name}";
      recursive = true;
    };
  }) ["hypr" "mako" "fuzzel" "foot"]);

  home.sessionPath = ["$HOME/.local/bin"];
  home.file."bin" = {
    enable = true;
    source = ../../../bin;
    target = ".local/bin";
    recursive = true;
    executable = true;
  };
  # home.file = builtins.listToAttrs (map (name: {
  #   name = ".local/bin/${name}";
  #   value = {
  #     source = ../../bin/${name};
  #   };
  # }) ["abre"]);
}
