{config, ...}: {
  flake.nixosModules.broot = {pkgs, ...}: {
    home-manager.users.${config.username} = {
      home.packages = [pkgs.broot];
      xdg.configFile."broot" = {
        source = ../../configs/broot;
        recursive = true;
      };
    };
  };
}
