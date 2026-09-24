{config, ...}: {
  flake.nixosModules.foot = {pkgs, ...}: {
    home-manager.users.${config.username} = {
      home.packages = with pkgs; [
        foot
        monaspace
      ];
      xdg.configFile = {
        "foot/foot.ini".source = ../../configs/foot/foot.ini;
        "foot/theme.ini".source = ../../configs/foot/themes/github_dark.ini;
      };
    };
  };
}
