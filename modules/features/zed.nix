f @ {...}: {
  flake.nixosModules.zed = {pkgs, ...}: {
    home-manager.users.${f.config.username} = {config, ...}: {
      programs.zed-editor = {
        enable = true;
        package = pkgs.zed-editor;
        extraPackages = with pkgs; [
          haskell-language-server
          ormolu

          nixd
          nil
          alejandra

          vscode-langservers-extracted
          vtsls
          emmet-language-server

          taplo

          gopls

          pyright
          ruff
        ];
      };

      xdg.configFile."zed" = {
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dots/configs/zed";
        recursive = true;
      };
    };
  };
}
