{
  pkgs,
  config,
  ...
}: {
  programs.zed-editor = {
    enable = true;
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
    recursive = true;
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dots/configs/zed";
  };
}
