{ config, pkgs, modulesPath, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      (modulesPath + "/profiles/qemu-guest.nix")
    ];

  networking.hostName = "qemu";

  modules = {
    sway.enable = true;
    silent-boot.enable = true;
  };

  systemd.network.enable = true;

}
