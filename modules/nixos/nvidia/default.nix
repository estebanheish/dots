{config, ...}: {
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    modesetting.enable = true;
    nvidiaSettings = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
  };

  hardware.graphics.enable = true;

  # environment.sessionVariables = {
  #   GBM_BACKEND = "nvidia-drm";
  #   LIBVA_DRIVER_NAME = "nvidia";
  #   # WLR_NO_HARDWARE_CURSORS = "1"; # hyprland (it works from 0.40)
  #   __GLX_VENDOR_LIBRARY_NAME = "nvidia";
  #   __GL_GSYNC_ALLOWED = "1";
  # };
}
