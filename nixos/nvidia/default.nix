{
  config,
  pkgs,
  lib,
  ...
}:
with lib; let
  cfg = config.modules.nvidia;
in {
  options = {
    modules.nvidia.enable = mkEnableOption "nvidia drivers";
  };

  config = mkIf cfg.enable {
    services.xserver.videoDrivers = ["nvidia"];
    hardware.opengl.enable = true;
    hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;
    hardware.nvidia.modesetting.enable = true;
    hardware.nvidia.nvidiaSettings = true;
    environment.systemPackages = with pkgs; [
      nvidia-vaapi-driver
    ];
  };
}
