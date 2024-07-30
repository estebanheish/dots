{pkgs, ...}: {
  services.udev.packages = [
    (pkgs.writeTextFile {
      name = "udev rule for corne keyboard";
      destination = "/etc/udev/rules.d/99-vial.rules";
      text = ''KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="4653", ATTRS{idProduct}=="0001", MODE="0660", GROUP="users", TAG+="uaccess", TAG+="udev-acl"'';
    })
  ];
}
