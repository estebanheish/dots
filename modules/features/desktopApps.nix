{self, ...}: {
  flake.nixosModules.desktopApps = {pkgs, ...}: {
    imports = [
      self.nixosModules.mpv
      self.nixosModules.librewolf
      self.nixosModules.zathura
    ];
  };
}
