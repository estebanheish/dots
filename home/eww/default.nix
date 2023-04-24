{
  config,
  pkgs,
  lib,
  inputs,
  system,
  ...
}:
with lib; let
  cfg = config.modules.eww;
in {
  options = {
    modules.eww.enable = mkEnableOption "eww";
  };

  config = mkIf cfg.enable {
    programs.eww = {
      enable = true;
      package = pkgs.eww-wayland;
      configDir = ./../../config/eww;
    };

    home.packages = [
      inputs.eww-scripts.packages.${system}.default
    ];
  };
}
