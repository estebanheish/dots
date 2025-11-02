{
  pkgs,
  config,
  lib,
  inputs,
  ...
}: let
  myLib = import ../../../lib {inherit lib config;};
in {
  imports = [
    ../librewolf
    ../mpv
    # ../adwaita-dark
    ../zathura
    inputs.dankMaterialShell.homeModules.dankMaterialShell.default
  ];

  home.packages = with pkgs; [
    monaspace
    wev
    imv
    satty

    swaybg

    pwvucontrol
    blueman

    impala
    bluetui
    rofi
    # ncmpcpp

    foot

    xwayland-satellite
  ];

  services.polkit-gnome.enable = true;
  services.cliphist.enable = true;

  xdg.configFile = myLib.mkRecSymCfg ["foot" "niri" "rofi" "matugen"];

  home.file = {
    "bin" = {
      enable = true;
      source = ../../../bin;
      target = ".local/bin";
      recursive = true;
      executable = true;
    };
  };

  programs.dankMaterialShell = {
    quickshell.package = inputs.quickshell.packages.${pkgs.system}.default;
    enable = true;
    enableSystemd = true;
    enableVPN = false;
  };
}
