{
  self,
  config,
  ...
}: {
  flake.homeModules.shell = {
    imports = [
      self.homeModules.nushell
      self.homeModules.yazi
      self.homeModules.broot
      self.homeModules.neovim
    ];
  };

  flake.nixosModules.shell = {
    home-manager.users.${config.username}.imports = [self.homeModules.shell];
  };
}
