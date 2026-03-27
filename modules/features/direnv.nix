{config, ...}: {
  flake.nixosModules.direnv = {
    home-manager.users.${config.username} = {...}: {
      programs.direnv = {
        enable = true;
        nix-direnv.enable = true;
      };
    };
  };
}
