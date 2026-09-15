f @ {...}: {
  flake.nixosModules.zed = {pkgs, ...}: {
    home-manager.users.${f.config.username} = {config, ...}: {
      programs.zed-editor.enable = true;

      xdg.configFile."zed" = {
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dots/configs/zed";
        recursive = true;
      };
    };
  };
}
