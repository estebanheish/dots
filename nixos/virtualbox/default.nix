{ config
, lib
, pkgs
, ...
}:
with lib; let
  cfg = config.modules.virtualbox;
in
{
  options = {
    modules.virtualbox.enable = mkEnableOption "virtualbox";
  };

  config = mkIf cfg.enable {
    virtualisation.virtualbox.host.enable = true;
    virtualisation.virtualbox.host.enableExtensionPack = true;
    users.extraGroups.vboxusers.members = [ "heis" ];
  };
}
