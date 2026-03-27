{config, ...}: {
  flake.nixosModules.hunspell = {
    home-manager.users.${config.username} =
      {pkgs, ...}: {
        home.packages = with pkgs; [
          hunspell
          hunspellDicts.es_ES
          hunspellDicts.en_US
        ];
      }
    ;
  };
}
