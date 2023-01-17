{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.modules.neovim;
in {
  options = {
    modules.neovim.enable = mkEnableOption "neovim";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [gcc nerdfonts];
    programs.neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      plugins = with pkgs.vimPlugins; [
        packer-nvim
      ];
    };

    xdg.configFile."nvim" = {
      source = ./../../config/nvim;
      recursive = true;
    };
  };
}
