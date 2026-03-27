{config, ...}: {
  flake.nixosModules.nh = {user, ...}: {
    programs.nh = {
      enable = true;
      clean.enable = true;
      flake = "/home/${config.username}/.dots";
    };
  };
}
