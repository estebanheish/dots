{config, ...}: {
  flake.nixosModules.swayimg = {
    home-manager.users.${config.username} = {
      config,
      pkgs,
      ...
    }: {
      home.packages = [pkgs.swayimg];
      xdg.configFile."swayimg/init.lua".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dots/configs/swayimg/init.lua";
    };
  };
}
