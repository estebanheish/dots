{
  pkgs,
  user,
  ...
}: {
  virtualisation.docker.enable = true;
  users.extraGroups.docker.members = [user];
  environment.systemPackages = [pkgs.docker-compose];
}
