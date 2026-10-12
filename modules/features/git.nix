{
  self,
  config,
  ...
}: {
  flake.homeModules.git = {
    programs.git = {
      enable = true;
      lfs.enable = true;
      settings = {
        user = {
          name = "estebanheish";
          email = "estebanheish@gmail.com";
        };
        aliases = {
          s = "status";
          d = "diff";
          ds = "diff --staged";
          A = "add -A";
        };
      };
      # delta = {
      #   enable = true;
      # };
    };
  };

  flake.nixosModules.git = {
    home-manager.users.${config.username}.imports = [self.homeModules.git];
  };
}
