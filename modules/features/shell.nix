{self, ...}: {
  flake.nixosModules.shell = {pkgs, ...}: {
    imports = [
      self.nixosModules.nushell
      self.nixosModules.yazi
      self.nixosModules.broot
      self.nixosModules.neovim
    ];
  };
}
