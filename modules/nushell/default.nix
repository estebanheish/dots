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

    environment.systemPackages = with pkgs; [
      nushell
    ];

    hm.xdg.configFile."nushell" = { source = ./../../config/nushell; recursive = true; };

  };

}
