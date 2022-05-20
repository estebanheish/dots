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

    hm.home.packages = [ pkgs.neovim ];

    hm.xdg.configFile."nvim" = { source = ./../../config/nvim; recursive = true; };

  };

}
