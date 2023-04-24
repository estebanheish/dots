{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.vulkan;
in {
  options = {
    modules.vulkan.enable = mkEnableOption "vulkan";
  };

  config = mkIf cfg.enable {
    hardware.opengl = { 
      enable = true; 
      driSupport = true;
      extraPackages = with pkgs; [
          intel-media-driver
          vaapiIntel
          nvidia-vaapi-driver
        
      ];
    };

    environment.systemPackages = with pkgs; [
      vulkan-validation-layers # for sway
      vulkan-tools
    ];
  };
}
