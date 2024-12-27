{user, ...}: {
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  home-manager.users.${user}.imports = [
    ../../home-manager/firefox
    ../../home-manager/ghostty
    ../../home-manager/mpv
    ../../home-manager/zathura
  ];
}
