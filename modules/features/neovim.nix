{
  inputs,
  config,
  ...
}: {
  flake.nixosModules.neovim = {pkgs, ...}: {
    home-manager.users.${config.username} = {
      programs.neovim = {
        enable = true;
        viAlias = true;
        vimAlias = true;
        package = inputs.neovim-nightly-overlay.packages.${pkgs.stdenv.hostPlatform.system}.default;
        withRuby = false;
        withPython3 = false;
      };
      xdg.configFile = {
        "nvim/init.lua".source = ../../configs/nvim/init.lua;
        "nvim/after/lsp" = {
          source = ../../configs/nvim/after/lsp;
          recursive = true;
        };
      };
    };
  };
}
