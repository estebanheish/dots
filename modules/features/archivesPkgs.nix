{config, ...}: {
  flake.nixosModules.archivesPkgs = {pkgs, ...}: {
    home-manager.users.${config.username} = {
      home.packages = with pkgs; [
        zip
        unzip
        unrar
        gnutar
      ];
    };
  };
}
