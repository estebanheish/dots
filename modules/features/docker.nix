{config, ...}: {
  flake.nixosModules.docker = {
    pkgs,
    user,
    ...
  }: {
    virtualisation.docker.enable = true;
    users.extraGroups.docker.members = [config.username];
    environment.systemPackages = [pkgs.docker-compose];
  };
}
