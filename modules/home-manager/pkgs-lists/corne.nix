{pkgs, ...}: {
  home.packages = with pkgs; [
    via
    qmk
    qmk-udev-rules
    gnumake
    pkgsCross.avr.buildPackages.gcc
  ];
}
