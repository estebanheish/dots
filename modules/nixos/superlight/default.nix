{pkgs, ...}: {
  # services.ratbagd.enable = true;
  environment.systemPackages = with pkgs; [
    # piper 
    solaar
  ];
  services.udev.packages = [pkgs.logitech-udev-rules];
}
