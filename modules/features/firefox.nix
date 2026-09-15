{config, ...}: {
  flake.nixosModules.firefox = {
    home-manager.users.${config.username} = hm: {
      programs.firefox = {
        enable = true;
        configPath = "${hm.config.xdg.configHome}/mozilla/firefox";
      };
    };
  };
}
