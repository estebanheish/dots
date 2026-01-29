{
  inputs,
  pkgs,
  config,
  ...
}: let
  l = import ../lib {inherit config;};
in {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
  };
  xdg.configFile = {
    "nvim/init.lua".source = l.linkFile "nvim/init.lua";
    "nvim/after/lsp" = l.linkDir "nvim/after/lsp";
  };
}
