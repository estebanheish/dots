{config, ...}: {
  flake.nixosModules.alacritty = {
    home-manager.users.${config.username} =
      {pkgs, ...}: {
        home.packages = [pkgs.alacritty pkgs.ubuntu_font_family pkgs.cascadia-code];
        xdg.configFile."alacritty/alacritty.yml".source = ../../configs/alacritty/alacritty.yml;
      }
    ;
  };
}
