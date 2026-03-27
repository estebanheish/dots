{config, ...}: {
  flake.nixosModules.tmux = {
    home-manager.users.${config.username} =
      {...}: {
        programs.tmux = {
          enable = true;
          escapeTime = 0;
          keyMode = "vi";
          mouse = true;
        };
      }
    ;
  };
}
