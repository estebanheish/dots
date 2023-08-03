{pkgs, ...}: {
  services.ratbagd.enable = true;
  environment.systemPackages = [pkgs.piper pkgs.solaar];
  services.udev.packages = [pkgs.logitech-udev-rules];
}
