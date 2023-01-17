{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.modules.vulkan;
in {
  options = {
    modules.vulkan.enable = mkEnableOption "vulkan";
  };

  config = mkIf cfg.enable {
    hardware.opengl.enable = true;
    hardware.opengl.driSupport = true;

    environment.systemPackages = [
      vulkan-validation-layers # for sway
      vulkan-tools
    ];
  };
}
