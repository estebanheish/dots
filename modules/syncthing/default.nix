{ config, pkgs, lib, ... }:
with lib;
let
  cfg = config.modules.syncthing;
in
{
  options = {
    modules.syncthing.enable = mkEnableOption "syncthing";
  };

  config = mkIf cfg.enable {
    services = {
      syncthing = {
        enable = true;
        user = config.user.name;
        dataDir = "/home/${config.user.name}";
        declarative.overrideDevices = false;
        # declarative.overrideFolders = false;
        folders = {
          "Documents" = {
            label = "Documents";
            path = "/home/${config.user.name}/Documents";
          };
          "Videos" = {
            label = "Videos";
            path = "/home/${config.user.name}/Videos";
          };
          "Music" = {
            label = "Music";
            path = "/home/${config.user.name}/Music";
          };
          "Pictures" = {
            label = "Pictures";
            path = "/home/${config.user.name}/Pictures";
          };
          "org" = {
            label = "org";
            path = "/home/${config.user.name}/org";
          };
        };
      };
    };
  };

}
