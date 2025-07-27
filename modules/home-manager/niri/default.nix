{
  pkgs,
  config,
  ...
}: {
  imports = [
    ../ghostty
    ../librewolf
    ../mpv
    ../tofi
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
    fuzzel
    rofi-wayland
    foot
  ];

  xdg.configFile."niri" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dots/configs/niri";
    recursive = true;
  };
  xdg.configFile."mako" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dots/configs/mako";
    recursive = true;
  };
  xdg.configFile."foot" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dots/configs/foot";
    recursive = true;
  };
  xdg.configFile."swaylock" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dots/configs/swaylock";
    recursive = true;
  };
  xdg.configFile."rofi" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dots/configs/rofi";
    recursive = true;
  };

  programs.fuzzel.enable = true;
  programs.swaylock.enable = true;
  programs.waybar.enable = true;
  services.mako.enable = true;
  services.swayidle.enable = true;
  services.polkit-gnome.enable = true;
  services.cliphist.enable = true;

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
