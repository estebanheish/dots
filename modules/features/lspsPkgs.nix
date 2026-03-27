{config, ...}: {
  flake.nixosModules.lspPkgs = {pkgs, ...}: {
    home-manager.users.${config.username} = {
      home.packages = with pkgs; [
        nil
        alejandra
        taplo
        lua-language-server
      ];
    };
  };
}
