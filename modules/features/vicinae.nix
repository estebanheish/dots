{config, ...}: {
  flake.nixosModules.vicinae = {
    home-manager.users.${config.username} = {
      programs.vicinae = {
        enable = true;
        systemd = {
          enable = true;
          autoStart = true;
        };
      };
    };
  };
}
