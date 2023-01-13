{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.modules.jellyfin;
in
{

  options = {
    modules.jellyfin.enable = mkEnableOption "jellyfin";
  };

  config = mkIf cfg.enable {
    users.users.${config.user.name}.extraGroups = [ "jellyfin" ];
    services.jellyfin.enable = true;
  };

}
