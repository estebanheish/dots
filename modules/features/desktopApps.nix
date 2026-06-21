{self, ...}: {
  flake.nixosModules.desktopApps = {pkgs, ...}: {
    imports = [
      self.nixosModules.mpv
      self.nixosModules.firefox
      self.nixosModules.zathura
    ];
  };
}
