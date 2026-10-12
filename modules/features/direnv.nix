{
  self,
  config,
  ...
}: {
  flake.homeModules.direnv = {
    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };

  flake.nixosModules.direnv = {
    home-manager.users.${config.username}.imports = [self.homeModules.direnv];
  };
}
