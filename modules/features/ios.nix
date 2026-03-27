{...}: {
  flake.nixosModules.ios = {pkgs, ...}: {
    services.usbmuxd.enable = true;
    environment.systemPackages = with pkgs; [
      libimobiledevice
      ifuse
    ];
  };
}
