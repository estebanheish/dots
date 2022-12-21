{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.modules.neovim;
in
{

  options = {
    modules.neovim.enable = mkEnableOption "neovim";
  };

  config = mkIf cfg.enable {

    hm.home.packages = with pkgs; [ nerdfonts ];
    hm.programs.neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      plugins = with pkgs.vimPlugins; [
        packer-nvim
      ];
    };

    hm.xdg.configFile."nvim" = { source = ./../../config/nvim; recursive = true; };

  };

}
