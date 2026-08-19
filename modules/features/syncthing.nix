{config, ...}: let
  username = config.username;
in {
  flake.nixosModules.syncthing = {config, lib, ...}: let
    peers = lib.filter (device: device != config.networking.hostName) ["clank" "rivet" "orbb"];
  in {
    services = {
      syncthing = {
        enable = true;
        user = username;
        group = "users";
        dataDir = "/home/${username}";
        overrideDevices = true;
        overrideFolders = true;
        settings = {
          options = {
            localAnnounceEnabled = false;
            urAccepted = -1;
          };
          devices = {
            clank.id = "KWHZD2G-63YYWUP-354FMH3-ELFBS5P-Z6VLVFA-BFLIB72-5QRHYNB-MRMCFAD";
            rivet.id = "C43ALVN-4ZRFV2I-HCLS6WQ-Q554WTV-PXF3UIQ-PMABDUN-UM2LM64-7PZYCAC";
            orbb.id = "NMK4DHY-YQELFX2-ZMXJZPE-RMJOUKJ-WVMVFYN-GAJCU3B-IHD363K-X2DTIQP";
          };
          folders = {
            "Documents" = {
              label = "Documents";
              path = "/home/${username}/Documents";
              devices = peers;
            };
            "Videos" = {
              label = "Videos";
              path = "/home/${username}/Videos";
              devices = peers;
            };
            "Music" = {
              label = "Music";
              path = "/home/${username}/Music";
              devices = peers;
            };
            "Pictures" = {
              label = "Pictures";
              path = "/home/${username}/Pictures";
              devices = peers;
            };
          };
        };
      };
    };
  };
}
