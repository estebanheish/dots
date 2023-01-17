{ config, lib, user, ... }:
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
        user = user;
        dataDir = "/home/${user}";
        overrideDevices = false;
        # overrideFolders = false;
        folders = {
          "Documents" = {
            label = "Documents";
            path = "/home/${user}/Documents";
          };
          "Videos" = {
            label = "Videos";
            path = "/home/${user}/Videos";
          };
          "Music" = {
            label = "Music";
            path = "/home/${user}/Music";
          };
          "Pictures" = {
            label = "Pictures";
            path = "/home/${user}/Pictures";
          };
          "org" = {
            label = "org";
            path = "/home/${user}/org";
          };
        };
      };
    };
  };

}
