{user, ...}: {
  services = {
    syncthing = {
      enable = true;
      user = user;
      group = "users";
      dataDir = "/home/${user}";
      overrideDevices = true;
      overrideFolders = true;
      settings = {
        options = {
          localAnnounceEnabled = false;
          urAccepted = -1;
        };
        devices = {
          clank.id = "6MFSC7S-JBVAB2T-C3EV7YY-MCFTJ6J-JYFAWCB-H4QRMHL-LKLY4BF-U4IPVQD";
          rivet.id = "C43ALVN-4ZRFV2I-HCLS6WQ-Q554WTV-PXF3UIQ-PMABDUN-UM2LM64-7PZYCAC";
          orbb.id = "QXOH7IJ-FUMPKW6-NDKLQ2O-NDDTXIN-G3LOI6C-YMLBOZM-CAQIGHC-VOV4RQV";
        };
        folders = {
          "Documents" = {
            label = "Documents";
            path = "/home/${user}/Documents";
            devices = ["clank" "rivet" "orbb"];
          };
          "Videos" = {
            label = "Videos";
            path = "/home/${user}/Videos";
            devices = ["clank" "rivet" "orbb"];
          };
          "Music" = {
            label = "Music";
            path = "/home/${user}/Music";
            devices = ["clank" "rivet" "orbb"];
          };
          "Pictures" = {
            label = "Pictures";
            path = "/home/${user}/Pictures";
            devices = ["clank" "rivet" "orbb"];
          };
        };
      };
    };
  };
}
