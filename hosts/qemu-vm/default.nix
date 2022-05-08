{ config, pkgs, modulesPath, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      (modulesPath + "/profiles/qemu-guest.nix")
    ];

  networking.hostName = "qemu-vm";

  modules.sway.enable = true;
  modules.silent-boot.enable = true;

  environment.systemPackages = with pkgs; [
  ];

}
