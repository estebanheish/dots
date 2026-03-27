{...}: {
  flake.nixosModules.hardwareAccess = {
    services.udev.extraRules = ''
      KERNEL=="hidraw*", SUBSYSTEM=="hidraw", TAG+="uaccess"
    '';
  };
}
