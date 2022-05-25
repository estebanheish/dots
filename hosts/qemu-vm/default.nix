{ config, pkgs, modulesPath, ... }:
{
  imports =
    [
      # Include the results of the hardware scan.
      (modulesPath + "/profiles/qemu-guest.nix")
    ];

  networking.hostName = "qemu";


  services.xserver = {
    enable = true;
    windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
      config = builtins.readFile ./../../config/xmonad/xmonad.hs;
    };
    displayManager.defaultSession = "none+xmonad";
    layout = "us";
    xkbVariant = "colemak";
    xkbOptions = "grp:win_space_toggle";
  };

  environment.systemPackages = with pkgs; [
    haskellPackages.xmobar
    firefox
    alacritty
    dmenu
    xterm
  ];

  systemd.network.enable = true;

}
