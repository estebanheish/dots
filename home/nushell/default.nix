{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.modules.nushell;
in
{

  options = {
    modules.nushell.enable = mkEnableOption "nushell";
  };

  config = mkIf cfg.enable {

    home.packages = with pkgs; [
      nushell
    ];

    xdg.configFile."nushell" = { source = ./../../config/nushell; recursive = true; };

  };

}
