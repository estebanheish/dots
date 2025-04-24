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
          clank.id = "WV7TPHZ-D5MXJPQ-RKBNLUO-HLV3LHC-NKIMVU5-VU4HJ4X-HTP7WEM-AZZKEQM";
          rivet.id = "C43ALVN-4ZRFV2I-HCLS6WQ-Q554WTV-PXF3UIQ-PMABDUN-UM2LM64-7PZYCAC";
          orbb.id = "PDE2YH7-E6GSPAL-BMOVUQQ-QR5OIKU-YKJV72X-MT5XRER-PDRMN6M-M44BHQA";
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
