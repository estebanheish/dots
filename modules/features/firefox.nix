{config, ...}: {
  flake.nixosModules.firefox = {
    home-manager.users.${config.username} = {
      programs.firefox = {
        enable = true;
      };
    };
  };
}
