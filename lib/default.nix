{config, ...}: {
  mkRecSymCfg = names:
    builtins.listToAttrs (map (name: {
        inherit name;
        value = {
          source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dots/configs/${name}";
          recursive = true;
        };
      })
      names);
}
