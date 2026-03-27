{config, ...}: {
  flake.nixosModules.wezterm = {
    home-manager.users.${config.username} =
      {pkgs, ...}: {
        home.packages = [pkgs.wezterm];
        xdg.configFile."wezterm/wezterm.lua".source = ../../configs/wezterm/wezterm.lua;
      }
    ;
  };
}
