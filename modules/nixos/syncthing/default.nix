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
          clank.id = "XJZULI3-L53TGMK-55V5MXO-RW74G4T-S3ZGRXA-6H4IWLV-3OFWQY2-STA25Q7";
          rivet.id = "43UIVEC-5HOOXJG-SMTJ2T4-234EWIS-HWMG5D5-ZMSKAM2-HAX6IU4-Z45HDQR";
        };
        folders = {
          "Documents" = {
            label = "Documents";
            path = "/home/${user}/Documents";
            devices = ["clank" "rivet"];
          };
          "Videos" = {
            label = "Videos";
            path = "/home/${user}/Videos";
            devices = ["clank" "rivet"];
          };
          "Music" = {
            label = "Music";
            path = "/home/${user}/Music";
            devices = ["clank" "rivet"];
          };
          "Pictures" = {
            label = "Pictures";
            path = "/home/${user}/Pictures";
            devices = ["clank" "rivet"];
          };
        };
      };
    };
  };
}
