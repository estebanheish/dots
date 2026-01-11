{
  pkgs,
  config,
  ...
}: let
  l = import ../lib {inherit config;};
in {
  programs.zed-editor = {
    enable = true;
    package = pkgs.master.zed-editor;
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

  xdg.configFile."zed" = l.linkDir "zed";
}
