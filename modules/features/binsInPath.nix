{config, ...}: {
  flake.nixosModules.binsInPath = {
    environment.localBinInPath = true;
    home-manager.users.${config.username} = {
      home.file."bin" = {
        enable = true;
        source = ../../bin;
        target = ".local/bin";
        recursive = true;
        executable = true;
      };
    };
  };
}
