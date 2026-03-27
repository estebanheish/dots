{config, ...}: {
  flake.nixosModules.syncthing = {...}: {
    services = {
      syncthing = {
        enable = true;
        user = config.username;
        group = "users";
        dataDir = "/home/${config.username}";
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
            orbb.id = "QXOH7IJ-FUMPKW6-NDKLQ2O-NDDTXIN-G3LOI6C-YMLBOZM-CAQIGHC-VOV4RQV";
          };
          folders = {
            "Documents" = {
              label = "Documents";
              path = "/home/${config.username}/Documents";
              devices = ["clank" "rivet" "orbb"];
            };
            "Videos" = {
              label = "Videos";
              path = "/home/${config.username}/Videos";
              devices = ["clank" "rivet" "orbb"];
            };
            "Music" = {
              label = "Music";
              path = "/home/${config.username}/Music";
              devices = ["clank" "rivet" "orbb"];
            };
            "Pictures" = {
              label = "Pictures";
              path = "/home/${config.username}/Pictures";
              devices = ["clank" "rivet" "orbb"];
            };
          };
        };
      };
    };
  };
}
