{config, ...}: {
  flake.nixosModules.udiskie = {
    services.udisks2.enable = true;
    home-manager.users.${config.username} = {
      services.udiskie.enable = true;
    };
  };
}
