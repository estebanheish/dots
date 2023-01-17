{ config, lib, pkgs, user, ... }:
with lib;
let
  cfg = config.modules.jellyfin;
in
{

  options = {
    modules.jellyfin.enable = mkEnableOption "jellyfin";
  };

  config = mkIf cfg.enable {
    users.users.${user}.extraGroups = [ "jellyfin" ];
    services.jellyfin.enable = true;
  };

}
