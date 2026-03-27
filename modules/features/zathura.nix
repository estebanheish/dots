{config, ...}: {
  flake.nixosModules.zathura = {
    home-manager.users.${config.username} =
      {pkgs, ...}: {
        home.packages = with pkgs; [monaspace];
        programs.zathura = {
          enable = true;
          options = {
            font = "Monaspace Xenon 14";
            recolor = "true";
            render-loading = "true";
            statusbar-home-tilde = "true";
            selection-clipboard = "clipboard";
          };
        };
      }
    ;
  };
}
