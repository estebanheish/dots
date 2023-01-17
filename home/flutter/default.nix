{
  config,
  pkgs,
  lib,
  ...
}:
with lib; let
  cfg = config.modules.flutter;
in {
  options = {
    modules.flutter.enable = mkEnableOption "flutter";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      flutter

      # linux toolchain
      cmake
      clang
      ninja
      pkg-config
      gtk3

      # android toolchain
      # android-tools
      android-studio

      # web
      google-chrome
    ];
  };
}
